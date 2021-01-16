use proc_macro::TokenStream;
use std::str::FromStr;

#[proc_macro]
pub fn nut(input: TokenStream) -> TokenStream {
    internal_nut(input)
}

fn internal_nut(code_to_nut: TokenStream) -> TokenStream {
    let code_to_nut = code_to_nut.to_string();

    let replaced: String = code_to_nut
        .replace("& nut self", "& mut self")
        .replace("let nut", "let mut");

    TokenStream::from_str(&replaced).expect("this code can't nut :pensive:")
}
