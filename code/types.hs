myCoolFunc :: [Integer] -> [Integer]
myCoolFunc nums = [x^2 | x <- nums, x > 5]
