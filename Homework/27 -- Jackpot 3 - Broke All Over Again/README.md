# Homework 

## Jackpot 3 - Broke All Over Again

Recreate the Jackpot application from early in the cohort. You can implement it in either Objective-C or Swift. Try not to reference your previous code if possible. Also, see if you can improve on the design.

Here is the description from the previous time this was assigned:

Create a single view application that shows a table view as its main interface to the user. Provide a Navigation Controller to handle eventual view transitions (we'll add these later) and also show a Navigation bar. Add an "add" button to the navigation bar that when tapped, will generate a quick pick lottery number and place it in a cell in the table view.

Quick pick is defined as a lottery number that is randomly generated. A lottery number is 6 integers that are within the range 1 through 53. Picking a number does not preclude it from being picked again for another of the 6 in the sequence.

Then add a winning number view that allows the user to select the winning numbers for the lottery drawing. Also add a method or methods that search through your random tickets and determine which ones are winners.

A winning ticket is one that has at least three numbers that match the winning ticket.

* 3 numbers = $1
* 4 numbers = $5
* 5 numbers = $20
* 6 numbers = $100

