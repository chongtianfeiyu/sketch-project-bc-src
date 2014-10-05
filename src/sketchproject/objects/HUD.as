package sketchproject.objects
{
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.events.NavigationEvent;
	import sketchproject.events.ZoomEvent;
	import sketchproject.managers.FireworkManager;
	import sketchproject.objects.dialog.Option;
	import sketchproject.utilities.Config;
	import sketchproject.utilities.ValueFormat;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	public class HUD extends Sprite
	{
		public var containerHUD:Sprite;
		public var containerDashboard:Sprite;
		
		private var hudBase:Image;
		private var hudIcon:Image;		
		private var dashboard:Image;
		
		private var buttonAddCustomer:Button;
		private var buttonAddPoint:Button;
		private var buttonAddStar:Button;
		private var buttonAddProfit:Button;
		
		private var buttonMap:Button;
		private var buttonBusiness:Button;
		private var buttonProduct:Button;
		private var buttonEmployee:Button;
		private var buttonIssues:Button;
		private var buttonAdvert:Button;
		private var buttonFinance:Button;
		
		private var buttonInfo:Button;
		private var buttonSetting:Button;
		private var buttonHelp:Button;
		private var buttonAchievement:Button;
		private var buttonPerformance:Button;
		private var buttonLeaderboard:Button;
		private var buttonMenu:Button;
		private var buttonBgm:Button;
		private var buttonSfx:Button;
		
		private var buttonOpenMarket:Button;
		private var avatarBase:Image;
		private var avatarMask:Image;
		
		private var timeClock:Clock;
		
		private var label:TextField;
		private var textProfit:TextField;
		private var textPoint:TextField;
		private var textCustomer:TextField;
		
		private var textZoom:TextField;
		
		private var customerBar:Image;
		
		private var starsContainer:Sprite;
		private var star:Image;
		
		private var buttonZoomIn:Button;
		private var buttonZoomOut:Button;
		private var zoomTrack:Image;
		private var zoomSlider:Image;
		private var zoomLabel:TextField;
		
		private var bgmOn:Boolean;
		private var sfxOn:Boolean;
		
		private var fireworkManager:FireworkManager;
		
		public function HUD()
		{
			super();
			fireworkManager = new FireworkManager(Game.overlayStage);
			bgmOn = true;
			sfxOn = true;
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			// container
			containerHUD = new Sprite();
			containerDashboard = new Sprite();	
									
			// HUD
			hudBase = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_base"));
			hudBase.x = 120.35;
			hudBase.y = 19.45;			
			containerHUD.addChild(hudBase);
			
			hudIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_icon_lighting"));
			hudIcon.x = 115.25;
			hudIcon.y = 12;
			containerHUD.addChild(hudIcon);
						
			customerBar = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("blue_bar"));
			customerBar.x = 148;
			customerBar.y = 27;
			customerBar.width = 100;
			customerBar.height = 17;
			containerHUD.addChild(customerBar);
			
			textCustomer = new TextField(150,25,"200 / "+Config.valuePopulation, "Carter",13, 0xFFFFFF);
			textCustomer.hAlign = HAlign.LEFT;
			textCustomer.x = 160;
			textCustomer.y = 24;
			containerHUD.addChild(textCustomer);
			
			buttonAddCustomer = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_plus")); 
			buttonAddCustomer.x = 255.75;
			buttonAddCustomer.y = 24.95;
			buttonAddCustomer.scaleX = 0.7;
			buttonAddCustomer.scaleY = 0.7;
			containerHUD.addChild(buttonAddCustomer);
			
			hudBase = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_base"));
			hudBase.x = 315.1;
			hudBase.y = 19.45;
			containerHUD.addChild(hudBase);
			
			hudIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_icon_diamond"));
			hudIcon.x = 305.45;
			hudIcon.y = 18.5;
			containerHUD.addChild(hudIcon);
			
			textPoint = new TextField(150,25,ValueFormat.format(Config.point)+" PTS", "Carter",13, 0xFFFFFF);
			textPoint.hAlign = HAlign.LEFT;
			textPoint.x = 346.45;
			textPoint.y = 24;
			containerHUD.addChild(textPoint);
			
			buttonAddPoint = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_plus")); 
			buttonAddPoint.x = 450.5;
			buttonAddPoint.y = 24.95;
			buttonAddPoint.scaleX = 0.7;
			buttonAddPoint.scaleY = 0.7;
			containerHUD.addChild(buttonAddPoint);
			
			
			hudBase = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_base"));
			hudBase.x = 511.75;
			hudBase.y = 19.45;
			containerHUD.addChild(hudBase);
			
			hudIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_icon_star"));
			hudIcon.x = 500.2;
			hudIcon.y = 14.7;
			containerHUD.addChild(hudIcon);
			
			starsContainer = new Sprite();
			starsContainer.x = 542.9;
			starsContainer.y = 27.35;
			for(var i:uint = 0; i<5;i++)
			{
				if(i < Config.stars)
				{
					star = new Image(Assets.getAtlas(Assets.TEXTURE_HUD,Assets.TEXTURE_HUD_XML).getTexture("star"));
				}
				else
				{
					star = new Image(Assets.getAtlas(Assets.TEXTURE_HUD,Assets.TEXTURE_HUD_XML).getTexture("star_base"));
				}				
				star.scaleX = 0.4;
				star.scaleY = 0.4;
				star.x = i * 20;
				starsContainer.addChild(star);
			}
			containerHUD.addChild(starsContainer);
			
			buttonAddStar = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_plus")); 
			buttonAddStar.x = 647.35;
			buttonAddStar.y = 24.95;
			buttonAddStar.scaleX = 0.7;
			buttonAddStar.scaleY = 0.7;
			containerHUD.addChild(buttonAddStar);
			
			hudBase = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_base"));
			hudBase.x = 707.05;
			hudBase.y = 19.45;
			containerHUD.addChild(hudBase);
			
			hudIcon = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("hud_icon_coin"));
			hudIcon.x = 692.85;
			hudIcon.y = 15.45;
			containerHUD.addChild(hudIcon);
						
			textProfit = new TextField(150,25,"IDR "+ValueFormat.format(Config.profit), "Carter",13, 0xFFFFFF);
			textProfit.hAlign = HAlign.LEFT;
			textProfit.x = 737.35;
			textProfit.y = 24;
			containerHUD.addChild(textProfit);
			
			buttonAddProfit = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_plus")); 
			buttonAddProfit.x = 842.5;
			buttonAddProfit.y = 23.6;
			buttonAddProfit.scaleX = 0.7;
			buttonAddProfit.scaleY = 0.7;
			containerHUD.addChild(buttonAddProfit);
			
			// zoom
			zoomTrack = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("zoom_track"));
			zoomTrack.x = 44.2;	
			zoomTrack.y = 353.5;
			containerHUD.addChild(zoomTrack);
								
			buttonZoomIn = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("zoom_in"));
			buttonZoomIn.pivotX = buttonZoomIn.width * 0.5;
			buttonZoomIn.pivotY = buttonZoomIn.height * 0.5;
			buttonZoomIn.x = 100;
			buttonZoomIn.y = 354;
			containerHUD.addChild(buttonZoomIn);
			
			buttonZoomOut = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("zoom_out"));
			buttonZoomOut.pivotX = buttonZoomOut.width * 0.5;
			buttonZoomOut.pivotY = buttonZoomOut.height * 0.5;
			buttonZoomOut.x = 38;
			buttonZoomOut.y = 400.95;
			containerHUD.addChild(buttonZoomOut);
			
			zoomSlider = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("zoom_slider"));
			zoomSlider.x = 54.75;	
			zoomSlider.y = 366.6;
			containerHUD.addChild(zoomSlider);
			
			textZoom = new TextField(50,70,"Zoom 2X", "Carter",13, 0xFFFFFF);
			textZoom.x = 85;
			textZoom.y = 360;
			containerHUD.addChild(textZoom);
			
			// dashboard
			dashboard = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("dashboard"));
			dashboard.x = 0;	
			dashboard.y = 415.85;
			containerDashboard.addChild(dashboard);
			
			buttonMap = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_map"));
			buttonMap.pivotX = buttonMap.width * 0.5;
			buttonMap.pivotY = buttonMap.height * 0.5;
			buttonMap.x = 282.2;
			buttonMap.y = 505.4;
			containerDashboard.addChild(buttonMap);
			
			buttonBusiness = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_business"));
			buttonBusiness.pivotX = buttonBusiness.width * 0.5;
			buttonBusiness.pivotY = buttonBusiness.height * 0.5;
			buttonBusiness.x = 351.9;
			buttonBusiness.y = 505.4;
			containerDashboard.addChild(buttonBusiness);
			
			buttonProduct = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_product"));
			buttonProduct.pivotX = buttonProduct.width * 0.5;
			buttonProduct.pivotY = buttonProduct.height * 0.5;
			buttonProduct.x = 421.6;
			buttonProduct.y = 505.4;
			containerDashboard.addChild(buttonProduct);
			
			buttonEmployee = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_employee"));
			buttonEmployee.pivotX = buttonEmployee.width * 0.5;
			buttonEmployee.pivotY = buttonEmployee.height * 0.5;
			buttonEmployee.x = 491.3;
			buttonEmployee.y = 505.4;
			containerDashboard.addChild(buttonEmployee);
			
			buttonIssues = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_issues"));
			buttonIssues.pivotX = buttonEmployee.width * 0.5;
			buttonIssues.pivotY = buttonEmployee.height * 0.5;
			buttonIssues.x = 561;
			buttonIssues.y = 505.4;
			containerDashboard.addChild(buttonIssues);
			
			buttonAdvert = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_advert"));
			buttonAdvert.pivotX = buttonAdvert.width * 0.5;
			buttonAdvert.pivotY = buttonAdvert.height * 0.5;
			buttonAdvert.x = 630.7;
			buttonAdvert.y = 505.4;
			containerDashboard.addChild(buttonAdvert);
			
			buttonFinance = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_finance"));
			buttonFinance.pivotX = buttonFinance.width * 0.5;
			buttonFinance.pivotY = buttonFinance.height * 0.5;
			buttonFinance.x = 700.4;
			buttonFinance.y = 505.4;
			containerDashboard.addChild(buttonFinance);
			
			
			buttonHelp = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_help"));
			buttonHelp.pivotX = buttonHelp.width * 0.5;
			buttonHelp.pivotY = buttonHelp.height * 0.5;
			buttonHelp.x = 104.55;
			buttonHelp.y = 450.35;
			buttonHelp.scaleX = 0.7;
			buttonHelp.scaleY = 0.7;
			containerDashboard.addChild(buttonHelp);
			
			buttonSetting = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_setting"));
			buttonSetting.pivotX = buttonSetting.width * 0.5;
			buttonSetting.pivotY = buttonSetting.height * 0.5;
			buttonSetting.x = 115.2;
			buttonSetting.y = 486.7;
			buttonSetting.scaleX = 0.7;
			buttonSetting.scaleY = 0.7;
			containerDashboard.addChild(buttonSetting);
			
			buttonInfo = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_info"));
			buttonInfo.pivotX = buttonInfo.width * 0.5;
			buttonInfo.pivotY = buttonInfo.height * 0.5;
			buttonInfo.x = 102.45;
			buttonInfo.y = 523.05;
			buttonInfo.scaleX = 0.7;
			buttonInfo.scaleY = 0.7;
			containerDashboard.addChild(buttonInfo);
			
			buttonAchievement = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_achievement"));
			buttonAchievement.pivotX = buttonAchievement.width * 0.5;
			buttonAchievement.pivotY = buttonAchievement.height * 0.5;
			buttonAchievement.x = 887.95;
			buttonAchievement.y = 450.35;
			buttonAchievement.scaleX = 0.7;
			buttonAchievement.scaleY = 0.7;
			containerDashboard.addChild(buttonAchievement);
			
			buttonLeaderboard = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_leaderboard"));
			buttonLeaderboard.pivotX = buttonLeaderboard.width * 0.5;
			buttonLeaderboard.pivotY = buttonLeaderboard.height * 0.5;
			buttonLeaderboard.x = 873.55;
			buttonLeaderboard.y = 486.7;
			buttonLeaderboard.scaleX = 0.7;
			buttonLeaderboard.scaleY = 0.7;
			containerDashboard.addChild(buttonLeaderboard);
			
			buttonPerformance = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_game"));
			buttonPerformance.pivotX = buttonPerformance.width * 0.5;
			buttonPerformance.pivotY = buttonPerformance.height * 0.5;
			buttonPerformance.x = 884.4;
			buttonPerformance.y = 523.05;
			buttonPerformance.scaleX = 0.7;
			buttonPerformance.scaleY = 0.7;
			containerDashboard.addChild(buttonPerformance);
			
			buttonMenu = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_menu"));
			buttonMenu.pivotX = buttonMenu.width * 0.5;
			buttonMenu.pivotY = buttonMenu.height * 0.5;
			buttonMenu.x = 763.65;
			buttonMenu.y = 508.05;
			buttonMenu.scaleX = 0.9;
			buttonMenu.scaleY = 0.9;
			containerDashboard.addChild(buttonMenu);
			
			buttonBgm = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_music"));
			buttonBgm.pivotX = buttonBgm.width * 0.5;
			buttonBgm.pivotY = buttonBgm.height * 0.5;
			buttonBgm.x = 812.85;
			buttonBgm.y = 489.05;
			buttonBgm.scaleX = 0.7;
			buttonBgm.scaleY = 0.7;
			containerDashboard.addChild(buttonBgm);
			
			buttonSfx = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_sound"));
			buttonSfx.pivotX = buttonSfx.width * 0.5;
			buttonSfx.pivotY = buttonSfx.height * 0.5;
			buttonSfx.x = 814.05;
			buttonSfx.y = 529.2;
			buttonSfx.scaleX = 0.7;
			buttonSfx.scaleY = 0.7;
			containerDashboard.addChild(buttonSfx);
			
			buttonOpenMarket = new Button(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_open_market"));
			buttonOpenMarket.pivotX = buttonOpenMarket.width * 0.5;
			buttonOpenMarket.pivotY = buttonOpenMarket.height * 0.5;
			buttonOpenMarket.x = 939.8;
			buttonOpenMarket.y = 483;
			containerDashboard.addChild(buttonOpenMarket);
			
			label = new TextField(80, 70, "MARKET", Assets.getFont("FontErasITC").fontName, 15, 0x333333);
			label.pivotX = label.width * 0.5;
			label.pivotY =label.height * 0.5;
			label.x = 939.8;
			label.y = 540;
			containerDashboard.addChild(label);
			
			avatarBase = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_base_avatar"));
			avatarBase.pivotX = avatarBase.width * 0.5;
			avatarBase.pivotY = avatarBase.height * 0.5;
			avatarBase.x = 50.45;	
			avatarBase.y = 490;
			containerDashboard.addChild(avatarBase);
			
			avatarBase = new Image(Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_base_avatar_mask"));
			avatarBase.x = 19.2;	
			avatarBase.y = 410;
			containerDashboard.addChild(avatarBase);
			
			label = new TextField(80, 70, Config.nickname.toUpperCase(), Assets.getFont("FontErasITC").fontName, 15, 0x333333);
			label.pivotX = label.width * 0.5;
			label.pivotY =label.height * 0.5;
			label.x = 50.45;
			label.y = 540;
			containerDashboard.addChild(label);
			
			timeClock = new Clock();
			timeClock.pivotX = timeClock.width * 0.5;
			timeClock.pivotY = timeClock.height * 0.5;
			timeClock.x = 202.5;
			timeClock.y = 507.4;
			containerDashboard.addChild(timeClock);
						
			addChild(containerHUD);
			addChild(containerDashboard);
			
			buttonAddCustomer.addEventListener(Event.TRIGGERED, onTrigerredCustomer);
			buttonAddPoint.addEventListener(Event.TRIGGERED, onTrigerredPoint);
			buttonAddStar.addEventListener(Event.TRIGGERED, onTrigerredStar);
			buttonAddProfit.addEventListener(Event.TRIGGERED, onTrigerredProfit);
			
			buttonZoomIn.addEventListener(Event.TRIGGERED, onTrigerredZoomIn);
			buttonZoomOut.addEventListener(Event.TRIGGERED, onTrigerredZoomOut);
			
			buttonHelp.addEventListener(Event.TRIGGERED, onTrigerredHelp);
			buttonSetting.addEventListener(Event.TRIGGERED, onTrigerredSetting);
			buttonInfo.addEventListener(Event.TRIGGERED, onTrigerredInfo);
			buttonAchievement.addEventListener(Event.TRIGGERED, onTrigerredAchievement);
			buttonLeaderboard.addEventListener(Event.TRIGGERED, onTrigerredLeaderboard);
			buttonPerformance.addEventListener(Event.TRIGGERED, onTrigerredPerformance);			
			buttonMenu.addEventListener(Event.TRIGGERED, onTrigerredMenu);
			buttonOpenMarket.addEventListener(Event.TRIGGERED, onTrigerredMarket);
			buttonBgm.addEventListener(Event.TRIGGERED, bgmSwitch);
			buttonSfx.addEventListener(Event.TRIGGERED, sfxSwitch);
			
			buttonMap.addEventListener(Event.TRIGGERED, onTrigerredMap);
			buttonBusiness.addEventListener(Event.TRIGGERED, onTrigerredBusiness);
			buttonProduct.addEventListener(Event.TRIGGERED, onTrigerredProduct);
			buttonEmployee.addEventListener(Event.TRIGGERED, onTrigerredEmployee);
			buttonIssues.addEventListener(Event.TRIGGERED, onTrigerredIssues);
			buttonAdvert.addEventListener(Event.TRIGGERED, onTrigerredAdvert);
			buttonFinance.addEventListener(Event.TRIGGERED, onTrigerredFinance);
			
			//containerDashboard.visible = false;
		}
		
		public function zoomControl(zoom:uint):void
		{
			switch(zoom)
			{
				case 1:
					zoomSlider.x = 40;	
					zoomSlider.y = 375;
					textZoom.text = "Zoom 1X";
					break;
				case 2:
					zoomSlider.x = 54.75;	
					zoomSlider.y = 366.6;
					textZoom.text = "Zoom 2X";
					break;
				case 3:
					zoomSlider.x = 66;	
					zoomSlider.y = 348;
					textZoom.text = "Zoom 3X";
					break;
			}
		}
		
		private function sfxSwitch(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			if(this.sfxOn)
			{
				sfxOn = false;
				buttonSfx.upState = Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_sound_disable");
				Config.volsfx = 0;
			}
			else
			{
				sfxOn= true;
				buttonSfx.upState = Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_sound");
				Config.volsfx = 10;
			}
			Option.volumeBgm = Config.volbgm;
			Option.volumeSfx = Config.volsfx;
			Assets.setup();
			trace(sfxOn +" "+ Config.volsfx);
		}
		
		private function bgmSwitch(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			if(this.bgmOn)
			{
				bgmOn = false;
				buttonBgm.upState = Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_music_disable");
				Config.volbgm = 0;
			}
			else
			{
				bgmOn= true;
				buttonBgm.upState = Assets.getAtlas(Assets.TEXTURE_HUD, Assets.TEXTURE_HUD_XML).getTexture("button_music");
				Config.volbgm = 10;				
			}
			Assets.setup();
			trace(bgmOn +" "+ Config.volbgm);
		}
		
		/* panel event dispatch */
		private function onTrigerredCustomer(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_CUSTOMER));
		}
		private function onTrigerredPoint(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_POINT));
		}
		private function onTrigerredStar(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_STAR));
		}
		private function onTrigerredProfit(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_PROFIT));
		}
		
		
		/* zoom event dispatch */
		private function onTrigerredZoomIn(event:Event):void
		{
			dispatchEvent(new ZoomEvent(ZoomEvent.ZOOM_IN));
		}
		private function onTrigerredZoomOut(event:Event):void
		{
			dispatchEvent(new ZoomEvent(ZoomEvent.ZOOM_OUT));
		}
		
		
		/* popup modal event dispatch */
		private function onTrigerredHelp(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_HELP));
		}
		
		private function onTrigerredSetting(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_SETTING));
		}
		
		private function onTrigerredInfo(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_INFO));
		}
		
		private function onTrigerredAchievement(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_ACHIEVEMENT));
		}
		
		private function onTrigerredLeaderboard(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_LEADERBOARD));
		}
		
		private function onTrigerredPerformance(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_PERFORMANCE));
		}
		
		private function onTrigerredMenu(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_MENU));
		}
		
		private function onTrigerredMarket(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_MARKET));
		}
		
		
		/* navigation event dispatch */
		private function onTrigerredMap(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_MAP));
		}
		
		private function onTrigerredBusiness(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_BUSINESS));
		}		
		
		private function onTrigerredProduct(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_PRODUCT));
		}
		
		private function onTrigerredEmployee(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_EMPLOYEE));
		}
				
		private function onTrigerredIssues(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_ISSUES));
		}
				
		private function onTrigerredAdvert(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_ADVERT));
		}
				
		private function onTrigerredFinance(event:Event):void
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.SWITCH, NavigationEvent.NAVIGATE_FINANCE));
		}
		
				
		/* class function */
		public function hideHUD():void
		{
			containerHUD.visible = false;
		}
		
		public function showHUD():void
		{
			containerHUD.visible = true;
		}
	}
}