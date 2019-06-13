class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    set_cash(attrs[:cash])
    @cash = 0
  end

  def set_name(obj)
    obj == nil ? missing_name : @name = obj
  end

  def set_cash(obj)
    obj == nil ? @cash = 0 : @cash = obj.to_i
  end

  def missing_name
    raise "A name is required"
  end

  def self.create_account(attrs = {})
    myAccount = self.class.new(attrs)
  end
end
