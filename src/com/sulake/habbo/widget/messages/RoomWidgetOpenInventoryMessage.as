package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_868:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1002:String = "inventory_effects";
      
      public static const const_1108:String = "inventory_badges";
      
      public static const const_1590:String = "inventory_clothes";
      
      public static const const_1480:String = "inventory_furniture";
       
      
      private var var_2584:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_868);
         this.var_2584 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2584;
      }
   }
}
