-- When compiled and run as a standalone program, haskell
-- will attempt to invoke the I/O action bound to the name "main".
-- By default, this is one action. Luckily, the "do" command lets us
-- add a bunch of lines to the block.
main = do
    -- We start by invoking our first very cool function to get data
    -- from the user
    (name, age) <- getUserInput

    -- We then call our formatter function to format the output
    -- as desired
    let output = formatOutput name age

    -- ... and print it.
    putStrLn output

-- This is another I/O action that we define. It retrieves input
-- from the user and returns a tuple containing the results.
getUserInput :: IO ((String, Int))
getUserInput = do
    -- Note here that we don't say "let name = getLine"; that would
    -- just define a new function called "name" that is identical to
    -- "getLine". Instead, we use the arrow (<-) to bind the result of the
    -- invoked I/O action to the variable.
    putStrLn "What is your name?"
    name <- getLine
    
    putStrLn "What is your age?"
    age <- getLine

    -- This sends a value back from an I/O action. Here, we send a tuple.
    -- We also do some maintenance work by parsing the age string as an Int.
    return (name, read age :: Int)

-- This defines our formatting function. It takes in a string and int,
-- and returns a string.
formatOutput :: String -> Int -> String
formatOutput name age =
    name ++ " is " ++ show age ++ " years old."
