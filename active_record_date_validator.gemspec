Gem::Specification.new do |spec|
  spec.name          = "active_record_date_validator"
  spec.version       = "0.1.0"
  spec.authors       = ["Palpandi Ramar"]
  spec.email         = ["palpandi26@gmail.com"]

  spec.summary       = "A validator for date fields in ActiveRecord models."
  spec.description   = "This gem provides a Rails concern to validate date fields in ActiveRecord models, allowing the exclusion of specific fields if needed."

  spec.metadata["source_code_uri"] = "https://github.com/Palpandi-Ramar/active_record_date_validator"
  spec.metadata["changelog_uri"] = "https://github.com/Palpandi-Ramar/active_record_date_validator/blob/main/CHANGELOG.md"
  spec.homepage      = "https://github.com/Palpandi-Ramar/active_record_date_validator"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]

  spec.add_development_dependency "rails", "~> 5.2"
  spec.add_development_dependency "pg", "~> 1.5"
  spec.add_development_dependency "rspec", "~> 3.11"

end