package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1711:int;
      
      private var var_2405:int;
      
      private var var_1401:int;
      
      private var var_2404:int;
      
      private var var_108:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1711 = param1.readInteger();
         this.var_2405 = param1.readInteger();
         this.var_1401 = param1.readInteger();
         this.var_2404 = param1.readInteger();
         this.var_108 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1711);
      }
      
      public function get callId() : int
      {
         return this.var_1711;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2405;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1401;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2404;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_108;
      }
   }
}
