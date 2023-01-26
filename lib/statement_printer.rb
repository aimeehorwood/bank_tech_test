# frozen_string_literal: true

require_relative '../lib/bank_account'

class Printer
  def print_statement(transactions)
    puts print_header
    transactions.each do |transaction|
      puts print_transaction(transaction)
    end
  end

  private

  def print_header
    'date || credit || debit || balance'
  end

  def print_transaction(transaction)
    if transaction.credit.zero?
      "#{transaction.date} ||  || #{format_amount(transaction.debit)}|| #{format_amount(transaction.balance)}"
    else
      "#{transaction.date} || #{format_amount(transaction.credit)} ||  || #{format_amount(transaction.balance)}"
    end
  end

  def format_amount(amount)
    format('%.2f', amount)
  end
end
