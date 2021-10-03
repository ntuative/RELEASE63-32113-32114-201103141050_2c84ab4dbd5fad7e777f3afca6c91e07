package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_81:String = "i";
      
      public static const const_87:String = "s";
      
      public static const const_232:String = "e";
       
      
      private var var_1765:String;
      
      private var var_2576:int;
      
      private var var_1389:String;
      
      private var var_1388:int;
      
      private var var_1764:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1765 = param1.readString();
         this.var_2576 = param1.readInteger();
         this.var_1389 = param1.readString();
         this.var_1388 = param1.readInteger();
         this.var_1764 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1765;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2576;
      }
      
      public function get extraParam() : String
      {
         return this.var_1389;
      }
      
      public function get productCount() : int
      {
         return this.var_1388;
      }
      
      public function get expiration() : int
      {
         return this.var_1764;
      }
   }
}
