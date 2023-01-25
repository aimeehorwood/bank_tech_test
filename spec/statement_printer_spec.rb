require_relative "../lib/statement_printer"


RSpec.describe Printer do
  let(:transaction) { Transactions.new("23/01/2023", 10.00, "", 10.00) }
  let(:bank_account) { BankAccount.new }
  subject(:printer) { described_class.new }

  describe "print_statement" do
    it "prints the statement in the desired format" do
      expect { printer.print_statement(transaction, bank_account) }.to output("date || credit || debit || balance\n23/01/2023 || 10.00 ||  || 10.00\n").to_stdout
    end
  end
end
