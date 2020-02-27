# mi4-excersize4
Exercises: Develop and Unit Test Smart Contracts with Truffle We are going to build a contract which allows for funds raising. Mechanics are the same as a single Kickstarter campaign. There is a particular time to reach the goal. If this does not happen, donators are free to request a refund of transferred Ether. If a goal is reached, the owner of the smart contact can withdraw funds. We want to also allow for “anonymous” donation which is merely a transfer of funds to a smart contract. Even if we are saying anonymous, you need to know that all transactions are publicly visible Ether transfer. We are just unable to refund those funds. Original Source: Michal Zalecki With clearly defined scope we can start implementing our smart contract

Original Source: Michal Zalecki
With clearly defined scope we can start implementing our smart contract
1.	Implementing the Contract and Tests
Step 1.	Setting an Owner
The first feature we want our smart contract to have is an owner. Before we start writing the first test let’s create an empty Funding contract so our tests can compile.
 
 

Now, with an empty contract defined we can create a testing contract.
 
 
Note: Some linters will tell you that “truffle/Assert.sol” doesn’t exist. Just ignore this. Truffle will do his magic and everything will be fine.
Now we are ready to run our first test.
truffle test
	
Yay! If we got it right, contracts should compile without any errors. But we still don’t have any tests. We need to fix that. We want Funding to store an address of its deployer as an owner.
 

Each smart contract has an address. An instance of each smart contract is implicitly convertible to its address and this.balance returns contract’s balance. One smart contract can instantiate another, so we expect that owner of Funding is still the same contract. Now, to the implementation.
 
A sender of the message inside a constructor is a deployer. Let’s rerun the tests!
 
 
Now let’s create some tests in JavaScript as well.
 
 
In JavaScript, we can require a contract using artifacts.require. Instead of describe which you may know from other testing frameworks we use contract which does some cleanup and provides a list of available accounts. The first account is used by default during tests.
Before we run the tests, we have to create a migration for our contract in migrations/2_funding.js:
 
 
 
Now let’s run both tests together.
 
Apart from creating a new contract during tests, we would also like to access contracts deployed through a migration.
 
We can now rerun tests.
 
 

Step 2.	Accepting donations
Next feature on the roadmap is accepting donations. Let’s start with a test in Solidity.
 
We use a unit called Finney. You should know that the smallest, indivisible unit of Ether is called Wei (it fits uint type).
1 Ether is 10^18 Wei
1 Finney is 10^15 Wei
1 Szabo is 10^12 Wei
1 Shannon is 10^9 Wei
Initially, a contract has no spare ethers to transfer so we can set an initial balance. Ten Ether is more than enough. Let’s write an equivalent JavaScript test.
 
Implementation in the contract can be following:
 

For now, it is everything to make tests pass. Let’s try them.
 
Now, we would like to keep track of who donated how much.
 

 
Testing with JavaScript gives us an ability to test for multiple different accounts.
 
For tracking a balance of particular user, we can use mapping. We have to mark a function as payable, so it allows users to send Ethers along with function calls.
 
 
Let’s test and see if all of them will pass again.
 

What to Submit?
Create a zip file (e.g. your-username-contracts-truffle-unit-tests-exercise.zip) holding the 
Source code (without node_modules folder) and screenshots with your experiments. Make screenshots of the unit tests results.
Submit your zip file as homework at the course Web site.


