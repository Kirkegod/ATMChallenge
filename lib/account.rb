require "date"

class Account
  attr_accessor :balance, :account_status, :exp_date, :pin_code

  def initialize
    @balance = 2000
    @account_status = :active
    @exp_date = Date.today.next_year(5).strftime("%m/%y")
    @pin_code = rand(1000..9999)
  end
end
