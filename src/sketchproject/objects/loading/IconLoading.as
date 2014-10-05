package sketchproject.objects.loading
{
	import sketchproject.core.Assets;
		
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	public class IconLoading extends MovieClip
	{
		private var wonderlandShilloute:Image;
		
		public function IconLoading()
		{
			super(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTextures("wonderland"), 15);
			initObjectProperty();			
		}
		
		public function initObjectProperty():void
		{			
			Starling.juggler.add(this);
			pivotX = width * 0.5;
			pivotY = height;
		}
	}
}