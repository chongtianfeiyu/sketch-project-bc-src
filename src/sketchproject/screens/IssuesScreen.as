package sketchproject.screens
{
	import sketchproject.core.Assets;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class IssuesScreen extends GameScreen
	{
		private var background:Quad;
		private var headline:Image;
		private var date:TextField;
				
		public function IssuesScreen()
		{
			super(false);
			
			background = new Quad(900, 420);
			background.pivotX = background.width * 0.5;
			background.pivotY = background.height * 0.5;
			super.addChild(background);
			
			headline = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("headline"));
			headline.pivotX = headline.width * 0.5;
			headline.pivotY = headline.height * 0.5;			
			headline.scaleX = 0.9;
			headline.scaleY = 0.9;
			headline.y = -170;
			super.addChild(headline);
			
			titleScreen = new TextField(200, 50, "Day 1 Year 1", Assets.getFont("FontSSPBold").fontName, 12, 0xFFFFFF);
			titleScreen.x = 210;
			titleScreen.y = -197;
			super.addChild(titleScreen);
			
		}
		
	}
}