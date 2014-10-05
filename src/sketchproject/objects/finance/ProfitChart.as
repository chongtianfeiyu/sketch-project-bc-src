package sketchproject.objects.finance
{
	import sketchproject.core.Assets;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class ProfitChart extends Sprite
	{
		private var  title:TextField;
		
		public function ProfitChart()
		{
			super();
			
			title = new TextField(250, 150, "Profit Chart", Assets.getFont("FontCarterOne").fontName, 14, 0x333333);
			title.x = 10;
			title.vAlign = VAlign.TOP;
			title.hAlign = HAlign.LEFT;
			addChild(title);
		}
	}
}