package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2032:String;
      
      protected var var_1334:Number;
      
      protected var var_2793:Boolean;
      
      protected var var_2794:Boolean;
      
      protected var var_2087:Boolean;
      
      protected var var_2761:Boolean;
      
      protected var var_2803:int;
      
      protected var var_2080:int;
      
      protected var var_2083:int;
      
      protected var var_2085:int;
      
      protected var var_1813:String;
      
      protected var var_2030:int;
      
      protected var var_919:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2087 = param5;
         this.var_2794 = param6;
         this.var_2793 = param7;
         this.var_2761 = param8;
         this.var_2032 = param9;
         this.var_1334 = param10;
         this.var_2803 = param11;
         this.var_2080 = param12;
         this.var_2083 = param13;
         this.var_2085 = param14;
         this.var_1813 = param15;
         this.var_2030 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2032;
      }
      
      public function get extra() : Number
      {
         return this.var_1334;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2793;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2794;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2087;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2761;
      }
      
      public function get expires() : int
      {
         return this.var_2803;
      }
      
      public function get creationDay() : int
      {
         return this.var_2080;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2083;
      }
      
      public function get creationYear() : int
      {
         return this.var_2085;
      }
      
      public function get slotId() : String
      {
         return this.var_1813;
      }
      
      public function get songId() : int
      {
         return this.var_2030;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_919 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_919;
      }
   }
}
