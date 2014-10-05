package sketchproject.objects.dialog
{
	import sketchproject.core.Assets;
	import sketchproject.managers.TaskManager;
	import sketchproject.objects.Panel;
	import sketchproject.objects.list.TaskAdapter;
	
	import starling.textures.Texture;
	
	public class TaskPanel extends Panel
	{
		
		public function TaskPanel()
		{
			super(
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("icon_diamond"),
				Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("title_points"),
				"Earn points by accomplish task list and daily transaction"
			);
			
		}
	}
}