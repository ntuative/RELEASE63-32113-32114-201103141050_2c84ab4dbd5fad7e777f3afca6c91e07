package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1435:int;
      
      private var var_2279:int;
      
      private var var_2277:int;
      
      private var var_2282:int;
      
      private var _energy:int;
      
      private var var_2280:int;
      
      private var _nutrition:int;
      
      private var var_2278:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1665:int = -1;
      
      private var _type:int;
      
      private var var_2267:int;
      
      private var var_45:BitmapData;
      
      private var var_2281:Boolean;
      
      private var var_2255:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2050:int;
      
      private var var_459:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1665;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2267;
      }
      
      public function get image() : BitmapData
      {
         return this.var_45;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2281;
      }
      
      public function get ownerId() : int
      {
         return this.var_2255;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_459;
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
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2050;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1665 = param1.id;
         this._type = param1.petType;
         this.var_2267 = param1.petRace;
         this.var_45 = param1.image;
         this.var_2281 = param1.isOwnPet;
         this.var_2255 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1435 = param1.level;
         this.var_2279 = param1.levelMax;
         this.var_2277 = param1.experience;
         this.var_2282 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2280 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2278 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2050 = param1.roomIndex;
         this.var_459 = param1.age;
      }
   }
}
