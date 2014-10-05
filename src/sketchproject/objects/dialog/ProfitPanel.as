package sketchproject.objects.dialog
{
	import sketchproject.core.Assets;
	import sketchproject.objects.Panel;
	
	import starling.textures.Texture;
	
	public class ProfitPanel extends Panel
	{
		public function ProfitPanel()
		{
			super(
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("icon_coin"),
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("title_revenue"),
				"Earn income by analysis revenue and loss"
			);
		}
	}
}