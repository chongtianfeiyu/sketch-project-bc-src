package sketchproject.objects.finance
{
	import sketchproject.core.Assets;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class GeneralJournal extends Sprite
	{
		private var  title:TextField;
		
		public function GeneralJournal()
		{
			super();
			
			title = new TextField(250, 150, "General Journal", Assets.getFont("FontCarterOne").fontName, 14, 0x333333);
			title.vAlign = VAlign.TOP;
			title.hAlign = HAlign.LEFT;
			addChild(title);
		}
	}
}