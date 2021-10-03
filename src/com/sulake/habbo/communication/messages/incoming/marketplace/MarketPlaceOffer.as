package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2587:int;
      
      private var var_2032:String;
      
      private var var_1825:int;
      
      private var var_388:int;
      
      private var var_2589:int = -1;
      
      private var var_2161:int;
      
      private var var_1833:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2587 = param3;
         this.var_2032 = param4;
         this.var_1825 = param5;
         this.var_388 = param6;
         this.var_2589 = param7;
         this.var_2161 = param8;
         this.var_1833 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2587;
      }
      
      public function get stuffData() : String
      {
         return this.var_2032;
      }
      
      public function get price() : int
      {
         return this.var_1825;
      }
      
      public function get status() : int
      {
         return this.var_388;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2589;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2161;
      }
      
      public function get offerCount() : int
      {
         return this.var_1833;
      }
   }
}
