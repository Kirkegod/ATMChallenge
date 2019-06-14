
### ATM Challenge ###
Authors: Pedro & Camilla 

```
As a programmer
In order to work in a test driven way
I want to unit test my code
```


## Instructions ##

To interact with the ATM program open IRB or Pry and follow these steps:

```
# Load program in Pry or IRB. 
load './lib/atm.rb'

# Create an ATM to interact with.
newATM = Atm.new
```
This will create and ATM instance with 1000$ available in 
- 25 bills of 20$, 
- 30 bills of 10$, and
- 40 bills of 5$.

```
# Create a named ATM user.
newPerson = Person.new(name: 'Alfred')

# Give the user an a bank account.
newPerson.create_account
```
The banc account will:
- be set to active, 
- get a 4 digit PIN, 
- expires in 5 years, and 
- have 0 in balance. 


Good news! Our user just received his paycheck! His boss kindly enough rewarded him with 2000$ for his work. This will add 2000 bucks to his pocket. 

```
# Add money to person.
newPerson.increase_cash(amount: 2000)
```

Now let's put all this cash in our account because, let's face it, streets ain't safe. This made our account balance to go up to 2000$, and, obviously, our cash to 0.
```
# Deposit money on bank account.
newPerson.deposit(2000)
```

It's good to have our money safe in our account, but we also need some pocket money. So let's withdraw some walk around cash. :+1:


```
# widraw arguments: (Amount to withdraw, PIN, ATM).
newPerson.withdraw(amount:25, pin:9863, atm: newATM)
```

______________________________________

## Rspec ##

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
