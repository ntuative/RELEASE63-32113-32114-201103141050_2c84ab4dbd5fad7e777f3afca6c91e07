package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1157:int = 0;
       
      
      private var var_409:BitmapData = null;
      
      private var var_1842:String = "";
      
      private var var_313:Boolean = true;
      
      private var var_2180:String = "";
      
      private var var_2692:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_2703:String = "normal";
      
      private var var_1427:Boolean = false;
      
      private var var_1426:Boolean = false;
      
      private var _offset:Point;
      
      private var _width:int = 0;
      
      private var _height:int = 0;
      
      private var var_1046:Number = 0;
      
      private var var_2670:Boolean = false;
      
      private var var_2704:Boolean = true;
      
      private var var_2669:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var _instanceId:int = 0;
      
      private var var_1914:Array;
      
      public function RoomObjectSprite()
      {
         this._offset = new Point(0,0);
         this.var_1914 = [];
         super();
         this._instanceId = var_1157++;
      }
      
      public function dispose() : void
      {
         this.var_409 = null;
         this._width = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_409;
      }
      
      public function get assetName() : String
      {
         return this.var_1842;
      }
      
      public function get visible() : Boolean
      {
         return this.var_313;
      }
      
      public function get tag() : String
      {
         return this.var_2180;
      }
      
      public function get alpha() : int
      {
         return this.var_2692;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_2703;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1426;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1427;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1046;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2670;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2704;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2669;
      }
      
      public function get instanceId() : int
      {
         return this._instanceId;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_1914;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this._width = param1.width;
            this._height = param1.height;
         }
         this.var_409 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_1842 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_313 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2180 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2692 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_2703 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_1914 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1427 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1426 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1046 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2670 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2704 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2669 = param1;
         ++this._updateID;
      }
   }
}
