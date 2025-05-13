require 'active_record'
require_relative '../lib/active_record_date_validator'
require 'rspec'

# Establishing database connection
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'active_record_date_validator_test',
  username: 'postgres',
  password: 'root',
  host: 'localhost'
)

# Check and create the database if not exists
begin
  ActiveRecord::Base.connection
rescue ActiveRecord::NoDatabaseError
  ActiveRecord::Base.connection.create_database('active_record_date_validator_test')
  puts "Database 'test_db' created."
end

# Create the schema and model only if not already defined
ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.data_source_exists?(:invoices)
    create_table :invoices, force: true do |t|
      t.date :bill_date
      t.datetime :created_at
      t.datetime :updated_at
    end
    puts "Table 'invoices' created."
  end
end

# Test Model
class Invoice < ActiveRecord::Base
  # Using the custom date validator
  validates_date exclude_columns: [:created_at, :updated_at]
end


RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
