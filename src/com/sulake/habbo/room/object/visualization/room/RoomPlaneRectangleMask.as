package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2127:Number = 0.0;
      
      private var var_2128:Number = 0.0;
      
      private var var_2151:Number = 0.0;
      
      private var var_2150:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2127 = param1;
         this.var_2128 = param2;
         this.var_2151 = param3;
         this.var_2150 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2127;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2128;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2151;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2150;
      }
   }
}
