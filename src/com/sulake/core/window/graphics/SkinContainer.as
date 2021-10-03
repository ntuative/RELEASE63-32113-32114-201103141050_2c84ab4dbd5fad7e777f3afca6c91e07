package com.sulake.core.window.graphics
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.graphics.renderer.BitmapDataRenderer;
   import com.sulake.core.window.graphics.renderer.BitmapSkinRenderer;
   import com.sulake.core.window.graphics.renderer.FillSkinRenderer;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import com.sulake.core.window.graphics.renderer.LabelRenderer;
   import com.sulake.core.window.graphics.renderer.NullSkinRenderer;
   import com.sulake.core.window.graphics.renderer.ShapeSkinRenderer;
   import com.sulake.core.window.graphics.renderer.SkinRenderer;
   import com.sulake.core.window.graphics.renderer.TextSkinRenderer;
   import com.sulake.core.window.utils.DefaultAttStruct;
   import com.sulake.core.window.utils.StateCodeTable;
   import com.sulake.core.window.utils.TypeCodeTable;
   import flash.utils.Dictionary;
   
   public class SkinContainer implements ISkinContainer
   {
      
      private static const const_966:uint = 8;
      
      private static const const_1340:String = "skin";
      
      private static const const_1343:String = "bitmap";
      
      private static const const_1338:String = "fill";
      
      private static const const_1341:String = "text";
      
      private static const const_1342:String = "label";
      
      private static const const_1339:String = "shape";
      
      private static const RENDERER_TYPE_UNKNOWN:String = "unknown";
      
      private static const RENDERER_TYPE_NULL:String = "PetInventoryUpdatedEvent";
      
      protected static var var_328:Array;
       
      
      private var _disposed:Boolean = false;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_952:Dictionary;
      
      private var var_951:Dictionary;
      
      private var var_431:Dictionary;
      
      private var var_1862:Dictionary;
      
      private var var_2605:Dictionary;
      
      private var var_2604:Dictionary;
      
      private var var_2603:Dictionary;
      
      public function SkinContainer(param1:XML, param2:IAssetLibrary)
      {
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         super();
         this._assetLibrary = param2;
         this.var_952 = new Dictionary();
         this.var_951 = new Dictionary();
         this.var_1862 = new Dictionary();
         this.var_2605 = new Dictionary();
         TypeCodeTable.fillTables(this.var_1862,this.var_2605);
         this.var_2604 = new Dictionary();
         this.var_2603 = new Dictionary();
         StateCodeTable.fillTables(this.var_2604,this.var_2603);
         this.var_431 = new Dictionary();
         this.var_431[const_1340] = BitmapSkinRenderer;
         this.var_431[const_1343] = BitmapDataRenderer;
         this.var_431[const_1338] = FillSkinRenderer;
         this.var_431[const_1341] = TextSkinRenderer;
         this.var_431[const_1342] = LabelRenderer;
         this.var_431[const_1339] = ShapeSkinRenderer;
         this.var_431[RENDERER_TYPE_UNKNOWN] = SkinRenderer;
         this.var_431[RENDERER_TYPE_NULL] = NullSkinRenderer;
         if(var_328 == null)
         {
            var_328 = new Array();
            var_328.push(WindowState.const_70);
            var_328.push(WindowState.const_82);
            var_328.push(WindowState.const_100);
            var_328.push(WindowState.const_54);
            var_328.push(WindowState.const_99);
            var_328.push(WindowState.const_84);
            var_328.push(WindowState.const_106);
            var_328.push(WindowState.const_94);
         }
         if(param1 != null)
         {
            _loc3_ = param1.child("component");
            _loc4_ = uint(_loc3_.length());
            if(_loc4_ > 0)
            {
               _loc18_ = 0;
               while(_loc18_ < _loc4_)
               {
                  _loc5_ = _loc3_[_loc18_];
                  _loc7_ = _loc5_.attribute("type");
                  _loc8_ = _loc5_.attribute("style");
                  _loc9_ = uint(_loc5_.attribute("blend") as uint);
                  _loc10_ = uint(_loc5_.attribute("color") as uint);
                  _loc11_ = _loc5_.attribute("asset");
                  _loc12_ = _loc5_.attribute("layout");
                  _loc15_ = _loc5_.attribute("renderer");
                  _loc6_ = _loc5_.child("states");
                  _loc16_ = this.var_431[_loc15_];
                  if(_loc16_)
                  {
                     _loc14_ = new _loc16_(_loc12_);
                     if(_loc14_)
                     {
                        _loc13_ = this._assetLibrary.getAssetByName(_loc11_);
                        _loc14_.parse(_loc13_,_loc6_,this._assetLibrary);
                     }
                  }
                  _loc17_ = new DefaultAttStruct();
                  _loc17_.var_2779 = !!_loc5_.@treshold[0] ? uint(uint(_loc5_.@treshold[0])) : uint(10);
                  _loc17_.background = !!_loc5_.@background[0] ? _loc5_.@background[0] == "HabboAchievementShareIdMessageParser" : false;
                  _loc17_.blend = !!_loc5_.@blend[0] ? Number(Number(_loc5_.@blend[0])) : Number(1);
                  _loc17_.color = !!_loc5_.@color[0] ? uint(uint(_loc5_.@color[0])) : uint(16777215);
                  _loc17_.width_min = !!_loc5_.@width_min[0] ? int(int(_loc5_.@width_min[0])) : int(int.MIN_VALUE);
                  _loc17_.width_max = !!_loc5_.@width_max[0] ? int(int(_loc5_.@width_max[0])) : int(int.MAX_VALUE);
                  _loc17_.height_min = !!_loc5_.@height_min[0] ? int(int(_loc5_.@height_min[0])) : int(int.MIN_VALUE);
                  _loc17_.height_max = !!_loc5_.@height_max[0] ? int(int(_loc5_.@height_max[0])) : int(int.MAX_VALUE);
                  this.addSkinRenderer(this.var_1862[_loc7_],uint(_loc8_),_loc14_,_loc17_);
                  _loc18_++;
               }
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         this.var_952 = null;
         this.var_951 = null;
         this._assetLibrary = null;
         this._disposed = true;
      }
      
      public function addSkinRenderer(param1:uint, param2:uint, param3:ISkinRenderer, param4:DefaultAttStruct) : void
      {
         if(this.var_952[param1] == null)
         {
            this.var_952[param1] = new Array(const_966);
         }
         this.var_952[param1][param2] = param3;
         if(this.var_951[param1] == null)
         {
            this.var_951[param1] = new Array(const_966);
         }
         this.var_951[param1][param2] = param4;
      }
      
      public function getSkinRendererByTypeAndStyle(param1:uint, param2:uint) : ISkinRenderer
      {
         var _loc4_:* = null;
         var _loc3_:Array = this.var_952[param1];
         if(_loc3_)
         {
            _loc4_ = _loc3_[param2];
            if(!_loc4_ && param2 != WindowStyle.const_185)
            {
               _loc4_ = _loc3_["null"];
            }
         }
         return _loc4_;
      }
      
      public function getDefaultAttributesByTypeAndStyle(param1:uint, param2:uint) : DefaultAttStruct
      {
         var _loc4_:* = null;
         var _loc3_:Array = this.var_951[param1];
         if(_loc3_)
         {
            _loc4_ = _loc3_[param2];
            if(!_loc4_ && param2 != WindowStyle.const_185)
            {
               _loc4_ = _loc3_["null"];
            }
         }
         return _loc4_;
      }
      
      public function getTheActualState(param1:uint, param2:uint, param3:uint) : uint
      {
         var _loc5_:int = 0;
         var _loc4_:ISkinRenderer = this.getSkinRendererByTypeAndStyle(param1,param2);
         if(_loc4_)
         {
            for each(_loc5_ in var_328)
            {
               if((param3 & _loc5_) == _loc5_)
               {
                  if(_loc4_.isStateDrawable(_loc5_))
                  {
                     return _loc5_;
                  }
               }
            }
         }
         return 0;
      }
   }
}
