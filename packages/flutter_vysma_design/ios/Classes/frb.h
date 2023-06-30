#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
typedef struct _Dart_Handle* Dart_Handle;

typedef struct DartCObject DartCObject;

typedef int64_t DartPort;

typedef bool (*DartPostCObjectFnType)(DartPort port_id, void *message);

typedef struct wire_uint_8_list {
  uint8_t *ptr;
  int32_t len;
} wire_uint_8_list;

typedef struct wire_VysmaColumnLayoutSetting {
  struct wire_uint_8_list *element_id;
  struct wire_uint_8_list *parent_element_id;
  struct wire_uint_8_list *icon;
  struct wire_uint_8_list *label;
} wire_VysmaColumnLayoutSetting;

typedef struct DartCObject *WireSyncReturn;

void store_dart_post_cobject(DartPostCObjectFnType ptr);

Dart_Handle get_dart_object(uintptr_t ptr);

void drop_dart_object(uintptr_t ptr);

uintptr_t new_dart_opaque(Dart_Handle handle);

intptr_t init_frb_dart_api_dl(void *obj);

void wire_create_root_widget_tree(int64_t port_);

void wire_column_layout_default_setting(int64_t port_);

void wire_column_layout_setting_to_string(int64_t port_,
                                          struct wire_VysmaColumnLayoutSetting *widget_tree);

void wire_string_to_column_layout_setting(int64_t port_, struct wire_uint_8_list *data);

void wire_widget_type_to_name(int64_t port_, int32_t widget_type);

void wire_widget_type_to_icon(int64_t port_, int32_t widget_type);

void wire_hello_world(int64_t port_);

struct wire_VysmaColumnLayoutSetting *new_box_autoadd_vysma_column_layout_setting_0(void);

struct wire_uint_8_list *new_uint_8_list_0(int32_t len);

void free_WireSyncReturn(WireSyncReturn ptr);

static int64_t dummy_method_to_enforce_bundling(void) {
    int64_t dummy_var = 0;
    dummy_var ^= ((int64_t) (void*) wire_create_root_widget_tree);
    dummy_var ^= ((int64_t) (void*) wire_column_layout_default_setting);
    dummy_var ^= ((int64_t) (void*) wire_column_layout_setting_to_string);
    dummy_var ^= ((int64_t) (void*) wire_string_to_column_layout_setting);
    dummy_var ^= ((int64_t) (void*) wire_widget_type_to_name);
    dummy_var ^= ((int64_t) (void*) wire_widget_type_to_icon);
    dummy_var ^= ((int64_t) (void*) wire_hello_world);
    dummy_var ^= ((int64_t) (void*) new_box_autoadd_vysma_column_layout_setting_0);
    dummy_var ^= ((int64_t) (void*) new_uint_8_list_0);
    dummy_var ^= ((int64_t) (void*) free_WireSyncReturn);
    dummy_var ^= ((int64_t) (void*) store_dart_post_cobject);
    dummy_var ^= ((int64_t) (void*) get_dart_object);
    dummy_var ^= ((int64_t) (void*) drop_dart_object);
    dummy_var ^= ((int64_t) (void*) new_dart_opaque);
    return dummy_var;
}
