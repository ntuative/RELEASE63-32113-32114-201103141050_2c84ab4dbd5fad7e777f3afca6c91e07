package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1597:Boolean;
      
      private var var_2174:int;
      
      private var var_427:Boolean;
      
      private var var_1057:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1597;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2174;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1057;
      }
      
      public function get owner() : Boolean
      {
         return this.var_427;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1057 != null)
         {
            this.var_1057.dispose();
            this.var_1057 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1597 = param1.readBoolean();
         if(this.var_1597)
         {
            this.var_2174 = param1.readInteger();
            this.var_427 = param1.readBoolean();
         }
         else
         {
            this.var_1057 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
