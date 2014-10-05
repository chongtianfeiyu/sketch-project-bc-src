package sketchproject.objects
{
	import sketchproject.core.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Avatar extends Sprite
	{
		private var avatar:Image;
		
		public function Avatar()
		{
			initObjectProperty();
			
		}
		
		public function initObjectProperty():void
		{
			avatar = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER,Assets.TEXTURE_PARAMETER_XML).getTexture("character"));
			addChild(avatar);		
		}
	}
}