require 'active_record'
require 'active_support/all'
require 'rspec'
require_relative '../../lib/active_record_date_validator'

# Database Configuration
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'active_record_date_validator_test',
  username: 'postgres',
  password: 'root',
  host: 'localhost'
)

# Setting timezone
Time.zone = 'UTC'

# Create the test table if not exists
ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.data_source_exists?(:invoices)
    create_table :invoices, force: true do |t|
      t.date :bill_date
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end

# Define the Invoice model
class Invoice < ActiveRecord::Base
  validates_date exclude_columns: [:created_at, :updated_at]
end
