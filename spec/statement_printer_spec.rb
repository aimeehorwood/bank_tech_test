# frozen_string_literal: true

require 'statement_printer'

RSpec.describe do
  let(:transactions) do
    [double(date: '01/01/2022', credit: 100, debit: 0, balance: 100),
     double(date: '02/01/2022', credit: 50, debit: 0, balance: 50)]
  end
  let(:printer) { Printer.new }

  it 'prints the statement header' do
    expected_output = "date || credit || debit || balance\n" \
                  "01/01/2022 || 100.00 ||  || 100.00\n" \
                  "02/01/2022 || 50.00 ||  || 50.00\n"
    expect { printer.print_statement(transactions) }.to output(expected_output).to_stdout
  end

  it 'prints the transactions in the correct format' do
    expected_output = "date || credit || debit || balance\n" \
                  "01/01/2022 || 100.00 ||  || 100.00\n" \
                  "02/01/2022 || 50.00 ||  || 50.00\n"
    expect { printer.print_statement(transactions) }.to output(include(expected_output)).to_stdout
  end
end
