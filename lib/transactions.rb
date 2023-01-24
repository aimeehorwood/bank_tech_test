require "time"

class Transactions
  attr_reader :date, :credit, :debit

  def initialize
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = 0
    @debit = 0
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

  def credit_account(amount)
    @credit = amount
  end

  def debit_account(amount)
    @debit = amount
  end
end
