package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_241:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2638:int = 0;
      
      private var var_2640:int = 0;
      
      private var var_2639:int = 0;
      
      private var var_2641:Boolean = false;
      
      private var var_2122:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_241,param6,param7);
         this.var_2638 = param1;
         this.var_2640 = param2;
         this.var_2639 = param3;
         this.var_2641 = param4;
         this.var_2122 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2638;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2640;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2639;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2641;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2122;
      }
   }
}
