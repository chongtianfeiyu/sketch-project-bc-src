package sketchproject.objects.loading
{
	import sketchproject.core.Assets;
		
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class Starbrust extends Sprite
	{
		private var _starbrust:Image;
		
		public function Starbrust()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			_starbrust = new Image(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTexture("starbrust"));			
			addChild(_starbrust);
			
			this.alpha = 0;
			this.scaleX = 0.3;
			this.scaleY = 0.3;
			this.pivotX = _starbrust.width * 0.5;
			this.pivotY = _starbrust.height * 0.5;
		}
	}
}