package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_148:Number = 0;
      
      private var var_149:Number = 0;
      
      private var var_2726:Number = 0;
      
      private var var_2725:Number = 0;
      
      private var var_2723:Number = 0;
      
      private var var_2724:Number = 0;
      
      private var var_244:int = 0;
      
      private var var_2089:int = 0;
      
      private var var_325:Array;
      
      private var var_2727:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_325 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_148 = param3;
         this.var_149 = param4;
         this.var_2726 = param5;
         this.var_244 = param6;
         this.var_2089 = param7;
         this.var_2725 = param8;
         this.var_2723 = param9;
         this.var_2724 = param10;
         this.var_2727 = param11;
         this.var_325 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_148;
      }
      
      public function get z() : Number
      {
         return this.var_149;
      }
      
      public function get localZ() : Number
      {
         return this.var_2726;
      }
      
      public function get targetX() : Number
      {
         return this.var_2725;
      }
      
      public function get targetY() : Number
      {
         return this.var_2723;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2724;
      }
      
      public function get dir() : int
      {
         return this.var_244;
      }
      
      public function get dirHead() : int
      {
         return this.var_2089;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2727;
      }
      
      public function get actions() : Array
      {
         return this.var_325.slice();
      }
   }
}
