package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1530:String = "pricing_model_unknown";
      
      public static const const_484:String = "pricing_model_single";
      
      public static const const_486:String = "pricing_model_multi";
      
      public static const const_449:String = "pricing_model_bundle";
      
      public static const const_1559:String = "price_type_none";
      
      public static const const_718:String = "price_type_credits";
      
      public static const const_1139:String = "price_type_activitypoints";
      
      public static const const_1028:String = "price_type_credits_and_activitypoints";
       
      
      private var var_719:String;
      
      private var var_1099:String;
      
      private var _offerId:int;
      
      private var var_1672:String;
      
      private var var_1100:int;
      
      private var var_1098:int;
      
      private var var_1671:int;
      
      private var var_421:ICatalogPage;
      
      private var var_720:IProductContainer;
      
      private var var_2334:int;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1672 = param1.localizationId;
         this.var_1100 = param1.priceInCredits;
         this.var_1098 = param1.priceInActivityPoints;
         this.var_1671 = param1.activityPointType;
         this.var_421 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_421;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1672;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1100;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1098;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1671;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_720;
      }
      
      public function get pricingModel() : String
      {
         return this.var_719;
      }
      
      public function get priceType() : String
      {
         return this.var_1099;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2334;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2334 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1672 = "";
         this.var_1100 = 0;
         this.var_1098 = 0;
         this.var_1671 = 0;
         this.var_421 = null;
         if(this.var_720 != null)
         {
            this.var_720.dispose();
            this.var_720 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_719)
         {
            case const_484:
               this.var_720 = new SingleProductContainer(this,param1);
               break;
            case const_486:
               this.var_720 = new MultiProductContainer(this,param1);
               break;
            case const_449:
               this.var_720 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_719);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_719 = const_484;
            }
            else
            {
               this.var_719 = const_486;
            }
         }
         else if(param1.length > 1)
         {
            this.var_719 = const_449;
         }
         else
         {
            this.var_719 = const_1530;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1100 > 0 && this.var_1098 > 0)
         {
            this.var_1099 = const_1028;
         }
         else if(this.var_1100 > 0)
         {
            this.var_1099 = const_718;
         }
         else if(this.var_1098 > 0)
         {
            this.var_1099 = const_1139;
         }
         else
         {
            this.var_1099 = const_1559;
         }
      }
   }
}
