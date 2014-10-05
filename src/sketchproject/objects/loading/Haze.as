package sketchproject.objects.loading
{
	import sketchproject.core.Assets;
		
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Haze extends Sprite
	{
		private var haze:Image;
		private var position:Number;
		
		public function Haze()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			this.pivotX = this.width * 0.5;
			this.pivotY = this.height * 0.5;
			this.alpha = 0;
			this.scaleX = 0.1;
			this.scaleY = 0.1;
			
			haze = new Image(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTexture("haze"));
			haze.pivotX = haze.width * 0.5;
			haze.pivotY = haze.height * 0.5;
			addChild(haze);
		}
		
		public function set positionHaze(posY:Number):void
		{
			this.position = posY;
		}
		
		public function get positionHaze():Number
		{
			return this.position;
		}
	}
}