package sketchproject.objects.business
{
	import sketchproject.core.Assets;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class Startup extends Sprite
	{
		private var buttonBusinessPlan:Button;
		private var buttonPersonalObjective:Button;
		private var buttonGameParameter:Button;
		private var buttonSeedFinancing:Button;
		
		private var textMonthAllocation:TextField;
		private var textBudgetAvailable:TextField;
		private var textBudgetAllocation:TextField;
		
		private var textOperatingCost:TextField;
		private var textHRCost:TextField;
		private var textRDCost:TextField;
		private var textManufacturing:TextField;
		private var textSalesMarketing:TextField;
		private var textSalesOperatingCost:TextField;
		private var textOtherCost:TextField;
		
		private var label:TextField;
		
		public function Startup()
		{
			super();
			
			buttonBusinessPlan = new Button(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("button_business_plan"));
			buttonBusinessPlan.pivotX = buttonBusinessPlan.width * 0.5;
			buttonBusinessPlan.pivotY = buttonBusinessPlan.height * 0.5;
			buttonBusinessPlan.x = -316.05;
			buttonBusinessPlan.y = -124.9;
			addChild(buttonBusinessPlan);
			
			buttonPersonalObjective = new Button(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("button_personal_objective"));
			buttonPersonalObjective.pivotX = buttonPersonalObjective.width * 0.5;
			buttonPersonalObjective.pivotY = buttonPersonalObjective.height * 0.5;
			buttonPersonalObjective.x = -178.05;
			buttonPersonalObjective.y = -124.9;
			addChild(buttonPersonalObjective);
			
			buttonGameParameter = new Button(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("button_game_parameter"));
			buttonGameParameter.pivotX = buttonGameParameter.width * 0.5;
			buttonGameParameter.pivotY = buttonGameParameter.height * 0.5;
			buttonGameParameter.x = -316.05;
			buttonGameParameter.y = 2.95;
			addChild(buttonGameParameter);
			
			buttonSeedFinancing = new Button(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("button_seed_financing"));
			buttonSeedFinancing.pivotX = buttonSeedFinancing.width * 0.5;
			buttonSeedFinancing.pivotY = buttonSeedFinancing.height * 0.5;
			buttonSeedFinancing.x = -178.05;
			buttonSeedFinancing.y = 2.95;
			addChild(buttonSeedFinancing);
			
			label = new TextField(250, 50, "Budget Detail", Assets.getFont("FontCarterOne").fontName, 15, 0xA92922);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -172.9;
			addChild(label);
			
			label = new TextField(250, 50, "Operating Cost", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -145 + (0 * 25);
			addChild(label);
			
			textOperatingCost = new TextField(250, 50, "IDR 5600 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textOperatingCost.vAlign = VAlign.TOP;
			textOperatingCost.hAlign = HAlign.LEFT;
			textOperatingCost.x = 40;
			textOperatingCost.y = -145 + (0 * 25);
			addChild(textOperatingCost);
			
			label = new TextField(250, 50, "HR Cost", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -145 + (1 * 25);
			addChild(label);
			
			textHRCost = new TextField(250, 50, "IDR 5700 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textHRCost.vAlign = VAlign.TOP;
			textHRCost.hAlign = HAlign.LEFT;
			textHRCost.x = 40;
			textHRCost.y = -145 + (1 * 25);
			addChild(textHRCost);
			
			label = new TextField(250, 50, "R&D Cost", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -145 + (2 * 25);
			addChild(label);
			
			textRDCost = new TextField(250, 50, "IDR 9800 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textRDCost.vAlign = VAlign.TOP;
			textRDCost.hAlign = HAlign.LEFT;
			textRDCost.x = 40;
			textRDCost.y = -145 + (2 * 25);
			addChild(textRDCost);
			
			label = new TextField(250, 50, "Manufacturing", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -145 + (3 * 25);
			addChild(label);
			
			textManufacturing = new TextField(250, 50, "IDR 3600 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textManufacturing.vAlign = VAlign.TOP;
			textManufacturing.hAlign = HAlign.LEFT;
			textManufacturing.x = 40;
			textManufacturing.y = -145 + (3 * 25);
			addChild(textManufacturing);
			
			label = new TextField(250, 50, "Sales Marketing", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -145 + (4 * 25);
			addChild(label);
			
			textSalesMarketing = new TextField(250, 50, "IDR 8600 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textSalesMarketing.vAlign = VAlign.TOP;
			textSalesMarketing.hAlign = HAlign.LEFT;
			textSalesMarketing.x = 40;
			textSalesMarketing.y = -145 + (4 * 25);
			addChild(textSalesMarketing);
			
			label = new TextField(250, 50, "Operating Cost", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -145 + (5 * 25);
			addChild(label);
			
			textOperatingCost = new TextField(250, 50, "IDR 9900 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textOperatingCost.vAlign = VAlign.TOP;
			textOperatingCost.hAlign = HAlign.LEFT;
			textOperatingCost.x = 40;
			textOperatingCost.y = -145 + (5 * 25);
			addChild(textOperatingCost);
			
			label = new TextField(250, 50, "Other Cost", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = -83.55;
			label.y = -145 + (6 * 25);
			addChild(label);
			
			textOperatingCost = new TextField(250, 50, "IDR 4400 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textOperatingCost.vAlign = VAlign.TOP;
			textOperatingCost.hAlign = HAlign.LEFT;
			textOperatingCost.x = 40;
			textOperatingCost.y = -145 + (6 * 25);
			addChild(textOperatingCost);
			
			
			label = new TextField(250, 50, "Month Budget", Assets.getFont("FontCarterOne").fontName, 15, 0xA92922);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = 172.25;
			label.y = -172.9;
			addChild(label);
			
			label = new TextField(250, 50, "Budget Available", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = 172.25;
			label.y = -145 + (0 * 25);
			addChild(label);
			
			textBudgetAvailable = new TextField(250, 50, "IDR 9900 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textBudgetAvailable.vAlign = VAlign.TOP;
			textBudgetAvailable.hAlign = HAlign.LEFT;
			textBudgetAvailable.x = 344.75;
			textBudgetAvailable.y = -145 + (0 * 25);
			addChild(textBudgetAvailable);
			
			label = new TextField(250, 50, "Budget Allocated", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = 172.25;
			label.y = -145 + (1 * 25);
			addChild(label);
			
			textBudgetAllocation = new TextField(250, 50, "IDR 9900 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textBudgetAllocation.vAlign = VAlign.TOP;
			textBudgetAllocation.hAlign = HAlign.LEFT;
			textBudgetAllocation.x = 344.75;
			textBudgetAllocation.y = -145 + (1 * 25);
			addChild(textBudgetAllocation);
			
			label = new TextField(250, 50, "Month Allocated", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			label.vAlign = VAlign.TOP;
			label.hAlign = HAlign.LEFT;
			label.x = 172.25;
			label.y = -145 + (2 * 25);
			addChild(label);
			
			textMonthAllocation = new TextField(250, 50, "IDR 9900 K", Assets.getFont("FontCarterOne").fontName, 12, 0x333333);
			textMonthAllocation.vAlign = VAlign.TOP;
			textMonthAllocation.hAlign = HAlign.LEFT;
			textMonthAllocation.x = 344.75;
			textMonthAllocation.y = -145 + (2 * 25);
			addChild(textMonthAllocation);
		}
	}
}