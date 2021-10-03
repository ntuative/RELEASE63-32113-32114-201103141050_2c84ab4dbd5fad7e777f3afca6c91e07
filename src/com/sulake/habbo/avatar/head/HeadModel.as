package com.sulake.habbo.avatar.head
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class HeadModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      public function HeadModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory(FigureData.const_177);
         initCategory(FigureData.const_260);
         initCategory(FigureData.const_258);
         initCategory(FigureData.const_239);
         initCategory(FigureData.const_259);
         var_189 = true;
         if(!var_16)
         {
            var_16 = new HeadView(this,controller.windowManager,controller.assets);
            if(var_16)
            {
               var_16.init();
            }
         }
      }
   }
}
