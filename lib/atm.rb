require "date"
require "./lib/person.rb"
require "./lib/account.rb"

class Atm
  attr_accessor :funds, :atm_bills

  def initialize
    @atm_bills = [25, 30, 40] # bills sums up to 1000.
    @funds = @atm_bills.zip([20, 10, 5]).map { |x, y| x * y }.reduce(0, :+)
  end

  def withdraw(amount, pin_code, account)
    case

    when insufficient_funds_in_account?(amount, account)
      # print_receipt (status: false, message: "Insufficient funds")
      { status: false, message: "Insufficient funds", date: Date.today }
    when insufficient_funds_in_atm?(amount)
      { status: false, message: "Insufficient funds in ATM", date: Date.today }
    when incorrect_pin?(pin_code, account.pin_code)
      { status: false, message: "Wrong pin", date: Date.today }
    when card_expired?(account.exp_date)
      { status: false, message: "Card expired", date: Date.today }
    when account_disabled?(account.account_status)
      { status: false, message: "Account disabled", date: Date.today }
    when invalid_amount?(amount)
      { status: false, message: "Invalid amount", date: Date.today }
    else
      perform_transaction(amount, account)
      bills = add_bills(amount)
      print_receipt(amount, account, bills)
      { status: true, message: "success", date: Date.today, amount: amount, bills: bills }
    end
  end

  private

  def print_receipt(amount, account, bills)
    printf("status: true, message: success, date %s, amount: %s, bills: %s", Date.today, amount,
           bills)
  end

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

  def invalid_amount?(amount)
    amount % 5 != 0
  end

  def perform_transaction(amount, account)
    @funds -= amount
    account.balance = account.balance - amount
    #{ status: true, message: "success", date: Date.today, amount: amount, bills: add_bills(amount) }
  end

  def add_bills(amount)
    denominations = [20, 10, 5]
    bills = []
    denominations.each do |bill|
      while amount - bill >= 0
        amount -= bill
        atm_bills[denominations.index(bill)] -= 1
        bills << bill
      end
    end
    bills
  end
end
