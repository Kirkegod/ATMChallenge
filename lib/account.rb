require "date"

class Account
  attr_accessor :balance, :account_status, :exp_date, :pin_code

  STANDARD_VALIDITY_YRS = 5 #why not instance or class variable? It crashes.

  def initialize
    @balance = 2000
    @account_status = :active
    @exp_date = Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
    @pin_code = rand(1000..9999)
  end
end
