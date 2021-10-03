package com.sulake.habbo.avatar.structure.figure
{
   import flash.geom.ColorTransform;
   
   public class PartColor implements IPartColor
   {
       
      
      private var _id:int;
      
      private var _index:int;
      
      private var var_2122:int;
      
      private var var_2173:Boolean = false;
      
      private var _rgb:uint;
      
      private var var_1592:uint;
      
      private var var_1594:uint;
      
      private var _b:uint;
      
      private var var_1595:Number;
      
      private var var_1596:Number;
      
      private var var_1593:Number;
      
      private var var_1569:ColorTransform;
      
      public function PartColor(param1:XML)
      {
         super();
         this._id = parseInt(param1.@id);
         this._index = parseInt(param1.@index);
         this.var_2122 = parseInt(param1.@club);
         this.var_2173 = Boolean(parseInt(param1.@selectable));
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_1592 = this._rgb >> 16 & 255;
         this.var_1594 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_1595 = this.var_1592 / 255 * 1;
         this.var_1596 = this.var_1594 / 255 * 1;
         this.var_1593 = this._b / 255 * 1;
         this.var_1569 = new ColorTransform(this.var_1595,this.var_1596,this.var_1593);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_1569;
      }
      
      public function get redMultiplier() : Number
      {
         return this.var_1595;
      }
      
      public function get greenMultiplier() : Number
      {
         return this.var_1596;
      }
      
      public function get blueMultiplier() : Number
      {
         return this.var_1593;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get r() : uint
      {
         return this.var_1592;
      }
      
      public function get g() : uint
      {
         return this.var_1594;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2122;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2173;
      }
   }
}