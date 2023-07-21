{-# LANGUAGE TemplateHaskell #-}
module Lib
    ( someFunc
    ) where

import Language.Haskell.TH

{- Credits to 'leftaroundabout': https://stackoverflow.com/a/44369564/16760741 -}
readIn :: String
readIn = $(LitE . StringL <$> runIO (readFile "src/example.txt"))

someFunc :: IO ()
someFunc = putStrLn readIn
