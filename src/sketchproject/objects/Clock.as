package sketchproject.objects
{
	import sketchproject.core.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Clock extends Sprite
	{
		private var clockBase:Image;
		
		public function Clock()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			clockBase = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("clock_base"));
			clockBase.pivotX = base.width * 0.5;
			clockBase.pivotY = base.height * 0.5;
			addChild(clockBase);
		}
	}
}