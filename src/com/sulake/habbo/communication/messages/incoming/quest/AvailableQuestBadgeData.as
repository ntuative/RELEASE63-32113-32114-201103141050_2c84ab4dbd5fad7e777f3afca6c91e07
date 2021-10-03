package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AvailableQuestBadgeData
   {
       
      
      private var var_306:int;
      
      private var var_2352:String;
      
      public function AvailableQuestBadgeData(param1:IMessageDataWrapper)
      {
         super();
         this.var_306 = param1.readInteger();
         this.var_2352 = param1.readString();
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
