
1. Describe the Problem

- As a user, I want to set up a bank account
- My bank account keeps track of my balance, deposits and withdrawals 
- It can print a statement for me with all these transactions in a nice format and date

Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00



2. Design the Class System



┌───────────────────────────────────────────────┐
│                    BankAccount                │
│                                               │
│                                               │
│    - add(transaction)                         │
│    - list transactions (all)                  │
│                                               │
│                                               │
│                                               │
│                                               │
│                                               ├───────────────────────────────────────────────┐
│                                               │                                               │
│                                               │                                               │
│                                               │                                               │
└────────────────────────┬──────────────────────┘                                               │
                         │                                                                      │
                         │                                                                      │
                         │  Owns a list of                                                      │
                         │                                                                      │
                         │                                                                      │
                         │                                                                      │
                         │                                                   ┌──────────────────▼────────────────────────────────────┐
 ┌───────────────────────▼────────────────────────┐                          │                  Balance                              │
 │                  Transactions                  │                          │        - initializes with bankAccount                 │
 │                                                │                          │                                                       │
 │                                                │                          │       - print BankAccount balance                     │
 │                                                │                          │       - print transactions by date, and amount        │
 │  - date                                        │                          │                                                       │
 │  - credit                                      │                          │                                                       │
 │  - deposit                                     │                          │                                                       │
 │  - balance                                     │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          │                                                       │
 │                                                │                          └───────────────────────────────────────────────────────┘
 │                                                │
 └────────────────────────────────────────────────┘



3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.


- integration test, 
- creating a new bank account, add transaction, 
- print statement 




4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.


constructs a bank account

bank = Bank.new
bank.date = "23/11/2023"




5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.

