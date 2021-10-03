package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1435:int;
      
      private var var_306:String;
      
      private var var_2467:int;
      
      private var var_2261:int;
      
      private var var_1854:int;
      
      private var var_2468:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1435 = param1.readInteger();
         this.var_306 = param1.readString();
         this.var_2467 = param1.readInteger();
         this.var_2261 = param1.readInteger();
         this.var_1854 = param1.readInteger();
         this.var_2468 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_306;
      }
      
      public function get level() : int
      {
         return this.var_1435;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2467;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2261;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1854;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2468;
      }
   }
}
