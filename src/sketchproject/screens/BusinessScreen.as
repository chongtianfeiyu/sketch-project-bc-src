package sketchproject.screens
{	
	import sketchproject.objects.business.General;
	import sketchproject.objects.business.Home;
	import sketchproject.objects.business.Schedule;
	import sketchproject.objects.business.Startup;
	
	import starling.display.Sprite;
	
	public class BusinessScreen extends GameScreen
	{
		private var general:General;
		private var schedule:Schedule;
		private var startup:Startup;
		private var home:Home;
		
		public function BusinessScreen()
		{
			super(true,"icon_business","Business", "Review Mangagement Team and Objective", "Setup how your business work and give you profits");
			
			general = new General();
			addChild(general);
			
			schedule = new Schedule();
			addChild(schedule);
			
			startup = new Startup();
			addChild(startup);
			
			home = new Home();
			addChild(home);
			
			
			switchPage(startup);
		}
		
		private function switchPage(page:Sprite):void
		{
			general.visible = false;
			schedule.visible = false;
			startup.visible = false;
			home.visible = false;
			
			page.visible = true;
		}
	}
}