use gloo_utils::document;
use leaflet::{LatLng, Map, TileLayer};
use wasm_bindgen::{prelude::*, JsCast};
use web_sys::{Element, HtmlElement, Node};
use yew::{html::ImplicitClone, prelude::*};

pub enum Msg {}

#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Point(pub f64, pub f64);

#[derive(PartialEq, Clone, Debug)]
pub struct City {
    pub name: String,
    pub lat: Point,
}

impl ImplicitClone for City {}

#[derive(PartialEq, Properties, Clone)]
pub struct Props {
    pub city: City,
}

pub struct MapComponent {
    map: Map,
    lat: Point,
    container: HtmlElement,
}

impl MapComponent {
    fn render_map(&self) -> Html {
        let node: &Node = &self.container.clone().into();
        Html::VRef(node.clone())
    }
}

impl Component for MapComponent {
    type Message = Msg;
    type Properties = Props;

    fn create(ctx: &Context<Self>) -> Self {
        let props = ctx.props();

        let container: Element = document().create_element("div").unwrap();
        let container: HtmlElement = container.dyn_into().unwrap();
        container.set_class_name("map");
        container.set_attribute("style", "height: 50vh;").unwrap(); // example inline style
        let leaflet_map = Map::new_with_element(&container, &JsValue::NULL);
        Self {
            map: leaflet_map,
            container,
            lat: props.city.lat,
        }
    }

    fn view(&self, _ctx: &Context<Self>) -> Html {
        html! {
            <div style="height: 50vh">
                {self.render_map()}
            </div>
        }
    }

    fn rendered(&mut self, _ctx: &Context<Self>, first_render: bool) {
        if first_render {
            self.map.setView(&LatLng::new(self.lat.0, self.lat.1), 11.0);
            add_tile_layer(&self.map);
        }
    }

    fn update(&mut self, _ctx: &Context<Self>, _msg: Self::Message) -> bool {
        false
    }

    fn changed(&mut self, ctx: &Context<Self>, _old_props: &Self::Properties) -> bool {
        let props = ctx.props();

        if self.lat == props.city.lat {
            false
        } else {
            self.lat = props.city.lat;
            self.map.setView(&LatLng::new(self.lat.0, self.lat.1), 11.0);
            true
        }
    }
}

fn add_tile_layer(map: &Map) {
    TileLayer::new(
        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        &JsValue::NULL,
    )
    .addTo(map);
}
