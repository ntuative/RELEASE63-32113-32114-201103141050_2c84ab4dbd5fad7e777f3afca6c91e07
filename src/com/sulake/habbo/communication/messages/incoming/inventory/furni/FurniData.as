package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2720:int;
      
      private var var_1473:String;
      
      private var _objId:int;
      
      private var var_1788:int;
      
      private var _category:int;
      
      private var var_2032:String;
      
      private var var_2735:Boolean;
      
      private var var_2737:Boolean;
      
      private var var_2736:Boolean;
      
      private var var_2698:Boolean;
      
      private var var_2548:int;
      
      private var var_1334:int;
      
      private var var_1813:String = "";
      
      private var var_2030:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2720 = param1;
         this.var_1473 = param2;
         this._objId = param3;
         this.var_1788 = param4;
         this._category = param5;
         this.var_2032 = param6;
         this.var_2735 = param7;
         this.var_2737 = param8;
         this.var_2736 = param9;
         this.var_2698 = param10;
         this.var_2548 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1813 = param1;
         this.var_1334 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2720;
      }
      
      public function get itemType() : String
      {
         return this.var_1473;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1788;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2032;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2735;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2737;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2736;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2698;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2548;
      }
      
      public function get slotId() : String
      {
         return this.var_1813;
      }
      
      public function get songId() : int
      {
         return this.var_2030;
      }
      
      public function get extra() : int
      {
         return this.var_1334;
      }
   }
}
