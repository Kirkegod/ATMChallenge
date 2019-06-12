class Account
    attr_accessor :balance, :account_status, :exp_date, :pin_code

    def initialize
        @balance = 
        @account_status =
        @exp_date = 
        @pin_code = rand(1000..9999)
    end
end
