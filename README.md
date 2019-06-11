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

ATM Challenge Requirements

- [] An ATM machine can hold up to $1000
Withdrawal can be cleared only if:
- [] The ATM holds enough funds
- [] The amount is divisible by 5
- [] The person attempting the withdrawal provides a valid ATM card
- [] Valid pin and expire date
- [] Card status must be active (Not report stolen or lost)
- [] The person attempting the withdrawal has sufficient funds on his account
- [] There are only $5, $10 and $20 bills in the ATM. Withdrawals for amounts not divisible by 5 must be rejected.
- [] Upon a successful withdrawal the system should return a receipt with information about the date, amount and bills that was dispatched. (The receipt should be presented in the form of a Hash.