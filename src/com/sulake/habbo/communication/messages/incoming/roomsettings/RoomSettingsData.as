package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_562:int = 0;
      
      public static const const_204:int = 1;
      
      public static const const_120:int = 2;
      
      public static const const_799:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1695:String;
      
      private var var_2149:int;
      
      private var var_1489:int;
      
      private var var_2147:int;
      
      private var var_2141:int;
      
      private var var_817:Array;
      
      private var var_2146:Array;
      
      private var var_2143:int;
      
      private var var_2148:Boolean;
      
      private var var_2142:Boolean;
      
      private var var_2144:Boolean;
      
      private var var_2145:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2148;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2148 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2142;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2142 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2144;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2144 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2145;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2145 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1695;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1695 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2149;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2149 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1489;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1489 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2147;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2147 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2141;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2141 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_817;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_817 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2146;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2146 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2143;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2143 = param1;
      }
   }
}
