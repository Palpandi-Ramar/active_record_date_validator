module ActiveRecordDateValidator
  extend ActiveSupport::Concern

  class DateValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      # Get the raw value before typecasting
      raw_value = record.read_attribute_before_type_cast(attribute)
      
      # Skip validation for nil values
      return if raw_value.nil?
      
      # Only allow Date, Time, or ActiveSupport::TimeWithZone objects
      # Reject ANY string values regardless of format
      if raw_value.is_a?(String) || 
         (!raw_value.is_a?(Date) && !raw_value.is_a?(Time) && !raw_value.is_a?(ActiveSupport::TimeWithZone))
        record.errors.add(attribute, "must be a valid date or datetime")
      end
    end
  end

  class_methods do
    def validates_date(exclude_columns: [])
      date_columns = columns.select { |col| [:date, :datetime].include?(col.type) }.map(&:name)
      date_columns -= exclude_columns.map(&:to_s)

      date_columns.each do |field|
        # Use our custom validator on each date column
        validates field, date: true
      end
    end
  end
end

# Include the module in ActiveRecord::Base to make it available to all models
ActiveRecord::Base.include(ActiveRecordDateValidator)