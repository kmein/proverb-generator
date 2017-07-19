extern crate reqwest;
extern crate scraper;

use std::io::Read;
use scraper::{Html, Selector};

fn main() {
    let mut resp = reqwest::get("http://sprichwort.gener.at/or/").unwrap();
    assert!(resp.status().is_success());
    let mut content = String::new();
    resp.read_to_string(&mut content).unwrap();

    for spwort in Html::parse_document(&content).select(&Selector::parse(".spwort").unwrap()) {
        println!("{}", spwort.inner_html());
    }
}
