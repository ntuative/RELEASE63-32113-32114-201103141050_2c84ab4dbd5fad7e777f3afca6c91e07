package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2809:uint;
      
      private var var_144:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_267:IWindowContext;
      
      private var var_1037:IMouseDraggingService;
      
      private var var_1034:IMouseScalingService;
      
      private var var_1032:IMouseListenerService;
      
      private var var_1035:IFocusManagerService;
      
      private var var_1036:IToolTipAgentService;
      
      private var var_1033:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2809 = 0;
         this.var_144 = param2;
         this.var_267 = param1;
         this.var_1037 = new WindowMouseDragger(param2);
         this.var_1034 = new WindowMouseScaler(param2);
         this.var_1032 = new WindowMouseListener(param2);
         this.var_1035 = new FocusManager(param2);
         this.var_1036 = new WindowToolTipAgent(param2);
         this.var_1033 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1037 != null)
         {
            this.var_1037.dispose();
            this.var_1037 = null;
         }
         if(this.var_1034 != null)
         {
            this.var_1034.dispose();
            this.var_1034 = null;
         }
         if(this.var_1032 != null)
         {
            this.var_1032.dispose();
            this.var_1032 = null;
         }
         if(this.var_1035 != null)
         {
            this.var_1035.dispose();
            this.var_1035 = null;
         }
         if(this.var_1036 != null)
         {
            this.var_1036.dispose();
            this.var_1036 = null;
         }
         if(this.var_1033 != null)
         {
            this.var_1033.dispose();
            this.var_1033 = null;
         }
         this.var_144 = null;
         this.var_267 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1037;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1034;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1032;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1035;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1036;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1033;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
