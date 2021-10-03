package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_997:String = "M";
      
      public static const const_1506:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_148:Number = 0;
      
      private var var_149:Number = 0;
      
      private var var_244:int = 0;
      
      private var _name:String = "";
      
      private var _userType:int = 0;
      
      private var var_910:String = "";
      
      private var _figure:String = "";
      
      private var var_2310:String = "";
      
      private var var_2175:int;
      
      private var var_2207:int = 0;
      
      private var var_2313:String = "";
      
      private var var_2312:int = 0;
      
      private var var_2194:int = 0;
      
      private var var_2311:String = "";
      
      private var var_182:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_182 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_182)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_148;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_148 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_149;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_149 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_244;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_244 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_182)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this._userType;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_182)
         {
            this._userType = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_910;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_910 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_182)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2310;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2310 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2175;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2175 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2207;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2207 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2313;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2313 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2312;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2312 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2194;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_2194 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2311;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_182)
         {
            this.var_2311 = param1;
         }
      }
   }
}
