class Atm
    attr_accessor :funds, :status, :date, :message 

    def initialize
        @funds = 1000
        @status = true
    end 

    def withdraw(amount)
        if @funds < amount
            @status = false
        else
            @status = true
            @funds -= amount
        end

    end

    def response()
        @status
    end



end

