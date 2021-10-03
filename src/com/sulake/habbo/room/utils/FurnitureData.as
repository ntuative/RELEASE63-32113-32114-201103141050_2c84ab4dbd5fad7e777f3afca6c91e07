package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class FurnitureData
   {
       
      
      private var _id:int = 0;
      
      private var var_2547:int = 0;
      
      private var var_80:Vector3d;
      
      private var var_244:Vector3d;
      
      private var _state:int = 0;
      
      private var _data:String = null;
      
      private var var_1334:Number = NaN;
      
      private var var_2548:int = -1;
      
      public function FurnitureData(param1:int, param2:int, param3:IVector3d, param4:IVector3d, param5:int, param6:String, param7:Number = NaN, param8:int = -1)
      {
         this.var_80 = new Vector3d();
         this.var_244 = new Vector3d();
         super();
         this._id = param1;
         this.var_2547 = param2;
         this.var_80.assign(param3);
         this.var_244.assign(param4);
         this._state = param5;
         this._data = param6;
         this.var_1334 = param7;
         this.var_2548 = param8;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get typeId() : int
      {
         return this.var_2547;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_80;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_244;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get extra() : Number
      {
         return this.var_1334;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2548;
      }
   }
}
