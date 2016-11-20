#!/usr/bin/env python3
from bs4 import BeautifulSoup
import urllib.request

PROVERB_GENERATOR = "http://sprichwort.gener.at/or/"

def get_proverb():
    with urllib.request.urlopen(PROVERB_GENERATOR) as f:
        html = f.read().decode("utf-8")
        soup = BeautifulSoup(html, "html.parser")
        proverb = soup.html.body.find(class_="spwort").string
        return proverb

if __name__ == "__main__":
    print(get_proverb())
