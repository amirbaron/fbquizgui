package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	[Bindable] 
	public class SlidesModel
	{
		private var jsonObject:Object;
		private var CONFIG_URL:String = "demo.json";
		private var currentSlide:int;
		
		public function SlidesModel(){
			loadConfigFromUrl();
			currentSlide =0;
		}
		
		public function getSlideImage():String{
			return jsonObject.slides[getCurrentSlide()].imgSmall;
		}
		
		public function getTSlideText():String{
			return jsonObject.slides[getCurrentSlide()].text;
		}
		
		
		private function getCurrentSlide():int{
			return currentSlide;
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
			trace("completeHandler: " + loader.data);
			
			jsonObject= JSON.parse(loader.data);
			trace("Read :" + jsonObject);
		}
		
		
	}
}