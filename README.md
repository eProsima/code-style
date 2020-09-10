# Code Style for *eprosima Fast DDS*

This document describes the code style for the [*eprosima Fast DDS* project](https://github.com/eProsima/Fast-DDS) in order to improve the code readability and maintainability.

This code style is enforced through unit tests run automatically every time a pull request is done using [*uncrustify*](https://github.com/uncrustify/uncrustify).
Latest results from these tests can be found [here](http://jenkins.eprosima.com:8080/job/fastdds_github_uncrustify/lastBuild/).
These tests only run over those files where changes have been made.
Over time, this code style will apply to all source files.

## Language and Standard

*eprosima Fast DDS* project is mostly written in C++. The Standard followed is C++14.

## Formatting

The code style is formalized in the [uncrustify.cfg](uncrustify.cfg) file for the uncrustify tool. Below, the more important rules that are enforced are listed.

### Line length

The maximum line length is 120 characters.

### Character encoding

Non-ASCII characters should be rare and must use UTF-8 formatting.

### Indentation

Spaces are used for indentation instead of tabs.
Block indentation increases +4 spaces each time a new block or block-like construct is opened. When the block ends, the indent returns to the previous indent level.
If line-wrapping occurs an extra indentation of +8 spaces should be added.

### Vertical Whitespace

There must be one blank line between function or method declarations.

There must also be one blank line before and after access specifiers (`public`, `private` and `protected`) within a class definition.

Within a method or function declaration, there should be blank lines separating different functionalities. It should be convenient to start each functionality block with a comment.

### Horizontal Whitespace

[//]: # (TODO: Confirm with uncrustify.cfg -> There must be no trailing whitespace at the end of the line.)

#### Operators

Assignment operators always have spaces around them.
Other binary operators must also have spaces around them.

```v = W * x + y / z;```

### Conditionals and Loops

There should be a space between the keyword (`if`, `for`, `switch`, `while`, etc.) and the open parenthesis `(`.
There must always be braces `{ }`, even if there is no need (one line statements or empty statements). 

[//]: # (TODO: Confirm with uncrustify.cfg -> Every brace should be opened and closed in its own line.)

### Lambda expressions