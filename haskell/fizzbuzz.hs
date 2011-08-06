fizzbuzz' :: [(Integer, String)] -> Integer -> String
fizzbuzz' ss n = foldl (\str (num, subst) -> if n `mod` num == 0 then str ++ subst else str ++ "") "" ss

fizzbuzz :: [(Integer, String)] -> Integer -> String
fizzbuzz ss n = if null str then show n else str
  where str = fizzbuzz' ss n

-- mapM_ putStrLn $ map (fizzbuzz [(3, "fizz"), (5, "buzz"), (7, "dazz")]) [1..21]
