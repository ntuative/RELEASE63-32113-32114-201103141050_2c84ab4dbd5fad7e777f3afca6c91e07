package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_835:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2386:int;
      
      private var var_2388:int;
      
      private var _color:uint;
      
      private var var_1121:int;
      
      private var var_2474:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_835);
         this.var_2386 = param1;
         this.var_2388 = param2;
         this._color = param3;
         this.var_1121 = param4;
         this.var_2474 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2386;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2388;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1121;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2474;
      }
   }
}
