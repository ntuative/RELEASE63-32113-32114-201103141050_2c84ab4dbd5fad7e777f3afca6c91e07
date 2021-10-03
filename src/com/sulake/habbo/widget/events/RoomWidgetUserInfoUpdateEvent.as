package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_115:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_136:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1160:int = 2;
      
      public static const const_1123:int = 3;
      
      public static const const_1652:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1942:String = "";
      
      private var var_2175:int;
      
      private var var_2207:int = 0;
      
      private var var_2194:int = 0;
      
      private var _figure:String = "";
      
      private var var_45:BitmapData = null;
      
      private var var_274:Array;
      
      private var var_1606:Array;
      
      private var var_1498:int = 0;
      
      private var var_2198:String = "";
      
      private var var_2199:int = 0;
      
      private var var_2200:int = 0;
      
      private var var_1960:Boolean = false;
      
      private var var_1804:String = "";
      
      private var var_2196:Boolean = false;
      
      private var var_2203:Boolean = true;
      
      private var var_1041:int = 0;
      
      private var var_2202:Boolean = false;
      
      private var var_2197:Boolean = false;
      
      private var var_2205:Boolean = false;
      
      private var var_2204:Boolean = false;
      
      private var var_2201:Boolean = false;
      
      private var var_2206:Boolean = false;
      
      private var var_2195:int = 0;
      
      private var var_1957:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_274 = [];
         this.var_1606 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1942 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1942;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2175 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2175;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2207 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2207;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2194 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2194;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_45 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_274 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_274;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1606;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1606 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1498 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1498;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2198 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2198;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2196 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2196;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1041 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1041;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2202 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2202;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2197 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2197;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2205 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2205;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2204 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2204;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2201 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2201;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2206 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2206;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2195 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2195;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2203 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2203;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1957 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1957;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2199 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2199;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2200 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2200;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1960 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1960;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1804 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1804;
      }
   }
}
