package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_306:int;
      
      private var var_2352:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_306 = param1;
         this.var_2352 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_306;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2352;
      }
   }
}
