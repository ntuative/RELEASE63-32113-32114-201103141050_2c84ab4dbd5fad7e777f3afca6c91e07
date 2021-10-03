package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_963:String = "avatar";
      
      private static const const_603:Number = -0.01;
      
      private static const const_602:Number = -0.409;
      
      private static const const_964:int = 2;
      
      private static const const_1330:Array = [0,0,0];
      
      private static const const_1332:int = 3;
       
      
      private var var_631:AvatarVisualizationData = null;
      
      private var var_509:Map;
      
      private var var_510:Map;
      
      private var var_1182:int = 0;
      
      private var var_836:Boolean;
      
      private var _figure:String;
      
      private var var_936:String;
      
      private var var_1183:int = 0;
      
      private var var_630:BitmapDataAsset;
      
      private var var_946:BitmapDataAsset;
      
      private var var_1838:int = -1;
      
      private var var_1847:int = -1;
      
      private var var_1853:int = -1;
      
      private const const_965:int = 0;
      
      private const const_1719:int = 1;
      
      private const const_1721:int = 2;
      
      private const const_1720:int = 3;
      
      private const const_1329:int = 4;
      
      private var var_1902:int = -1;
      
      private var var_270:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1848:Boolean = false;
      
      private var var_1849:Boolean = false;
      
      private var var_1852:Boolean = false;
      
      private var var_1433:Boolean = false;
      
      private var var_602:Boolean = false;
      
      private var var_1425:int = 0;
      
      private var var_1431:int = 0;
      
      private var var_2591:int = 0;
      
      private var var_769:int = 0;
      
      private var var_771:int = 0;
      
      private var var_629:int = 0;
      
      private var var_1432:int = 0;
      
      private var var_1188:Boolean = false;
      
      private var var_1850:Boolean = false;
      
      private var var_1187:int = 0;
      
      private var var_770:int = 0;
      
      private var var_1851:Boolean = false;
      
      private var var_1186:int = 0;
      
      private var var_60:IAvatarImage = null;
      
      private var var_688:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_509 = new Map();
         this.var_510 = new Map();
         this.var_836 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_509 != null)
         {
            this.resetImages();
            this.var_509.dispose();
            this.var_510.dispose();
            this.var_509 = null;
         }
         this.var_631 = null;
         this.var_630 = null;
         this.var_946 = null;
         super.dispose();
         this.var_688 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_688;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_631 = param1 as AvatarVisualizationData;
         createSprites(this.const_1329);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_172)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_270) > 0 && param3);
            if(_loc5_ != this.var_1848)
            {
               this.var_1848 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_377) > 0;
            if(_loc5_ != this.var_1849)
            {
               this.var_1849 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_335) > 0;
            if(_loc5_ != this.var_1852)
            {
               this.var_1852 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_806) > 0 && param3);
            if(_loc5_ != this.var_1433)
            {
               this.var_1433 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1017) > 0;
            if(_loc5_ != this.var_602)
            {
               this.var_602 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_150);
            if(_loc6_ != this.var_1425)
            {
               this.var_1425 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_265);
            if(_loc7_ != this.var_270)
            {
               this.var_270 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_905);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1011);
            if(_loc6_ != this.var_1431)
            {
               this.var_1431 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_524);
            if(_loc6_ != this.var_769)
            {
               this.var_769 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_555);
            if(_loc6_ != this.var_771)
            {
               this.var_771 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_392);
            if(_loc6_ != this.var_629)
            {
               this.var_629 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_200);
            if(_loc6_ != this.var_1838)
            {
               this.var_1838 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_771 > 0 && param1.getNumber(RoomObjectVariableEnum.const_392) > 0)
            {
               if(this.var_629 != this.var_771)
               {
                  this.var_629 = this.var_771;
                  _loc4_ = true;
               }
            }
            else if(this.var_629 != 0)
            {
               this.var_629 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_692);
            if(_loc6_ != this.var_1187)
            {
               this.var_1187 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1107);
            if(_loc7_ != this.var_936)
            {
               this.var_936 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_188);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_172 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this._figure != param1)
         {
            this._figure = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_509)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_510)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_509.reset();
         this.var_510.reset();
         this.var_60 = null;
         _loc2_ = getSprite(this.const_965);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1433 = false;
         }
         if(this.var_270 == "sit" || this.var_270 == "lay")
         {
            this.var_1432 = param1 / 2;
         }
         else
         {
            this.var_1432 = 0;
         }
         this.var_1850 = false;
         this.var_1188 = false;
         if(this.var_270 == "lay")
         {
            this.var_1188 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1850 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_509.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_510.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_631.getAvatar(this._figure,param1,this.var_936,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_509.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_510.length >= const_1332)
                  {
                     this.var_510.remove(this.var_510.getKeys().shift());
                  }
                  this.var_510.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_453 != param1.getUpdateID() || this.var_1902 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1838;
            if(this.var_270 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1847 || param4)
            {
               _loc5_ = true;
               this.var_1847 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_60.setDirectionAngle(AvatarSetType.const_36,_loc6_);
            }
            if(_loc7_ != this.var_1853 || param4)
            {
               _loc5_ = true;
               this.var_1853 = _loc7_;
               if(this.var_1853 != this.var_1847)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_60.setDirectionAngle(AvatarSetType.const_52,_loc7_);
               }
            }
            var_453 = param1.getUpdateID();
            this.var_1902 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1719);
         this.var_630 = null;
         if(this.var_270 == "mv" || this.var_270 == "std")
         {
            _loc2_.visible = true;
            if(this.var_630 == null || param1 != var_97)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_630 = this.var_60.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_630 = this.var_60.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_630 != null)
               {
                  _loc2_.asset = this.var_630.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_630 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_946 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1721);
         if(this.var_602)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_946 = this.var_631.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_946 = this.var_631.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_270 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_270 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_946 != null)
            {
               _loc2_.asset = this.var_946.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1720);
         if(this.var_1187 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_631.getAvatarRendererAsset("number_" + this.var_1187 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_631.getAvatarRendererAsset("number_" + this.var_1187 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_270 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_270 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_770 = 1;
               this.var_1851 = true;
               this.var_1186 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_770 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1720);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1851)
         {
            ++this.var_1186;
            if(this.var_1186 < 10)
            {
               return false;
            }
            if(this.var_770 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1186 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_770 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_770 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_770 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_770 = 0;
               this.var_1851 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_631 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = this.var_769;
         var _loc11_:Boolean = false;
         var _loc12_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(this.animateNumberBubble(_loc6_))
         {
            increaseUpdateId();
         }
         if(_loc12_ || _loc6_ != var_97 || this.var_60 == null)
         {
            if(_loc6_ != var_97)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc10_ != this.var_769)
            {
               _loc11_ = true;
            }
            if(_loc8_ || this.var_60 == null || _loc11_)
            {
               this.var_60 = this.getAvatarImage(_loc6_,this.var_769);
               if(this.var_60 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc15_ = getSprite(this.const_965);
               if(_loc15_ && this.var_60 && this.var_60.isPlaceholder())
               {
                  _loc15_.alpha = 150;
               }
               else if(_loc15_)
               {
                  _loc15_.alpha = 255;
               }
            }
            if(this.var_60 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            if(_loc8_)
            {
               this.updateTypingBubble(_loc6_);
               this.updateNumberBubble(_loc6_);
            }
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_60);
            var_97 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc13_:Boolean = _loc9_ || _loc12_ || _loc8_;
         var _loc14_:Boolean = (this.var_836 || this.var_1183 > 0) && param3;
         if(_loc13_)
         {
            this.var_1183 = const_964;
         }
         if(_loc13_ || _loc14_)
         {
            increaseUpdateId();
            --this.var_1183;
            --this.var_1182;
            if(!(this.var_1182 <= 0 || _loc8_ || _loc12_ || _loc7_))
            {
               return;
            }
            this.var_60.updateAnimationByFrames(1);
            this.var_1182 = const_964;
            _loc17_ = this.var_60.getCanvasOffsets();
            if(_loc17_ == null || _loc17_.length < 3)
            {
               _loc17_ = const_1330;
            }
            _loc16_ = getSprite(this.const_965);
            if(_loc16_ != null)
            {
               _loc20_ = this.var_60.getImage(AvatarSetType.const_36,false);
               if(_loc20_ != null)
               {
                  _loc16_.asset = _loc20_;
               }
               if(_loc16_.asset)
               {
                  _loc16_.offsetX = -1 * _loc6_ / 2 + _loc17_[0];
                  _loc16_.offsetY = -_loc16_.asset.height + _loc6_ / 4 + _loc17_[1] + this.var_1432;
               }
               if(this.var_1188)
               {
                  if(this.var_1850)
                  {
                     _loc16_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc16_.relativeDepth = const_602 + _loc17_[2];
                  }
               }
               else
               {
                  _loc16_.relativeDepth = const_603 + _loc17_[2];
               }
            }
            _loc16_ = getSprite(this.const_1721);
            if(_loc16_ != null && _loc16_.visible)
            {
               if(!this.var_1188)
               {
                  _loc16_.relativeDepth = const_603 - 0.01 + _loc17_[2];
               }
               else
               {
                  _loc16_.relativeDepth = const_602 - 0.01 + _loc17_[2];
               }
            }
            this.var_836 = this.var_60.isAnimating();
            _loc18_ = this.const_1329;
            for each(_loc19_ in this.var_60.getSprites())
            {
               if(_loc19_.id == const_963)
               {
                  _loc16_ = getSprite(this.const_965);
                  _loc21_ = this.var_60.getLayerData(_loc19_);
                  _loc22_ = _loc19_.getDirectionOffsetX(this.var_60.getDirection());
                  _loc23_ = _loc19_.getDirectionOffsetY(this.var_60.getDirection());
                  if(_loc21_ != null)
                  {
                     _loc22_ += _loc21_.dx;
                     _loc23_ += _loc21_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc22_ /= 2;
                     _loc23_ /= 2;
                  }
                  _loc16_.offsetX += _loc22_;
                  _loc16_.offsetY += _loc23_;
               }
               else
               {
                  _loc16_ = getSprite(_loc18_);
                  if(_loc16_ != null)
                  {
                     _loc16_.capturesMouse = false;
                     _loc16_.visible = true;
                     _loc24_ = this.var_60.getLayerData(_loc19_);
                     _loc25_ = 0;
                     _loc26_ = _loc19_.getDirectionOffsetX(this.var_60.getDirection());
                     _loc27_ = _loc19_.getDirectionOffsetY(this.var_60.getDirection());
                     _loc28_ = _loc19_.getDirectionOffsetZ(this.var_60.getDirection());
                     _loc29_ = 0;
                     if(_loc19_.hasDirections)
                     {
                        _loc29_ = this.var_60.getDirection();
                     }
                     if(_loc24_ != null)
                     {
                        _loc25_ = _loc24_.animationFrame;
                        _loc26_ += _loc24_.dx;
                        _loc27_ += _loc24_.dy;
                        _loc29_ += _loc24_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc26_ /= 2;
                        _loc27_ /= 2;
                     }
                     if(_loc29_ < 0)
                     {
                        _loc29_ += 8;
                     }
                     else if(_loc29_ > 7)
                     {
                        _loc29_ -= 8;
                     }
                     _loc30_ = this.var_60.getScale() + "_" + _loc19_.member + "_" + _loc29_ + "_" + _loc25_;
                     _loc31_ = this.var_60.getAsset(_loc30_);
                     if(_loc31_ == null)
                     {
                        continue;
                     }
                     _loc16_.asset = _loc31_.content as BitmapData;
                     _loc16_.offsetX = -_loc31_.offset.x - _loc6_ / 2 + _loc26_;
                     _loc16_.offsetY = -_loc31_.offset.y + _loc27_ + this.var_1432;
                     if(this.var_1188)
                     {
                        _loc16_.relativeDepth = const_602 - 0.001 * spriteCount * _loc28_;
                     }
                     else
                     {
                        _loc16_.relativeDepth = const_603 - 0.001 * spriteCount * _loc28_;
                     }
                     if(_loc19_.ink == 33)
                     {
                        _loc16_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc16_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc18_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_358,this.var_270,this._postureParameter);
         if(this.var_1425 > 0)
         {
            param1.appendAction(AvatarAction.const_323,AvatarAction.const_1560[this.var_1425]);
         }
         if(this.var_1431 > 0)
         {
            param1.appendAction(AvatarAction.const_649,this.var_1431);
         }
         if(this.var_2591 > 0)
         {
            param1.appendAction(AvatarAction.const_689,this.var_2591);
         }
         if(this.var_771 > 0)
         {
            param1.appendAction(AvatarAction.const_716,this.var_771);
         }
         if(this.var_629 > 0)
         {
            param1.appendAction(AvatarAction.const_777,this.var_629);
         }
         if(this.var_1848)
         {
            param1.appendAction(AvatarAction.const_278);
         }
         if(this.var_1852 || this.var_1433)
         {
            param1.appendAction(AvatarAction.const_481);
         }
         if(this.var_1849)
         {
            param1.appendAction(AvatarAction.const_246);
         }
         if(this.var_769 > 0)
         {
            param1.appendAction(AvatarAction.const_276,this.var_769);
         }
         param1.endActionAppends();
         this.var_836 = param1.isAnimating();
         var _loc2_:int = this.const_1329;
         for each(_loc3_ in this.var_60.getSprites())
         {
            if(_loc3_.id != const_963)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
