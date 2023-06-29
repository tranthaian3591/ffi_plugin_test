use anyhow::{Ok, Result};
use serde_json::Value;

use crate::structs::column_layout_struct::VysmaColumnLayoutSetting;

pub fn create_root_widget_tree() -> VysmaColumnLayoutSetting {
    return VysmaColumnLayoutSetting::default_setting();
}

pub fn column_layout_default_setting() -> Result<VysmaColumnLayoutSetting> {
    Ok(VysmaColumnLayoutSetting::default_setting())
}

// region : setting to string

pub fn column_layout_setting_to_string(widget_tree: VysmaColumnLayoutSetting) -> Result<String> {
    Ok(hcl::to_string(&widget_tree).unwrap())
}

// end region : setting to string

// region : string to setting
pub fn string_to_column_layout_setting(data: String) -> Result<Option<VysmaColumnLayoutSetting>> {
    let value: Value = hcl::from_str(&data).unwrap();

    let value_to_str = value.to_string();

    if value_to_str.is_empty() {
        Ok(None)
    } else {
        Ok(serde_json::from_str(&value_to_str).unwrap())
    }
}

// end region : string to setting

// region widgetType

pub enum WidgetType {
    Root,
    Row,
    Column,
    Button,
    Text,
    Icon,
}

pub fn widget_type_to_name(widget_type: WidgetType) -> Result<String> {
    match widget_type {
        WidgetType::Root => Ok("Root".to_string()),
        WidgetType::Row => Ok("Row".to_string()),
        WidgetType::Column => Ok("Column".to_string()),
        WidgetType::Button => Ok("Button".to_string()),
        WidgetType::Text => Ok("Text".to_string()),
        WidgetType::Icon => Ok("Icon".to_string()),
    }
}

pub fn widget_type_to_icon(widget_type: WidgetType) -> Result<String> {
    match widget_type {
        WidgetType::Root => Ok("assets/icons/row.svg".to_string()),
        WidgetType::Row => Ok("assets/icons/row.svg".to_string()),
        WidgetType::Column => Ok("assets/icons/column.svg".to_string()),
        WidgetType::Button => Ok("assets/icons/row.svg".to_string()),
        WidgetType::Text => Ok("assets/icons/row.svg".to_string()),
        WidgetType::Icon => Ok("assets/icons/row.svg".to_string()),
    }
}

// end region widgetType
