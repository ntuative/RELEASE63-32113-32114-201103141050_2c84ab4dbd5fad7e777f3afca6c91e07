package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const ANIMATION_ID_ROLL:int = 3;
      
      private static const const_1366:int = 2;
      
      private static const const_1365:int = 1;
      
      private static const ANIMATION_DURATION:int = 15;
       
      
      private var var_289:Array;
      
      private var var_1215:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_289 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1366)
         {
            this.var_289 = new Array();
            this.var_289.push(const_1365);
            this.var_1215 = ANIMATION_DURATION;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Array
      {
         if(this.var_1215 > 0)
         {
            --this.var_1215;
         }
         if(this.var_1215 == 0)
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
