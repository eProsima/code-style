# Code Style for eProsima open source Python projects

This document describes the code style for the [eProsima open source Python projects](https://github.com/eProsima) in order to improve the code readability and maintainability.

This code style is enforced through unit tests run automatically every time a pull request is done using [*flake8*](https://github.com/PyCQA/flake8).
There exist a Github action to run automatically these checks in [eProsima-CI](https://github.com/eProsima/eProsima-CI).

## Language and Standard

The scope of this document only affects eProsima open source projects written in Python language.
The followed Standard is [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html) with slide variations.

## Formatting

The code style is formalized in the [python_linter.cfg](python_linter.cfg) file for the flake8 tool.
The rules that are enforced or changed regarding the mentioned guide are enumerated below:

### Maximum line length

The maximum line length for the projects will be **100 characters**.
This decision has been deeply studied and discussed, but finally we decided 80 character line is too short in many cases, hindering readability.
*e.g. Sometimes 2 tabs plus a variable name and a method name is enough to overcome such limit.*

### Limit the use of double quotes "

In order to facilitate the redeability and to have a uniform code, single quote **`'` will be used for strings**.
The use of double quotes `"` is limited to:

- Inside strings that require a explicit `"` char.
- To declare strings that require an internal explicit `'` char.
- For multi-line comments `"""`.

### Maximum document length

In order to force the simplicity and readability of every file, each document is limited to **400 lines**.
Test files are exempt of such limitation.

### Maximum function complexity

In order to force the simplicity, readability and correctness of every function, the maximum [Cyclomatic or McCabe Complexity](https://en.wikipedia.org/wiki/Cyclomatic_complexity) allowed is **8**.
