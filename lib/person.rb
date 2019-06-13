class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
  end

  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end
end
