package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1655:String;
      
      private var var_1825:int;
      
      private var var_2342:Boolean;
      
      private var var_2343:Boolean;
      
      private var var_2347:int;
      
      private var var_2346:int;
      
      private var var_421:ICatalogPage;
      
      private var var_2345:int;
      
      private var var_2348:int;
      
      private var var_2344:int;
      
      private var var_2583:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1655 = param2;
         this.var_1825 = param3;
         this.var_2342 = param4;
         this.var_2343 = param5;
         this.var_2347 = param6;
         this.var_2346 = param7;
         this.var_2345 = param8;
         this.var_2348 = param9;
         this.var_2344 = param10;
      }
      
      public function dispose() : void
      {
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_182;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1825;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_421;
      }
      
      public function get priceType() : String
      {
         return Offer.const_718;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1655;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_421 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2583;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2583 = param1;
      }
   }
}
