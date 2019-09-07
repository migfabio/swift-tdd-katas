# TDD Katas

What does _kata_ mean? According to Wikipedia:

> Kata, a Japanese word, meaning literally: "form" (型 or 形), is a detailed choreographed pattern of movements made to be practiced alone, but are also practiced within groups and in unison when training. It is practiced as a way to memorize and perfect the movement being executed.

The idea of kata for software development was originally coined by Dave Thomas (co-author of [The Pragmatic Programmer](https://www.amazon.co.uk/dp/020161622X/ref=cm_sw_em_r_mt_dp_U_nzvyDbJTKJR59)) and it's the same as in martial arts, practice and repetition to hone the skills and lock in the patterns.

In this repository, you will find my journey on refreshing and mastering TDD with Swift. Any issue is appreciate.

More reading:

* [Kata - the Only Way to Learn TDD](http://www.peterprovost.org/blog/2012/05/02/kata-the-only-way-to-learn-tdd/)
* [CodeKata](http://codekata.com/)

# The Three Laws of TDD

1. You are not allowed to write any production code unless it is to make a failing unit test pass.
2. You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

You must begin by writing a unit test for the functionality that you intend to write. But by rule 2, you can't write very much of that unit test. As soon as the unit test code fails to compile, or fails an assertion, you must stop and write production code. But by rule 3 you can only write the production code that makes the test compile or pass, and no more.

[Source](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd)

# Katas
Inspired by [this repo](https://github.com/wix/tdd-katas). Thank you!

<details>
  <summary>Greeter</summary>
  <p>

    PR: https://github.com/migfabio/swift-tdd-katas/pull/1

    1. Write a `Greeter` class with `greet` function that receives a `name` as input and outputs `Hello <name>`. The signature of `greet` should not change throughout the kata. You are allowed to construct `Greeter` object as you please.
    2. `greet` trims the input
    3. `greet` capitalizes the first letter of the `name`
    4. `greet` returns `Good morning <name>` when the time is 06:00-12:00
    5. `greet` returns `Good evening <name>` when the time is 18:00-22:00
    6. `greet` returns `Good night <name>` when the time is 22:00-06:00

  </p>
</details>

<details>
  <summary>String Calculator</summary>
  <p>
    
    PR: https://github.com/migfabio/swift-tdd-katas/pull/2
    
    Write a method `add` under an object `StringCalculator` that, given a delimited string, returns the sum of the numbers in the string.
    1. An empty string returns zero `'' => 0`
    2. A single number returns the value `'1' => 1` `'2' => 2`
    3. Two numbers, comma delimited, returns the sum `'1,2' => 3` `'10,20' => 30`
    4. Two numbers, newline delimited, returns the sum `'1\n2' => 3`
    5. Three numbers, delimited either way, returns the sum `'1\n2,3\n4' => 10`
    6. Negative numbers throw an exception with the message `'-1,2,-3' => 'Negatives not allowed: -1,-3'`
    7. Numbers greater than 1000 are ignored
    8. A single char delimiter can be defined on the first line starting with `//` (e.g `//#\n1#2` for a ‘#’ as the delimiter)
    9. A multi char delimiter can be defined on the first line starting with `//` (e.g. `//###\n1###2` for ‘###’ as the delimiter)
    
  </p>
</details>

<details>
  <summary>Prime Factors</summary>
  <p>
    
    PR: https://github.com/migfabio/swift-tdd-katas/pull/3
    
    Write a function `generate` under a module `PrimeFactors` that, given an integer, returns the list containing the prime factors in numerical sequence.

	- 1 should return `[]`
	- 2 should return `[2]`
	- 3 should return `[3]`
	- 4 should return `[2,2]`
	- 5 should return `[5]`
	- 6 should return `[2,3]`
	- 7 should return `[7]`
	- 8 should return `[2,2,2]`
	- 9 should return `[3,3]`
	- 13860 should return `[2,2,3,3,5,7,11]`
    
  </p>
</details>
