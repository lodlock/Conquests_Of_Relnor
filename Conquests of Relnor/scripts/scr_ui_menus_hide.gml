///scr_ui_menus_hide(obj_menu)

var _menu = argument0;

for(var i = 0; i < scr_linked_list_size(_menu.objects); i++){
    var _drawObject = scr_linked_list_get_next(_menu.objects);
    _drawObject.isVisible = false;
}

_menu.isVisible = false;
