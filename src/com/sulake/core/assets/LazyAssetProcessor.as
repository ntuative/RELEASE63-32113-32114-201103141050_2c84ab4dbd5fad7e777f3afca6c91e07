package com.sulake.core.assets
{
   import com.sulake.core.Core;
   import com.sulake.core.runtime.IUpdateReceiver;
   
   public class LazyAssetProcessor implements IUpdateReceiver
   {
       
      
      private var var_406:Array;
      
      private var var_785:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      public function LazyAssetProcessor()
      {
         this.var_406 = new Array();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            Core.instance.removeUpdateReceiver(this);
            this.var_406 = null;
            this.var_785 = false;
            this._disposed = true;
         }
      }
      
      public function push(param1:ILazyAsset) : void
      {
         if(param1)
         {
            this.var_406.push(param1);
            if(!this.var_785)
            {
               Core.instance.registerUpdateReceiver(this,2);
               this.var_785 = true;
            }
         }
      }
      
      public function flush() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_406)
         {
            if(!_loc1_.disposed)
            {
               _loc1_.prepareLazyContent();
            }
         }
         this.var_406 = new Array();
         if(this.var_785)
         {
            Core.instance.removeUpdateReceiver(this);
            this.var_785 = false;
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:ILazyAsset = this.var_406.shift();
         if(!_loc2_)
         {
            if(this.var_785)
            {
               Core.instance.removeUpdateReceiver(this);
               this.var_785 = false;
            }
         }
         else if(!_loc2_.disposed)
         {
            _loc2_.prepareLazyContent();
         }
      }
   }
}
