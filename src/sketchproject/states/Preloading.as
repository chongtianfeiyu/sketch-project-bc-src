package sketchproject.states
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Elastic;
	import com.greensock.easing.Linear;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.entities.Player;
	import sketchproject.interfaces.IState;
	import sketchproject.managers.ServerManager;
	import sketchproject.objects.dialog.Option;
	import sketchproject.objects.loading.DeveloperLogo;
	import sketchproject.objects.loading.PreloadAssets;
	import sketchproject.objects.loading.PreloadProgress;
	import sketchproject.objects.loading.ServerLoading;
	import sketchproject.utilities.Config;
	
	import starling.animation.Tween;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	
	public class Preloading extends Sprite implements IState
	{
		private var game:Game;
		
		private var gameDevLogo:DeveloperLogo;
		private var gamePreload:PreloadProgress;
		private var assetsPreload:PreloadAssets;
		private var serverCommunication:ServerLoading;
		
		private var gameLoaded:uint;
		private var assetsLoaded:uint;
		
		private var loadingNow:Boolean;
		private var gameLoading:Boolean;
		private var assetsLoading:Boolean;
		
		private var gameLoadingText:TextField;
		
		public function Preloading(game:Game)
		{
			super();
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			initialize();	
			trace("STATE PRELOADING");
		}
		
		public function initialize():void
		{			
			gameLoading = false;			
			assetsLoading = false;
			
			gameLoaded = 0;
			assetsLoaded = 0;
			
			gameLoadingText = new TextField(
				200, 
				50, 
				"Loading "+gameLoaded+" %", 
				Assets.getFont("FontSSPBold").fontName, 
				25, 
				0xFFFFFF
			);
			gameLoadingText.color = 0xffffff;
			gameLoadingText.x = stage.stageWidth * 0.5 - gameLoadingText.width * 0.5;
			gameLoadingText.y = 400;
			
			gameDevLogo = new DeveloperLogo();
			gameDevLogo.x = stage.stageWidth * 0.5;
			gameDevLogo.y = stage.stageHeight * 0.5;
			addChild(gameDevLogo);
			
			gamePreload = new PreloadProgress();
			gamePreload.x = stage.stageWidth * 0.5;
			gamePreload.y = 100;
			addChild(gamePreload);
			
			assetsPreload = new PreloadAssets();
			assetsPreload.x = 0;
			assetsPreload.y = 0;
			addChild(assetsPreload);
			
			serverCommunication = new ServerLoading(
				ServerLoading.SERVER_PROGRESS, 
				"SERVER COMMUNICATION", 
				"[Server Check, Please Wait]"
			);
			serverCommunication.y = -serverCommunication.height;
			addChild(serverCommunication);
			
			TweenMax.to(
				gameDevLogo, 
				0.3, 
				{
					scaleX:0.5, 
					scaleY:0.5, 
					alpha:1, 
					ease:Linear.easeNone, 
					delay:1, 
					onComplete:logoSlideUp
				}
			);
		}
		
		private function logoSlideUp():void
		{
			TweenMax.to(
				gameDevLogo, 
				0.6, 
				{
					scaleX:1, 
					scaleY:1, 
					ease:Bounce.easeOut, 					
					onComplete:logoSlideDown
				}
			);
		}
		
		private function logoSlideDown():void
		{
			TweenMax.to(
				gameDevLogo, 
				0.5, 
				{
					scaleX:0, 
					scaleY:0,
					alpha:0, 
					ease:Back.easeIn, 
					delay:1, 
					onComplete:gameLoadingSlideUp
				}
			);
		}
		
		private function gameLoadingSlideUp():void
		{			
			TweenMax.to(
				gamePreload, 
				1.8, 
				{
					scaleX:1, 
					scaleY:1, 
					alpha:1,
					ease:Elastic.easeOut, 
					delay:0.5, 
					onComplete:gameLoadingProgress
				}
			);
		}
		
		private function gameLoadingProgress():void
		{
			gameLoading = true;
			addChild(gameLoadingText);
		}
		
		private function gameLoadingSlideDown():void
		{
			TweenMax.to(
				gamePreload, 
				1, 
				{
					scaleX:0.3, 
					scaleY:0.3, 
					alpha:0,
					ease:Elastic.easeIn, 
					delay:0.5, 
					onComplete:assetsLoadingSlideUp
				}
			);
		}
		
		private function assetsLoadingSlideUp():void
		{
			TweenMax.to(
				assetsPreload, 
				0.3, 
				{					 
					alpha:1,
					ease:Linear.easeIn,
					onComplete:assetsLoadingProgress
				}
			);	
			Assets.bgmChannel.stop();
			//Assets.bgm.play(0,int.MAX_VALUE, Assets.bgmTransform);
			Assets.bgmChannel = Assets.bgm.play(0,int.MAX_VALUE, Assets.bgmTransform);
			//Assets.setup();
		}
		
		private function assetsLoadingProgress():void
		{
			assetsLoading = true; 
			assetsPreload.startAnimate();
		}
		
		private function assetsLoadingSlideDown():void
		{
			TweenMax.to(
				assetsPreload, 
				1, 
				{					
					alpha:0,
					ease:Linear.easeOut, 
					onComplete:checkSessionSlideUp
				}
			);
		}
		
		private function checkSessionSlideUp():void
		{
			assetsPreload.destroy();
			
			TweenMax.to(
				serverCommunication, 
				1, 
				{
					y:0,
					ease:Bounce.easeOut,
					onComplete:checkSession
				}
			);
		}		
		
		private function checkSession():void
		{
			var playerObject:Object = new Object();
			playerObject.gameaccess = "businesscareer";
			var gameServer:ServerManager = new ServerManager("gameserver", playerObject);
			gameServer.addEventListener(ServerManager.READY, complete);
			gameServer.addEventListener(ServerManager.ERROR, error);
			
			function complete(event:Object):void{				
				var result:String = gameServer.received.result_var;
				if(result=="ready_session")
				{
					var player:Object = JSON.parse(gameServer.received.player_var as String);
					Config.id = player["ply_name"];
					Config.key = player["ply_name"];
					Config.username = player["ply_name"];
					Config.name = player["ply_name"];
					Config.password = player["ply_name"];
					serverCommunication.updateInfo("SERVER READY", "[Welcome "+player["ply_name"]+"]");
					TweenMax.to(
						serverCommunication, 
						0.5, 
						{
							y:-serverCommunication.height - 50,
							delay:2, 
							ease:Cubic.easeOut,
							onComplete:menuEnter
						}
					);
				}
				else
				{
					var noSessionServer:ServerLoading = new ServerLoading(
						ServerLoading.SERVER_EXCLAMATION, 
						"RETRIEVE FAILED", 
						"[No Session Ready, Please Login First]"
					);
					noSessionServer.y = -noSessionServer.height;
					addChild(noSessionServer);
					
					TweenMax.to(
						noSessionServer, 
						1, 
						{
							y:0,
							ease:Bounce.easeOut
						}
					);
				}
			}
			
			function error(event:Object):void
			{
				var errorServer:ServerLoading = new ServerLoading(
					ServerLoading.SERVER_EXCLAMATION, 
					"COMMUNICATION DATA ERROR", 
					"[Connection Error Occurred, Try Again or Contact Our Administrator]"
				);
				errorServer.y = -errorServer.height;
				addChild(errorServer);
				trace(gameServer.error);
				TweenMax.to(
					errorServer, 
					1, 
					{
						y:0,
						ease:Bounce.easeOut
					}
				);
			}
		}
		
		public function update():void
		{
			if(gameLoading)
			{
				gameLoaded++;
				gameLoadingText.text = "Loading "+gameLoaded+" %";
				
				gamePreload.progress = gameLoaded;
				gamePreload.updateProgress();
				
				if(gameLoaded == 100)
				{
					gameLoading = false;
					removeChild(gameLoadingText);
					gameLoadingSlideDown();					
				}				
			}
			else if(assetsLoading)
			{
				assetsPreload.update();
				if(assetsPreload.closing)
				{
					assetsLoading = false;
					assetsLoadingSlideDown();
				}
			}			
		}
		
		private function menuEnter():void
		{
			game.changeState(Game.MENU_STATE);
		}
		
		public function destroy():void
		{
			gameDevLogo.removeFromParent(true);
			gameDevLogo = null;
			gamePreload.removeFromParent(true);
			gamePreload = null;
			assetsPreload.removeFromParent(true);
			assetsPreload = null;
			serverCommunication.removeFromParent(true);
			serverCommunication = null;
			
			removeFromParent(true);			
		}
	}
}