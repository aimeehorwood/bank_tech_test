# Bank tech test

### Requirements

Interact with your code via a REPL like IRB or Node.
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory.

### Specification

Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see:

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

### User stories

```
As a customer, 
I want to set up a bank account
```
```
So I can invest my money, 
I want to deposit money into my bank account
```
```
In order to make purchases,
I would like to also withdraw money from my bank
```
```
So I know how much money I have,
I would like to print my account history 
and see a statement of all my deposit and withdrawal activity.
```


### Design

* Before starting the challenge, I diagrammed my classes and their responsibilities to adhere to SOLID and OOP design principles.

* First, I created a Transactions class to establish a skeleton for a single transaction


```ruby

class Transactions

  def initialize(date, credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end
end
```

* I then created a BankAccount class to store several transactions through dependency injection in an array. The class has credit and debit methods and uses the print method from the Printer class 


```ruby

class BankAccount

  attr_reader :all_transactions

  def initialize(transactions_class = Transactions)
    @transactions_class = transactions_class
    @all_transactions = []
    @balance = 0
  end
  
  def credit(amount, date)
  end

  def debit(amount, date)
  end

  def add_transaction(credit, debit, date)
  end
  
  def print_my_statement
    sort_transactions_by_date
    Printer.new.print_statement(@all_transactions)
  end

end
```

* Printer, was my final class and its methods of printing and formatting are utilised in the Bank Account class to format statements in the desired way
```ruby

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
  end

  def format_amount(amount)
  end
end

```


### How to get started:

* clone this repository
*  `bundle install` inside the terminal

### Example of program in irb terminal

```
3.0.0 :001 > require './lib/bank_account.rb'
 => true 
3.0.0 :002 > bank = BankAccount.new
 => #<BankAccount:0x00007feeca8852c8 @transactions_class=Transactions, @all_transactions=[], @balance=0> 
3.0.0 :003 > bank.credit(1000,"10/01/2023")
 => [#<Transactions:0x00007feec7911938 @date="10/01/2023", @credit=1000, @debit=0, @balance=1000>] 
3.0.0 :004 > bank.credit(2000,"13/01/2023")
 => [#<Transactions:0x00007fb61a9a4980 @date="10/01/2023", @credit=1000, @debit=0, @balance=1000>, #<Transactions:0x00007fb61a9c6760 @date="13/01/2023", @credit=2000, @debit=0, @balance=3000>] 
3.0.0 :005 > bank.debit(500,"14/01/2023")
 => [#<Transactions:0x00007fb61a9a4980 @date="10/01/2023", @credit=1000, @debit=0, @balance=1000>, #<Transactions:0x00007fb61a9c6760 @date="13/01/2023", @credit=2000, @debit=0, @balance=3000>, #<Transactions:0x00007fb61a9dc8d0 @date="14/01/2023", @credit=0, @debit=500, @balance=2500>] 
3.0.0 :006 > bank.print_my_statement
date || credit || debit || balance
14/01/2023 ||  || 500.00|| 2500.00
13/01/2023 || 2000.00 ||  || 3000.00
10/01/2023 || 1000.00 ||  || 1000.00
 => [#<Transactions:0x00007fb61a9dc8d0 @date="14/01/2023", @credit=0, @debit=500, @balance=2500>, #<Transactions:0x00007fb61a9c6760 @date="13/01/2023", @credit=2000, @debit=0, @balance=3000>, #<Transactions:0x00007fb61a9a4980 @date="10/01/2023", @credit=1000, @debit=0, @balance=1000>] 
3.0.0 :007 >  quit
```

### Dependencies
* This project uses `rspec` for testing and `SimpleCov` for code coverage which is `100%`

### Gemfile
```ruby
# frozen_string_literal: true

source 'https://rubygems.org'

# gem "rails"

gem 'rspec', '~> 3.12'

gem 'simplecov', require: false, group: :test

```



