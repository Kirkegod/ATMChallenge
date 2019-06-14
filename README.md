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
This will create and ATM instance with 1000$ available in 25 bills of 20$, 30 bills of 10$ and 40 bills of 5$

- Now lets create a person to interact with the ATM. To create a person we will need to give him/her a name

```
newPerson = Person.new(name: 'Alfred')
```
This will create a Person instance named Alfred, still with no account, and no cash :(

- For Alfred to interact with the ATM he will need to have an account, so let's got to the bank and create an account and have him be it's owner

```
newAccount = Account.new(owner: newPerson)
```

This will create a new account for Alfred with an active status, with a 5 year expiry date a pin code, and, sadly, 0 balance, we'll take care of that in a moment.

- We've come a long way, so let's make a small recap, lets call out our person instance to see everything we have done so far

```
newPerson
```
This will display all the values we've added to our attributes. We can see that Alfred has an account assigned to him with 0 balance, and expiry date, a pin code, and he also has no cash in his pocket.

- Good news! Alfred just received his paycheck! His bosses were kind enough to reward him with 2000$ for his work. 

```
newPerson.increase_cash(amount: 2000)
```
This will add 2000 bucks to our pocket.

- Now let's put all this cash in our account because, let's face it, streets ain't safe

```
newPerson.perform_deposit(2000)
```
This made our account balance to go up to 2000$, and, obviously, our cash to 0.

- It's good to have our money safe in our account, but we also need some pocket money. So let's withdraw some walk around cash

```


