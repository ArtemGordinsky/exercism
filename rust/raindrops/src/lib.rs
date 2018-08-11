use std::string::String;

pub fn raindrops(number: u16) -> String {
    let mut raindrops = String::new();

    if number % 3 == 0 {
        raindrops.push_str("Pling");
    }

    if number % 5 == 0 {
        raindrops.push_str("Plang");
    }

    if number % 7 == 0 {
        raindrops.push_str("Plong");
    }

    if raindrops.len() == 0 {
        return number.to_string();
    }

    raindrops
}