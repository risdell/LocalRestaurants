use stylist::Style;

pub fn main_viewport() -> Style {
    Style::new(
        r#".main-viewport {
            flex: 100%;
            background-color: red;
        }"#,
    )
    .unwrap()
}

// pub fn body() -> Style {
//     style! {
//         "body {
//             height: 100vh - 100px;
//         }"
//     }
//     .unwrap()
// }

// pub fn header_and_footer() -> Style {
//     style! {
//         "header, footer {
//             background-color: #ccc;
//             height: 50px;
//             text-align: center;
//             line-height: 50px;
//         }"
//     }
//     .unwrap()
// }
