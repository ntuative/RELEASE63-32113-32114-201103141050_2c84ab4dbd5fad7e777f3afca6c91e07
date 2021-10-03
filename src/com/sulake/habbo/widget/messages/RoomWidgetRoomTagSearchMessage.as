package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_752:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2180:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_752);
         this.var_2180 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2180;
      }
   }
}
