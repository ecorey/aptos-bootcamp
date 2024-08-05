# Homework 5

# Write a simple module

---

- Take this module and this config file and complete the code and config according to the following :

---


- In the config file set the basic_address to be your wallet address

---


- In the module The Asset struct should have 2 fields 1. an unsigned 8 bit integer named flag 2. an unsigned 64 bit integer called value

---


- The function create has 2 arguments.

    - an unsigned 8 bit integer named flag
    - an unsigned 64 bit integer called value
    - The create function should create an instance of the asset struct using the arguments to populate the fields The create function should return an instance of the asset struct. The create function should not be visible to other modules.

---


- The build asset function should call the the create function , and only allow the creation of assets where the value is greater than 100, and the flag is 0 or 1. The function should throw an error if those requirements are not met, in either case giving an error code of 17. You do not need to do anything with the asset that was created.

---


- Hint : you can use the assert! macro