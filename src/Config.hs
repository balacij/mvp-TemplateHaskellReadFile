{-# LANGUAGE TemplateHaskell, DeriveLift, DeriveGeneric #-}

module Config (DC(..), readInCfg) where

import           Data.Aeson (decodeFileStrict, FromJSON, ToJSON)
import           GHC.Generics (Generic)
import           Language.Haskell.TH.Syntax (Lift, addDependentFile)
import           Language.Haskell.TH (Exp, Q, runIO)

{- 
  Thank you to the following people for their helpful public resources.
   - 'leftaroundabout': https://stackoverflow.com/a/44369564/16760741
   - Mark Karpov: https://markkarpov.com/tutorial/th.html
-}
data DC = DC { version :: String, name :: String }
  deriving (Generic, Show, Lift)

instance ToJSON DC where


instance FromJSON DC where


readInCfg :: Q Exp
readInCfg = do
  let fp = "src/DrasilMetadata.json"
  maybeDC <- runIO (decodeFileStrict fp :: IO (Maybe DC))
  addDependentFile fp
  [|fromMaybe (error "could not read in the drasil metadata file") maybeDC|]
