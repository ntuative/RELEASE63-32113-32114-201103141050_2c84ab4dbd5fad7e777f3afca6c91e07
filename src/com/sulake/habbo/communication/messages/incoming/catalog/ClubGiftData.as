package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var _offerId:int;
      
      private var var_2606:Boolean;
      
      private var var_2173:Boolean;
      
      private var var_2607:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_2606 = param1.readBoolean();
         this.var_2607 = param1.readInteger();
         this.var_2173 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2606;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2173;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2607;
      }
   }
}
