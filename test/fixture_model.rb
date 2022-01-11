# frozen_string_literal: true

class FixtureModel
  attr_accessor :field, :boolean, :datetime, :select, :err_field

  def initialize
    self.field = "value"
    self.boolean = true
    self.datetime = DateTime.new(1970, 1, 1)
    self.select = 1
    self.err_field = "bad_value"
  end

  def persisted?
    true
  end

  def errors
    { err_field: ["error_msg"] }
  end

  def self.human_attribute_name(attribute)
    "#{attribute}_human"
  end
end
