package sketchproject.objects.parameter
{
	import sketchproject.core.Assets;
		
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	import sketchproject.utilities.Config;
	
	public class StartupFinancial extends Sprite
	{
		private var text:TextField;
		
		public function StartupFinancial()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			text = new TextField(250, 50, "Financial Deatail", Assets.getFont("FontErasITC").fontName, 25, 0xc0251e);
			text.x = 20;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(250, 50, "Startup Cost", Assets.getFont("FontErasITC").fontName, 25, 0xc0251e);
			text.x = 550;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(350, 50, "Detail source starting cost", Assets.getFont("FontSSPBold").fontName, 14, 0x333333);
			text.x = 20;
			text.y = 25;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(350, 50, "Cost for starting your business", Assets.getFont("FontSSPBold").fontName, 14, 0x333333);
			text.x = 550;
			text.y = 25;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(300, 50, "Saving", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 20;
			text.y = 80;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(300, 50, "Other", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 20;
			text.y = 110;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(300, 50, "Total Seed Financing", Assets.getFont("FontSSPBold").fontName, 18, 0x333333);
			text.x = 20;
			text.y = 150;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			
			text = new TextField(300, 50, "Signature", Assets.getFont("FontSSPBold").fontName, 12, 0x333333);
			text.x = 20;
			text.y = 250;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(300, 50, Config.name, Assets.getFont("FontSSPBold").fontName, 20, 0x333333);
			text.x = 20;
			text.y = 270;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(300, 50, "CEO Sketch Project", Assets.getFont("FontSSPBold").fontName, 14, 0xc0251e);
			text.x = 20;
			text.y = 292;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			
			text = new TextField(300, 50, "Cart", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 550;
			text.y = 80;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(150, 50, "5.000.000", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 700;
			text.y = 80;
			text.hAlign = HAlign.RIGHT;
			addChild(text);
			
			text = new TextField(300, 50, "Equipment", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 550;
			text.y = 110;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(150, 50, "300.000", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 700;
			text.y = 110;
			text.hAlign = HAlign.RIGHT;
			addChild(text);
			
			text = new TextField(300, 50, "Permits", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 550;
			text.y = 140;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(150, 50, "240.000", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 700;
			text.y = 140;
			text.hAlign = HAlign.RIGHT;
			addChild(text);
			
			text = new TextField(300, 50, "Sign", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 550;
			text.y = 170;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(150, 50, "1.200.000", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 700;
			text.y = 170;
			text.hAlign = HAlign.RIGHT;
			addChild(text);
			
			text = new TextField(300, 50, "Insurance", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 550;
			text.y = 200;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(150, 50, "450.000", Assets.getFont("FontSSPBold").fontName, 16, 0x333333);
			text.x = 700;
			text.y = 200;
			text.hAlign = HAlign.RIGHT;
			addChild(text);
			
			text = new TextField(200, 50, "Total Startup Cost", Assets.getFont("FontSSPBold").fontName, 18, 0x333333);
			text.x = 550;
			text.y = 240;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(150, 50, "6.344.566", Assets.getFont("FontSSPBold").fontName, 18, 0x333333);
			text.x = 700;
			text.y = 240;
			text.hAlign = HAlign.RIGHT;
			addChild(text);
			
			text = new TextField(200, 50, "Working Capital", Assets.getFont("FontSSPBold").fontName, 18, 0x333333);
			text.x = 550;
			text.y = 270;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(150, 50, "700.000", Assets.getFont("FontSSPBold").fontName, 18, 0x333333);
			text.x = 700;
			text.y = 270;
			text.hAlign = HAlign.RIGHT;
			addChild(text);
			
			text = new TextField(300, 50, "This cost will dedicate from your cash balance", Assets.getFont("FontSSPBold").fontName, 14, 0x333333);
			text.x = 550;
			text.y = 305;
			text.hAlign = HAlign.LEFT;
			addChild(text);
		}
	}
}