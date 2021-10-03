package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1665:int;
      
      private var var_1435:int;
      
      private var var_2279:int;
      
      private var var_2277:int;
      
      private var var_2282:int;
      
      private var _energy:int;
      
      private var var_2280:int;
      
      private var _nutrition:int;
      
      private var var_2278:int;
      
      private var var_2255:int;
      
      private var _ownerName:String;
      
      private var var_2295:int;
      
      private var var_459:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1665;
      }
      
      public function get level() : int
      {
         return this.var_1435;
      }
      
      public function get levelMax() : int
      {
         return this.var_2279;
      }
      
      public function get experience() : int
      {
         return this.var_2277;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2282;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2280;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2278;
      }
      
      public function get ownerId() : int
      {
         return this.var_2255;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2295;
      }
      
      public function get age() : int
      {
         return this.var_459;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1665 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1435 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2279 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2277 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2282 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2280 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2278 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2255 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2295 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_459 = param1;
      }
   }
}
