# frozen_string_literal: true

class SelectModel
  attr_accessor :id, :name

  def initialize(id:, name:)
    self.id = id
    self.name = name
  end

  def self.all
    [SelectModel.new(id: 1, name: 'a'), SelectModel.new(id: 2, name: 'b')]
  end
end
