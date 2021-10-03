package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1435:int;
      
      private var var_1667:int;
      
      private var var_2261:int;
      
      private var var_1854:int;
      
      private var var_1434:int;
      
      private var var_2238:String = "";
      
      private var var_2263:String = "";
      
      private var var_2262:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1435 = param1.readInteger();
         this.var_2238 = param1.readString();
         this.var_1667 = param1.readInteger();
         this.var_2261 = param1.readInteger();
         this.var_1854 = param1.readInteger();
         this.var_1434 = param1.readInteger();
         this.var_2262 = param1.readInteger();
         this.var_2263 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1435;
      }
      
      public function get points() : int
      {
         return this.var_1667;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2261;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1854;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1434;
      }
      
      public function get badgeID() : String
      {
         return this.var_2238;
      }
      
      public function get achievementID() : int
      {
         return this.var_2262;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2263;
      }
   }
}
