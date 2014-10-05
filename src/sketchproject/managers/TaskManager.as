package sketchproject.managers
{
	import sketchproject.objects.HUD;
	import sketchproject.objects.TaskIcon;
	import sketchproject.objects.list.TaskAdapter;
	import sketchproject.utilities.Config;
	
	import starling.display.Quad;
	import starling.display.Sprite;

	public class TaskManager
	{
		public static const TASK_JOURNAL:String ="journal";
		public static const TASK_SELLING:String = "selling";
		public static const TASK_ORDER:String = "order";
		public static const TASK_UPGRADE:String ="upgrade";
		
		private var worldLists:Sprite;
		private var panelLists:Sprite;
		
		private var hud:HUD;
		
		private var backList:Quad;
		
		public function TaskManager(hud:HUD)
		{
			this.hud = hud;
			
			backList = new Quad(100,240);
			backList.pivotX = backList.width * 0.5;
			backList.pivotY = backList.height;
			backList.color = 0xFFFFFF;
			backList.x = 70;
			backList.y = 320;
			this.hud.containerHUD.addChild(backList);
		}
				
		public function update():void
		{
			
		}
	}
}