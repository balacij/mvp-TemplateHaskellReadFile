{-# LANGUAGE TemplateHaskell #-}

module Lib (someFunc) where

import           Config (DC(..), readInCfg)
import           Data.Maybe (fromMaybe)

someFunc :: IO ()
someFunc = do
  putStrLn $ "version: " ++ version dc
  putStrLn $ "name: " ++ name dc

dc :: DC
dc = $readInCfg

