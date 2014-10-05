package sketchproject.objects.parameter
{
	import sketchproject.core.Assets;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	import sketchproject.utilities.Config;
	
	public class StartupConfiguration extends Sprite
	{
		private var labelName:TextField;
		private var labelAge:TextField;
		private var labelMotivation:TextField;
		private var labelSelfAchievement:TextField;
		private var labelRestaurantName:TextField;
		private var labelBusinessLogo:TextField;
		private var labelBusinessAdvisor:TextField;
		private var labelAvatarDesign:TextField;
		
		private var inputName:TextField;
		private var inputAge:TextField;
		private var inputMotivation:TextField;
		private var inputSelfAchievement:TextField;
		private var inputRestaurantName:TextField;
		private var businessLogo:uint;
		private var businessAdvisor:uint;
		
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
		
		private var character:Image;
		private var logo:Image;
		private var advisor:Image;
		
		private var selectedLogo:Quad;
		private var selectedAdvisor:Quad;
		
		public function StartupConfiguration()
		{
			super();
			businessLogo = 1;
			businessAdvisor = 1;
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
			
			//new MetalWorksMobileTheme();
			initObjectProperty();
			
			setup();
		}
		
		public function initObjectProperty():void
		{
			/** label and input **/
			labelName = new TextField(200, 50, "C.E.O Name", Assets.getFont("FontErasITC").fontName, 18, 0x333333);
			labelName.hAlign = HAlign.LEFT;
			addChild(labelName);
			
			inputName = new TextField(200, 50, "input your name", Assets.getFont("FontSSPRegular").fontName, 16, 0x333333);
			inputName.x = 0;
			inputName.y = 30;
			inputName.hAlign = HAlign.LEFT;
			addChild(inputName);			
			
			labelAge = new TextField(200, 50, "Your Age", Assets.getFont("FontErasITC").fontName, 18, 0x333333);
			labelAge.y = 75;
			labelAge.hAlign = HAlign.LEFT;
			addChild(labelAge);
			
			inputAge = new TextField(200, 50, "input your age", Assets.getFont("FontSSPRegular").fontName, 16, 0x333333);
			inputAge.x = 0;
			inputAge.y = 105;
			inputAge.hAlign = HAlign.LEFT;
			addChild(inputAge);
			
			labelMotivation = new TextField(200, 50, "Your Motivation", Assets.getFont("FontErasITC").fontName, 18, 0x333333);
			labelMotivation.y = 150;
			labelMotivation.hAlign = HAlign.LEFT;
			addChild(labelMotivation);
			
			inputMotivation = new TextField(200, 50, "input your motivation", Assets.getFont("FontSSPRegular").fontName, 16, 0x333333);
			inputMotivation.x = 0;
			inputMotivation.y = 180;
			inputMotivation.hAlign = HAlign.LEFT;
			addChild(inputMotivation);
			
			labelSelfAchievement = new TextField(250, 50, "Self Achievement", Assets.getFont("FontErasITC").fontName, 18, 0x333333);
			labelSelfAchievement.y = 250;
			labelSelfAchievement.hAlign = HAlign.LEFT;
			addChild(labelSelfAchievement);
			
			inputSelfAchievement = new TextField(200, 50, "input your motivation", Assets.getFont("FontSSPRegular").fontName, 16, 0x333333);
			inputSelfAchievement.x = 0;
			inputSelfAchievement.y = 280;
			inputSelfAchievement.hAlign = HAlign.LEFT;
			addChild(inputSelfAchievement);
						
			labelRestaurantName = new TextField(200, 50, "Restaurant Name", Assets.getFont("FontErasITC").fontName, 18, 0x333333);
			labelRestaurantName.x = 270;
			labelRestaurantName.y = 0;
			labelRestaurantName.hAlign = HAlign.LEFT;
			addChild(labelRestaurantName);
			
			inputSelfAchievement = new TextField(200, 50, "input restaurant name", Assets.getFont("FontSSPRegular").fontName, 16, 0x333333);
			inputSelfAchievement.x = 270;
			inputSelfAchievement.y = 30;
			inputSelfAchievement.hAlign = HAlign.LEFT;
			addChild(inputSelfAchievement);
			
			labelBusinessLogo = new TextField(200, 50, "Business Logo", Assets.getFont("FontErasITC").fontName, 18, 0x333333);
			labelBusinessLogo.x = 270;
			labelBusinessLogo.y = 75;
			labelBusinessLogo.hAlign = HAlign.LEFT;
			addChild(labelBusinessLogo);
			
			labelBusinessAdvisor = new TextField(200, 50, "Business Advisor", Assets.getFont("FontErasITC").fontName, 18, 0x333333);
			labelBusinessAdvisor.x = 270;
			labelBusinessAdvisor.y = 190;
			labelBusinessAdvisor.hAlign = HAlign.LEFT;
			addChild(labelBusinessAdvisor);
			
			labelAvatarDesign = new TextField(200, 50, "Avatar Design", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 570;
			labelAvatarDesign.y = 0;
			labelAvatarDesign.hAlign = HAlign.LEFT;
			addChild(labelAvatarDesign);
			
			/** label control avatar **/	
			labelAvatarDesign = new TextField(200, 50, "Gender", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 830 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = 27;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Hair", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 830 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = 87;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Skin", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 830 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = 147;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Top", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 830 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = 207;
			addChild(labelAvatarDesign);
			
			labelAvatarDesign = new TextField(200, 50, "Bottom", Assets.getFont("FontErasITC").fontName, 18, 0xc0251e);
			labelAvatarDesign.x = 830 - labelAvatarDesign.width * 0.5;
			labelAvatarDesign.y = 267;
			addChild(labelAvatarDesign);
			
			for(var i:uint = 0; i< 5;i++)
			{
				var backgroundSet:Quad = new Quad(100,25,0xCCCCCC);
				backgroundSet.x = 785;
				backgroundSet.y =  i * 60 + 66;
				addChild(backgroundSet);
			}
			
			/** selected attribut character **/
			selectGender = new TextField(100, 25, dataCharacter["gender"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectGender.x = 830 - selectGender.width * 0.5;
			selectGender.y = 65;
			addChild(selectGender);
			
			selectHair = new TextField(100, 25, dataCharacter["hair"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectHair.x = 830 - selectGender.width * 0.5;
			selectHair.y = 125;
			addChild(selectHair);
			
			selectSkin = new TextField(100, 25, dataCharacter["skin"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectSkin.x = 830 - selectGender.width * 0.5;
			selectSkin.y = 185;
			addChild(selectSkin);
			
			selectTop = new TextField(100, 25, dataCharacter["top"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectTop.x = 830 - selectGender.width * 0.5;
			selectTop.y = 245;
			addChild(selectTop);
			
			selectBottom = new TextField(100, 25, dataCharacter["bottom"][0].toString(), Assets.getFont("FontErasITC").fontName, 16, 0x333333);
			selectBottom.x = 830 - selectGender.width * 0.5;
			selectBottom.y = 305;
			addChild(selectBottom);
			
			/** button control character **/
			buttonRightGender = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightGender.x = 870;
			buttonRightGender.y = 65;
			addChild(buttonRightGender);
			
			buttonLeftGender = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftGender.x = 790;
			buttonLeftGender.y = 65;
			buttonLeftGender.scaleX = -1;
			addChild(buttonLeftGender);
			
			buttonRightHair = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightHair.x = 870;
			buttonRightHair.y = 125;
			addChild(buttonRightHair);
			
			buttonLeftHair = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftHair.x = 790;
			buttonLeftHair.y = 125;
			buttonLeftHair.scaleX = -1;
			addChild(buttonLeftHair);
						
			buttonRightSkin = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightSkin.x = 870;
			buttonRightSkin.y = 185;
			addChild(buttonRightSkin);
			
			buttonLeftSkin = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftSkin.x = 790;
			buttonLeftSkin.y = 185;
			buttonLeftSkin.scaleX = -1;
			addChild(buttonLeftSkin);
			
			buttonRightTop = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightTop.x = 870;
			buttonRightTop.y = 245;
			addChild(buttonRightTop);
			
			buttonLeftTop = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftTop.x = 790;
			buttonLeftTop.y = 245;
			buttonLeftTop.scaleX = -1;
			addChild(buttonLeftTop);
			
			buttonRightBottom = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightBottom.x = 870;
			buttonRightBottom.y = 305;
			addChild(buttonRightBottom);
			
			buttonLeftBottom = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftBottom.x = 790;
			buttonLeftBottom.y = 305;
			buttonLeftBottom.scaleX = -1;
			addChild(buttonLeftBottom);
			
			/** character **/
			character = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("character"));
			character.x = 585;
			character.y = 60;
			addChild(character);
			
			selectedLogo = new Quad(67,67,0xc0251e);
			selectedLogo.x = 277;
			selectedLogo.y = 113;
			addChild(selectedLogo);
			
			selectedAdvisor = new Quad(84,84,0xc0251e);
			selectedAdvisor.x = 274;
			selectedAdvisor.y = 231;
			addChild(selectedAdvisor);
			
			for(var j:uint = 0; j< 4; j++)
			{
				logo = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("logo"+(j+1)));
				logo.x = ((j* (logo.width)) + 270) + 10;
				logo.y =  120;
				logo.scaleX = 0.8;
				logo.scaleY = 0.8;
				logo.name = "logo"+(j+1);
				addChild(logo);
				logo.addEventListener(TouchEvent.TOUCH, logoOnTouch);
			}
			
			for(var k:uint = 0; k < 3; k++)
			{
				advisor = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("advisor"+(k+1)));
				advisor.x = ((k * (advisor.width + 20)) + 270) + 10;
				advisor.y =  240;
				advisor.name = "advisor"+(k+1);
				addChild(advisor);
				advisor.addEventListener(TouchEvent.TOUCH, advisorOnTouch);
			}
			
			addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function logoOnTouch(touch:TouchEvent):void
		{
			if (touch.getTouch(Image(touch.target), TouchPhase.ENDED))
			{
				Config.logo = Image(touch.target).name;
				selectedLogo.x = Image(touch.target).x - 7;
			}			
		}
		
		private function advisorOnTouch(touch:TouchEvent):void
		{
			if (touch.getTouch(Image(touch.target), TouchPhase.ENDED))
			{
				Config.advisor = Image(touch.target).name;
				selectedAdvisor.x = Image(touch.target).x - 9;
			}			
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
			selectedLogo.x = getChildByName(Config.logo).x - 7;
			selectedAdvisor.x = getChildByName(Config.advisor).x - 9;
			
			indexGender = dataCharacter["gender"].indexOf(Config.gender);
			indexHair = dataCharacter["hair"].indexOf(Config.hair);
			indexSkin = dataCharacter["skin"].indexOf(Config.skin);
			indexTop = dataCharacter["top"].indexOf(Config.top);
			indexBottom = dataCharacter["bottom"].indexOf(Config.bottom);
			trace(indexGender);
			updateAvatar();
		}
	}
}