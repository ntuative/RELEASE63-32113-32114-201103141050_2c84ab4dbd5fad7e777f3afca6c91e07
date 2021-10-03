package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1665:int;
      
      private var _name:String;
      
      private var var_1435:int;
      
      private var var_2770:int;
      
      private var var_2277:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var _figure:String;
      
      private var var_2773:int;
      
      private var var_2771:int;
      
      private var var_2772:int;
      
      private var var_2295:int;
      
      private var var_2255:int;
      
      private var _ownerName:String;
      
      private var var_459:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1665;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1435;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2770;
      }
      
      public function get experience() : int
      {
         return this.var_2277;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2773;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2771;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2772;
      }
      
      public function get respect() : int
      {
         return this.var_2295;
      }
      
      public function get ownerId() : int
      {
         return this.var_2255;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_459;
      }
      
      public function flush() : Boolean
      {
         this.var_1665 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1665 = param1.readInteger();
         this._name = param1.readString();
         this.var_1435 = param1.readInteger();
         this.var_2770 = param1.readInteger();
         this.var_2277 = param1.readInteger();
         this.var_2773 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2771 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2772 = param1.readInteger();
         this._figure = param1.readString();
         this.var_2295 = param1.readInteger();
         this.var_2255 = param1.readInteger();
         this.var_459 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
