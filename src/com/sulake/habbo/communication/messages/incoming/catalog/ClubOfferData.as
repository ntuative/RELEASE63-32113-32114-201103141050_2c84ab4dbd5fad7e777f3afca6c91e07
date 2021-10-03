package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1655:String;
      
      private var var_1825:int;
      
      private var var_2342:Boolean;
      
      private var var_2343:Boolean;
      
      private var var_2347:int;
      
      private var var_2346:int;
      
      private var var_2345:int;
      
      private var var_2348:int;
      
      private var var_2344:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1655 = param1.readString();
         this.var_1825 = param1.readInteger();
         this.var_2342 = param1.readBoolean();
         this.var_2343 = param1.readBoolean();
         this.var_2347 = param1.readInteger();
         this.var_2346 = param1.readInteger();
         this.var_2345 = param1.readInteger();
         this.var_2348 = param1.readInteger();
         this.var_2344 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1655;
      }
      
      public function get price() : int
      {
         return this.var_1825;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2342;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2343;
      }
      
      public function get periods() : int
      {
         return this.var_2347;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2346;
      }
      
      public function get year() : int
      {
         return this.var_2345;
      }
      
      public function get month() : int
      {
         return this.var_2348;
      }
      
      public function get day() : int
      {
         return this.var_2344;
      }
   }
}
