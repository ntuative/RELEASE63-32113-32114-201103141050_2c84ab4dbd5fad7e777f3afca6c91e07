package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1842:String;
      
      private var var_2776:String;
      
      private var var_409:BitmapDataAsset;
      
      private var var_1427:Boolean;
      
      private var var_1426:Boolean;
      
      private var var_2777:Boolean;
      
      private var _offsetX:int;
      
      private var var_1213:int;
      
      private var _width:int;
      
      private var _height:int;
      
      private var var_723:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1842 = param1;
         this.var_2776 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_409 = _loc9_;
            this.var_723 = false;
         }
         else
         {
            this.var_409 = null;
            this.var_723 = true;
         }
         this.var_1427 = param4;
         this.var_1426 = param5;
         this._offsetX = param6;
         this.var_1213 = param7;
         this.var_2777 = param8;
      }
      
      public function dispose() : void
      {
         this.var_409 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_723 && this.var_409 != null)
         {
            _loc1_ = this.var_409.content as BitmapData;
            if(_loc1_ != null)
            {
               this._width = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_723 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1426;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1427;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this._width;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1842;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2776;
      }
      
      public function get asset() : IAsset
      {
         return this.var_409;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2777;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1427)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1426)
         {
            return this.var_1213;
         }
         return -(this.height + this.var_1213);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1213;
      }
   }
}
