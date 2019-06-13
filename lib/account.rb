require "date"
require "./lib/person.rb"
require "./lib/atm.rb"

class Account
  attr_accessor :balance, :account_status, :exp_date, :pin_code, :owner

  STANDARD_VALIDITY_YRS = 5 #why not instance or class variable? It crashes.

  def initialize(attrs = {})
    @balance = 0
    @account_status = :active
    @exp_date = Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
    @pin_code = rand(1000..9999)
    set_owner(attrs[:owner])
  end

  def missing_owner
    raise "An Account owner is required"
  end

  def self.deactivate(account)
    account.account_status = :deactivated
  end

  def deactivate
    @account_status = :deactivated
  end

  private

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end
end
