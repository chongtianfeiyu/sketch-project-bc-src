package sketchproject.events
{
	import starling.events.Event;
	
	public class NavigationEvent extends Event
	{
		public static const SWITCH:String = "switch";
		
		public static const NAVIGATE_CUSTOMER:String = "customer";
		public static const NAVIGATE_POINT:String = "point";
		public static const NAVIGATE_STAR:String = "star";
		public static const NAVIGATE_PROFIT:String = "profit";
		
		public static const NAVIGATE_HELP:String = "help";
		public static const NAVIGATE_SETTING:String = "setting";
		public static const NAVIGATE_INFO:String = "info";
		public static const NAVIGATE_ACHIEVEMENT:String = "achievement";
		public static const NAVIGATE_LEADERBOARD:String = "leaderboard";
		public static const NAVIGATE_PERFORMANCE:String = "performance";
		public static const NAVIGATE_MENU:String = "menu";
		
		public static const NAVIGATE_MARKET:String = "market";
		
		public static const NAVIGATE_MAP:String = "map";
		public static const NAVIGATE_BUSINESS:String = "business";
		public static const NAVIGATE_PRODUCT:String = "product";
		public static const NAVIGATE_EMPLOYEE:String = "employee";
		public static const NAVIGATE_ISSUES:String = "issues";
		public static const NAVIGATE_ADVERT:String = "advert";
		public static const NAVIGATE_FINANCE:String = "finance";
		
		private var mResult:String;
		
		public function NavigationEvent(type:String, data:String, bubbles:Boolean=false)
		{
			super(type, bubbles);
			this.mResult = data;
		}
		
		public function get navigate():String 
		{ 
			return mResult; 
		}
	}
}