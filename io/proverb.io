#!/usr/bin/env io
PROVERB_GENERATOR := "http://sprichwort.gener.at/or/"

main := method(
    body := URL with(PROVERB_GENERATOR) fetch
    pattern := Regex with("<div class=\"spwort\">(.*)</div>")
    body findRegex(pattern) at(1) println
)

if(isLaunchScript, main)
