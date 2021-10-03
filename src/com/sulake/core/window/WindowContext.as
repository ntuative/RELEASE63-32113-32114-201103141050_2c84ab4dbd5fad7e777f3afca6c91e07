package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_462:uint = 0;
      
      public static const const_1665:uint = 1;
      
      public static const const_1834:int = 0;
      
      public static const const_1942:int = 1;
      
      public static const const_1785:int = 2;
      
      public static const const_1864:int = 3;
      
      public static const const_1564:int = 4;
      
      public static const const_395:int = 5;
      
      public static var var_387:IEventQueue;
      
      private static var var_648:IEventProcessor;
      
      private static var var_1910:uint = const_462;
      
      private static var stage:Stage;
      
      private static var var_164:IWindowRenderer;
       
      
      private var var_2687:EventProcessorState;
      
      private var var_2686:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_209:DisplayObjectContainer;
      
      protected var var_2849:Boolean = true;
      
      protected var var_1257:Error;
      
      protected var var_2036:int = -1;
      
      protected var var_1270:IInternalWindowServices;
      
      protected var var_1519:IWindowParser;
      
      protected var var_2798:IWindowFactory;
      
      protected var var_145:IDesktopWindow;
      
      protected var var_1518:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_541:Boolean = false;
      
      private var var_2688:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_164 = param2;
         this._localization = param4;
         this.var_209 = param5;
         this.var_1270 = new ServiceManager(this,param5);
         this.var_2798 = param3;
         this.var_1519 = new WindowParser(this);
         this.var_2686 = param7;
         if(!stage)
         {
            if(this.var_209 is Stage)
            {
               stage = this.var_209 as Stage;
            }
            else if(this.var_209.stage)
            {
               stage = this.var_209.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_145 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_209.addChild(this.var_145.getDisplayObject());
         this.var_209.doubleClickEnabled = true;
         this.var_209.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2687 = new EventProcessorState(var_164,this.var_145,this.var_145,null,this.var_2686);
         inputMode = const_462;
         this.var_1518 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1910;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_387)
         {
            if(var_387 is IDisposable)
            {
               IDisposable(var_387).dispose();
            }
         }
         if(var_648)
         {
            if(var_648 is IDisposable)
            {
               IDisposable(var_648).dispose();
            }
         }
         switch(value)
         {
            case const_462:
               var_387 = new MouseEventQueue(stage);
               var_648 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1665:
               var_387 = new TabletEventQueue(stage);
               var_648 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_462;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_209.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_209.removeChild(IGraphicContextHost(this.var_145).getGraphicContext(true) as DisplayObject);
            this.var_145.destroy();
            this.var_145 = null;
            this.var_1518.destroy();
            this.var_1518 = null;
            if(this.var_1270 is IDisposable)
            {
               IDisposable(this.var_1270).dispose();
            }
            this.var_1270 = null;
            this.var_1519.dispose();
            this.var_1519 = null;
            var_164 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1257;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2036;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1257 = param2;
         this.var_2036 = param1;
         if(this.var_2849)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1257 = null;
         this.var_2036 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1270;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1519;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2798;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_145;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_145.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1564,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1518;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_145,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_145)
         {
            this.var_145 = null;
         }
         if(param1.state != WindowState.const_580)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_164.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_541 = true;
         if(this.var_1257)
         {
            throw this.var_1257;
         }
         var_648.process(this.var_2687,var_387);
         this.var_541 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2688 = true;
         var_164.update(param1);
         this.var_2688 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_145 != null && !this.var_145.disposed)
         {
            if(this.var_209 is Stage)
            {
               this.var_145.width = Stage(this.var_209).stageWidth;
               this.var_145.height = Stage(this.var_209).stageHeight;
            }
            else
            {
               this.var_145.width = this.var_209.width;
               this.var_145.height = this.var_209.height;
            }
         }
      }
   }
}
