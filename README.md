```
As a programmer
In order to work in a test driven way
I want to unit test my code
```

Rspec

- [x] Make sure it's set up 
- [x]  Make sure code formatting and output is readable

Version Control

- [x] Gitignore 
- [x] Commit
- [x] Create Remote Repository

ATM Challenge Requirements/Checklist

- [x] An ATM machine can hold up to $1000
Withdrawal can be cleared only if:

- [x] The ATM holds enough funds
- [x] The amount is divisible by 5
- [x] The person attempting the withdrawal provides a valid ATM card
- [x] Valid pin and expire date
- [x] Card status must be active (Not report stolen or lost)
- [x] The person attempting the withdrawal has sufficient funds on his account
- [x] There are only $5, $10 and $20 bills in the ATM. Withdrawals for amounts not divisible by 5 must be rejected.
- [x] Upon a successful withdrawal the system should return a receipt with information about the date, amount and bills that was dispatched. (The receipt should be presented in the form of a Hash.
- [x] When a withdrawal is done, the number of bills inside the ATM must decrease
- [x] A deposit should only be possible if a person has cash available

Instruction:

To interact with the ATM program open IRB or Pry and follow these steps:

- You can start by creating an ATM to interact with

```
newATM = Atm.new
```
This will create and ATM with 1000$ available in 25 bills of 20$, 30 bills of 10$ and 40 bills of 5$

- Now lets create a person to interact with the ATM

