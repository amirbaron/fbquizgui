package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.collections.ArrayCollection;
	
	[SWF(width='485',height='192',backgroundColor='#ffffff',frameRate='25')]
	
	[Bindable] 
	public class DataModel
	{
		private static var instance:DataModel = new DataModel();
		private var jsonObject:Object;
		private var CONFIG_URL:String = "demo.json";
		
		[Bindable]
		public var activity:Activity;
		
		public static function getInstance():DataModel
		{
			return instance;
		}
		
		public function DataModel(){
			if(instance)
			{
				throw new Error ("We cannot create a new instance. Please use Singleton.getInstance()");
			}
			
			loadConfigFromUrl();
		}
		
		protected function loadConfigFromUrl():void
		{
			var urlRequest:URLRequest  = new URLRequest(CONFIG_URL);
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, completeHandler);
			
			try{
				urlLoader.load(urlRequest);
			} catch (error:Error) {
				trace("Cannot load : " + error.message);
			}
		}
		
		private  function completeHandler(event:Event):void {
			var loader:URLLoader = URLLoader(event.target);
			//			trace("completeHandler: " + loader.data);
			
			jsonObject= JSON.parse(loader.data);
			activity = new Activity(jsonObject);
		}

	}
}