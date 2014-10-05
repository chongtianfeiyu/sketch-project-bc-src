package sketchproject.screens
{
	import com.greensock.TweenMax;
	
	import sketchproject.core.Assets;
	import sketchproject.objects.finance.BalanceSheet;
	import sketchproject.objects.finance.CashFlow;
	import sketchproject.objects.finance.GeneralJournal;
	import sketchproject.objects.finance.GeneralLedger;
	import sketchproject.objects.finance.ProfitChart;
	import sketchproject.objects.finance.ProfitLoss;
	import sketchproject.objects.finance.TrialBalance;
	import sketchproject.utilities.Config;
	
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class FinanceScreen extends GameScreen
	{
		private var menu:Image;
		private var selectMenu:Image;
		private var buttonMenu1:Quad;
		private var buttonMenu2:Quad;
		private var buttonMenu3:Quad;
		private var buttonMenu4:Quad;
		private var buttonMenu5:Quad;
		private var buttonMenu6:Quad;
		private var buttonMenu7:Quad;
		private var baseContent:Shape;
		
		// content
		private var generalJournal:GeneralJournal;
		private var generalLedger:GeneralLedger;
		private var trialBalance:TrialBalance;
		private var balanceSheet:BalanceSheet;
		private var profitLoss:ProfitLoss;
		private var cashFlow:CashFlow;
		private var profitChart:ProfitChart;
		
		public function FinanceScreen()
		{
			super(true, "icon_finance", "Finance","Review financial information and performance", "Review the financial status of your business in these key accounting");
			
			baseContent = new Shape();
			baseContent.graphics.clear();
			baseContent.graphics.beginFill(0xFFFFFF);
			baseContent.graphics.lineStyle(1, 0xFFFFFF, 0.5);
			baseContent.graphics.drawRoundRect(-250, -192.6, 700, 300, 10);
			baseContent.graphics.endFill();
			addChild(baseContent);
			
			generalJournal = new GeneralJournal();
			generalJournal.x = -225;
			generalJournal.y = -185;
			addChild(generalJournal);
			
			generalLedger = new GeneralLedger();
			generalLedger.x = -225;
			generalLedger.y = -185;
			addChild(generalLedger);
			
			trialBalance = new TrialBalance();
			trialBalance.x = -225;
			trialBalance.y = -185;
			addChild(trialBalance);
			
			balanceSheet = new BalanceSheet();
			balanceSheet.x = -225;
			balanceSheet.y = -185;
			addChild(balanceSheet);
			
			profitLoss = new ProfitLoss();
			profitLoss.x = -225;
			profitLoss.y = -185;
			addChild(profitLoss);
			
			cashFlow = new CashFlow();
			cashFlow.x = -225;
			cashFlow.y = -185;
			addChild(cashFlow);
			
			profitChart = new ProfitChart();
			profitChart.x = -225;
			profitChart.y = -185;
			addChild(profitChart);
						
			menu = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("report_menu_background"));
			menu.x = -450.85;
			menu.y = -211.55;
			menu.scaleX = 0.9;
			menu.scaleY = 0.9;
			addChild(menu);
			
			selectMenu = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("report_select"));
			selectMenu.x = -455.75;
			selectMenu.y = -185;
			selectMenu.scaleX = 0.9;
			selectMenu.scaleY = 0.9;
			addChild(selectMenu);
			
			menu = new Image(Assets.getAtlas(Assets.TEXTURE_CONTENT, Assets.TEXTURE_CONTENT_XML).getTexture("report_menu"));
			menu.x = -419.25;
			menu.y = -178.9;
			menu.scaleX = 0.9;
			menu.scaleY = 0.9;
			addChild(menu);
			
			buttonMenu1 = new Quad(200, 30);
			buttonMenu1.x = -430;
			buttonMenu1.y = -175;
			buttonMenu1.alpha = 0;
			addChild(buttonMenu1);
			
			buttonMenu2 = new Quad(200, 30);
			buttonMenu2.x = -430;
			buttonMenu2.y = -133;
			buttonMenu2.alpha = 0;
			addChild(buttonMenu2);
			
			buttonMenu3 = new Quad(200, 30);
			buttonMenu3.x = -430;
			buttonMenu3.y = -93;
			buttonMenu3.alpha = 0;
			addChild(buttonMenu3);
			
			buttonMenu4 = new Quad(200, 30);
			buttonMenu4.x = -430;
			buttonMenu4.y = -53;
			buttonMenu4.alpha = 0;
			addChild(buttonMenu4);
			
			buttonMenu5 = new Quad(200, 30);
			buttonMenu5.x = -430;
			buttonMenu5.y = -13;
			buttonMenu5.alpha = 0;
			addChild(buttonMenu5);
			
			buttonMenu6 = new Quad(200, 30);
			buttonMenu6.x = -430;
			buttonMenu6.y = 27;
			buttonMenu6.alpha = 0;
			addChild(buttonMenu6);
			
			buttonMenu7 = new Quad(200, 30);
			buttonMenu7.x = -430;
			buttonMenu7.y = 67;
			buttonMenu7.alpha = 0;
			addChild(buttonMenu7);
			
			addEventListener(TouchEvent.TOUCH, menuTouch);
			
			switchReport(generalJournal);
		}
		
		private function menuTouch(event:TouchEvent):void
		{
			if (event.getTouch(buttonMenu1, TouchPhase.ENDED))
			{
				TweenMax.to(selectMenu,0.3,{y:buttonMenu1.y-10});
				switchReport(generalJournal);
			}	
			if (event.getTouch(buttonMenu2, TouchPhase.ENDED))
			{
				TweenMax.to(selectMenu,0.3,{y:buttonMenu2.y-10});
				switchReport(generalLedger);
			}
			if (event.getTouch(buttonMenu3, TouchPhase.ENDED))
			{
				TweenMax.to(selectMenu,0.3,{y:buttonMenu3.y-10});
				switchReport(trialBalance);
			}
			if (event.getTouch(buttonMenu4, TouchPhase.ENDED))
			{
				TweenMax.to(selectMenu,0.3,{y:buttonMenu4.y-10});
				switchReport(balanceSheet);
			}
			if (event.getTouch(buttonMenu5, TouchPhase.ENDED))
			{
				TweenMax.to(selectMenu,0.3,{y:buttonMenu5.y-10});
				switchReport(profitLoss);
			}
			if (event.getTouch(buttonMenu6, TouchPhase.ENDED))
			{
				TweenMax.to(selectMenu,0.3,{y:buttonMenu6.y-10});
				switchReport(cashFlow);
			}
			if (event.getTouch(buttonMenu7, TouchPhase.ENDED))
			{
				TweenMax.to(selectMenu,0.3,{y:buttonMenu7.y-10});
				switchReport(profitChart);
			}
		}
		
		private function switchReport(activeReport:Sprite):void
		{
			generalJournal.visible = false;
			generalLedger.visible = false;
			trialBalance.visible = false;
			balanceSheet.visible = false;
			profitLoss.visible = false;
			cashFlow.visible = false;
			profitChart.visible = false;
			
			activeReport.visible = true;
		}
	}
}