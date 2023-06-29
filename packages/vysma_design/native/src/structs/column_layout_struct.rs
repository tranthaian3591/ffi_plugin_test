use flutter_rust_bridge::frb;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[frb]
#[derive(Serialize, Deserialize)]
pub struct VysmaColumnLayoutSetting {
    #[frb(non_final)]
    pub element_id: String,
    #[frb(non_final)]
    pub parent_element_id: String,

    #[frb(non_final)]
    pub icon: String,
    #[frb(non_final)]
    pub label: String,
}

impl VysmaColumnLayoutSetting {
    pub fn default_setting() -> VysmaColumnLayoutSetting {
        VysmaColumnLayoutSetting {
            icon: "assets/icons/column.svg".to_string(),
            label: "Label Item".to_string(),
            element_id: Uuid::new_v4().to_string(),
            parent_element_id: String::from(""),
        }
    }
}
