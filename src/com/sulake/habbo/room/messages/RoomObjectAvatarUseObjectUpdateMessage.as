package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarUseObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1473:int;
      
      public function RoomObjectAvatarUseObjectUpdateMessage(param1:int)
      {
         super();
         this.var_1473 = param1;
      }
      
      public function get itemType() : int
      {
         return this.var_1473;
      }
   }
}
