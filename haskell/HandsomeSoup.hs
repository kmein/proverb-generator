#!/usr/bin/env stack
-- stack --resolver lts-7.8 runhaskell --package HandsomeSoup --package hxt
import Control.Arrow ((>>>))
import Text.HandsomeSoup (fromUrl, css)
import Text.XML.HXT.Core (runX, (//>), getText)

main :: IO ()
main = runX (fromUrl url >>> css "div.spwort" //> getText) >>= mapM_ putStrLn
  where
    url = "http://sprichwort.gener.at/or/"
