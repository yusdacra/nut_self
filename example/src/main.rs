use nut_self::nut;

struct Nuts(u8);

impl Nuts {
    nut! {
        fn nut(&nut self) {
            self.0 += 1;
        }
    }

    nut! {
        fn reset_nuts(&nut self) -> u8 {
            let my_nuts = self.0;
            self.0 = 0;
            my_nuts
        }
    }
}

nut! {
    fn main() {
        let nut nuts = Nuts(0);
        println!("nut count: {}", nuts.0);
        for _ in 0..10 {
            nuts.nut();
        }
        println!("nut count: {}", nuts.0);
        nuts.reset_nuts();
        println!("nut count: {}", nuts.0);
    }
}
