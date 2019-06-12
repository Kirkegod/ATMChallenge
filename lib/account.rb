require "date"

class Account
  attr_accessor :balance, :account_status, :exp_date, :pin_code

  STANDARD_VALIDITY_YRS = 5 #why not instance or class variable? It crashes.

  def initialize(attrs = {})
    @balance = 2000
    @account_status = :active
    @exp_date = Date.today.next_year(STANDARD_VALIDITY_YRS).strftime("%m/%y")
    @pin_code = rand(1000..9999)
    set_owner(attrs[:owner])
  end

  private

  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end

  def missing_owner
    raise "An Account owner is requierd"
  end

  def self.deactivate(account)
    account.account_status = :deactivated
  end

  def deactivate
    @account_status = :deactivated
  end
end
