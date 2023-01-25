require "bank_account"

RSpec.describe BankAccount do
  context "when no transactions added" do
    it "initalially has an empty list" do
      bank_account = BankAccount.new
      expect(bank_account.all_transactions).to eq []
    end
  end

  it "can credit the bank account and return the amount" do
    bank_account = BankAccount.new
    bank_account.credit(100, "23/01/2023")
    expect(bank_account.all_transactions.first.credit).to eq 100
    expect(bank_account.all_transactions.first.date).to eq "23/01/2023"
  end

  it "can credit the bank account and update the balance to the amount" do
    bank_account = BankAccount.new
    bank_account.credit(100, "23/01/2023")
    expect(bank_account.all_transactions.first.balance).to eq 100
    expect(bank_account.all_transactions.first.date).to eq "23/01/2023"
  end

  it "can debit the bank account and return the amount" do
    bank_account = BankAccount.new
    bank_account.debit(55.40, "25/01/2023")
    expect(bank_account.all_transactions.first.debit).to eq 55.40
    expect(bank_account.all_transactions.first.date).to eq "25/01/2023"
  end

  it "can debit the bank account and update the balance to the amount" do
    bank_account = BankAccount.new
    bank_account.debit(55.40, "25/01/2023")
    expect(bank_account.all_transactions.first.balance).to eq -55.40
    expect(bank_account.all_transactions.first.date).to eq "25/01/2023"
  end

  it "can handle several transactions on different days and return correct values" do
    bank_account = BankAccount.new
    bank_account.debit(100, "22/01/2023")
    bank_account.credit(50, "23/01/2023")
    bank_account.debit(30, "24/01/2023")
    bank_account.credit(1000, "25/01/2023")
    expect(bank_account.all_transactions[0].date).to eq "22/01/2023"
    expect(bank_account.all_transactions[0].debit).to eq 100
    expect(bank_account.all_transactions[1].credit).to eq 50
    expect(bank_account.all_transactions[2].debit).to eq 30
    expect(bank_account.all_transactions[3].credit).to eq 1000
    expect(bank_account.all_transactions[3].date).to eq "25/01/2023"
  end

  describe "printer" do
    let(:transactions_class) { double(:transactions_class) }
    let(:printer_class) { double(:printer_class) }
    let(:transaction1) { double(:transaction1, date: "14/01/2023", credit: "", debit: 500.00, balance: 2500.00) }
    let(:transaction2) { double(:transaction2, date: "13/01/2023", credit: 2000.00, debit: "", balance: 3000.00) }
    let(:transaction3) { double(:transaction3, date: "10/01/2023", credit: 1000.00, debit: "", balance: 1000.00) }
    subject(:bank_account) { described_class.new(transactions_class, printer_class) }

    before do
      allow(transactions_class).to receive(:new).and_return(transaction1, transaction2, transaction3)
      allow(printer_class).to receive(:print_statement)
      bank_account.credit(1000.00, "10/01/2023")
      bank_account.credit(2000.00, "13/01/2023")
      bank_account.debit(500.00, "14/01/2023")
    end

    describe "#print_my_statement" do
      it "prints the statement in the desired format" do
        expect(printer_class).to receive(:print_statement).with([transaction1, transaction2, transaction3])
        bank_account.print_my_statement
      end
    end
  end
end
