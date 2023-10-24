use yew::prelude::*;
mod styles;

#[function_component(HolyGrail)]
pub fn holy_grail() -> Html {
    let hg_class_name = styles::holy_grail().get_class_name().to_string();
    let hf_class_name = styles::header_and_footer().get_class_name().to_string();
    html! {
        <div class={hg_class_name}>
            <header class={hf_class_name.clone()}>{"Header"}</header>
            <footer class={hf_class_name}>{"Footer"}</footer>
        </div>
    }
}


#[function_component(App)]
fn app() -> Html {
    let body_html_class_name = styles::body_and_html().get_class_name().to_string();
    html! {
        <div class={body_html_class_name}>
            <HolyGrail />
        </div>
    }
}

fn main() {
    yew::Renderer::<App>::new().render();
}
