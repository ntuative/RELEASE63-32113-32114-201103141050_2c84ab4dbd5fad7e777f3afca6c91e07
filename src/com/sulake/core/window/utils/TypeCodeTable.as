package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_849;
         param1["bitmap"] = const_871;
         param1["border"] = const_856;
         param1["border_notify"] = const_1411;
         param1["button"] = const_503;
         param1["button_thick"] = const_702;
         param1["button_icon"] = const_1642;
         param1["button_group_left"] = const_790;
         param1["button_group_center"] = const_756;
         param1["button_group_right"] = const_850;
         param1["canvas"] = const_792;
         param1["checkbox"] = const_679;
         param1["closebutton"] = const_999;
         param1["container"] = const_398;
         param1["container_button"] = const_645;
         param1["display_object_wrapper"] = const_908;
         param1["dropmenu"] = const_556;
         param1["dropmenu_item"] = const_450;
         param1["frame"] = const_387;
         param1["frame_notify"] = const_1437;
         param1["header"] = const_770;
         param1["html"] = const_1207;
         param1["icon"] = const_1093;
         param1["itemgrid"] = const_1035;
         param1["itemgrid_horizontal"] = const_518;
         param1["itemgrid_vertical"] = const_873;
         param1["itemlist"] = const_1194;
         param1["itemlist_horizontal"] = const_352;
         param1["itemlist_vertical"] = const_404;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1629;
         param1["menu"] = const_1504;
         param1["menu_item"] = const_1635;
         param1["submenu"] = const_1209;
         param1["minimizebox"] = const_1599;
         param1["notify"] = const_1513;
         param1["PetInventoryUpdatedEvent"] = const_708;
         param1["password"] = const_663;
         param1["radiobutton"] = const_736;
         param1["region"] = const_460;
         param1["restorebox"] = const_1521;
         param1["scaler"] = const_771;
         param1["scaler_horizontal"] = const_1445;
         param1["scaler_vertical"] = const_1400;
         param1["scrollbar_horizontal"] = const_561;
         param1["scrollbar_vertical"] = const_761;
         param1["scrollbar_slider_button_up"] = const_1019;
         param1["scrollbar_slider_button_down"] = const_1184;
         param1["scrollbar_slider_button_left"] = const_988;
         param1["scrollbar_slider_button_right"] = const_1012;
         param1["scrollbar_slider_bar_horizontal"] = const_1061;
         param1["scrollbar_slider_bar_vertical"] = const_1152;
         param1["scrollbar_slider_track_horizontal"] = const_1224;
         param1["scrollbar_slider_track_vertical"] = const_1179;
         param1["scrollable_itemlist"] = const_1403;
         param1["scrollable_itemlist_vertical"] = const_467;
         param1["scrollable_itemlist_horizontal"] = const_1032;
         param1["selector"] = const_725;
         param1["selector_list"] = const_860;
         param1["submenu"] = const_1209;
         param1["tab_button"] = const_510;
         param1["tab_container_button"] = const_1092;
         param1["tab_context"] = const_502;
         param1["tab_content"] = const_1004;
         param1["tab_selector"] = const_747;
         param1["text"] = const_485;
         param1["input"] = const_650;
         param1["toolbar"] = const_1508;
         param1["tooltip"] = const_359;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
