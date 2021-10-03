package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1701:int;
      
      private var var_2765:int;
      
      private var var_1248:int;
      
      private var var_493:Number;
      
      private var var_2764:Boolean;
      
      private var var_2763:int;
      
      private var var_1968:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2765 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2763 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2764 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1248;
         if(this.var_1248 == 1)
         {
            this.var_493 = param1;
            this.var_1701 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_1248);
            this.var_493 = this.var_493 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2764 && param3 - this.var_1701 >= this.var_2765 && this.var_1968 < this.var_2763)
         {
            _loc5_ = 1000 / this.var_493;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1968;
            this.var_1701 = param3;
            this.var_1248 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
