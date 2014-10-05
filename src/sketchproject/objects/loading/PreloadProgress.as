package sketchproject.objects.loading
{
	import sketchproject.core.Assets;
		
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;

	public class PreloadProgress extends Sprite
	{
		private var imagePreload:Image;
		private var wonderland:IconLoading;
		private var progressShape:Shape;
		
		private var progressValue:uint;
		private var progressWidth:Number
		
		public function PreloadProgress()
		{
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{		
			progress = 0;
			
			imagePreload = new Image(Assets.getAtlas("AtlasTextureMenu","AtlasMenuXML").getTexture("preloading"));
			imagePreload.pivotX = imagePreload.width * 0.5;
			addChild(imagePreload);
			
			wonderland = new IconLoading();
			wonderland.x = 100;
			wonderland.y = 240;
			addChild(wonderland);
			
			progressShape = new Shape();
			addChild(progressShape);
			
			this.alpha = 0;
			this.scaleX = 0.3;
			this.scaleY = 0.3;			
		}
		
		public function set progress(percent:uint):void
		{
			progressValue = percent;
		}
		
		public function get progress():uint
		{
			return progressValue;
		}
						
		public function updateProgress():Number
		{
			progressWidth = progress * 562 / 100;
			progressShape.graphics.clear();
			progressShape.graphics.beginFill(0xFFFFFF);
			progressShape.graphics.lineStyle(1, 0xFFFFFF, 0.5);
			progressShape.graphics.drawRoundRect(-this.width * 0.5 + 10, 260, progressWidth, 17, 20);
			progressShape.graphics.endFill();
			
			return progressWidth;
		}
	}
}