package sketchproject.entities
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	import sketchproject.managers.ServerManager;

	public class Player
	{
		private var id:uint;
		private var key:String;
		private var username:String;
		private var password:String;
		private var name:String;
		private var avatar:String;
		private var state:String;
		private var read:String;
		private var updatedAt:String;
		private var createdAt:String;
		
		public function Player()
		{
			
		}
		
		public function checkPlayerSession():Boolean
		{
			return false;
			//var server:ServerManager		
		}
		
		
	}
}