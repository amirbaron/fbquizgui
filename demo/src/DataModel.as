package
{
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import illumifi.Parse;
	
	import mx.collections.ArrayCollection;
	
	[SWF(width='485',height='192',backgroundColor='#ffffff',frameRate='25')]
	
	[Bindable] 
	public class DataModel
	{
		private static var instance:DataModel = new DataModel();
		private var jsonObject:Object;
		private var CONFIG_URL:String = "demo.json";
		private static var DEBUG:Boolean = false;
		
		[Bindable]
		public var activity:Activity;
		[Bindable]
		public var loaderInfo:LoaderInfo;
		
		public static function getInstance():DataModel
		{
			return instance;
		}
		
		public function DataModel(){
			if(instance)
			{
				throw new Error ("We cannot create a new instance. Please use Singleton.getInstance()");
			}
			
			loadConfig();
		}
		
		protected function extractIdFromUrl() : String
		{
			var url:String = loaderInfo.loaderURL;
			var _loc3_:Array = null;
			var _loc2_:RegExp = new RegExp("item=([^&]*)");
			_loc3_ = url.match(_loc2_);
			if(_loc3_ === null)
			{
				return null;
			}
			return _loc3_[1];
		}
		
		protected function loadConfig()
		{
			if(DEBUG==true){
				loadConfigFromLocalFile();
			}
			else
			{
				loadConfigFromUrl();	
			}
		}
		
		protected function loadConfigFromUrl():void
		{
			Parse.CloudCode("item",{"id":extractIdFromUrl()},completeHandlerUrl,function():void{
				trace("Failed to load json");
			});
		}
		
		protected function loadConfigFromLocalFile():void
		{
			var urlRequest:URLRequest  = new URLRequest(CONFIG_URL);
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, completeHandlerLocal);
			
			try{
				urlLoader.load(urlRequest);
			} catch (error:Error) {
				trace("Cannot load : " + error.message);
			}
		}
		
		public static function completeHandlerUrl(jsonRes:Object):void {
			getInstance().jsonObject= JSON.parse(jsonRes.result);
			getInstance().activity = new Activity(getInstance().jsonObject);
		}

		public static  function completeHandlerLocal(event:Event):void {
			var loader:URLLoader = URLLoader(event.target);
			//			trace("completeHandler: " + loader.data);
			
			getInstance().jsonObject = JSON.parse(loader.data);
			getInstance().activity = new Activity(getInstance().jsonObject);
		}
	}
}