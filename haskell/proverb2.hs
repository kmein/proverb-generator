#!/usr/bin/env stack
-- stack --resolver lts-7.8 runghc --package http-conduit --package text --package xml-conduit --package html-conduit
{-# LANGUAGE OverloadedStrings #-}
import Network.HTTP.Conduit (simpleHttp)
import Text.HTML.DOM (parseLBS)
import Text.XML.Cursor
import qualified Data.Text as T
import qualified Data.Text.IO as T (putStrLn)

main :: IO ()
main = do
    cursor <- (fromDocument . parseLBS) <$> simpleHttp url
    T.putStrLn . T.concat $ cursor $// findProverb &| extractData
  where
    url = "http://sprichwort.gener.at/or/"
    extractData = T.concat . content
    findProverb = element "div" >=> attributeIs "class" "spwort" >=> child
