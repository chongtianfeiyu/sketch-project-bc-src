package sketchproject.states
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.interfaces.IState;
	import sketchproject.managers.FireworkManager;
	import sketchproject.objects.parameter.StartupConfiguration;
	import sketchproject.objects.parameter.StartupFinancial;
	import sketchproject.objects.parameter.StartupParameter;
	import sketchproject.objects.parameter.StartupTarget;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Parameter extends Sprite implements IState
	{
		private var game:Game;
		private var background:Image;
		
		private var configuration:StartupConfiguration;
		private var parameter:StartupParameter;
		private var target:StartupTarget;
		private var financial:StartupFinancial;
		
		private var setConfigurationDone:Boolean;
		private var setParameterDone:Boolean;
		private var setTargetDone:Boolean;
		private var setFinancialDone:Boolean;
		
		private var startupPage:uint;
		
		private var buttonClose:Button;
		private var buttonPlay:Button;
		
		private var buttonPageActive:Image;
		
		private var buttonBusinessProfile:Button;
		private var buttonGameParameter:Button;
		private var buttonPlanObjective:Button;
		private var buttonSeedFinancial:Button;
		
		private var checkConfigurationDone:Image;
		private var checkParameterDone:Image;
		private var checkTargetDone:Image;
		private var checkFinancialDone:Image;
		
		private var labelConfiguration:Image;
		private var labelParameter:Image;
		private var labelTarget:Image;
		private var labelFinancial:Image;
		
		private var fireworkManager:FireworkManager;
		
		public function Parameter(game:Game)
		{
			super();
			fireworkManager = new FireworkManager(Game.overlayStage);
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			setConfigurationDone = true;
			setParameterDone = false;
			setTargetDone = false;
			setFinancialDone = false;
			
			startupPage = 1;
			
			initialize();	
			openTransition();			
			trace("STATE PARAMETER MENU");
		}
		
		public function initialize():void
		{
			background = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("parameter_background"));
			addChild(background);
			
			configuration= new StartupConfiguration();
			configuration.x = 50;
			configuration.y = 100;
			addChild(configuration);
			
			parameter = new StartupParameter();
			parameter.x = 50;
			parameter.y = 100;
			addChild(parameter);
						
			target = new StartupTarget();
			target.x = 50;
			target.y = 100;
			addChild(target);
			
			financial = new StartupFinancial();
			financial.x = 50;
			financial.y = 100;
			addChild(financial);
			
			
			/** label page top **/
			labelConfiguration = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_startup_configuration"));
			labelConfiguration.x = 50;
			labelConfiguration.y = 18;
			labelConfiguration.visible = false;
			addChild(labelConfiguration);
			
			labelParameter = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_startup_parameter"));
			labelParameter.x = 50;
			labelParameter.y = 18;
			labelParameter.visible = false;
			addChild(labelParameter);
			
			labelTarget = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_startup_target"));
			labelTarget.x = 50;
			labelTarget.y = 18;
			labelTarget.visible = false;
			addChild(labelTarget);
			
			labelFinancial = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_startup_financial"));
			labelFinancial.x = 50;
			labelFinancial.y = 18;
			labelFinancial.visible = false;
			addChild(labelFinancial);
			
			buttonClose = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_cross"));
			buttonClose.pivotX = buttonClose.width * 0.5;
			buttonClose.pivotY = buttonClose.height * 0.5;
			buttonClose.x = 950;
			buttonClose.y = 30;
			addChild(buttonClose);
			
			buttonPageActive = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("parameter_button"));
			buttonPageActive.x = 40;
			buttonPageActive.y = 505;
			addChild(buttonPageActive);
			
			/** button page bottom */
			buttonBusinessProfile = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_business_profile"));
			buttonBusinessProfile.x = 60;
			buttonBusinessProfile.y = 515;
			addChild(buttonBusinessProfile);			
			
			buttonGameParameter = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_game_parameter"));
			buttonGameParameter.x = 260;
			buttonGameParameter.y = 515;
			addChild(buttonGameParameter);
			
			buttonPlanObjective= new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_plan_objective"));
			buttonPlanObjective.x = 500;
			buttonPlanObjective.y = 515;
			addChild(buttonPlanObjective);
			
			buttonSeedFinancial = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_seed_financing"));
			buttonSeedFinancial.x = 720;
			buttonSeedFinancial.y = 515;
			addChild(buttonSeedFinancial);
			
			/** label check **/
			checkConfigurationDone = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_check"));
			checkConfigurationDone.x = 55;
			checkConfigurationDone.y = 505;
			checkConfigurationDone.visible = false;
			addChild(checkConfigurationDone);
			
			checkParameterDone = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_check"));
			checkParameterDone.x = 275;
			checkParameterDone.y = 505;
			checkParameterDone.visible = false;
			addChild(checkParameterDone);
			
			checkTargetDone = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_check"));
			checkTargetDone.x = 495;
			checkTargetDone.y = 505;
			checkTargetDone.visible = false;
			addChild(checkTargetDone);
			
			checkFinancialDone = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_check"));
			checkFinancialDone.x = 715;
			checkFinancialDone.y = 505;
			checkFinancialDone.visible = false;
			addChild(checkFinancialDone);
			
			/** button play **/
			buttonPlay = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_play_unactive"));
			buttonPlay.pivotX = buttonPlay.width * 0.5;
			buttonPlay.pivotY = buttonPlay.height * 0.5;
			buttonPlay.x = 950;
			buttonPlay.y = 522;
			buttonPlay.enabled = false;
			addChild(buttonPlay);			
			
			y = -height;
			
			buttonClose.addEventListener(Event.TRIGGERED, disposeWindow);
			addEventListener(TouchEvent.TOUCH, onTouch);
			
			Assets.playBgm(Assets.BGM_FALL);
		}
		
		private function disposeWindow(event:Event):void
		{
			TweenMax.to(
				this,
				0.5,
				{
					y:-height,
					ease:Back.easeIn,
					delay:0.2,
					onComplete:changeState,
					onCompleteParams:[Game.MENU_STATE]
				}
			);			
		}
		
		private function onTouch(touch:TouchEvent):void
		{				
			if (touch.getTouch(buttonBusinessProfile, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				setConfigurationDone = true;
				startupPage = 1;
				TweenMax.to(
					buttonPageActive,
					0.5,
					{
						x:buttonBusinessProfile.x - 20,
						ease:Bounce.easeOut
					}
				);
			}
			if (touch.getTouch(buttonGameParameter, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				setParameterDone = true;
				startupPage = 2;
				TweenMax.to(
					buttonPageActive,
					0.5,
					{
						x:buttonGameParameter.x - 20,
						ease:Bounce.easeOut
					}
				);
			}
			if (touch.getTouch(buttonPlanObjective, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				setTargetDone = true;
				startupPage = 3;
				TweenMax.to(
					buttonPageActive,
					0.5,
					{
						x:buttonPlanObjective.x - 20,
						ease:Bounce.easeOut
					}
				);
			}
			if (touch.getTouch(buttonSeedFinancial, TouchPhase.ENDED))
			{
				fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
				setFinancialDone = true;
				startupPage = 4;
				TweenMax.to(
					buttonPageActive,
					0.5,
					{
						x:buttonSeedFinancial.x - 20,
						ease:Bounce.easeOut
					}
				);
			}
		}
		
		private function openTransition():void
		{
			TweenMax.to(
				this,
				1.2,
				{
					y:0,
					ease:Bounce.easeOut,
					delay:1
				}
			);
		}
		
		private function closeTransition():void
		{
			TweenMax.to(
				this,
				0.5,
				{
					y:-height,
					ease:Back.easeIn,
					delay:0.2,
					onComplete:changeState,
					onCompleteParams:[Game.PLAY_STATE]
				}
			);
		}
		
		private function changeState(dest:int):void
		{
			if(dest == Game.PLAY_STATE)
			{
				game.changeState(Game.PLAY_STATE);
			}
			else if(dest == Game.MENU_STATE)
			{
				game.changeState(Game.MENU_STATE);	
			}			
		}
		
		public function update():void
		{
			if(setConfigurationDone && setParameterDone && setTargetDone && setFinancialDone)
			{
				removeChild(buttonPlay);
				buttonPlay = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_play_active"));
				buttonPlay.pivotX = buttonPlay.width * 0.5;
				buttonPlay.pivotY = buttonPlay.height * 0.5;
				buttonPlay.x = 950;
				buttonPlay.y = 522;
				buttonPlay.enabled = true;
				addChild(buttonPlay);
				buttonPlay.addEventListener(Event.TRIGGERED, onPlayTriggered);
			}
			
			if(setConfigurationDone){
				checkConfigurationDone.visible = true;
			}
			if(setParameterDone){
				checkParameterDone.visible = true;
			}
			if(setTargetDone){
				checkTargetDone.visible = true;
			}
			if(setFinancialDone){
				checkFinancialDone.visible = true;
			}
			
			labelConfiguration.visible = false;
			labelParameter.visible = false;
			labelTarget.visible = false;
			labelFinancial.visible = false;
			
			configuration.visible = false;
			parameter.visible = false;
			target.visible = false;
			financial.visible = false;
			
			if(startupPage == 1)
			{
				checkConfigurationDone.visible = false;
				labelConfiguration.visible = true;
				configuration.visible = true;
			}
			else if(startupPage == 2)
			{
				checkParameterDone.visible = false;
				labelParameter.visible = true;
				parameter.visible = true;
			}
			else if(startupPage == 3)
			{
				checkTargetDone.visible = false;
				labelTarget.visible = true;
				target.visible = true;
			}
			else if(startupPage == 4)
			{
				checkFinancialDone.visible = false;
				labelFinancial.visible = true;
				financial.visible = true;
			}
		}
		
		private function onPlayTriggered(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			closeTransition();
		}
		
		public function destroy():void
		{
			buttonClose.removeEventListener(Event.TRIGGERED, disposeWindow);
			removeEventListener(TouchEvent.TOUCH, onTouch);
			fireworkManager.destroy();
			removeFromParent(true);
		}
	}
}