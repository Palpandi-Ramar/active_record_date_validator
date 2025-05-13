require 'spec_helper'

RSpec.describe Invoice, type: :model do
  context "with valid date" do
    it "is valid when bill_date is a date" do
      invoice = Invoice.new(bill_date: Date.today)
      expect(invoice.valid?).to be true
    end

    it "is valid when bill_date is a datetime" do
      invoice = Invoice.new(bill_date: Time.now)
      expect(invoice.valid?).to be true
    end

    it "is valid when bill_date is an ActiveSupport::TimeWithZone" do
      Time.zone = "UTC"
      invoice = Invoice.new(bill_date: Time.zone.now)
      expect(invoice.valid?).to be true
    end
  end

  context "with invalid date" do
    it "is invalid when bill_date is a string" do
      invoice = Invoice.new(bill_date: "invalid_date")
      expect(invoice.valid?).to be false
      expect(invoice.errors[:bill_date]).to include("must be a valid date or datetime")
    end

    it "is invalid when bill_date is a string containing a valid date format" do
      invoice = Invoice.new(bill_date: "2023-05-20")
      expect(invoice.valid?).to be false
      expect(invoice.errors[:bill_date]).to include("must be a valid date or datetime")
    end

    it "is invalid when bill_date is an integer" do
      invoice = Invoice.new(bill_date: 12345)
      expect(invoice.valid?).to be false
      expect(invoice.errors[:bill_date]).to include("must be a valid date or datetime")
    end

    it "is invalid when bill_date is a malformed date string" do
      invoice = Invoice.new(bill_date: "2025-99-99")
      expect(invoice.valid?).to be false
      expect(invoice.errors[:bill_date]).to include("must be a valid date or datetime")
    end

    it "is invalid when bill_date is an array" do
      invoice = Invoice.new(bill_date: [2023, 5, 20])
      expect(invoice.valid?).to be false
      expect(invoice.errors[:bill_date]).to include("must be a valid date or datetime")
    end

    it "is invalid when bill_date is a hash" do
      invoice = Invoice.new(bill_date: {year: 2023, month: 5, day: 20})
      expect(invoice.valid?).to be false
      expect(invoice.errors[:bill_date]).to include("must be a valid date or datetime")
    end
  end

  context "with nil date" do
    it "is valid when bill_date is nil" do
      invoice = Invoice.new(bill_date: nil)
      expect(invoice.valid?).to be true
    end
  end

  context "when date column is excluded" do
    it "skips validation for excluded date fields" do
      invoice = Invoice.new(created_at: "not a date")
      expect(invoice.valid?).to be true
    end
  end

  context "when date is not provided" do
    it "defaults to nil for bill_date" do
      invoice = Invoice.new
      expect(invoice.bill_date).to be_nil
    end
  end
end