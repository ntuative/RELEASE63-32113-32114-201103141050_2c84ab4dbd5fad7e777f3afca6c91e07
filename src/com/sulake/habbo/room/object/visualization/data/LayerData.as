package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_889:String = "";
      
      public static const const_534:int = 0;
      
      public static const const_423:int = 255;
      
      public static const const_785:Boolean = false;
      
      public static const const_539:int = 0;
      
      public static const const_568:int = 0;
      
      public static const const_351:int = 0;
      
      public static const const_1023:int = 1;
      
      public static const const_1220:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2180:String = "";
      
      private var var_1888:int = 0;
      
      private var var_2692:int = 255;
      
      private var var_2693:Boolean = false;
      
      private var var_2690:int = 0;
      
      private var var_2689:int = 0;
      
      private var var_2691:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2180 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2180;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1888 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1888;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2692 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2692;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2693 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2693;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2690 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2690;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2689 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2689;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2691 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2691;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
