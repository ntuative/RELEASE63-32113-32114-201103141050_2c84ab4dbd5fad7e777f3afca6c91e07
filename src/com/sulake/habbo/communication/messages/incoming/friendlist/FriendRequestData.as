package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1152:int;
      
      private var var_2114:String;
      
      private var var_2115:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1152 = param1.readInteger();
         this.var_2114 = param1.readString();
         this.var_2115 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1152;
      }
      
      public function get requesterName() : String
      {
         return this.var_2114;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2115;
      }
   }
}
