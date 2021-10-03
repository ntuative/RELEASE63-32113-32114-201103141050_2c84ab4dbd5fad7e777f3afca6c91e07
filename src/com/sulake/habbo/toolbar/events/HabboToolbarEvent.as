package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_71:String = "HTE_INITIALIZED";
      
      public static const const_37:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_421:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_1126:String = "HTE_TOOLBAR_RESIZED";
       
      
      private var var_776:String;
      
      private var var_490:String;
      
      private var var_1194:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_776 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_776;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_490 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_490;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1194 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1194;
      }
   }
}
