require "date"
require "./lib/person.rb"
require "./lib/account.rb"

class Atm
  attr_accessor :funds, :atm_bills

  def initialize
    @atm_bills = [25, 30, 40] #1000
    @funds = @atm_bills.zip([20, 10, 5]).map { |x, y| x * y }.reduce(0, :+)
  end

  def withdraw(amount, pin_code, account)
    case

    when insufficient_funds_in_account?(amount, account)
      { status: false, message: "insufficient funds", date: Date.today }
    when insufficient_funds_in_atm?(amount)
      { status: false, message: "insufficient funds in ATM", date: Date.today }
    when incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: "wrong pin", date: Date.today }
    when card_expired?(account.exp_date)
      { status: false, message: "card expired", date: Date.today }
    when account_disabled?(account.account_status)
      { status: false, message: "account disabled", date: Date.today }
    #should we define a scenario where the input is an invalid amount, meaning not divisible by 5?
    
    else
      perform_transaction(amount, account)
    end
  end

  private

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def insufficient_funds_in_atm?(amount)
    amount > @funds
  end

  def incorrect_pin?(pin_code, actual_pin)
    pin_code != actual_pin
  end

  def account_disabled?(account_status)
    account_status != :active
  end

  def card_expired?(exp_date)
    Date.strptime(exp_date, "%m/%y") < Date.today
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount
    { status: true, message: "success", date: Date.today, amount: amount, bills: add_bills(amount) }
  end

  def add_bills(amount)
    denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        bills << bill
      end
    end
    bills
  end
end
