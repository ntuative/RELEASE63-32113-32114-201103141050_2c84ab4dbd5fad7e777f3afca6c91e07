package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2553:String;
      
      private var var_2555:Array;
      
      private var var_2554:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2553 = param1;
         this.var_2555 = param2;
         this.var_2554 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2553;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2555;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2554;
      }
   }
}
