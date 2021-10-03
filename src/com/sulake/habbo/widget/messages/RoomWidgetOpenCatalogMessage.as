package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_355:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1200:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1154:String = "RWOCM_PIXELS";
      
      public static const const_1141:String = "RWOCM_CREDITS";
       
      
      private var var_2528:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_355);
         this.var_2528 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2528;
      }
   }
}
