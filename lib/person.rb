require "./lib/account.rb"

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    set_cash(attrs[:cash])
    @cash = 0
    @account = nil
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

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(obj)
    if (@account != nil)
      @cash += obj
      true
    else
      raise "No account present"
    end
  end
end
