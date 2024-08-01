# Exercise 4

# Using the Move CLI

# Creating a simple project

---

- Follow the instructions from the lesson to install the Aptos CLI

- Create a directory called h4 and within that use the CLI to create a project
    - aptos move init --name h4

-You can also set up your environment within that directory by running
aptos init

- This will take you through setting up an account, choose the default network devnet.

---

- You can get extra funds from the faucet with
    - aptos account fund-with-faucet --account default

- See what resources and balance is associated with your account :
    - aptos account list --query balance --account default

    - aptos account list --query resources --account default

---

# Compiling a module

- Create a simple module in file h4.move which should be in the sources directory. You can use the code from this gist (Change the module address to be your account address)

- Compile your code with

    - aptos move compile   

- Deploy your code to devnet with

    - aptos move publish   

- Find the transaction on the block explorer, and recheck the resources and modules associated with your account.