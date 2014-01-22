class Widget
  include Bumbleworks::Entity

  attr_accessor :identifier

  def initialize(identifier)
    @identifier = identifier
  end

  def self.first_by_identifier(identifier)
    new(identifier)
  end
end