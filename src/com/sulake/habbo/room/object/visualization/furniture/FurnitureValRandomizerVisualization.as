package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_936:int = 20;
      
      private static const const_594:int = 10;
      
      private static const const_1283:int = 31;
      
      private static const ANIMATION_ID_ROLL:int = 32;
      
      private static const ANIMATION_ID_OFF:int = 30;
       
      
      private var var_289:Array;
      
      private var var_785:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_289 = new Array();
         super();
         super.setAnimation(ANIMATION_ID_OFF);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_785)
            {
               this.var_785 = true;
               this.var_289 = new Array();
               this.var_289.push(const_1283);
               this.var_289.push(ANIMATION_ID_ROLL);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_594)
         {
            if(this.var_785)
            {
               this.var_785 = false;
               this.var_289 = new Array();
               if(direction == 2)
               {
                  this.var_289.push(const_936 + 5 - param1);
                  this.var_289.push(const_594 + 5 - param1);
               }
               else
               {
                  this.var_289.push(const_936 + param1);
                  this.var_289.push(const_594 + param1);
               }
               this.var_289.push(ANIMATION_ID_OFF);
               return;
            }
            super.setAnimation(ANIMATION_ID_OFF);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_289.length > 0)
            {
               super.setAnimation(this.var_289.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
