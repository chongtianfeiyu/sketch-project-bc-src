package sketchproject.objects.business
{
	import sketchproject.core.Assets;
	import sketchproject.objects.Avatar;
	import sketchproject.utilities.Config;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class General extends Sprite
	{
		private var label:TextField;
		private var image:Image;
		private var buttonOpenShop:Button;
		private var buttonCharacterCustom:Button;
		private var avatar:Avatar;
		
		public function General()
		{
			super();
			
			label = new TextField(250, 50, "Company Name and Logo", Assets.getFont("FontCarterOne").fontName, 15, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -430.35;
			label.y = -198.4;
			addChild(label);
			
			label = new TextField(250, 50, "CEO Name", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -430.35;
			label.y = -155.15;
			addChild(label);
			
			label = new TextField(250, 50, Config.name, Assets.getFont("FontSSPRegular").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -430.35;
			label.y = -134.05;
			addChild(label);
			
			label = new TextField(250, 50, "Restaurant Name", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -430.35;
			label.y = -104.45;
			addChild(label);
			
			label = new TextField(250, 50, Config.restaurant, Assets.getFont("FontSSPRegular").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -430.35;
			label.y = -83.35;
			addChild(label);
			
			label = new TextField(250, 50, "Logo", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -430.35;
			label.y = -53.75;
			addChild(label);
			
			label = new TextField(250, 50, "Advisor", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -326.95;
			label.y = -53.75;
			addChild(label);
			
			image = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture(Config.logo));
			image.scaleX = 0.9;
			image.scaleY = 0.9;
			image.x = -430.35;
			image.y = -24.7;
			addChild(image);
			
			image = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture(Config.advisor));
			image.scaleX = 0.52;
			image.scaleY = 0.52;
			image.x = -323.4;
			image.y = -24.7;
			addChild(image);
			
			label = new TextField(250, 50, "Management Team and Objective", Assets.getFont("FontCarterOne").fontName, 15, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -148.1;
			label.y = -198.4;
			addChild(label);
			
			label = new TextField(265, 200, "You are the CEO of a micro restaurant company. your goal is to generate as much profit as posible. the market isestabilished, your focus will be on winning market share from competitor. you begin by selling your products spot by spot. At the begining of each quarter you and your competitors must make your investment decisions. All decisions will be processed at the same time according to a present schedule.", Assets.getFont("FontSSPRegular").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -144.65;
			label.y = -160;
			addChild(label);
			
			label = new TextField(250, 50, "Location", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -148.1;
			label.y = 0;
			addChild(label);
			
			label = new TextField(250, 50, "Your Avatar", Assets.getFont("FontCarterOne").fontName, 15, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = 240;
			label.y = -198.4;
			addChild(label);
			
			buttonOpenShop = new Button(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("button_open_shop"));
			buttonOpenShop.pivotX = buttonOpenShop.width * 0.5;
			buttonOpenShop.pivotY = buttonOpenShop.height * 0.5;
			buttonOpenShop.x = 370;
			buttonOpenShop.y = -39.9;
			addChild(buttonOpenShop);
			
			buttonCharacterCustom = new Button(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("button_custom_character"));
			buttonCharacterCustom.pivotX = buttonOpenShop.width * 0.5;
			buttonCharacterCustom.pivotY = buttonOpenShop.height * 0.5;
			buttonCharacterCustom.x = 274.3;
			buttonCharacterCustom.y = -45;
			addChild(buttonCharacterCustom);
			
			avatar = new Avatar();
			avatar.x = 260;
			avatar.y = -155.25;
			avatar.scaleX = 0.85;
			avatar.scaleY = 0.85;
			addChild(avatar);
		}
	}
}