package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2431:String;
      
      private var var_1728:String;
      
      private var var_2430:String;
      
      private var var_1729:Boolean;
      
      private var var_1730:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2431 = String(param1["set-type"]);
         this.var_1728 = String(param1["flipped-set-type"]);
         this.var_2430 = String(param1["remove-set-type"]);
         this.var_1729 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1730 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1730;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1730 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2431;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1728;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2430;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1729;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1729 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1728 = param1;
      }
   }
}
