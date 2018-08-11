#![crate_type = "lib"]
#![crate_name = "difference_of_squares"]

use std::iter::Map;

pub fn square_of_sum(num: u64) -> u64 {
    let sum: u64 = (1..num + 1).sum();

    (sum as f64).powi(2) as u64
}

pub fn sum_of_squares(num: u64) -> u64 {
    let squares = (1..num + 1)
        .map(|num: u64| (num as f64).powi(2) as u64);

}

pub fn difference(num: u64) -> u64 {
    let sum: u64 = [1, num].iter().sum();
    (sum as f64).sqrt() as u64

}