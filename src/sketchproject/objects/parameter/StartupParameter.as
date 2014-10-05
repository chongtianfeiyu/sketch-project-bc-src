package sketchproject.objects.parameter
{
	import sketchproject.core.Assets;
		
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.HAlign;
	
	import sketchproject.utilities.Config;
	
	public class StartupParameter extends Sprite
	{
		private var labelGameWorld:Image;
		private var labelCustomer:Image;
		
		private var buttonRightPopulation:Button;
		private var buttonLeftPopulation:Button;
		private var buttonRightWheater:Button;
		private var buttonLeftWheater:Button;
		private var buttonRightEvent:Button;
		private var buttonLeftEvent:Button;
		private var buttonRightCompetitor:Button;
		private var buttonLeftCompetitor:Button;
		
		private var buttonRightVariant:Button;
		private var buttonLeftVariant:Button;
		private var buttonRightAddicted:Button;
		private var buttonLeftAddicted:Button;
		private var buttonRightBuying:Button;
		private var buttonLeftBuying:Button;
		private var buttonRightEmotion:Button;
		private var buttonLeftEmotion:Button;
				
		private var sliderPopulation:Image;
		private var sliderWheater:Image;
		private var sliderEvent:Image;
		private var sliderCompetitor:Image;
		
		private var sliderVariant:Image;
		private var sliderAddicted:Image;
		private var sliderBuying:Image;
		private var sliderEmotion:Image;
		
		private var textLabelParameter:Array;
		
		private var worldLeft:uint;
		private var worldRight:uint;
		
		private var customerLeft:uint;
		private var customerRight:uint;
		
		private var distance:uint;
		
		public function StartupParameter()
		{
			super();
						
			textLabelParameter = ["Population", "Social Variant", "Wheater Chaos", "Addicted Level", "Event Traffict", "Buying Power", "Competitor", "Emotion Chaos"];
			
			initObjectProperty();
						
			worldLeft = 230;
			worldRight = 230 + 170 - sliderPopulation.width;
			customerLeft = 690;
			customerRight = 690 + 170 - sliderPopulation.width;
			distance = worldRight - worldLeft;
			
			updateSlider();
		}
		
		public function initObjectProperty():void
		{
			labelGameWorld = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_gameworld_parameter"));
			labelGameWorld.x = 20;
			labelGameWorld.scaleX = 0.9;
			labelGameWorld.scaleY = 0.9;
			addChild(labelGameWorld);
			
			labelCustomer = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("label_customer_parameter"));
			labelCustomer.x = 500;
			labelCustomer.scaleX = 0.9;
			labelCustomer.scaleY = 0.9;
			addChild(labelCustomer);
			
			for(var i:uint = 0; i< 8; i++)
			{
				var gearLabel:Image = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("dark_gear"));
				gearLabel.x = 460 * (i % 2) + 20; 
				gearLabel.y =  70 * int(i/2) + 100;
				addChild(gearLabel);
				
				var labelParameter:TextField = new TextField(150, 20, textLabelParameter[i], Assets.getFont("FontErasITC").fontName, 18, 0x333333);
				labelParameter.x = 460 * (i % 2) + 45;
				labelParameter.y = 70 * int(i/2) + 100;
				labelParameter.hAlign = HAlign.LEFT;
				addChild(labelParameter);
				
				var backgroundSet:Quad = new Quad(170,25,0xDDDDDD);
				backgroundSet.x = 460 * (i % 2) + 230;
				backgroundSet.y =  70 * int(i/2) + 100;
				addChild(backgroundSet);
				
				trace(backgroundSet.x+"    "+backgroundSet.y);
			}
			
			/** world **/
			buttonRightPopulation = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightPopulation.x = 400;
			buttonRightPopulation.y = 100 - 3;
			addChild(buttonRightPopulation);
			
			buttonLeftPopulation = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftPopulation.x = 230;
			buttonLeftPopulation.y = 100 - 3;
			buttonLeftPopulation.scaleX = -1;
			addChild(buttonLeftPopulation);
						
			sliderPopulation = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderPopulation.x = 300;
			sliderPopulation.y = 100;
			addChild(sliderPopulation);
			
			
			buttonRightWheater = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightWheater.x = 400;
			buttonRightWheater.y = 170 - 3;
			addChild(buttonRightWheater);
			
			buttonLeftWheater = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftWheater.x = 230;
			buttonLeftWheater.y = 170 - 3;
			buttonLeftWheater.scaleX = -1;
			addChild(buttonLeftWheater);
			
			sliderWheater = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderWheater.x = 300;
			sliderWheater.y = 170;
			addChild(sliderWheater);
						
			
			buttonRightEvent = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightEvent.x = 400;
			buttonRightEvent.y = 240 - 3;
			addChild(buttonRightEvent);
			
			buttonLeftEvent = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftEvent.x = 230;
			buttonLeftEvent.y = 240 - 3;
			buttonLeftEvent.scaleX = -1;
			addChild(buttonLeftEvent);
			
			sliderEvent = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderEvent.x = 300;
			sliderEvent.y = 240;
			addChild(sliderEvent);
			
			
			buttonRightCompetitor = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightCompetitor.x = 400;
			buttonRightCompetitor.y = 310 - 3;
			addChild(buttonRightCompetitor);
			
			buttonLeftCompetitor = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftCompetitor.x = 230;
			buttonLeftCompetitor.y = 310 - 3;
			buttonLeftCompetitor.scaleX = -1;
			addChild(buttonLeftCompetitor);
			
			sliderCompetitor = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderCompetitor.x = 300;
			sliderCompetitor.y = 310;
			addChild(sliderCompetitor);
			
			/** customer **/
			buttonRightVariant = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightVariant.x = 860;
			buttonRightVariant.y = 100 - 3;
			addChild(buttonRightVariant);
			
			buttonLeftVariant = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftVariant.x = 690;
			buttonLeftVariant.y = 100 - 3;
			buttonLeftVariant.scaleX = -1;
			addChild(buttonLeftVariant);
			
			sliderVariant = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderVariant.x = 700;
			sliderVariant.y = 100;
			addChild(sliderVariant);
			
			
			buttonRightAddicted = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightAddicted.x = 860;
			buttonRightAddicted.y = 170 - 3;
			addChild(buttonRightAddicted);
			
			buttonLeftAddicted = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftAddicted.x = 690;
			buttonLeftAddicted.y = 170 - 3;
			buttonLeftAddicted.scaleX = -1;
			addChild(buttonLeftAddicted);
			
			sliderAddicted = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderAddicted.x = 700;
			sliderAddicted.y = 170;
			addChild(sliderAddicted);
			
			
			buttonRightBuying = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightBuying.x = 860;
			buttonRightBuying.y = 240 - 3;
			addChild(buttonRightBuying);
			
			buttonLeftBuying = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftBuying.x = 690;
			buttonLeftBuying.y = 240 - 3;
			buttonLeftBuying.scaleX = -1;
			addChild(buttonLeftBuying);
			
			sliderBuying = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderBuying.x = 700;
			sliderBuying.y = 240;
			addChild(sliderBuying);
			
						
			buttonRightEmotion = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonRightEmotion.x = 860;
			buttonRightEmotion.y = 310 - 3;
			addChild(buttonRightEmotion);
			
			buttonLeftEmotion = new Button(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("button_arrow"));
			buttonLeftEmotion.x = 690;
			buttonLeftEmotion.y = 310 - 3;
			buttonLeftEmotion.scaleX = -1;
			addChild(buttonLeftEmotion);
			
			sliderEmotion = new Image(Assets.getAtlas(Assets.TEXTURE_PARAMETER, Assets.TEXTURE_PARAMETER_XML).getTexture("slider_bar"));
			sliderEmotion.x = 700;
			sliderEmotion.y = 310;
			addChild(sliderEmotion);
			
			addEventListener(TouchEvent.TOUCH, onTouch);
			
		}
		
		
		
		private function onTouch(touch:TouchEvent):void
		{	
			if (touch.getTouch(sliderPopulation, TouchPhase.MOVED))
			{
				if(sliderPopulation.x >= worldLeft && sliderPopulation.x <= worldRight){
					sliderPopulation.x = touch.getTouch(this).getLocation(this).x - sliderPopulation.width * 0.5;
				}
				if(sliderPopulation.x < worldLeft)
				{
					sliderPopulation.x = worldLeft;
				}
				if(sliderPopulation.x > worldRight)
				{
					sliderPopulation.x = worldRight;
				}
				Config.valuePopulation = 1000  * (sliderPopulation.x - worldLeft) / (170 - sliderPopulation.width);
				Config.valuePopulation-=int(Config.valuePopulation % 20);
			}
			
			if (touch.getTouch(sliderWheater, TouchPhase.MOVED))
			{
				if(sliderWheater.x >= worldLeft && sliderWheater.x <= worldRight){
					sliderWheater.x = touch.getTouch(this).getLocation(this).x - sliderWheater.width * 0.5;
				}
				if(sliderWheater.x < worldLeft)
				{
					sliderWheater.x = worldLeft;
				}
				if(sliderWheater.x > worldRight)
				{
					sliderWheater.x = worldRight;
				}
				Config.valueWheater = 10  * (sliderWheater.x - worldLeft) / (170 - sliderWheater.width);
			}
						
			if (touch.getTouch(sliderEvent, TouchPhase.MOVED))
			{
				if(sliderEvent.x >= worldLeft && sliderEvent.x <= worldRight){
					sliderEvent.x = touch.getTouch(this).getLocation(this).x - sliderEvent.width * 0.5;
				}
				if(sliderEvent.x < worldLeft)
				{
					sliderEvent.x = worldLeft;
				}
				if(sliderEvent.x > worldRight)
				{
					sliderEvent.x = worldRight;
				}
				Config.valueEvent = 10  * (sliderEvent.x - worldLeft) / (170 - sliderEvent.width);
			}
			
			if (touch.getTouch(sliderCompetitor, TouchPhase.MOVED))
			{
				if(sliderCompetitor.x >= worldLeft && sliderEvent.x <= worldRight){
					sliderCompetitor.x = touch.getTouch(this).getLocation(this).x - sliderCompetitor.width * 0.5;
				}
				if(sliderCompetitor.x < worldLeft)
				{
					sliderCompetitor.x = worldLeft;
				}
				if(sliderCompetitor.x > worldRight)
				{
					sliderCompetitor.x = worldRight;
				}
				Config.valueCompetitor = 10  * (sliderCompetitor.x - worldLeft) / (170 - sliderCompetitor.width);
			}
			
			if (touch.getTouch(sliderVariant, TouchPhase.MOVED))
			{
				if(sliderVariant.x >= customerLeft && sliderEvent.x <= customerRight){
					sliderVariant.x = touch.getTouch(this).getLocation(this).x - sliderVariant.width * 0.5;
				}
				if(sliderVariant.x < customerLeft)
				{
					sliderVariant.x = customerLeft;
				}
				if(sliderVariant.x > customerRight)
				{
					sliderVariant.x = customerRight;
				}
				Config.valueVariant = 10  * (sliderVariant.x - customerLeft) / (170 - sliderVariant.width);
			}
			
			if (touch.getTouch(sliderAddicted, TouchPhase.MOVED))
			{
				if(sliderAddicted.x >= customerLeft && sliderEvent.x <= customerRight){
					sliderAddicted.x = touch.getTouch(this).getLocation(this).x - sliderAddicted.width * 0.5;
				}
				if(sliderAddicted.x < customerLeft)
				{
					sliderAddicted.x = customerLeft;
				}
				if(sliderAddicted.x > customerRight)
				{
					sliderAddicted.x = customerRight;
				}
				Config.valueAddicted = 10  * (sliderAddicted.x - customerLeft) / (170 - sliderAddicted.width);
			}
			
			if (touch.getTouch(sliderBuying, TouchPhase.MOVED))
			{
				if(sliderBuying.x >= customerLeft && sliderEvent.x <= customerRight){
					sliderBuying.x = touch.getTouch(this).getLocation(this).x - sliderBuying.width * 0.5;
				}
				if(sliderBuying.x < customerLeft)
				{
					sliderBuying.x = customerLeft;
				}
				if(sliderBuying.x > customerRight)
				{
					sliderBuying.x = customerRight;
				}
				Config.valueBuying = 10  * (sliderBuying.x - customerLeft) / (170 - sliderBuying.width);
			}
			
			if (touch.getTouch(sliderEmotion, TouchPhase.MOVED))
			{
				if(sliderEmotion.x >= customerLeft && sliderEvent.x <= customerRight){
					sliderEmotion.x = touch.getTouch(this).getLocation(this).x - sliderEmotion.width * 0.5;
				}
				if(sliderEmotion.x < customerLeft)
				{
					sliderEmotion.x = customerLeft;
				}
				if(sliderEmotion.x > customerRight)
				{
					sliderEmotion.x = customerRight;
				}
				Config.valueEmotion = 10  * (sliderEmotion.x - customerLeft) / (170 - sliderEmotion.width);
			}
			
			
			if (touch.getTouch(buttonRightPopulation, TouchPhase.ENDED))
			{
				if((Config.valuePopulation+20)<=1000){
					Config.valuePopulation+=20;
				}
			}
			if (touch.getTouch(buttonLeftPopulation, TouchPhase.ENDED))
			{
				if((Config.valuePopulation-20)>=0){
					Config.valuePopulation-=20;
				}
			}
			
			if (touch.getTouch(buttonRightWheater, TouchPhase.ENDED))
			{
				if(Config.valueWheater<10){
					Config.valueWheater++;
				}				
			}
			if (touch.getTouch(buttonLeftWheater, TouchPhase.ENDED))
			{
				if(Config.valueWheater>0){
					Config.valueWheater--;
				}
			}
			
			if (touch.getTouch(buttonRightEvent, TouchPhase.ENDED))
			{
				if(Config.valueEvent<10){
					Config.valueEvent++;
				}				
			}
			if (touch.getTouch(buttonLeftEvent, TouchPhase.ENDED))
			{
				if(Config.valueEvent>0){
					Config.valueEvent--;
				}
			}
			
			if (touch.getTouch(buttonRightVariant, TouchPhase.ENDED))
			{
				if(Config.valueVariant<10){
					Config.valueVariant++;
				}				
			}
			if (touch.getTouch(buttonLeftVariant, TouchPhase.ENDED))
			{
				if(Config.valueVariant>0){
					Config.valueVariant--;
				}
			}
			
			if (touch.getTouch(buttonRightAddicted, TouchPhase.ENDED))
			{
				if(Config.valueAddicted<10){
					Config.valueAddicted++;
				}				
			}
			if (touch.getTouch(buttonLeftAddicted, TouchPhase.ENDED))
			{
				if(Config.valueAddicted>0){
					Config.valueAddicted--;
				}
			}
			
			if (touch.getTouch(buttonRightBuying, TouchPhase.ENDED))
			{
				if(Config.valueBuying<10){
					Config.valueBuying++;
				}				
			}
			if (touch.getTouch(buttonLeftBuying, TouchPhase.ENDED))
			{
				if(Config.valueBuying>0){
					Config.valueBuying--;
				}
			}
			
			if (touch.getTouch(buttonRightEmotion, TouchPhase.ENDED))
			{
				if(Config.valueEmotion<10){
					Config.valueEmotion++;
				}				
			}
			if (touch.getTouch(buttonLeftEmotion, TouchPhase.ENDED))
			{
				if(Config.valueEmotion>1){
					Config.valueEmotion--;
				}
			}
			
			updateSlider();
		}
		
		public function updateSlider():void
		{
			sliderPopulation.x = distance / 1000 * Config.valuePopulation + worldLeft;
			sliderWheater.x = distance / 10 * Config.valueWheater + worldLeft;
			sliderEvent.x = distance / 10 * Config.valueEvent + worldLeft;
			sliderCompetitor.x = distance / 10 * Config.valueCompetitor + worldLeft;	
			
			sliderVariant.x = distance / 10 * Config.valueVariant + customerLeft;
			sliderAddicted.x = distance / 10 * Config.valueAddicted + customerLeft;
			sliderBuying.x = distance / 10 * Config.valueBuying + customerLeft;
			sliderEmotion.x = distance / 10 * Config.valueEmotion + customerLeft;	
		}
	}
}