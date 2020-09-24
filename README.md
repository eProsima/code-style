# Code Style for *eprosima Fast DDS*

This document describes the code style for the [*eprosima Fast DDS* project](https://github.com/eProsima/Fast-DDS) in order to improve the code readability and maintainability.

This code style is enforced through unit tests run automatically every time a pull request is done using [*uncrustify*](https://github.com/uncrustify/uncrustify).
The latest results from these tests can be found [here](http://jenkins.eprosima.com:8080/job/fastdds_github_uncrustify/lastBuild/).
These tests only run over those files where changes have been made.
Over time, this code style will apply to all source files.

## Language and Standard

*eprosima Fast DDS* project is mostly written in C++.
The followed Standard is C++14.

## Formatting

The code style is formalized in the [uncrustify.cfg](uncrustify.cfg) file for the uncrustify tool.
The most important rules that are enforced are listed below.

### Line length

The maximum line length is 120 characters.

### Character encoding

Non-ASCII characters should be rare and must use UTF-8 formatting.

### Indentation

Spaces are used for indentation instead of tabs.

Block indentation increases +4 spaces each time a new block or block-like construct is opened.
When the block ends, the indent returns to the previous indent level.
If line-wrapping occurs, an extra indentation of +8 spaces should be added.

### Vertical Whitespace

There must be one blank line between function or method declarations.

There must also be one blank line before and after access specifiers (`public`, `private` and `protected`) within a class definition.

Within a method or function declaration, there should be blank lines separating different functionalities.
It is convenient to start each functionality block with a comment.

### Horizontal Whitespace

There should not be any trailing whitespace at the end of the line.

#### General

When declaring variables, there must be only one space between the type and the variable name.
If several variables are declared in the same line, there must be a space after the comma, but not before.
This also applies to function declarations and callings.

There must be no space before semicolons.

When declaring arrays, the opening square bracket `[` should be always adjacent to the variable name.

Before a backslash-newline `\` there should be a space.

In `case` statements, there should not be a space before the colon `:`.

#### Loops and Conditionals

There must be a space between the keyword (`if`, `for`, `switch`, `while`, etc.) and the open parenthesis `(`.
There should not be a space after the closing parenthesis `)` of a control statement.

In `for` loops, there is always one space after each semicolon.

#### Operators

Assignment operators always have spaces around them.
This also affects to compound assignment operators.

Other binary arithmetic operators must also have spaces around them.
This does not apply to the sign and the increment `++` and decrement `--`, which should be adjacent to the variable it affects.

```c++
v = -5 * x + y / --z;

x += y++;
```

Logical operators `&&` and `||` should also have spaces around them.
This does not apply to unary logical operator `!` which should be written adjacent to the variable it affects.

Similarly, bitwise operators should have spaces around them, except the unary complement (bit inversion) operator `~` which should also be written adjacent to the variable it affects.

Comparison operators ought to have spaces around them too.

```c++
if (param1 == 0 && param1 > 3 || !param2)
{
}
```

There should be no space around member operators `.` and `->`.

Address-of `&` and de-reference `*` unary operators should be always adjacent to the variable they affect.

When overloading an operator, there should be a space between the `operator` keyword and the operator being overloaded.

```c++
Subscriber& Subscriber::operator <<(
        const qos::SubscriberQos& qos)
{
    this->qos(qos);
    return *this;
}
```

#### Templates

There should be a space between closing angles `>`.

```c++
std::map<std::string, std::vector<DataWriterImpl*> > writers_;
```

#### Line-end Comments

Lines that are non-obvious should get a comment at the end of the line.
These end-of-line comments should be separated from the code by a space.

### Function Declarations and Definitions

To improve parameter readability, each parameter must be in its own line, even the first one, and even if there is only one parameter.
The line-wrapping indentation is to be used in this case.
Never indent to the opening parenthesis level.

This does not apply when calling the function.
In this case the parameters should be in the same line taking into account the space after each comma that separates the parameters.

The closing parenthesis `)` should be adjacent to the last parameter on the list.

The opening and close braces should be each alone in their own line.

Method definition should not have any indentation.

```c++
void EDPStatic::assignRemoteEndpoints(
        const ParticipantProxyData& pdata)
{
    // Method body
}
                                        // Blank line between methods
// Incorrect
void EDPStatic::assignRemoteEndpoints(const ParticipantProxyData& pdata)
{
    // Method body
}

bool EDPStatic::newRemoteReader(
        const GUID_t& participant_guid,
        const string_255& participant_name,
        uint16_t user_id,
        EntityId_t ent_id)
{
    // Method body
}
```

### Loops and Conditionals

There must always be braces `{ }`, even if there is no need (one line statements or even empty statements).
Additionally, both the opening and closing braces should be each alone in their own new line.

```c++
// Correct
if (!error)
{
    return success;
}

// Incorrect
if (!error)
    return success;

// Incorrect
if (!error) return success;
```

### Pointer and Reference Expressions

When declaring a pointer or reference variable, the `*` or `&` must be always adjacent to the type and introduce a space before the variable name.
This also applies when declaring a prototype and defining a function or method.

In case of defining double pointers (pointer to pointer), there should be no space between the asterisks `*`.

```c++
char* p;
int** ptr;
int& x;

const DomainParticipant* get_participant() const;
```

### Lambda Expressions

Format parameters and bodies as for any other function, and capture lists like other comma-separated lists.

In by-reference captures, do not leave a space between the ampersand `&` and the variable name.

There should not be a space separating the closing square bracket `]` from the opening parenthesis `(` when an argument list is present in the lambda expression.

Lamba bodies should be indented following the indentation rules and both the opening and closing braces should be each alone in their own line.

```c++
    auto init_fun = [this, reader, &att, &rqos](
        ReaderProxyData* rpd,
        bool updating,
        const ParticipantProxyData& participant_data)
    {
        // Lambda Body
    };
```

### Class Format

Any base class name should be on the same line as the subclass name, subject to the 120-column limit.

The braces should open and close each in its own line.
This also applies to structures `struct`, unions `union` and enumerates `enum`.

The `public:`, `protected:`, and `private:` keywords should not be indented.
Except for the first instance, these keywords should be preceded by a blank line.
There should be a blank line after these keywords.

```c++
class DomainParticipant : public Entity
{
public: // No indentation
                                                // Blank line
    RTPS_DllAPI ReturnCode_t get_qos(
        DomainParticipantQos& qos) const;
                                                // Blank line before
protected:
                                                // and after
    RTPS_DllAPI DomainParticipant(
            DomainId_t domain_id,
            const DomainParticipantQos& qos,
            DomainParticipantListener* listener,
            const StatusMask& mask = StatusMask::all());
};
```

### Constructor Initializer List

Constructor initializer parameters should be each in one line.
Except for the first parameter which is preceded by a colon `:`, the rest should have the comma `,` before the name.
There should also be a space between the colon or the comma and the parameters following the [horizontal whitespace rules](#horizontal-whitespace).

The indentation in this case, instead of being +8 spaces, is only of +4 spaces.

```c++
DynamicType::DynamicType()
    : descriptor_(nullptr)
    , name_("")
    , kind_(TK_NONE)
    , is_key_defined_(false)
{
}
```

### Namespace Formatting

When declaring a namespace, the open brace should be in the same line as the declaration, separated one space from the namespace name.
This is the only exception in the code style where the opening brace is not in its own line.

Namespaces do not add an extra level of indentation.

There should be a comment after the closing brace of the namespace, even more if the scope of the namespace is great enough and there may be doubts about which namespace is being closed.

```c++
namespace network {
namespace ip {

class IPv4 // Correct. No extra indentation in namespaces
{
public:

    long socket;
};

} // ip
} // network
```

### Templates

[//]: # (The uncrustify configuration file does not enforce that the template parameters should be each in a different line.)

The template declaration should be in a different line from the entity it modifies.

```c++
template<typename K, typename V>
struct map_size_helper : public detail::pool_size_helper<detail::map_node_size<K, V>::value>
{
};
```

### Preprocessor Directives

The hash mark `#` that starts a preprocessor directive should always be at the beginning of the line.
Even when preprocessor directives are within a block of indented code, the directives should start at the beginning of the line.

There should be a comment after `#endif` indicating the `#if` which is ending.
This is even more important when the scope of the `#if` is great enough, and there may be doubts.

```c++
    ProtocolVersion_t():
#if HAVE_SECURITY
        // As imposed by DDSSEC11-93
        ProtocolVersion_t(2,3)
#else
        ProtocolVersion_t(2,2)
#endif // HAVE_SECURITY
```

There must be spaces around the preprocessor `##` concatenation operator.

```c++
#define PASTE2( x, y) x ## y
```

## Struct vs Classes

Use a struct only for passive objects that carry data; everything else is a class.
It is advisable that structs do not provide any method, although public access methods could be accepted.
However, as the struct members should be public, there would be no need to provide those methods.

If more functionality is required, a class is more appropriate.
If in doubt, make it a class.

## Naming

Use names that describe the purpose or intent of the object.
Minimize the use of abbreviations that would likely be unknown to people outside the project.
Do not abbreviate by deleting letters within a word.

```c++
// Correct
int stock_size;
int num_errors;

// Incorrect
int n;
int nerr;
int s_size;
```

### Filenames

File extensions `.cpp` and `.hpp` are used for source files with C++ code.
On the other hand, use `.c` and `.h` extensions if the file is in C code.

Filenames should be all lowercase and can include underscores `_`.
However, class files that define or declare a class should take the class name.

### Type Names

Type names start with a capital letter and have a capital letter for each new word, with no underscores.
This convention is followed by all types: classes, structs, type aliases, enums, and type template parameters.
Usually, this convention is called *CamelCase*.

### Variable Names

The names of variables (including function parameters) and data members are all lowercase, with underscores between words.
Data members of classes (but not structs) additionally have a trailing underscore.

All data members should be private.
Accessors and mutators (get and set functions) will take the name of the variable they affect without the trailing underscore.

```c++
class Table
{
public:

    void row_count(
            long count)
    {
        row_count_ = count;
    }

    long row_count() const
    {
        return row_count_;
    }

    long& row_count()
    {
        return row_count_;
    }

private:

    long row_count_;
};
```

### Function Names

Function names are lowercase with underscores between words.

## C++ Features

### nullptr

For pointers (address values) not yet initialized, use `nullptr` as this provides type-safety.
