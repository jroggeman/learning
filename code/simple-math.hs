-- Baby's first function
doubleMe x = x + x

-- A function with multiple arguments
doubleUs x y = x * 2 + y * 2

-- The previous function rewritten using function composition
doubleUs' x y = doubleMe x + doubleMe y

-- Introduction to if/else expressions. Note else is required.
doubleSmallNumber x = if x > 100
                      then x
                      else x * 2
