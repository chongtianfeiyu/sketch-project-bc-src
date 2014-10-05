package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.events.DialogBoxEvent;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	import sketchproject.utilities.Config;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class Booster extends Sprite implements IDialog
	{
		private var overlay:Quad;
		private var dialogBase:Image;
		private var labelImage:Image;
		private var dialogTitle:TextField;
		private var buttonPrimary:Button;
		private var fireworkManager:FireworkManager;
				
		private var dialogTraining:NativeDialog;
		private var dialogShop:NativeDialog;
		private var dialogProduct:NativeDialog;
		private var dialogLucky:NativeDialog;
		
		private var containerTraining:Sprite;
		private var containerProduct:Sprite;
		private var containerShop:Sprite;
		private var containerLucky:Sprite;
		
		private var buttonIncreaseTraining:Button;
		private var buttonIncreaseProduct:Button;
		private var buttonIncreaseShop:Button;
		private var buttonIncreaseLucky:Button;
		
		public function Booster()
		{
			super();
			initObjectProperty();
		}
		
		public function initObjectProperty():void
		{
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			dialogBase = new Image(Assets.getAtlas(Assets.TEXTURE_PANEL, Assets.TEXTURE_PANEL_XML).getTexture("snakeholder"));
			dialogBase.pivotX = dialogBase.width * 0.5;
			dialogBase.pivotY = dialogBase.height * 0.5;
			addChild(dialogBase);
			
			dialogTitle = new TextField(350, 50, "Performance Booster", Assets.getFont("FontCarterOne").fontName, 24, 0xc0251e);
			dialogTitle.pivotX = dialogTitle.width * 0.5;
			dialogTitle.pivotY = dialogTitle.height * 0.5;
			dialogTitle.y = -200;
			addChild(dialogTitle);
			
			labelImage = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_menu"));
			labelImage.pivotX = labelImage.width * 0.5;
			labelImage.pivotY = labelImage.height * 0.5;
			addChild(labelImage);
			
			containerTraining = new Sprite();
			containerTraining.x = -20;
			containerTraining.y = -117;
			addChild(containerTraining);
			
			containerShop = new Sprite();
			containerShop.x = -20;
			containerShop.y = -30;
			addChild(containerShop);
			
			containerProduct = new Sprite();
			containerProduct.x = -20;
			containerProduct.y = 59;
			addChild(containerProduct);
			
			containerLucky = new Sprite();
			containerLucky.x = -20;
			containerLucky.y = 148;
			addChild(containerLucky);
			

			buttonIncreaseTraining = new Button(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("button_confirm"));
			buttonIncreaseTraining.pivotX = buttonIncreaseTraining.width * 0.5;
			buttonIncreaseTraining.pivotY = buttonIncreaseTraining.height * 0.5;
			buttonIncreaseTraining.scaleX = 0.5;
			buttonIncreaseTraining.scaleY = 0.5;
			buttonIncreaseTraining.x = 125;
			buttonIncreaseTraining.y = -150;
			addChild(buttonIncreaseTraining);
			
			buttonIncreaseShop = new Button(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("button_confirm"));
			buttonIncreaseShop.pivotX = buttonIncreaseShop.width * 0.5;
			buttonIncreaseShop.pivotY = buttonIncreaseShop.height * 0.5;
			buttonIncreaseShop.scaleX = 0.5;
			buttonIncreaseShop.scaleY = 0.5;
			buttonIncreaseShop.x = 125;
			buttonIncreaseShop.y = -60;
			addChild(buttonIncreaseShop);
			
			buttonIncreaseProduct = new Button(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("button_confirm"));
			buttonIncreaseProduct.pivotX = buttonIncreaseProduct.width * 0.5;
			buttonIncreaseProduct.pivotY = buttonIncreaseProduct.height * 0.5;
			buttonIncreaseProduct.scaleX = 0.5;
			buttonIncreaseProduct.scaleY = 0.5;
			buttonIncreaseProduct.x = 130;
			buttonIncreaseProduct.y = 30;
			addChild(buttonIncreaseProduct);
			
			buttonIncreaseLucky = new Button(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("button_confirm"));
			buttonIncreaseLucky.pivotX = buttonIncreaseLucky.width * 0.5;
			buttonIncreaseLucky.pivotY = buttonIncreaseLucky.height * 0.5;
			buttonIncreaseLucky.scaleX = 0.5;
			buttonIncreaseLucky.scaleY = 0.5;
			buttonIncreaseLucky.x = 130;
			buttonIncreaseLucky.y = 120;
			addChild(buttonIncreaseLucky);
			
			buttonPrimary = new Button(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("button_confirm"));
			buttonPrimary.pivotX = buttonPrimary.width * 0.5;
			buttonPrimary.pivotY = buttonPrimary.height * 0.5;
			buttonPrimary.scaleX = 0.8;
			buttonPrimary.scaleY = 0.8;
			buttonPrimary.x = 0;
			buttonPrimary.y = 215;
			addChild(buttonPrimary);
			
			buttonPrimary.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			buttonIncreaseTraining.addEventListener(Event.TRIGGERED, onIncreaseTraining);
			buttonIncreaseShop.addEventListener(Event.TRIGGERED, onIncreaseShop);
			buttonIncreaseProduct.addEventListener(Event.TRIGGERED, onIncreaseProduct);
			buttonIncreaseLucky.addEventListener(Event.TRIGGERED, onIncreaseLucky);
			
			dialogLucky = new NativeDialog(NativeDialog.DIALOG_QUESTION, "Booster", "Are you sure Boost Your Lucky by IDR 5000 K?");
			addChild(dialogLucky);
			dialogLucky.addEventListener(DialogBoxEvent.CLOSED, onLuckyDialogClosed);
			
			dialogProduct = new NativeDialog(NativeDialog.DIALOG_QUESTION, "Booster", "Are you sure Boost Your Product by IDR 5000 K?");
			addChild(dialogProduct);
			dialogProduct.addEventListener(DialogBoxEvent.CLOSED, onProductDialogClosed);
			
			dialogShop = new NativeDialog(NativeDialog.DIALOG_QUESTION, "Booster", "Are you sure Boost Your Shop by IDR 5000 K?");
			addChild(dialogShop);
			dialogShop.addEventListener(DialogBoxEvent.CLOSED, onShopDialogClosed);	
			
			dialogTraining = new NativeDialog(NativeDialog.DIALOG_QUESTION, "Booster", "Are you sure Boost Your Training by IDR 5000 K?");
			addChild(dialogTraining);
			dialogTraining.addEventListener(DialogBoxEvent.CLOSED, onTrainingDialogClosed);
			
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
			
			setup();
		}
		
		private function onIncreaseLucky(event:Event):void
		{			
			dialogLucky.openDialog();
		}
		
		private function onLuckyDialogClosed(event:DialogBoxEvent):void
		{
			if(event.result)
			{
				// primary action	
				Config.boosterLucky++;
				setup();
				dialogLucky.closeDialog();
			}
			else
			{
				// secondary action	
				dialogLucky.closeDialog();
			}
		}
		
		private function onIncreaseProduct(event:Event):void
		{			
			dialogProduct.openDialog();
		}
		
		private function onProductDialogClosed(event:DialogBoxEvent):void
		{
			if(event.result)
			{
				// primary action	
				Config.boosterProduct++;
				setup();
				dialogProduct.closeDialog();
			}
			else
			{
				// secondary action	
				dialogProduct.closeDialog();
			}
		}
		
		private function onIncreaseShop(event:Event):void
		{			
			dialogShop.openDialog();					
		}
		
		private function onShopDialogClosed(event:DialogBoxEvent):void
		{
			if(event.result)
			{
				// primary action	
				Config.boosterShop++;
				setup();
				dialogShop.closeDialog();
			}
			else
			{
				// secondary action	
				dialogShop.closeDialog();
			}
		}
		
		private function onIncreaseTraining(event:Event):void
		{			
			dialogTraining.openDialog();			
		}
		
		private function onTrainingDialogClosed(event:DialogBoxEvent):void
		{
			if(event.result)
			{
				// primary action
				Config.boosterTraining++;
				setup();
				dialogTraining.closeDialog();
			}
			else
			{
				// secondary action	
				dialogTraining.closeDialog();
			}
		}
		
		public function setup():void
		{
			var bar:Image;
			
			containerTraining.removeChildren();
			for(var i:uint = 0; i< Config.boosterTraining;i++)
			{
				if(i == 0)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_blue_side"));
				}
				else if(i == 4)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_blue_side"));
					bar.scaleX = -1;
				}
				else
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_blue_middle"));
				}
				bar.pivotX = bar.width * 0.5;
				bar.pivotY = bar.height * 0.5;
				bar.x = i * (bar.width + 3);
				containerTraining.addChild(bar);
			}
			
			containerShop.removeChildren();
			for(var j:uint = 0; j< Config.boosterShop;j++)
			{
				if(j == 0)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_orange_side"));
				}
				else if(j == 4)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_orange_side"));
					bar.scaleX = -1;
				}
				else
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_orange_middle"));
				}
				bar.pivotX = bar.width * 0.5;
				bar.pivotY = bar.height * 0.5;
				bar.x = j * (bar.width + 3);
				containerShop.addChild(bar);
			}
			
			containerProduct.removeChildren();
			for(var k:uint = 0; k< Config.boosterProduct;k++)
			{
				if(k == 0)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_red_side"));
				}
				else if(k == 4)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_red_side"));
					bar.scaleX = -1;
				}
				else
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_red_middle"));
				}
				bar.pivotX = bar.width * 0.5;
				bar.pivotY = bar.height * 0.5;
				bar.x = k * (bar.width + 3);
				containerProduct.addChild(bar);
			}
			
			containerLucky.removeChildren();
			for(var l:uint = 0; l< Config.boosterLucky;l++)
			{
				if(l == 0)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_green_side"));
				}
				else if(l == 4)
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_green_side"));
					bar.scaleX = -1;
				}
				else
				{
					bar = new Image(Assets.getAtlas(Assets.TEXTURE_ACHIEVEMENT, Assets.TEXTURE_ACHIEVEMENT_XML).getTexture("booster_green_middle"));
				}
				bar.pivotX = bar.width * 0.5;
				bar.pivotY = bar.height * 0.5;
				bar.x = l * (bar.width + 3);
				containerLucky.addChild(bar);
			}
			
			
			if(Config.boosterTraining == 5)
			{
				buttonIncreaseTraining.visible = false;
			}
			if(Config.boosterShop == 5)
			{
				buttonIncreaseShop.visible = false;
			}
			if(Config.boosterProduct == 5)
			{
				buttonIncreaseProduct.visible = false;
			}
			if(Config.boosterLucky == 5)
			{
				buttonIncreaseLucky.visible = false;
			}
		}
		
		public function openDialog():void
		{
			visible = true;
			TweenMax.to(
				this,
				0.7,
				{
					ease:Back.easeOut,
					scaleX:0.9,
					scaleY:0.9,
					alpha:1,
					delay:0.2
				}
			);	
		}
		
		public function closeDialog():void
		{
			TweenMax.to(
				this,
				0.5,
				{
					ease:Back.easeIn,
					scaleX:0.5,
					scaleY:0.5,
					alpha:0,
					delay:0.2,
					onComplete:function():void{
						visible = false;
					}
				}
			);
		}
		
		public function onPrimaryTrigerred(event:Event):void
		{
			fireworkManager.spawn(Game.cursor.x, Game.cursor.y);
			closeDialog();
		}
		
		public function onSecondaryTrigerred(event:Event):void
		{
			// nothing
		}
	}
}