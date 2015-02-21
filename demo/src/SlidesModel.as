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
		public var currentSlide:int;
		
		public function SlidesModel(){
			loadConfigFromUrl();
			currentSlide =0;
		}
		
		private function getCurrentSlideJsonObj():Object{
			return jsonObject.slides[getCurrentSlide()];
		}
		
		[Bindable]
		public function getPointsForIndex(index:int):int{
			return getEntityAtIndex(index).points;
		}
		
		[Bindable]
		public function getSlideImage():String{
			return getCurrentSlideJsonObj().imgSmall;
		}
		
		public function getTSlideText():String{
			return getCurrentSlideJsonObj().text;
		}
		
		public function getNumberOfEntitiesInSlide():int{
			return getCurrentSlideJsonObj().entities.length;
		}
		
		private function getEntityAtIndex(index:int):Object{
			return getCurrentSlideJsonObj().entities[index];
		}
		[Bindable]
		public function getImgForEntityAtIndex(index:int):String {
			return getEntityAtIndex(index).imgSmall;
		}
		[Bindable]
		public function getTitleForEntityAtIndex(index:int):String {
			return getEntityAtIndex(index).title;
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