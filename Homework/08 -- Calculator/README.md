# Homework 08

## Calculator

Create a single view application that shows a calculator interface. It should have buttons for numbers 0 - 9 (plus a . button so you can add floating point numbers) as well as 7 operator buttons (addition, subtraction, multiplication, division, and equals, plus/minus, percent). It should also have a button to clear out the current transaction (clear). It will need a label to display the current value of the calculator. It should operate as you would expect from a normal calculator.

### Steps to Success

#### Storyboard Tasks
* [ ] Build UI with buttons for each operand and operator and include a label to display the input from the user.
* [ ] Apply autolayout rules to all UI elements to make sure they are responsive and will fit within the bounds of the device's screen.
* [ ] Connect all UI elements to either IBOutlets or IBActions as necessary.
#### Code Tasks
* [ ] Create a class called CalculatorBrain to hold state information about the current calculation. An object of this type will be created and destroyed as each "calculation transaction" is performed by the user.
* [ ] 