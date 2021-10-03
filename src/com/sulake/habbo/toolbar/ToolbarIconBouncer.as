package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2730:Number;
      
      private var var_1524:Number;
      
      private var var_988:Number;
      
      private var var_987:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2730 = param1;
         this.var_1524 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_988 = param1;
         this.var_987 = 0;
      }
      
      public function update() : void
      {
         this.var_988 += this.var_1524;
         this.var_987 += this.var_988;
         if(this.var_987 > 0)
         {
            this.var_987 = 0;
            this.var_988 = this.var_2730 * -1 * this.var_988;
         }
      }
      
      public function get location() : Number
      {
         return this.var_987;
      }
   }
}
