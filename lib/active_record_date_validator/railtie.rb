require "rails/railtie"

module ActiveRecordDateValidator
  class Railtie < Rails::Railtie
    initializer "active_record_date_validator.include_concern" do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.include(ActiveRecordDateValidator)
      end
    end
  end
end
