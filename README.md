# ActiveRecordDateValidator

## Avoiding Date Parsing Pitfalls in Ruby on Rails: Lessons Learned and a Custom Gem Solution The Problem with Rails' Date Parsing

In Ruby on Rails, date parsing can be tricky, especially when dealing with date formats like DD/MM/YYYY. Rails' default behavior is to interpret date strings in the MM/DD/YYYY format. This can lead to serious issues when the day part falls between 1 and 12, causing the date to be misinterpreted.

#For instance:

   If the date string is "11/05/2025", Rails interprets it as November 5th, 2025.

   If the date string is "13/05/2025", Rails will fail to parse it correctly, resulting in nil.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_record_date_validator'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_record_date_validator

## Usage

This gem provides a simple way to validate date attributes in your ActiveRecord models. You can specify columns to exclude from validation using the exclude_columns option.

## Example

The valid dates for the bill_date attribute in the Invoice model are as follows:

# Valid Date Formats:

```ruby
Date object (e.g., Date.today)

Time object (e.g., Time.now)

ActiveSupport::TimeWithZone object (e.g., Time.zone.now)

nil (allowed as a valid value)
```

# Invalid Date Formats:
```ruby
Non-date string (e.g., "invalid_date")

Valid date format as a string (e.g., "2023-05-20")

Malformed date string (e.g., "2025-99-99")

Integer value (e.g., 12345)

Array (e.g., [2023, 5, 20])

Hash (e.g., {year: 2023, month: 5, day: 20})
```
# Example usage

bill_date field is being validated, while created_at and updated_at fields are excluded from validation

```ruby
class Invoice < ActiveRecord::Base
  validates_date exclude_columns: [:created_at, :updated_at]
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_record_date_validator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/active_record_date_validator/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveRecordDateValidator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/active_record_date_validator/blob/master/CODE_OF_CONDUCT.md).
