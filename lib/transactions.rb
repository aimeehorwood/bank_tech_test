require "time"

class Transactions
  def initialize
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = 0
    @debit = 0
    @transactions_list = []
  end

  def return_date
    @date
  end

  def return_all_transactions
    @transactions_list
  end

  def return_credit
    @credit
  end

  def return_debit
    @debit
  end
end
