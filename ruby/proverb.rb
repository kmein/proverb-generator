#!/usr/bin/env ruby
require "open-uri"
require "nokogiri"

PROVERB_GENERATOR = "http://sprichwort.gener.at/or/"

if __FILE__ == $PROGRAM_NAME
    Nokogiri::HTML(open(PROVERB_GENERATOR)).css("div.spwort").each do |proverb|
        puts proverb.content
    end
end
