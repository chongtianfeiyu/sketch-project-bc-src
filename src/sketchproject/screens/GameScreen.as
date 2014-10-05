package sketchproject.screens
{
	import sketchproject.core.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class GameScreen extends Sprite
	{
		protected var containerScreen:Sprite;
		protected var baseScreen:Image;
		protected var topScreen:Image;
		protected var iconScreen:Image;
		protected var titleScreen:TextField;
		
		public function GameScreen(hasIcon:Boolean, icon:String = "icon_business", title:String = "Title", subtitle:String = "subtitle", description:String = "Description")
		{
			super();
			
			containerScreen = new Sprite();
			
			baseScreen = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("shop_background"));
			baseScreen.pivotX = baseScreen.width * 0.5;
			baseScreen.pivotY = baseScreen.height * 0.5;			
			baseScreen.scaleX = 0.9;
			baseScreen.scaleY = 0.9;
			containerScreen.addChild(baseScreen);
			
			topScreen = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("shop_top"));
			topScreen.pivotX = topScreen.width * 0.5;
			topScreen.pivotY = topScreen.height * 0.5;		
			topScreen.y = - 250;
			topScreen.scaleX = 0.9;
			topScreen.scaleY = 0.9;
			containerScreen.addChild(topScreen);
			
			if(hasIcon){
				iconScreen = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture(icon));
				iconScreen.pivotX = iconScreen.width * 0.5;
				iconScreen.pivotY = iconScreen.height * 0.5;
				iconScreen.x = -290;
				iconScreen.y = 148;
				iconScreen.scaleX = 0.8;
				iconScreen.scaleY = 0.8;
				containerScreen.addChild(iconScreen);
							
				titleScreen = new TextField(200, 50, title, Assets.getFont("FontSSPBold").fontName, 12, 0xc333333);
				titleScreen.vAlign = VAlign.TOP;
				titleScreen.hAlign = HAlign.LEFT;
				titleScreen.x = -260;
				titleScreen.y = 130;
				containerScreen.addChild(titleScreen);
				
				titleScreen = new TextField(500, 50, "-  "+subtitle, Assets.getFont("FontSSPRegular").fontName, 12, 0x333333);
				titleScreen.vAlign = VAlign.TOP;
				titleScreen.hAlign = HAlign.LEFT;
				titleScreen.x = -200;
				titleScreen.y = 130;
				containerScreen.addChild(titleScreen);
				
				titleScreen = new TextField(500, 50,description, Assets.getFont("FontSSPRegular").fontName, 11, 0x333333);
				titleScreen.vAlign = VAlign.TOP;
				titleScreen.hAlign = HAlign.LEFT;
				titleScreen.x = -260;
				titleScreen.y = 145;
				containerScreen.addChild(titleScreen);
				
				
				
			}
			
			addChild(containerScreen);
		}
		
		protected function hideBase():void
		{
			containerScreen.visible = false;
		}
		
		protected function showBase():void
		{
			containerScreen.visible = true;
		}
	}
}