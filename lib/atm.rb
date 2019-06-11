require "date"

class Atm
    attr_accessor :funds #, :status, :date, :message 

    def initialize
        @funds = 1000
        #@status = true
    end 

    def withdraw(amount, account)
        case

        when insufficient_funds_in_account?(amount, account)
                { status: false, message: 'insufficient funds', date: Date.today }

        when insufficient_funds_in_atm?(amount)
            { status: false, message: 'insufficient funds in ATM', date: Date.today }
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

    def perform_transaction(amount, account)
        @funds -= amount
        account.balance = account.balance - amount

        { status: true, message: 'success', date: Date.today, amount: amount}
    end
    
    # def withdraw(amount)
    #     if @funds < amount
    #         @status = false
    #     else
    #         @status = true
    #         @funds -= amount
    #     end

    # end

    # def response()
    #     @status
    # end



end
