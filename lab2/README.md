# Introduction to C programming
## Overview
The purpose of this lab is to introduce the following basics of the C programming language:
1. Program structure
2. Data types
3. Conditionals
4. Loops
5. Compilation

## Hello World!
The source is [here](./src/hello_world.c)  

### Run-down
Some of you may have seen this snippet of code before, it simply prints the string `"Hello world"` to console.

Let us go through the each components in this code snippet:

- `#include <stdio.h>`
    * `stdio.h` is a header file for **st**an**d**ard **IO** (input/output)
    * A header file usually contains function (more on this later) declarations. This allows separation of source code (we don't really want a thousand line long code file).
    * It has the `printf` function we want to use
    * Functions in programming are similar to mathematical functions in the sense that when you give it an input, it typically produces an output.
    * However, functions in programming are distinct from mathematical functions for the following reasons:
        * They may not return any value
        * The returned value may not be unique
        * The returned value may not be reproducible
- `int main()`
    * Here we declare a function called `main` with return type `int` (integer)
    * The `main` function is a special function as it is the entrypoint of the program
    * Notice we use `{}` brackets to indicate the start and end of the function
- `printf("Hello world!\n");`
    * We are simply calling the `printf` function with the argument (just like command arguments in lab 1) `"Hello world!\n"`
    * The `\n` is the ascii character line feed `0x0A`, essentially a return
- `return 0`
    * Similar to mathematical functions, the `return` here is the output of the function
    * In addition, you can consider the similarity between the two:
        * Math: `y = f(x)`, `f(x) = 5x`
        * C: `variable = function(x)`, `int function(int x) { return 5 * x; }` [^1]

### Compilation
#### Overview
Cool, now we have the code for the program, but how do we actually run the program? While programmers can understand the source code, but machines can't, we need to translate it for the machine. This step is called **compilation**.  
We will be using `gcc` for this course, it is a powerful C compiler  
The easiest call to it is simply just `gcc [source file]`, i.e. `gcc hello_world.c`  
If you do this, you'll notice an `a.out` file has been created, it is indeed the compiled program since we did not specify a name for the output  

#### Command run-down
Here are the flags we want you to understand and use:
- `Wall` stands for **W**arning **all** 
    * It will show warnings with your code, please pay attention to it
- `Werror` stands for **W**arning as **error** 
    * Unless you have a very good reason warning are just as important as errors
    * For almost all code you write in your life, you won't have a good reason
    * Warnings do not prevent compilation while errors do, with this flag, warnings do as well
- `o` specifies the name of the output file
    * The flag takes an argument, being the name of the output

Putting everything together: `gcc -Wall -Werror -o hello_world hello_world.c`

#### Makefile
It is a pain to remember and type the command everytime you wish to compile. This introduces inefficiency and possibility for error.
Makefile is an easy way to keep our make environment consistent.

You can learn how to use the Makefile we've provided [here](#how-to-use-a-makefile)

### Execution
Awesome, now we have compiled the program. How do we run it? Since it's a program, you can run the same way you run `gcc`. Try it out.

You will most likely get an error that says something like `command not found`. Now what is that?

Recall in lab 1, we learned about how to find the path of a file, you'll have to do something like that here as well, using `./hello_world`

This begs the question, why can we just do `gcc` but not `hello_world` [^2]

## Data types
In C, you need to define the type of variables. However, remember that all data are stored as bits. The type is user defined and computers simply follow that definition. There is nothing preventing you from telling the computer to interpret these bits as one type or the other.

Here are some data types:
- `int`
    * Short for integer
    * Is signed
    * Assume 32-bits wide unless explicitly told otherwise
- `unsigned int`
    * Same as int but unsigned
- `float`
    * Short for floating point
    * Assume follows IEEE 754 format (32-bits wide)
- `double`
    * "Doubles" the precision of `float`
    * Usually not needed
- `char`
    * Short for character
    * ALWAYS 8-bits wide
    * Used for a single ASCII

## Conditionals
Conditionals are useful for describing different possible behaviors.  

Consider this [code snippet](./src/conditional.c)  
Feel free to compile and play around with the program and guess what it does.

Notice the construct of `if ([expression])`, you may consider these `if` statements functions that only gets executed if the expression is `true`

## Loops
Loops are useful for running the same operation multiple times, as we don't want to copy paste the same code multiple times or if the amount of runs is unknown at compile time.

Consider this [code snippet](./src/loop.c)  
Feel free to compile and play around with the program and guess what it does.

There are two different loop constructs, `for` loop and `while` loop.  

Here is the construct of a `for` loop: `for ([initialize]; [conditional]; [iteration]) { [body] }`
- `[initialize]`, `i = 0` in our case, is executed once at the beginning
- `[conditional]`, `i < count` in our case, is resolved once right after initialize, then resolved every time the `[body]` finishes executing
    * If `[condition]` resolved to `true` the loop continues and vice versa
- `[iteration]`, `i = i + 1` in our case, is executed right after every `[conditional]` except for the first one

Here is the construct of a `while` loop: `while ([conditional]) { [body] }`
- `[condition]` is resolved once at the beginning, then every time `[body]` was finishes executing
    * If `[condition]` resolved to `true` the loop continues and vice versa

## Assignment
### 1. Data types
#### Overview
You will modify [num_comps.c](./src/num_comp.c). You will do three computation for each of four data types.

The computation are as follows:
1. `-22 * 33`
2. `12 / 3`
3. `10 / 3`
4. `12 % 3` (ONLY FOR `int`)
5. `-11 % 3` (ONLY FOR `int`)

The data type are as follows:
1. `int`
2. `unsigned int`
3. `float`
4. `double`

The file already contains an example calculating `-22 * 33` using `int`.

Note:
1. Keep the numbers as-is, it is ok to assign a negative number to `unsigned int`
2. Make sure to also modify the printf specifier
    * `%d` for `int`
    * `%f` for `float` and `double`
    * `%u` for `unsigned int`
3. It may be an good idea to guess what the correct result should be prior to doing the computation

#### Turn-in (Through git)
Record the result for each of these computation in `lab2.txt`.

### 2. Loops
#### Overview
You will modify [lab2.c](./src/lab2.c) to use a `while` loop instead of the `for` loop.

When attempting to compile, you will likely encounter `undefined reference to sqrt`. This is due to `math.h` not being part of standard C library and must be linked statically. You can simply add the `-lm` flag during compilation

We expect the behavior between the program with the `while` loop to be exactly the same as with the `for` loop.

#### Turn-in (Through git)
The modified source code. (Keep the name the same)


## Appendix
### How to use a Makefile
The Makefile is [here](./Makefile)  
Here are some aspect of the Makefile you should understand:
- `CC`
    * Refers to C Compiler, which is `gcc` in our case
- `CFLAGS`
    * Refers to compilation flags
- `$(CC) $(CFLAGS) $(PROG)`
    * We use our previously defined variable 
    * This expands to `gcc -Wall -Werror $(PROG)`
    * `$(PROG)` is an argument provided by the user
- `clean`
    * Some times we want to compile everything from scratch
    * A clean function is useful then

Note that the Makefile creates a `build` folder to store the compiled program, it will not be in the same location as the source

You can invoke the Makefile by simply doing `make $(function)`  
For example, if you wanted to clean, it is `make clean`  
If you wanted to compile a program, it is `make build PROG=path/to/source`

[^1]: C is statically-type, meaning the data type of the variable has to be known at compile time, unlike Python, this is why you see the `int`

[^2]: The terminal (bash) is handling a lot of work for you. When you call something like `gcc`, it is not trying to find it in your working directory, but in `PATH`. `PATH` is a collection of locations, for the terminal to find commonly used programs. You can see what the locations are by doing `echo $PATH`. 