use stylist::{style, Style};

pub fn body_and_html() -> Style {
    style! {
        "body, html {
            height: 100%;
            padding: 0;
            margin: 0;
        }"
    }.unwrap()
}

pub fn holy_grail() -> Style {
    style! {
        ".holy-grail {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }"
    }.unwrap()
}

pub fn header_and_footer() -> Style {
    style! {
        "header, footer {
            background-color: #ccc;
            height: 50px;
            text-align: center;
            line-height: 50px;
        }"
    }.unwrap()
}

