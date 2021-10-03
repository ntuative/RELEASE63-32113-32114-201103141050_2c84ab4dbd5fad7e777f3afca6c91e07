package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2874:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_145 = param1.desktop;
         var_72 = param1.var_1252 as WindowController;
         var_171 = param1.var_1251 as WindowController;
         var_164 = param1.renderer;
         var_816 = param1.var_1249;
         param2.begin();
         param2.end();
         param1.desktop = var_145;
         param1.var_1252 = var_72;
         param1.var_1251 = var_171;
         param1.renderer = var_164;
         param1.var_1249 = var_816;
      }
   }
}
