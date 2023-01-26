require_relative "../lib/bank_account"

class Printer

  def print_statement(transactions)
    puts print_header
    transactions.each do |transaction|
      if transaction.credit == 0
        puts "#{transaction.date} ||  || #{sprintf("%.2f", transaction.debit)}|| #{sprintf("%.2f", transaction.balance)}"
      else
        puts "#{transaction.date} || #{sprintf("%.2f", transaction.credit)} ||  || #{sprintf("%.2f", transaction.balance)}"
      end
    end
  end


  private

  def print_header
    "date || credit || debit || balance"
  end
end 