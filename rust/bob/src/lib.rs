#![crate_type = "lib"]
#![crate_name = "bob"]

use std::string::String;

pub fn reply(input_sentence: &'static str) -> String {
    let sentence = input_sentence.trim();
    let contains_letters: bool = sentence.matches(char::is_alphabetic).count() > 0;
    let is_caps: bool = contains_letters && sentence.len() > 0 && sentence.to_uppercase() == sentence;

    if is_caps {
        String::from("Whoa, chill out!")
    } else if sentence.ends_with("?") {
        String::from("Sure.")
    } else if sentence.len() == 0 {
        String::from("Fine. Be that way!")
    } else {
        String::from("Whatever.")
    }
}