package sketchproject.objects.dialog
{
	import sketchproject.core.Assets;
	import sketchproject.objects.Panel;
	
	public class CustomerPanel extends Panel
	{
		public function CustomerPanel()
		{
			super(
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("icon_lightning"),
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("title_customer"),
				"Earn customer active by analysis customer relationship and advertising "
			);
		}
		
		public function open():void
		{
			super.openDialog();
		}
	}
}