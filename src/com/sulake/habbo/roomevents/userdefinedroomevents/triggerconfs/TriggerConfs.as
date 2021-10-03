package com.sulake.habbo.roomevents.userdefinedroomevents.triggerconfs
{
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.TriggerDefinition;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.userdefinedroomevents.Element;
   import com.sulake.habbo.roomevents.userdefinedroomevents.ElementTypeHolder;
   
   public class TriggerConfs implements ElementTypeHolder
   {
       
      
      private var var_196:Array;
      
      public function TriggerConfs()
      {
         this.var_196 = new Array();
         super();
         this.var_196.push(new AvatarSaysSomething());
         this.var_196.push(new AvatarEntersStuff());
         this.var_196.push(new AvatarExitsStuff());
         this.var_196.push(new TriggerOnce());
         this.var_196.push(new StuffIsUsed());
         this.var_196.push(new TriggerPeriodically());
         this.var_196.push(new AvatarEntersRoom());
         this.var_196.push(new GameStarts());
         this.var_196.push(new GameEnds());
         this.var_196.push(new ScoreAchieved());
         this.var_196.push(new AvatarCaught());
         this.var_196.push(new StuffCaught());
      }
      
      public function get confs() : Array
      {
         return this.var_196;
      }
      
      public function getByCode(param1:int) : TriggerConf
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_196)
         {
            if(_loc2_.code == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getElementByCode(param1:int) : Element
      {
         return this.getByCode(param1);
      }
      
      public function acceptTriggerable(param1:Triggerable) : Boolean
      {
         return param1 as TriggerDefinition != null;
      }
      
      public function getKey() : String
      {
         return "trigger";
      }
   }
}
