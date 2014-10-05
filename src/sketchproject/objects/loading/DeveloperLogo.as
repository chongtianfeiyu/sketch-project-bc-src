package sketchproject.objects.loading
{
	import sketchproject.core.Assets;
		
	import starling.display.Image;
	import starling.display.Sprite;

	public class DeveloperLogo extends Sprite
	{
		private var developerLogo:Image;
		
		public function DeveloperLogo()
		{
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			developerLogo = new Image(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTexture("dev_logo"));
			addChild(developerLogo);
			
			this.pivotX = developerLogo.width * 0.5;
			this.pivotY = developerLogo.height * 0.5;			
			this.alpha = 0;
			this.scaleX = 0.3;
			this.scaleY = 0.3;			
		}
	}
}