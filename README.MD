# TDD Katas

What does _kata_ mean? According to Wikipedia:

```
Kata, a Japanese word, meaning literally: "form" (型 or 形), is a detailed choreographed pattern of movements made to be practiced alone, but are also practiced within groups and in unison when training. It is practiced as a way to memorize and perfect the movement being executed.
```

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

