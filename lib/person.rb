require "./lib/account.rb"
require "./lib/atm.rb"

class Person
  attr_accessor :name, :cash, :account

  def initialize(attrs = {})
    set_name(attrs[:name])
    @cash = 0
    @account = nil
  end

  def set_name(obj)
    obj == nil ? missing_name : @name = obj.to_s
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

  def withdraw(args = {})
    @account == nil ? missing_account : withdraw_funds(args)
  end

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def missing_atm
    raise "An ATM is required"
  end

  def missing_account
    @account = nil
    raise "No account present"
  end

  def deposit(amount)
    @account.nil? ? missing_account : deposit_funds(amount)
  end

  def insuficient_cash?(amount)
    amount > @cash
  end

  def perform_deposit(amount)
    @cash -= amount
    @account.balance += amount
  end

  def deposit_funds(amount)
    #We should only be able to make a deposit if we have that cash
    #available, otherwise it will go to negative cash
    case
    when insuficient_cash?(amount)
      { status: false, message: "Insufficient cash", date: Date.today }
    else
      perform_deposit(amount)
    end

      
  end
end
