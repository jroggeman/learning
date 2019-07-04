# Functions, Types, and I/O
Learned about functions in general, types and typeclasses, and very basic IO.
Did some cool programs with it :)

## Functions
I didn't go through the functions chapter yet, but at least learned the very basics of authoring functions.

### Syntax
Unlike procedural languages, functions in Haskell are much more like mathematical functions. Rather than defining a list of steps, they simply define a specific output for a given input.

There are a few important consequences of this:
- Functions are **pure**. This means they can have no side effects - they can not manipulate global state.
- Functions are **idmepotent**. Calling a function with the same input _must_ produce the same ouptut.
- Functions _must_ return a value. Like any normal statement in haskell, a function returns a value. This has interesting consequences with things like `if` statements, which as a result **must** have a matching `else` statement.

### Example
```haskell
addNumbers x y = 
    x + y
```

### Type Annotations
Generally speaking, haskell can use type inference on both the defintion and usage of a function to determine what the resulting type should be. However, in case it's ambiguous, you want a more generalized type, or just want to follow best practices, you can define the type definition yourself:

```haskell
addNumbers :: Int -> Int -> Int
addNumbers x y = 
    x + y
```
This is read as "`addNumbers` is a function that takes two `Int`s as input and returns an `Int`."

A few notes:
- The `::` operator is read as "has a type of"
- You may note that there is no explicit way to separate the return of a function from its arguments. This will evidently be more clear as we go through the book. 
    - I expect that we're basically applying one argument at a time
    - e.g., addNumbers 3 returns a function that takes one number and adds it to three, which we then immediately apply.

## Type Classes
Rather than using concrete types, we can instead specify a type class for our function arguments. These behave like interfaces in other languages. In particular, if a type is a member of a specific type class, that type must have a certain set of behavior defined on it that is required by said class.

As an example, the `Eq` class encompsases types that are equatable. More specifically, any type that is a member of the `Eq` typeclass implements the `==` function to check for equality.

Note - I expect that interface implementation here is more implicit, such that the statement's converse is actually true. E.g., a type that implements the `==` method is innately a member of the `Eq` type class. We'll see later.

## I/O
As mentioned, functions in haskell are pure and can have no side effects. To let us actually interact with the world, then, haskell defines "I/O actions", which are special functions that do have side effects, and can return a result.

Any function of the form `myFunc :: IO ()` is an I/O action. I/O actions can only be called from the main method of the program, defined as the I/O action bound to the name `main`.

To allow for multiple steps for I/O actions, haskell introduces the `do` block, which is similar to a procedural language.

### Examples
```haskell
main = do
    putStrLine "Hello, world" -- Prints to the console

    putStrLine "What is your name?"
    name <- getLine                  -- See below for an explanation.
    putStrLine "Hello, " ++ name ++ "."
```

`getLine` as defined above is an I/O action of the type `IO (String)`. This means that there is a result retrieved from the IO. The arrow operator, `<-`, lets us bind the result of the IO operation to names within another I/O operation.
