package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_182:int = 0;
       
      
      private var var_2396:int = 0;
      
      private var var_1464:Dictionary;
      
      private var var_1890:int = 0;
      
      private var var_1889:int = 0;
      
      private var var_2075:Boolean = false;
      
      private var var_2073:int = 0;
      
      private var var_2074:int = 0;
      
      public function Purse()
      {
         this.var_1464 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2396;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2396 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1890;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1890 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1889;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1889 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1890 > 0 || this.var_1889 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2075;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2075 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2073;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2073 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2074;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2074 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1464;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1464 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1464[param1];
      }
   }
}
