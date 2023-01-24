require_relative "../lib/transactions"

class BankAccount

    def initialize
        @balance = 0
        @transaction_history = []
    end 

    def add_transaction(transaction)
        @transaction_history << [transaction.date,transaction.credit,transaction.debit]

    end 

    def view 
        @transaction_history
    end 

end
