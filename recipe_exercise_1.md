# {{PROBLEM}} Method Design Recipe

Copy this into a `recipe.md` in your project and fill it out.

## 1. Describe the Problem

The user wants to find out how long it would take them to read a certain bit of text. They can read 200 words per minute.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._
text_estimator(text)
text: the bit of text that will be checked. could be a long paragraph (over 200 words to make sure we get a value over a minute) and also short texts
text_estimartor: a string (e.g. "2 minutes")

## 3. Create Examples as Tests

text_esimator("very long text that includes around 2600 words..") => "13 minutes"
text_estimator("very short text which includes around 400 words..") => "2 minutes"
text_estimator("somewhere around 250 words so we go over a minute..") => "1 minute"
text_estimator("somewhere around 150 words so we go under 200..") => "0 minutes"
text_estimator("") => throws an error
text_estimator(nil) => throws an error
text_estimator(6) => throws an error
text_estimator(["texty text"]) => throws an error

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
