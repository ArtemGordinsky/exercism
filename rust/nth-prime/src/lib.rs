#![crate_type = "lib"]
#![crate_name = "nth_prime"]

use std::result::Result;

pub fn nth(nth_prime: u32) -> Result<u32, &'static str> {
    if nth_prime == 0 {
        return Err("nth_prime must be a positive integer");
    }

    let mut primes: Vec<u32> = Vec::new();
    let mut primes_i = 1;

    // Generates primes until we have enough to return the "nth" one
    while primes.len() < nth_prime as usize {
        if is_prime(primes_i) {
            primes.push(primes_i);
        }

        primes_i += 1;
    }

    return Ok(primes[(nth_prime - 1) as usize])
}

// Adapted from https://stackoverflow.com/a/1801446/1784564
pub fn is_prime(n: u32) -> bool {
    match n {
        1 => return false,
        2 => return true,
        3 => return true,
        _ => (),
    }

    if n % 2 == 0 {
        return false
    }
    if n % 3 == 0 {
        return false
    }

    let mut i: u32 = 5;
    let mut w: u32 = 2;

    while i * i <= n {
        if n % i == 0 {
            return false
        }

        i += w;
        w = 6 - w;
    }


    return true
}