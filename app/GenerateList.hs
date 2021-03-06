module GenerateList where

import System.Random

getListSizes :: [Int]
getListSizes = map round [2 ** 2, 2 ** 4, 2 ** 6, 2 ** 8, 2 ** 10, 2 ** 12]

getListSize :: Int -> Int
getListSize x = if x >= length getListSizes then 0 else getListSizes !! x

getBiggestSize :: Int
getBiggestSize = last getListSizes

generateRandomList :: Int -> IO [Int]
generateRandomList 0 = return []
generateRandomList n = do
  r <- randomRIO (0, getBiggestSize)
  rs <- generateRandomList (n -1)
  return (r : rs)
