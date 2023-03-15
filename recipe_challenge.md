# {{PROBLEM}} Method Design Recipe

Copy this into a `recipe.md` in your project and fill it out.

## 1. Describe the Problem

User wants to keep track of their tasks. They have notes which include #TODO in them. 
We have to develop a method which checks the text input for #TODO's.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

check_for_todo(text)
text: the sentenc to cross check. input will be string
output: either true or false depending whether the sentence has the term #TODO in it.

## 3. Create Examples as Tests

check_for_todo("Hi. This is a sentence which includes #TODO in it.") --> true
check_for_todo("Hi. This is a sentence which does not have todo in it.") --> false
check_for_todo("#TODO this is a sentence which includes in it.") --> true
check_for_todo("this is a sentence which includes in it #TODO") --> true
check_for_todo("absolutely no mention of the word whatsoever") --> false

checking for edge cases

check_for_todo("") --> throw an error no input
check_for_todo(2) --> throw an error - invalid data type
check_for_todo(["str","kaleka"]) --> throw an error - invalid data type
check_for_todo(nil) --> throw an error - invalid data type

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
