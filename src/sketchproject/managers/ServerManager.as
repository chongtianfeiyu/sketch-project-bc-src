package sketchproject.managers
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class ServerManager extends EventDispatcher
	{
		public static const SERVER_HOST:String = "http://localhost/businesscareer/";
		public static const NO_SESSION:String = "no_session";
		public static const READY_SESSION:String = "ready_session";
		
		public static const READY:String = "ready";
		public static const PROGRESS:String = "progress";
		public static const ERROR:String = "error";
		
		// public variable from server
		public var received:URLVariables;
		public var progress:Number;
		public var error:String;
		
		// Assign a variable name for our URLVariables object;
		private var variables:URLVariables;		
		// Build the request variable
		private var request:URLRequest;		
		// Build the varLoader variable
		private var loader:URLLoader;
		
		// data carrier variable
		private var data:Object;
		private var url:String;
		
		public function ServerManager(dest:String, dataVars:Object)
		{
			url = ServerManager.SERVER_HOST + dest;
			variables = new URLVariables();
			request = new URLRequest(url);
			loader = new URLLoader();			
			
			data = dataVars;
			
			parseVariables();
		}
		
		private function parseVariables():void {			
			for (var item:* in data) 
			{				
				variables[item] = data[item];             
			}			
			serverRequest();
		}
				
		private function serverRequest():void {	
			request.method = URLRequestMethod.POST;
			request.data = variables;
			
			loader.dataFormat = URLLoaderDataFormat.VARIABLES;           
			loader.addEventListener(Event.COMPLETE, completeHandler);
			loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			loader.load(request);
		}
		
		public function completeHandler(event:Event):void
		{
			// event.target.data
			received = new URLVariables(loader.data);
			dispatchEvent(new Event(ServerManager.READY)); 
		}
		
		public function progressHandler(event:ProgressEvent):void
		{
			progress = Math.ceil(Math.floor(event.bytesLoaded / 1024) / Math.floor(event.bytesTotal / 1024) * 100);
			dispatchEvent(new Event(ServerManager.PROGRESS)); 
		}
		
		public function errorHandler(event:IOErrorEvent):void
		{
			error = event.toString();
			dispatchEvent(new Event(ServerManager.ERROR)); 
		}
	}
}