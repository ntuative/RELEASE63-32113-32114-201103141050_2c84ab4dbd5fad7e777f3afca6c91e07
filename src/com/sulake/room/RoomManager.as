package com.sulake.room
{
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.iid.IIDRoomObjectFactory;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.exceptions.RoomManagerException;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomManager extends Component implements IRoomManager, IRoomInstanceContainer
   {
      
      public static const const_700:int = -1;
      
      public static const const_1651:int = 0;
      
      public static const const_1647:int = 1;
      
      public static const const_1133:int = 2;
      
      public static const ROOM_MANAGER_INITIALIZED:int = 3;
       
      
      private var var_111:Map;
      
      private var var_51:IRoomContentLoader;
      
      private var var_592:Array;
      
      private var var_590:Array;
      
      private var var_1047:int;
      
      private var var_155:IRoomManagerListener;
      
      private var var_2861:IRoomContentLoader;
      
      private var var_591:IRoomObjectFactory = null;
      
      private var var_489:IRoomObjectVisualizationFactory = null;
      
      private var _state:int = 0;
      
      private var var_1103:XML = null;
      
      private var _disposed:Boolean = false;
      
      public function RoomManager(param1:IContext, param2:uint = 0)
      {
         super(param1,param2);
         this.var_111 = new Map();
         queueInterface(new IIDRoomObjectFactory(),this.objectFactoryReady);
         queueInterface(new IIDRoomObjectVisualizationFactory(),this.visualizationFactoryReady);
         this.var_592 = [];
         this.var_590 = [];
         events.addEventListener(RoomContentLoadedEvent.const_376,this.onContentLoaded);
         events.addEventListener(RoomContentLoadedEvent.const_495,this.onContentLoaded);
         events.addEventListener(RoomContentLoadedEvent.const_682,this.onContentLoaded);
      }
      
      override public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      override public function dispose() : void
      {
         var _loc3_:* = null;
         if(this.disposed)
         {
            return;
         }
         super.dispose();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.var_111 != null)
         {
            _loc1_ = this.var_111.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.var_111.getWithIndex(_loc2_) as IRoomInstance;
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_111.dispose();
            this.var_111 = null;
         }
         this.var_155 = null;
         if(this.var_591 != null)
         {
            release(new IIDRoomObjectFactory());
            this.var_591 = null;
         }
         if(this.var_489 != null)
         {
            release(new IIDRoomObjectVisualizationFactory());
            this.var_489 = null;
         }
         this.var_592 = null;
         this.var_590 = null;
         this.var_51 = null;
         this._disposed = true;
      }
      
      private function objectFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(this.disposed)
         {
            return;
         }
         this.var_591 = param2 as IRoomObjectFactory;
         this.continueInitializing();
      }
      
      private function visualizationFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(this.disposed)
         {
            return;
         }
         this.var_489 = param2 as IRoomObjectVisualizationFactory;
         this.continueInitializing();
      }
      
      private function continueInitializing() : void
      {
         var _loc1_:* = null;
         if(this.var_591 == null || this.var_489 == null)
         {
            return;
         }
         this._state = const_1647;
         if(this.var_1103 != null)
         {
            _loc1_ = this.var_1103;
            this.var_1103 = null;
            this.initialize(_loc1_,this.var_155);
         }
      }
      
      public function initialize(param1:XML, param2:IRoomManagerListener) : Boolean
      {
         var _loc5_:* = null;
         if(this._state == const_1651)
         {
            if(this.var_1103 != null)
            {
               return false;
            }
            this.var_1103 = param1;
            this.var_155 = param2;
            return true;
         }
         if(this._state >= const_1133)
         {
            return false;
         }
         if(param1 == null)
         {
            return false;
         }
         if(this.var_51 == null)
         {
            return false;
         }
         this.var_1047 = 50;
         this.var_155 = param2;
         var _loc3_:Array = this.var_51.getPlaceHolderTypes();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            if(this.var_592.indexOf(_loc5_) < 0)
            {
               this.var_51.loadObjectContent(_loc5_,events);
               this.var_592.push(_loc5_);
            }
            _loc4_++;
         }
         this._state = const_1133;
         return true;
      }
      
      public function setContentLoader(param1:IRoomContentLoader) : void
      {
         if(this.var_51 != null)
         {
            this.var_51.dispose();
         }
         this.var_51 = param1;
      }
      
      public function addObjectUpdateCategory(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = this.var_590.indexOf(param1);
         if(_loc2_ >= 0)
         {
            return;
         }
         this.var_590.push(param1);
         var _loc3_:int = this.var_111.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this.var_111.getWithIndex(_loc3_) as RoomInstance;
            if(_loc4_ != null)
            {
               _loc4_.addObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      public function removeObjectUpdateCategory(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = this.var_590.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.var_590.splice(_loc2_,1);
         var _loc3_:int = this.var_111.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this.var_111.getWithIndex(_loc3_) as RoomInstance;
            if(_loc4_ != null)
            {
               _loc4_.removeObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      public function createRoom(param1:String, param2:XML) : IRoomInstance
      {
         var _loc5_:int = 0;
         if(this._state < ROOM_MANAGER_INITIALIZED)
         {
            throw new RoomManagerException();
         }
         if(this.var_111.getValue(param1) != null)
         {
            return null;
         }
         var _loc3_:RoomInstance = new RoomInstance(param1,this);
         this.var_111.add(String(param1),_loc3_);
         var _loc4_:int = this.var_590.length - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_590[_loc4_];
            _loc3_.addObjectUpdateCategory(_loc5_);
            _loc4_--;
         }
         return _loc3_;
      }
      
      public function getRoom(param1:String) : IRoomInstance
      {
         return this.var_111.getValue(param1) as IRoomInstance;
      }
      
      public function disposeRoom(param1:String) : Boolean
      {
         var _loc2_:IRoomInstance = this.var_111.remove(param1) as IRoomInstance;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            return true;
         }
         return false;
      }
      
      public function createRoomObject(param1:String, param2:int, param3:String, param4:int) : IRoomObject
      {
         if(this._state < ROOM_MANAGER_INITIALIZED)
         {
            throw new RoomManagerException();
         }
         var _loc5_:IRoomInstance = this.getRoom(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         if(this.var_51 == null)
         {
            return null;
         }
         var _loc6_:RoomInstance = _loc5_ as RoomInstance;
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:String = param3;
         if(!this.var_51.hasInternalContent(param3))
         {
            _loc7_ = this.var_51.getGraphicAssetCollection(param3);
            if(_loc7_ == null)
            {
               this.var_51.loadObjectContent(param3,events);
               _loc12_ = this.var_51.getPlaceHolderType(param3);
               _loc7_ = this.var_51.getGraphicAssetCollection(_loc12_);
            }
            _loc8_ = this.var_51.getVisualizationXML(_loc12_);
            _loc9_ = this.var_51.getLogicXML(_loc12_);
            if(_loc8_ == null || _loc7_ == null)
            {
               return null;
            }
            _loc10_ = this.var_51.getVisualizationType(_loc12_);
            _loc11_ = this.var_51.getLogicType(_loc12_);
         }
         else
         {
            _loc10_ = param3;
            _loc11_ = param3;
         }
         var _loc13_:int = 1;
         var _loc14_:IRoomObject = _loc6_.createObjectInternal(param2,_loc13_,param4);
         var _loc15_:IRoomObjectController = _loc14_ as IRoomObjectController;
         if(_loc15_ == null)
         {
            return null;
         }
         var _loc16_:IRoomObjectModelController = _loc15_.getModelController();
         if(_loc16_ == null)
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc15_.setType(param3);
         var _loc17_:IRoomObjectGraphicVisualization = this.var_489.createRoomObjectVisualization(_loc10_);
         if(_loc17_ == null)
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc17_.assetCollection = _loc7_;
         var _loc18_:* = null;
         _loc18_ = this.var_489.getRoomObjectVisualizationData(_loc12_,_loc10_,_loc8_);
         if(!_loc17_.initialize(_loc18_))
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc15_.setVisualization(_loc17_);
         var _loc19_:IRoomObjectEventHandler = this.var_591.createRoomObjectLogic(_loc11_);
         _loc15_.setEventHandler(_loc19_);
         if(_loc19_ != null && _loc9_ != null)
         {
            _loc19_.initialize(_loc9_);
         }
         return _loc15_;
      }
      
      public function createRoomObjectManager() : IRoomObjectManager
      {
         if(this.var_591 != null)
         {
            return this.var_591.createRoomObjectManager();
         }
         return null;
      }
      
      public function isContentAvailable(param1:String) : Boolean
      {
         if(this.var_51 != null)
         {
            if(this.var_51.getGraphicAssetCollection(param1) != null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function processInitialContentLoad(param1:String) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(this._state == const_700)
         {
            return;
         }
         if(this.var_51 == null)
         {
            this._state = const_700;
            return;
         }
         if(this.var_51.getGraphicAssetCollection(param1) != null)
         {
            _loc2_ = this.var_592.indexOf(param1);
            if(_loc2_ >= 0)
            {
               this.var_592.splice(_loc2_,1);
            }
            if(this.var_592.length == 0)
            {
               this._state = ROOM_MANAGER_INITIALIZED;
               if(this.var_155 != null)
               {
                  this.var_155.roomManagerInitialized();
               }
            }
         }
         else
         {
            this._state = const_700;
            this.var_155.roomManagerInitialized(false);
         }
      }
      
      private function onContentLoaded(param1:RoomContentLoadedEvent) : void
      {
         if(this.var_51 == null)
         {
            return;
         }
         var _loc2_:String = param1.contentType;
         if(_loc2_ == null)
         {
            if(this.var_155 != null)
            {
               this.var_155.contentLoaded(null,false);
            }
            return;
         }
         var _loc3_:XML = this.var_51.getVisualizationXML(_loc2_);
         if(_loc3_ == null)
         {
            if(this.var_155 != null)
            {
               this.var_155.contentLoaded(_loc2_,false);
            }
            return;
         }
         var _loc4_:IGraphicAssetCollection = this.var_51.getGraphicAssetCollection(_loc2_);
         if(_loc4_ == null)
         {
            if(this.var_155 != null)
            {
               this.var_155.contentLoaded(_loc2_,false);
            }
            return;
         }
         this.updateObjectContent(_loc2_);
         if(this.var_155 != null)
         {
            this.var_155.contentLoaded(_loc2_,true);
         }
         if(this.var_592.length > 0)
         {
            this.processInitialContentLoad(_loc2_);
         }
      }
      
      private function updateObjectContent(param1:String) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this.var_51 == null || this.var_489 == null)
         {
            return;
         }
         var _loc2_:XML = this.var_51.getVisualizationXML(param1);
         var _loc3_:XML = this.var_51.getLogicXML(param1);
         var _loc4_:IGraphicAssetCollection = this.var_51.getGraphicAssetCollection(param1);
         if(_loc2_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:* = null;
         var _loc6_:int = this.var_111.length - 1;
         while(_loc6_ >= 0)
         {
            _loc7_ = this.var_111.getWithIndex(_loc6_) as RoomInstance;
            _loc8_ = this.var_111.getKey(_loc6_);
            if(_loc7_ != null)
            {
               _loc9_ = _loc7_.getObjectManagerIds();
               _loc10_ = _loc9_.length - 1;
               while(_loc10_ >= 0)
               {
                  _loc11_ = int(_loc9_[_loc10_]);
                  _loc12_ = _loc7_.getObjectCount(_loc11_);
                  _loc13_ = _loc12_ - 1;
                  while(_loc13_ >= 0)
                  {
                     _loc14_ = _loc7_.getObjectWithIndex(_loc13_,_loc11_) as IRoomObjectController;
                     if(_loc14_ != null)
                     {
                        _loc15_ = _loc14_.getType();
                        _loc16_ = this.var_51.getContentType(_loc15_);
                        if(_loc16_ == param1)
                        {
                           _loc17_ = this.var_51.getVisualizationType(_loc15_);
                           _loc18_ = this.var_51.getLogicType(_loc15_);
                           _loc5_ = this.var_489.getRoomObjectVisualizationData(_loc15_,_loc17_,_loc2_);
                           _loc19_ = this.var_489.createRoomObjectVisualization(_loc17_);
                           if(_loc19_ != null)
                           {
                              _loc19_.assetCollection = _loc4_;
                              if(!_loc19_.initialize(_loc5_))
                              {
                                 _loc7_.disposeObject(_loc14_.getId(),_loc11_);
                              }
                              else
                              {
                                 _loc14_.setVisualization(_loc19_);
                                 _loc20_ = this.var_591.createRoomObjectLogic(_loc18_);
                                 _loc14_.setEventHandler(_loc20_);
                                 if(_loc20_ != null)
                                 {
                                    _loc20_.initialize(_loc3_);
                                 }
                                 if(this.var_155 != null)
                                 {
                                    this.var_155.objectInitialized(_loc8_,_loc14_.getId(),_loc11_);
                                 }
                              }
                           }
                           else
                           {
                              _loc7_.disposeObject(_loc14_.getId(),_loc11_);
                           }
                        }
                     }
                     _loc13_--;
                  }
                  _loc10_--;
               }
            }
            _loc6_--;
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = this.var_111.length - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this.var_111.getWithIndex(_loc2_) as RoomInstance;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_--;
         }
      }
   }
}
