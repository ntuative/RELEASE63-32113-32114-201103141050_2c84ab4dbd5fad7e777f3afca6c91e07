package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["PetInventoryUpdatedEvent"] = const_186;
         param1["bound_to_parent_rect"] = const_96;
         param1["child_window"] = const_1091;
         param1["embedded_controller"] = const_1185;
         param1["resize_to_accommodate_children"] = const_72;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_847;
         param1["mouse_dragging_target"] = const_243;
         param1["mouse_dragging_trigger"] = const_368;
         param1["mouse_scaling_target"] = const_292;
         param1["mouse_scaling_trigger"] = const_428;
         param1["horizontal_mouse_scaling_trigger"] = const_237;
         param1["vertical_mouse_scaling_trigger"] = const_225;
         param1["observe_parent_input_events"] = const_1189;
         param1["optimize_region_to_layout_size"] = const_426;
         param1["parent_window"] = const_1079;
         param1["relative_horizontal_scale_center"] = const_197;
         param1["relative_horizontal_scale_fixed"] = const_151;
         param1["relative_horizontal_scale_move"] = const_393;
         param1["relative_horizontal_scale_strech"] = const_350;
         param1["relative_scale_center"] = const_1204;
         param1["relative_scale_fixed"] = const_876;
         param1["relative_scale_move"] = const_1147;
         param1["relative_scale_strech"] = const_1226;
         param1["relative_vertical_scale_center"] = const_198;
         param1["relative_vertical_scale_fixed"] = const_156;
         param1["relative_vertical_scale_move"] = const_343;
         param1["relative_vertical_scale_strech"] = const_295;
         param1["on_resize_align_left"] = const_724;
         param1["on_resize_align_right"] = const_516;
         param1["on_resize_align_center"] = const_490;
         param1["on_resize_align_top"] = const_862;
         param1["on_resize_align_bottom"] = const_432;
         param1["on_resize_align_middle"] = const_517;
         param1["on_accommodate_align_left"] = const_1073;
         param1["on_accommodate_align_right"] = const_536;
         param1["on_accommodate_align_center"] = const_728;
         param1["on_accommodate_align_top"] = const_1090;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_709;
         param1["route_input_events_to_parent"] = const_501;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1059;
         param1["scalable_with_mouse"] = const_1150;
         param1["reflect_horizontal_resize_to_parent"] = const_466;
         param1["reflect_vertical_resize_to_parent"] = const_488;
         param1["reflect_resize_to_parent"] = const_282;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1111;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
