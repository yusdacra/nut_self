# &nut self

It makes your code nut.

## Usage

Get `nut_self`:
```toml
[dependencies]
nut_self = "1.0"
```

Use `nut_self`:
```rust
use nut_self::nut;

nut! {
    fn main() {
        let nut count = 0;
        println!("nut count: {}", count);
        count += 1;
        println!("nut count: {}", count);
    }
}
```

See `example` directory for a more nutty example.
Run it with `cargo run --package example`.

## Credits
Thanks to [jan Pontaoski](https://github.com/pontaoski) for making the typo.