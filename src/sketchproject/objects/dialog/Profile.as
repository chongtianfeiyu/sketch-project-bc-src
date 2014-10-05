package sketchproject.objects.dialog
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	
	import sketchproject.core.Assets;
	import sketchproject.core.Game;
	import sketchproject.interfaces.IDialog;
	import sketchproject.managers.FireworkManager;
	import sketchproject.objects.Avatar;
	import sketchproject.utilities.Config;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	
	public class Profile extends Sprite implements IDialog
	{
		private var overlay:Quad;
		private var dialogBase:Image;
		private var buttonPrimary:Button;
		private var avatar:Avatar;
		
		private var buttonConfirm:Button;
		
		private var fireworkManager:FireworkManager;
		
		private var labelAvatarDesign:TextField;
		
		private var buttonRightGender:Button;
		private var buttonLeftGender:Button;
		
		private var buttonRightHair:Button;
		private var buttonLeftHair:Button;
		
		private var buttonRightSkin:Button;
		private var buttonLeftSkin:Button;
		
		private var buttonRightTop:Button;
		private var buttonLeftTop:Button;
		
		private var buttonRightBottom:Button;
		private var buttonLeftBottom:Button;
		
		private var dataCharacter:Array;
		
		private var selectGender:TextField;
		private var selectHair:TextField;
		private var selectSkin:TextField;
		private var selectTop:TextField;
		private var selectBottom:TextField;
		
		private var indexGender:uint;
		private var indexHair:uint;
		private var indexSkin:uint;
		private var indexTop:uint;
		private var indexBottom:uint;
		
		public function Profile()
		{
			super();
			
			dataCharacter = new Array();
			dataCharacter["gender"] = ["Male", "Female"];
			dataCharacter["hair"] = ["Hair 1", "Hair 2", "Hair 3", "Hair 4", "Hair 5"];
			dataCharacter["skin"] = ["Skin 1", "Skin 2", "Skin 3"];
			dataCharacter["top"] = ["Top 1", "Top 2", "Top 3", "Top 4", "Top 5"];
			dataCharacter["bottom"] = ["Bottom 1", "Bottom 2", "Bottom 3", "Bottom 4", "Bottom 5"];
			
			indexGender = 0;
			indexHair = 0;
			indexSkin = 0;
			indexTop = 0;
			indexBottom = 0;
			
			fireworkManager = new FireworkManager(Game.overlayStage);
			
			overlay = new Quad(Starling.current.nativeStage.stageWidth * 2.5,Starling.current.nativeStage.stageHeight * 2.5);
			overlay.pivotX = overlay.width * 0.5;
			overlay.pivotY = overlay.height * 0.5;
			overlay.alpha = 0.8;	
			overlay.color = 0x000000;
			addChild(overlay);
			
			dialogBase = new Image(Assets.getAtlas(Assets.TEXTURE_PANEL, Assets.TEXTURE_PANEL_XML).getTexture("panel_light"));
			dialogBase.pivotX = dialogBase.width * 0.5;
			dialogBase.pivotY = dialogBase.height * 0.5;
			addChild(dialogBase);
			
			avatar = new Avatar();
			avatar.x = -160;
			avatar.y = -200;
			addChild(avatar);
						
			buttonConfirm = new Button(Assets.getAtlas(Assets.TEXTURE_DIALOG, Assets.TEXTURE_DIALOG_XML).getTexture("button_confirm"));
			buttonConfirm.pivotX = buttonConfirm.width * 0.5;
			buttonConfirm.pivotY = buttonConfirm.height * 0.5;
			buttonConfirm.scaleX = 0.8;
			buttonConfirm.scaleY = 0.8;
			buttonConfirm.x = 115;
			buttonConfirm.y = 150;
			addChild(buttonConfirm);
			
			/** label avatar **/	
			labelAvatarDesign = new TextField(200, 50, "Avatar Design", Assets.getFont("FontCarterOne").fontName, 22, 0xc0251e);
			labelAvatarDesign.x = -200;
			labelAvatarDesign.y = 105;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, Config.name, Assets.getFont("FontCarterOne").fontName, 15, 0x333333);
			labelAvatarDesign.x = -200;
			labelAvatarDesign.y = 130;
			addChild(labelAvatarDesign);
			
			/** label control avatar **/	
			labelAvatarDesign = new TextField(200, 50, "Gender", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 110 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = -223;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Hair", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 110 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = -163;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Skin", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 110 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = -103;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Top", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 110 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = -43;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Bottom", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 110 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = 18;
			addChild(labelAvatarDesign);
			
			for(var i:uint = 0; i< 5;i++)
			{
				var backgroundSet:Quad = new Quad(100,25,0xCCCCCC);
				backgroundSet.x = 65;
				backgroundSet.y =  i * 60 + (-183);
				addChild(backgroundSet);
			}
			
			/** selected attribut character **/
			selectGender = new TextField(100, 25, dataCharacter["gender"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectGender.x = 110 - selectGender.width * 0.5;
			selectGender.y = -184;
			addChild(selectGender);
			
			selectHair = new TextField(100, 25, dataCharacter["hair"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectHair.x = 110 - selectGender.width * 0.5;
			selectHair.y = -124;
			addChild(selectHair);
			
			selectSkin = new TextField(100, 25, dataCharacter["skin"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectSkin.x = 110 - selectGender.width * 0.5;
			selectSkin.y = -64;
			addChild(selectSkin);
			
			selectTop = new TextField(100, 25, dataCharacter["top"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectTop.x = 110 - selectGender.width * 0.5;
			selectTop.y = -4;
			addChild(selectTop);
			
			selectBottom = new TextField(100, 25, dataCharacter["bottom"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectBottom.x = 110 - selectGender.width * 0.5;
			selectBottom.y = 54;
			addChild(selectBottom);
			
			/** button control character **/
			buttonRightGender = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightGender.x = 150;
			buttonRightGender.y = -185;
			addChild(buttonRightGender);
			
			buttonLeftGender = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftGender.x = 70;
			buttonLeftGender.y = -185;
			buttonLeftGender.scaleX = -1;
			addChild(buttonLeftGender);
			
			buttonRightHair = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightHair.x = 150;
			buttonRightHair.y = -125;
			addChild(buttonRightHair);
			
			buttonLeftHair = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftHair.x = 70;
			buttonLeftHair.y = -125;
			buttonLeftHair.scaleX = -1;
			addChild(buttonLeftHair);
			
			buttonRightSkin = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightSkin.x = 150;
			buttonRightSkin.y = -65;
			addChild(buttonRightSkin);
			
			buttonLeftSkin = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftSkin.x = 70;
			buttonLeftSkin.y = -65;
			buttonLeftSkin.scaleX = -1;
			addChild(buttonLeftSkin);
			
			buttonRightTop = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightTop.x = 150;
			buttonRightTop.y = -5;
			addChild(buttonRightTop);
			
			buttonLeftTop = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftTop.x = 70;
			buttonLeftTop.y = -5;
			buttonLeftTop.scaleX = -1;
			addChild(buttonLeftTop);
			
			buttonRightBottom = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightBottom.x = 150;
			buttonRightBottom.y = 55;
			addChild(buttonRightBottom);
			
			buttonLeftBottom = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftBottom.x = 70;
			buttonLeftBottom.y = 55;
			buttonLeftBottom.scaleX = -1;
			addChild(buttonLeftBottom);
			
			buttonConfirm.addEventListener(Event.TRIGGERED, onPrimaryTrigerred);
			addEventListener(TouchEvent.TOUCH, onTouch);
			
			scaleX = 0.5;
			scaleY = 0.5;
			alpha = 0;
			visible = false;
			
			setup();
		}
		
		private function onTouch(touch:TouchEvent):void
		{
			if (touch.getTouch(buttonRightGender, TouchPhase.ENDED))
			{
				if(indexGender<dataCharacter["gender"].length-1)
				{
					indexGender++;					
				}
			}
			if (touch.getTouch(buttonLeftGender, TouchPhase.ENDED))
			{
				if(indexGender>0)
				{
					indexGender--;					
				}
			}
			
			if (touch.getTouch(buttonRightHair, TouchPhase.ENDED))
			{
				if(indexHair<dataCharacter["hair"].length-1)
				{
					indexHair++;					
				}
			}
			if (touch.getTouch(buttonLeftHair, TouchPhase.ENDED))
			{
				if(indexHair>0)
				{
					indexHair--;					
				}
			}
			
			if (touch.getTouch(buttonRightSkin, TouchPhase.ENDED))
			{
				if(indexSkin<dataCharacter["skin"].length-1)
				{
					indexSkin++;					
				}
			}
			if (touch.getTouch(buttonLeftSkin, TouchPhase.ENDED))
			{
				if(indexSkin>0)
				{
					indexSkin--;					
				}
			}
			
			if (touch.getTouch(buttonRightTop, TouchPhase.ENDED))
			{
				if(indexTop<dataCharacter["top"].length-1)
				{
					indexTop++;					
				}
			}
			if (touch.getTouch(buttonLeftTop, TouchPhase.ENDED))
			{
				if(indexTop>0)
				{
					indexTop--;					
				}
			}
			
			if (touch.getTouch(buttonRightBottom, TouchPhase.ENDED))
			{
				if(indexBottom<dataCharacter["bottom"].length-1)
				{
					indexBottom++;					
				}
			}
			if (touch.getTouch(buttonLeftBottom, TouchPhase.ENDED))
			{
				if(indexBottom>0)
				{
					indexBottom--;					
				}
			}
			updateAvatar();
		}
		
		private function updateAvatar():void
		{
			selectGender.text = dataCharacter["gender"][indexGender];
			selectHair.text = dataCharacter["hair"][indexHair];
			selectSkin.text = dataCharacter["skin"][indexSkin];
			selectTop.text = dataCharacter["top"][indexTop];
			selectBottom.text = dataCharacter["bottom"][indexBottom];
			
			Config.gender = selectGender.text;
			Config.hair = selectHair.text;
			Config.skin = selectSkin.text;
			Config.top = selectTop.text;
			Config.bottom = selectBottom.text;
		}
		
		private function setup():void
		{	
			indexGender = dataCharacter["gender"].indexOf(Config.gender);
			indexHair = dataCharacter["hair"].indexOf(Config.hair);
			indexSkin = dataCharacter["skin"].indexOf(Config.skin);
			indexTop = dataCharacter["top"].indexOf(Config.top);
			indexBottom = dataCharacter["bottom"].indexOf(Config.bottom);

			updateAvatar();
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