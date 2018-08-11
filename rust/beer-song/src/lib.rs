#![crate_type = "lib"]
#![crate_name = "beer_song"]

use std::string::String;

pub fn sing(verse_from: u16, verse_to: u16) -> String {
    let mut song = String::new();
    let mut verses:Vec<String> = Vec::new();

    // Inclusive range is still "experimental" so I just increment the upper boundß
    for verse_i in verse_to..verse_from + 1 {
        verses.insert(0, verse(verse_i));
    }

    // Couldn't figure out how to join the vector nicely,
    // so I stupidly concatenate the verses like this ¯\_(ツ)_/¯
    for mut verse in verses {
        if song.len() > 0 {
            verse = format!("\n{}", verse)
        }

        song.push_str(verse.as_str())
    }

    song
}

pub fn verse(num: u16) -> String {
    let mut verse = String::new();

    match num {
        0 => verse.push_str("No more bottles of beer on the wall, no more bottles of beer.\n"),
        1 => verse.push_str("1 bottle of beer on the wall, 1 bottle of beer.\n"),
        _ => verse.push_str(format!("{0} bottles of beer on the wall, {0} bottles of beer.\n", num).as_str())
    }

    match num {
        0 => verse.push_str("Go to the store and buy some more, 99 bottles of beer on the wall.\n"),
        1 => verse.push_str("Take it down and pass it around, no more bottles of beer on the wall.\n"),
        2 => verse.push_str("Take one down and pass it around, 1 bottle of beer on the wall.\n"),
        _ => verse.push_str(format!("Take one down and pass it around, {} bottles of beer on the wall.\n", num - 1).as_str())
    }

    verse
}