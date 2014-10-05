package sketchproject.objects
{
	import sketchproject.core.Assets;
	import sketchproject.managers.TaskManager;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class TaskIcon extends Sprite
	{
		private var baseIcon:Image;
		private var iconAnimate:Image;
		
		public function TaskIcon(type:String)
		{
			super();
			
			iconAnimate = new Image(Assets.getAtlas(Assets.TEXTURE_HUD,Assets.TEXTURE_HUD_XML).getTexture("focus_circle"));
			iconAnimate.pivotX = iconAnimate.width * 0.5;
			iconAnimate.pivotY = iconAnimate.height * 0.5;
			addChild(iconAnimate);
			
			switch(type)
			{
				case TaskManager.TASK_JOURNAL:
					baseIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD,Assets.TEXTURE_HUD_XML).getTexture("task_journal"));
					break;
				case TaskManager.TASK_SELLING:
					baseIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD,Assets.TEXTURE_HUD_XML).getTexture("task_selling"));
					break;
				case TaskManager.TASK_ORDER:
					baseIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD,Assets.TEXTURE_HUD_XML).getTexture("task_order"));
					break;
				case TaskManager.TASK_UPGRADE:
					baseIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD,Assets.TEXTURE_HUD_XML).getTexture("task_selling"));
					break;
				
			}
			baseIcon.pivotX = baseIcon.width * 0.5;
			baseIcon.pivotY = baseIcon.height * 0.5;
			addChild(baseIcon);
		}
		
		public function update():void
		{
			iconAnimate.rotation+=0.1;
		}
	}
}