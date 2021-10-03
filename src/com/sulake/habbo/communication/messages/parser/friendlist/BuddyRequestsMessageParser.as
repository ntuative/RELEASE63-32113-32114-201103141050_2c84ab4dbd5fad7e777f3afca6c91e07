package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   
   public class BuddyRequestsMessageParser implements IMessageParser
   {
       
      
      private var var_1615:int;
      
      private var var_1616:Array;
      
      public function BuddyRequestsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1616 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1615 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         Logger.log("Received buddy requests: " + this.var_1615 + ", " + _loc2_);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1616.push(new FriendRequestData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function get totalReqCount() : int
      {
         return this.var_1615;
      }
      
      public function get method_4() : Array
      {
         return this.var_1616;
      }
   }
}
