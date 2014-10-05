package sketchproject.objects.parameter
{
	import sketchproject.core.Assets;
		
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	public class StartupTarget extends Sprite
	{
		
		private var panel:Image;
		private var text:TextField;
		
		public function StartupTarget()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			text = new TextField(250, 50, "Personal Objective", Assets.getFont("FontErasITC").fontName, 25, 0xc0251e);
			text.x = 20;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(250, 50, "Business Plan", Assets.getFont("FontErasITC").fontName, 25, 0xc0251e);
			text.x = 550;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(350, 50, "Write your personal objective and target", Assets.getFont("FontSSPBold").fontName, 14, 0x333333);
			text.x = 20;
			text.y = 25;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			text = new TextField(350, 50, "Write best avhievement in your business career", Assets.getFont("FontSSPBold").fontName, 14, 0x333333);
			text.x = 550;
			text.y = 25;
			text.hAlign = HAlign.LEFT;
			addChild(text);
			
			panel = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("small_panel"));
			panel.x = 20;
			panel.y = 80;
			panel.scaleX = 0.8;
			panel.scaleY = 0.8;
			addChild(panel);
			
			panel = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("small_panel"));
			panel.x = 550;
			panel.y = 80;
			panel.scaleX = 0.8;
			panel.scaleY = 0.8;
			addChild(panel);
		}
	}
}