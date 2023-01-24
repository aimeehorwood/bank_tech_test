require "time"

class Transactions
  def initialize
    @date = Time.now.strftime("%d/%m/%Y")
    @transactions_list = []
  end

  def return_date
    @date
  end

  def return_all_transactions
    @transactions_list
  end 

end
