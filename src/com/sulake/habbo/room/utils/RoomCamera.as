package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_926:int = 3;
       
      
      private var var_2230:int = -1;
      
      private var var_2231:int = -2;
      
      private var var_342:Vector3d = null;
      
      private var var_407:Vector3d = null;
      
      private var var_2226:Boolean = false;
      
      private var var_2227:Boolean = false;
      
      private var var_2225:Boolean = false;
      
      private var var_2224:Boolean = false;
      
      private var var_2228:int = 0;
      
      private var var_2229:int = 0;
      
      private var var_2233:int = 0;
      
      private var var_2232:int = 0;
      
      private var var_1316:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_407;
      }
      
      public function get targetId() : int
      {
         return this.var_2230;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2231;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2226;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2227;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2225;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2224;
      }
      
      public function get screenWd() : int
      {
         return this.var_2228;
      }
      
      public function get screenHt() : int
      {
         return this.var_2229;
      }
      
      public function get roomWd() : int
      {
         return this.var_2233;
      }
      
      public function get roomHt() : int
      {
         return this.var_2232;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2230 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2231 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2226 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2227 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2225 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2224 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2228 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2229 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2233 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2232 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_342 == null)
         {
            this.var_342 = new Vector3d();
         }
         if(this.var_342.x != param1.x || this.var_342.y != param1.y || this.var_342.z != param1.z)
         {
            this.var_342.assign(param1);
            this.var_1316 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_342 = null;
         this.var_407 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_407 != null)
         {
            return;
         }
         this.var_407 = new Vector3d();
         this.var_407.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_342 != null && this.var_407 != null)
         {
            ++this.var_1316;
            _loc4_ = Vector3d.dif(this.var_342,this.var_407);
            if(_loc4_.length <= param2)
            {
               this.var_407 = this.var_342;
               this.var_342 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_926 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1316 <= const_926)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_407 = Vector3d.sum(this.var_407,_loc4_);
            }
         }
      }
   }
}
