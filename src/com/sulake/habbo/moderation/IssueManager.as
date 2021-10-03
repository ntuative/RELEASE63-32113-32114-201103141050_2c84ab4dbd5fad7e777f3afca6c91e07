package com.sulake.habbo.moderation
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.outgoing.moderator.CloseIssuesMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.PickIssuesMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ReleaseIssuesMessageComposer;
   import com.sulake.habbo.communication.messages.parser.moderation.IssueMessageData;
   import com.sulake.habbo.sound.HabboSoundTypesEnum;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class IssueManager
   {
      
      public static const const_1005:String = "issue_bundle_open";
      
      public static const const_830:String = "issue_bundle_my";
      
      public static const const_1122:String = "issue_bundle_picked";
      
      public static const const_1481:int = 15000;
       
      
      private var var_64:ModerationManager;
      
      private var var_609:IssueBrowser;
      
      private var _issues:Map;
      
      private var var_100:Map;
      
      private var var_923:Map;
      
      private var var_1147:Array;
      
      private var var_1148:Array;
      
      private var var_924:Map;
      
      private var var_2490:int = 1;
      
      private var var_2489:int;
      
      private var var_1775:Timer;
      
      public function IssueManager(param1:ModerationManager)
      {
         super();
         this.var_64 = param1;
         this._issues = new Map();
         this.var_100 = new Map();
         this.var_923 = new Map();
         this.var_609 = new IssueBrowser(this,this.var_64.windowManager,this.var_64.assets);
         this.var_1147 = [];
         this.var_1148 = [];
         this.var_924 = new Map();
         this.var_2489 = parseInt(this.var_64.configuration.getKey("chf.score.updatefactor","60"));
         this.var_1775 = new Timer(const_1481,0);
         this.var_1775.addEventListener(TimerEvent.TIMER,this.updatePriorities);
         this.var_1775.start();
      }
      
      public function init() : void
      {
         this.var_609.show();
      }
      
      public function pickBundle(param1:int, param2:Boolean = false, param3:int = 0) : void
      {
         var _loc4_:IssueBundle = this.var_100.getValue(param1) as IssueBundle;
         if(_loc4_ == null)
         {
            return;
         }
         this.sendPick(_loc4_.getIssueIds(),param2,param3);
         this.var_1147 = this.var_1147.concat(_loc4_.getIssueIds());
      }
      
      public function autoPick(param1:Boolean = false, param2:int = 0) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = this.var_100.getValues();
         for each(_loc5_ in _loc3_)
         {
            if(_loc5_.state == IssueMessageData.const_171 && (_loc4_ == null || _loc5_.prioritySum > _loc4_.prioritySum))
            {
               _loc4_ = _loc5_;
            }
         }
         if(_loc4_ == null)
         {
            return;
         }
         this.pickBundle(_loc4_.id,param1,param2);
      }
      
      public function releaseAll() : void
      {
         var _loc3_:* = null;
         if(this.var_100 == null)
         {
            return;
         }
         var _loc1_:int = this.var_64.sessionDataManager.userId;
         var _loc2_:* = [];
         for each(_loc3_ in this.var_100)
         {
            if(_loc3_.state == IssueMessageData.const_389 && _loc3_.pickerUserId == _loc1_)
            {
               _loc2_ = _loc2_.concat(_loc3_.getIssueIds());
            }
         }
         this.sendRelease(_loc2_);
      }
      
      public function releaseBundle(param1:int) : void
      {
         if(this.var_100 == null)
         {
            return;
         }
         var _loc2_:IssueBundle = this.var_100.getValue(param1) as IssueBundle;
         if(_loc2_ == null)
         {
            return;
         }
         this.sendRelease(_loc2_.getIssueIds());
      }
      
      private function sendRelease(param1:Array) : void
      {
         if(param1 == null || param1.length == 0 || this.var_64 == null || this.var_64.connection == null)
         {
            return;
         }
         this.var_64.connection.send(new ReleaseIssuesMessageComposer(param1));
         this.var_1148 = this.var_1148.concat(param1);
      }
      
      public function playSound(param1:IssueMessageData) : void
      {
         if(this._issues[param1.issueId] != null)
         {
            return;
         }
         if(this.var_609 == null || !this.var_609.isOpen())
         {
            this.var_64.soundManager.playSound(HabboSoundTypesEnum.const_1013);
         }
      }
      
      public function updateIssue(param1:IssueMessageData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(param1 == null)
         {
            return;
         }
         this._issues.remove(param1.issueId);
         this._issues.add(param1.issueId,param1);
         var _loc2_:int = int(this.var_923.getValue(param1.issueId));
         if(_loc2_ != 0)
         {
            _loc3_ = this.var_100.getValue(_loc2_) as IssueBundle;
            if(_loc3_ != null)
            {
               if(this.validateBundle(_loc3_,param1))
               {
                  _loc3_.updateIssue(param1);
               }
               else
               {
                  _loc3_.removeIssue(param1.issueId);
                  if(_loc3_.getIssueCount() == 0)
                  {
                     this.var_100.remove(_loc3_.id);
                     this.removeHandler(_loc3_.id);
                  }
                  this.var_923.remove(param1.issueId);
                  _loc3_ = null;
               }
            }
         }
         if(param1.state == IssueMessageData.const_1602)
         {
            this._issues.remove(param1.issueId);
            return;
         }
         if(_loc3_ == null)
         {
            for each(_loc4_ in this.var_100)
            {
               if(this.validateBundle(_loc4_,param1))
               {
                  _loc3_ = _loc4_;
                  _loc3_.updateIssue(param1);
                  this.var_923.add(param1.issueId,_loc3_.id);
                  break;
               }
            }
         }
         if(_loc3_ == null)
         {
            _loc2_ = this.var_2490++;
            _loc3_ = new IssueBundle(_loc2_,param1);
            this.var_923.add(param1.issueId,_loc2_);
            this.var_100.add(_loc2_,_loc3_);
         }
         if(_loc3_ == null)
         {
            return;
         }
         if(this.var_1147.indexOf(param1.issueId) != -1)
         {
            this.handleBundle(_loc3_.id);
            _loc5_ = this.var_64.sessionDataManager.userId;
            if(_loc5_ != param1.pickerUserId)
            {
               if(param1.state == IssueMessageData.const_389)
               {
                  this.unhandleBundle(_loc3_.id);
               }
            }
         }
         if(param1.state == IssueMessageData.const_171)
         {
            _loc6_ = this.getBundles(const_830);
            _loc7_ = false;
            for each(_loc8_ in _loc6_)
            {
               if(this.validateBundle(_loc8_,param1,true))
               {
                  _loc7_ = true;
                  break;
               }
            }
            _loc9_ = this.var_1148.indexOf(param1.issueId);
            if(_loc9_ == -1 && _loc7_)
            {
               this.sendPick([param1.issueId]);
            }
            else
            {
               this.var_1148.splice(_loc9_,1);
            }
         }
         this.updateHandler(_loc3_.id);
         this.var_609.update();
      }
      
      public function updatePriorities(param1:Event = null) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:* = null;
         if(this.var_64 == null || this.var_64.configuration == null)
         {
            return;
         }
         var _loc2_:int = getTimer();
         for each(_loc4_ in this._issues)
         {
            if(_loc4_ != null)
            {
               _loc3_ = (_loc2_ - _loc4_.timeStamp) / 1000;
               _loc4_.temporalPriority = int(_loc3_ / this.var_2489);
            }
         }
         if(this.var_609 != null)
         {
            this.var_609.update();
         }
      }
      
      private function updateHandler(param1:int) : void
      {
         var _loc2_:IssueHandler = this.var_924.getValue(param1) as IssueHandler;
         if(_loc2_ != null)
         {
            _loc2_.update();
         }
      }
      
      public function removeHandler(param1:int) : void
      {
         var _loc2_:* = this.var_924.remove(param1) as IssueHandler;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      public function removeIssue(param1:int) : void
      {
         var _loc3_:* = null;
         if(this._issues == null)
         {
            return;
         }
         var _loc2_:int = this.var_923.getValue(param1);
         if(_loc2_ != 0)
         {
            _loc3_ = this.var_100.getValue(_loc2_) as IssueBundle;
            if(_loc3_ != null)
            {
               _loc3_.removeIssue(param1);
               if(_loc3_.getIssueCount() == 0)
               {
                  this.var_100.remove(_loc3_.id);
               }
            }
         }
         this._issues.remove(param1);
         this.var_609.update();
      }
      
      public function getBundles(param1:String) : Array
      {
         var _loc4_:* = null;
         if(this.var_100 == null)
         {
            return [];
         }
         var _loc2_:* = [];
         var _loc3_:int = this.var_64.sessionDataManager.userId;
         for each(_loc4_ in this.var_100)
         {
            switch(param1)
            {
               case const_1005:
                  if(_loc4_.state == IssueMessageData.const_171)
                  {
                     _loc2_.push(_loc4_);
                  }
                  break;
               case const_830:
                  if(_loc4_.state == IssueMessageData.const_389 && _loc4_.pickerUserId == _loc3_)
                  {
                     _loc2_.push(_loc4_);
                  }
                  break;
               case const_1122:
                  if(_loc4_.state == IssueMessageData.const_389 && _loc4_.pickerUserId != _loc3_)
                  {
                     _loc2_.push(_loc4_);
                  }
                  break;
            }
         }
         return _loc2_;
      }
      
      public function handleBundle(param1:int) : void
      {
         var _loc2_:IssueBundle = this.var_100.getValue(param1) as IssueBundle;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IssueHandler = new IssueHandler(this.var_64,_loc2_);
         this.removeHandler(param1);
         this.var_924.add(param1,_loc3_);
         this.var_64.windowTracker.show(_loc3_,null,false,false,false);
         this.var_1147 = [];
      }
      
      public function unhandleBundle(param1:int) : void
      {
         var _loc2_:IssueBundle = this.var_100.getValue(param1) as IssueBundle;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IssueHandler = this.var_924.remove(param1);
         if(_loc3_ != null)
         {
            _loc3_.dispose();
         }
      }
      
      public function closeBundle(param1:int, param2:int) : void
      {
         var _loc3_:IssueBundle = this.var_100.getValue(param1) as IssueBundle;
         if(_loc3_ == null)
         {
            return;
         }
         this.sendClose(_loc3_.getIssueIds(),param2);
      }
      
      public function closeIssue(param1:int, param2:int) : void
      {
         this.sendClose([param1],param2);
      }
      
      private function sendClose(param1:Array, param2:int) : void
      {
         if(param1 == null || this.var_64 == null || this.var_64.connection == null)
         {
            return;
         }
         this.var_64.connection.send(new CloseIssuesMessageComposer(param1,param2));
      }
      
      private function sendPick(param1:Array, param2:Boolean = false, param3:int = 0) : void
      {
         if(param1 == null || this.var_64 == null || this.var_64.connection == null)
         {
            return;
         }
         this.var_64.connection.send(new PickIssuesMessageComposer(param1,param2,param3));
      }
      
      private function validateBundle(param1:IssueBundle, param2:IssueMessageData, param3:Boolean = false) : Boolean
      {
         if(param2.reportedUserId == 0)
         {
            return false;
         }
         if(param1.reportedUserId != param2.reportedUserId)
         {
            return false;
         }
         if(!param3)
         {
            if(param1.state != param2.state)
            {
               return false;
            }
            if(param1.pickerUserId != param2.pickerUserId)
            {
               return false;
            }
         }
         return true;
      }
      
      public function autoHandle(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:Array = this.var_100.getValues();
         var _loc4_:int = this.var_64.sessionDataManager.userId;
         for each(_loc5_ in _loc2_)
         {
            if(_loc5_.state == IssueMessageData.const_389 && _loc5_.pickerUserId == _loc4_ && _loc5_.id != param1 && (_loc3_ == null || _loc5_.prioritySum > _loc3_.prioritySum))
            {
               _loc3_ = _loc5_;
            }
         }
         if(_loc3_ == null)
         {
            this.autoPick();
            return;
         }
         this.handleBundle(_loc3_.id);
      }
      
      public function issuePickFailed(param1:Array) : Boolean
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         if(!param1)
         {
            return false;
         }
         var _loc2_:Boolean = false;
         var _loc3_:int = this.var_64.sessionDataManager.userId;
         for each(_loc4_ in param1)
         {
            _loc5_ = _loc4_.issueId;
            _loc6_ = _loc4_.pickerUserName;
            _loc7_ = _loc4_.pickerUserId;
            if(_loc7_ != -1 && _loc7_ != _loc3_)
            {
               _loc2_ = true;
            }
            _loc8_ = null;
            for each(_loc9_ in this.var_100)
            {
               _loc10_ = _loc9_.getIssueIds();
               if(_loc10_ != null)
               {
                  for each(_loc11_ in _loc10_)
                  {
                     if(_loc5_ == _loc11_)
                     {
                        _loc8_ = _loc9_;
                        break;
                     }
                  }
               }
            }
            if(_loc8_ != null)
            {
               _loc12_ = _loc8_.id;
               _loc13_ = this.var_924.getValue(_loc12_) as IssueHandler;
               if(_loc13_ != null)
               {
                  _loc13_.dispose();
               }
               this.releaseBundle(_loc12_);
            }
         }
         return _loc2_;
      }
   }
}
