package sketchproject.states
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import sketchproject.core.Game;
	import sketchproject.events.NavigationEvent;
	import sketchproject.events.ZoomEvent;
	import sketchproject.interfaces.IState;
	import sketchproject.managers.FireworkManager;
	import sketchproject.managers.TaskManager;
	import sketchproject.objects.HUD;
	import sketchproject.objects.QuickHelp;
	import sketchproject.objects.dialog.AchievementPanel;
	import sketchproject.objects.dialog.AchievementUnlocked;
	import sketchproject.objects.dialog.Booster;
	import sketchproject.objects.dialog.CustomerPanel;
	import sketchproject.objects.dialog.Help;
	import sketchproject.objects.dialog.Leaderboard;
	import sketchproject.objects.dialog.NewTask;
	import sketchproject.objects.dialog.Option;
	import sketchproject.objects.dialog.Pause;
	import sketchproject.objects.dialog.Profile;
	import sketchproject.objects.dialog.ProfitPanel;
	import sketchproject.objects.dialog.TaskComplete;
	import sketchproject.objects.dialog.TaskPanel;
	import sketchproject.screens.AdvertScreen;
	import sketchproject.screens.BusinessScreen;
	import sketchproject.screens.EmployeeScreen;
	import sketchproject.screens.FinanceScreen;
	import sketchproject.screens.GameScreen;
	import sketchproject.screens.IssuesScreen;
	import sketchproject.screens.MapScreen;
	import sketchproject.screens.ProductScreen;
	import sketchproject.utilities.Config;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Play extends Sprite implements IState
	{
		private var game:Game;
		private var fireworkManager:FireworkManager;
		
		// layers
		private var hud:HUD;
		private var screens:Sprite;
		
		//screen
		private var mapScreen:MapScreen;
		private var businessScreen:BusinessScreen;
		private var productScreen:ProductScreen;
		private var employeeScreen:EmployeeScreen;
		private var issuesScreen:IssuesScreen;
		private var advertScreen:AdvertScreen;
		private var financeScreen:FinanceScreen;
				
		// panels
		private var panelCustomer:CustomerPanel = new CustomerPanel();
		private var panelTask:TaskPanel = new TaskPanel();
		private var panelAchievement:AchievementPanel = new AchievementPanel();
		private var profitCustomer:ProfitPanel = new ProfitPanel();
		
		// dialogs
		private var dialogHelp:Help;		
		private var dialogProfile:Profile;
		private var dialogLeaderboard:Leaderboard;
		private var dialogBooster:Booster;
		private var dialogPause:Pause;
		private var dialogOption:Option;
		
		// managers
		private var taskManager:TaskManager;
		
		
		public function Play(game:Game)
		{
			super();
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			initialize();
			trace("STATE PLAY");
		}
		
		public function initialize():void
		{			
			screens = new Sprite();
			addChild(screens);
			
			mapScreen = new MapScreen();
			mapScreen.x = stage.stageWidth * 0.5;
			mapScreen.y = stage.stageHeight * 0.5;
			screens.addChild(mapScreen);
			
			businessScreen = new BusinessScreen();
			businessScreen.x = stage.stageWidth * 0.5;
			businessScreen.y = stage.stageHeight * 0.5;
			screens.addChild(businessScreen);
			
			productScreen = new ProductScreen();
			productScreen.x = stage.stageWidth * 0.5;
			productScreen.y = stage.stageHeight * 0.5;
			screens.addChild(productScreen);
			
			employeeScreen = new EmployeeScreen();
			employeeScreen.x = stage.stageWidth * 0.5;
			employeeScreen.y = stage.stageHeight * 0.5;
			screens.addChild(employeeScreen);
			
			issuesScreen = new IssuesScreen();
			issuesScreen.x = stage.stageWidth * 0.5;
			issuesScreen.y = stage.stageHeight * 0.5;
			screens.addChild(issuesScreen);
			
			advertScreen = new AdvertScreen();
			advertScreen.x = stage.stageWidth * 0.5;
			advertScreen.y = stage.stageHeight * 0.5;
			screens.addChild(advertScreen);
			
			financeScreen = new FinanceScreen();
			financeScreen.x = stage.stageWidth * 0.5;
			financeScreen.y = stage.stageHeight * 0.5;
			screens.addChild(financeScreen);
			
			hud = new HUD();
			addChild(hud);
			
			hud.addEventListener(NavigationEvent.SWITCH, onTriggered);
			hud.addEventListener(ZoomEvent.ZOOM_IN, onZoomIn);
			hud.addEventListener(ZoomEvent.ZOOM_OUT, onZoomOut);
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			dialogHelp = new Help();
			dialogHelp.x = stage.stageWidth * 0.5;
			dialogHelp.y = stage.stageHeight * 0.5;
			addChild(dialogHelp);
			
			dialogProfile = new Profile();
			dialogProfile.x = stage.stageWidth * 0.5;
			dialogProfile.y = stage.stageHeight * 0.5;
			addChild(dialogProfile);
			
			dialogLeaderboard = new Leaderboard();
			dialogLeaderboard.x = stage.stageWidth * 0.5;
			dialogLeaderboard.y = stage.stageHeight * 0.5;
			addChild(dialogLeaderboard);
			
			dialogBooster = new Booster();
			dialogBooster.x = stage.stageWidth * 0.5;
			dialogBooster.y = stage.stageHeight * 0.5;
			addChild(dialogBooster);
			
			panelCustomer.x = stage.stageWidth * 0.5;
			panelCustomer.y = stage.stageHeight * 0.5;
			addChild(panelCustomer);
			
			panelTask.x = stage.stageWidth * 0.5;
			panelTask.y = stage.stageHeight * 0.5;
			addChild(panelTask);
			
			panelAchievement.x = stage.stageWidth * 0.5;
			panelAchievement.y = stage.stageHeight * 0.5;
			addChild(panelAchievement);
			
			profitCustomer.x = stage.stageWidth * 0.5;
			profitCustomer.y = stage.stageHeight * 0.5;
			addChild(profitCustomer);
						
			dialogOption = new Option();
			dialogOption.x = stage.stageWidth * 0.5;
			dialogOption.y = stage.stageHeight * 0.5;
			
			dialogPause = new Pause(game, dialogOption);
			dialogPause.x = stage.stageWidth * 0.5;
			dialogPause.y = stage.stageHeight * 0.5;
			addChild(dialogPause);
			addChild(dialogOption);
			
			taskManager = new TaskManager(hud);
			
			
			if(!Config.prepare)
			{
				Config.prepare = true;
				var quickHelp:QuickHelp = new QuickHelp();	
				quickHelp.x = stage.stageWidth * 0.5;
				quickHelp.y = stage.stageHeight * 0.5;
				addChild(quickHelp);
				//quickHelp.openDialog();
			}
			
			var congratulation:AchievementUnlocked = new AchievementUnlocked("You have Unlocked Sales Target for 2X", "icon_sales");
			congratulation.x = stage.stageWidth * 0.5;
			congratulation.y = stage.stageHeight * 0.5;
			addChild(congratulation);
			//congratulation.openDialog();
			
			var task:NewTask = new NewTask("You have request for journal financial", TaskManager.TASK_SELLING, 3000);
			task.x = stage.stageWidth * 0.5;
			task.y = stage.stageHeight * 0.5;
			addChild(task);
			//task.openDialog();
			
			var complete:TaskComplete = new TaskComplete("You have done Journal Task, you've got 2300 PTS");
			complete.x = stage.stageWidth * 0.5;
			complete.y = stage.stageHeight * 0.5;
			addChild(complete);
			//complete.openDialog();
			
			switchScreen(mapScreen);
			
		}
		
		private function onZoomOut(event:ZoomEvent):void
		{
			if(Config.zoom > 1)
			{
				hud.zoomControl(--Config.zoom);
			}			
		}
		
		private function onZoomIn(event:ZoomEvent):void
		{
			if(Config.zoom < 3)
			{
				hud.zoomControl(++Config.zoom);
			}
		}
		
		
		private function onTriggered(event:NavigationEvent):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			switch(event.navigate)
			{
				case NavigationEvent.NAVIGATE_CUSTOMER:
					panelCustomer.openDialog();
					break;
				case NavigationEvent.NAVIGATE_POINT:
					panelTask.openDialog();
					break;
				case NavigationEvent.NAVIGATE_STAR:
					panelAchievement.openDialog();
					break;
				case NavigationEvent.NAVIGATE_PROFIT:
					profitCustomer.openDialog();
					break;
				
				case NavigationEvent.NAVIGATE_HELP:
					trace("launch help");
					dialogHelp.openDialog();
					break;
				case NavigationEvent.NAVIGATE_SETTING:
					trace("launch setting");	
					dialogOption.updateSetting();
					dialogOption.openDialog();
					break;
				case NavigationEvent.NAVIGATE_INFO:
					trace("launch info");					
					dialogProfile.openDialog();
					break;
				case NavigationEvent.NAVIGATE_ACHIEVEMENT:
					trace("launch achievement");					
					panelAchievement.openDialog();
					break;
				case NavigationEvent.NAVIGATE_LEADERBOARD:
					trace("launch leaderboard");					
					dialogLeaderboard.openDialog();
					break;
				case NavigationEvent.NAVIGATE_PERFORMANCE:
					trace("launch performance");					
					dialogBooster.openDialog();
					break;				
				case NavigationEvent.NAVIGATE_MENU:
					trace("launch menu");					
					dialogPause.openDialog();
					break;
				case NavigationEvent.NAVIGATE_MARKET:
					trace("launch market");
					break;
				
				case NavigationEvent.NAVIGATE_MAP:
					trace("launch map");
					switchScreen(mapScreen);
					hud.showHUD();
					break;
				case NavigationEvent.NAVIGATE_BUSINESS:
					trace("launch business");
					switchScreen(businessScreen);
					hud.hideHUD();
					break;
				case NavigationEvent.NAVIGATE_PRODUCT:
					trace("launch product");
					switchScreen(productScreen);
					hud.hideHUD();
					break;
				case NavigationEvent.NAVIGATE_EMPLOYEE:
					trace("launch employee");
					switchScreen(employeeScreen);
					hud.hideHUD();
					break;
				case NavigationEvent.NAVIGATE_ISSUES:
					trace("launch issues");
					switchScreen(issuesScreen);
					hud.hideHUD();
					break;
				case NavigationEvent.NAVIGATE_ADVERT:
					trace("launch advert");
					switchScreen(advertScreen);
					hud.hideHUD();
					break;
				case NavigationEvent.NAVIGATE_FINANCE:
					trace("launch finance");
					switchScreen(financeScreen);
					hud.hideHUD();
					break;				
			}
		}
		
		public function switchScreen(screen:GameScreen):void
		{
			mapScreen.visible = false;
			businessScreen.visible = false;
			productScreen.visible = false;
			employeeScreen.visible = false;
			issuesScreen.visible = false;
			advertScreen.visible = false;
			financeScreen.visible = false;
			
			screen.visible = true;
		}
		
		public function update():void
		{
			taskManager.update();
		}
		
		public function destroy():void
		{
			removeFromParent(true);
		}
	}
}