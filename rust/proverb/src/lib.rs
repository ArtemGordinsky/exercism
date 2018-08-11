#![crate_type = "lib"]
#![crate_name = "proverb"]

use std::string::String;

pub fn build_proverb(input: Vec<&str>) -> String {
    let mut proverb = vec![];

    for (i, item) in input.iter().enumerate() {
        let next = input.get(i + 1);

        if next.is_some() {
            proverb.push(format!("For want of a {} the {} was lost.", item, next.unwrap()))
        }
        else {
            if input.len() < 3 {
                proverb.push(String::from("And all for the want of a nail."));
            }
            else {
                proverb.push(String::from("And all for the want of a horseshoe nail."));
            }
        }
    }

    proverb.join("\n")
}