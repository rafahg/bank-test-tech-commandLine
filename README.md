# README

## 1.TECHNICAL APPROACH.

The requirements of the task were the following:

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date       || credit  || debit  || balance
14/01/2012 ||         || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
```

 My approach to obtain this result was the following:

* First i designed a domain model for a little program to compute this result with the following structure.

  Class Bank
  This will be the main class, the only funcion of the bank class will be to act as controller to call the methods from other classes and give the final result.

  Class Operations.
  This will be the class in charge of make the basic daily bank operations, in our case Deposit and Withdrawals.

  Methods: 
  1. Deposit, to make a deposit in the account.
  2. Withdrawal, to make a withdrawal of the account.
  
  Class Print

  This will be the class just in charge of print the stament as a result of the Operations.
  
  Methods:
  1. print_stament, to print the stament with all the operations history.

* Logic for the solution.

  The logic behind the program is based in storage the data in hash in a similar way it is done in a row in a postgresql database.

  So When the Bank class is initialized is neccesary to imput a client as a parameter. This parameter, the client, will be used as a key for the hash with the operations.
  
  In the first moment, the Class Operations, which is in charge of this step of the process is created with a hash with the client name as a key, and an empty array as value. 
  
  That array will be the container of all the data belonging to a given client.

  Populating the hash with the methods deposit and withdrawal we provide the data needed for the account movements

  With the class Print, we are able to print the stament from that hash.

* Code strategy.

 I have tried to write the code following the principles of single responsabilitie and correct encapsulation. That means that the intention is the classes and the methods works doing just simple task very specific.

 The relationship between classes has been done with dependency injection in such way that Bank class has everything it is needed for run all the program creating just one instance of that class.

 Doing that the only thing it is needed for to add or change one method is to do it their respective part of the code and that implementation will not affect the result for the other parts once is implemented.

2. TESTING APPROACH.

All the code has been tested looking for a 100% coverage.

The test look for the correct functionality of the program, testing classes are created correctly, works independently , methods are responding and are returning what it is expected.

3. INSTRUCTIONS TO RUN THE PROGRAM. 

This program is intended to be displayed in the command line, and it is necessary to use IRB console to run the commands and see the result.

  - In the root of the project, in the terminal type
   ```
   $ irb 
   ```
  - once in the console to use the methods and obtain a result , type the following.
  ```
  $ require './lib/bank.rb'
  ```
  You should obtain a true result.

  Once it is done you can play with the program like that:

  ```
  $ instance = Bank.new("John Doe") // it will create an instance of the Bank class.

  $ instance.print.account.deposit(100) // will create a deposit of 100$, at the current date the deposit is made (real time)

  $ instance.print.account.withdrawal(50) // will  create a 50$ withdrawal registered at the date and time the withdrawal is made.

  $ instance.print.print_statement //will print all the registers in the account.

  ```
   if a withdrawal is made without funds in the account, an error message will arise.

   ``` 
   Runtime Error(Not enough funds in the account)

   ``` 
   
  3.1 Running Rspec and coverage.

  To run rspec, just type in the terminal,

     $ rspec 

  That will display the result of the tests and de % of coverage.



4. SETUP PROJECT.

  To see  the setup proccess i have made for this project , check the SETUP_GUIDE file included.

