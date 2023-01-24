require "time"

class Transactions
  attr_reader :date, :credit, :debit , :balance
  attr_writer :balance

  def initialize
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = 0
    @debit = 0
    @balance = 0
  end

  def return_date
    @date
  end

  def return_credit
    @credit
  end
  
  def return_debit
    @debit
  end

  def return_balance
    @balance
  end

  def credit_account(amount)
    @credit = amount
  end

  def debit_account(amount)
    @debit = amount
  end
end
