# {{PROBLEM}} Method Design Recipe

Copy this into a `recipe.md` in your project and fill it out.

## 1. Describe the Problem

User wants to check if a text starts with a capital letter and ends with a punctutation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

grammar_check(text) 
text: the sentence that will be checked
output: true or false, depending whether the sentence passes grammar checks

## 3. Create Examples as Tests

grammar_check("Hello, this is a good one.) --> true
grammar_check("hello, this is a good one.) --> false
grammar_check("Hello, this is a good one) --> false
grammar_check("hello, this is a good one) --> false
grammar_check("") --> throw an error saying no input
grammar_check([1,2,3]) --> throw an error saying invalid data type
grammar_check(nil) --> throw an error saying invalid data type
grammar_check(6) --> throw an error saying invalid data type

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
