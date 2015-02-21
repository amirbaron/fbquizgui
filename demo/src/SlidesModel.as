package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	[Bindable] 
	public class SlidesModel
	{
		private static var instance:SlidesModel = new SlidesModel();
		private var jsonObject:Object;
		private var CONFIG_URL:String = "demo.json";
		public var currentSlide:int;
		
		[Bindable]
		public var createdByImage:String;
		
		public static function getInstance():SlidesModel
		{
			return instance;
		}
		
		public function SlidesModel(){
			if(instance)
			{
				throw new Error ("We cannot create a new instance. Please use Singleton.getInstance()");
			}
			
			loadConfigFromUrl();
			currentSlide =0;
		}
		[Bindable]
		private function getCurrentSlideJsonObj():Object{
			return jsonObject.slides[getCurrentSlide()];
		}
		
		private function getCreatedByJsonObject():Object{
			return jsonObject.createdBy;
		}
		
		[Bindable]
		public function getCreatedByImg():String{
			return createdByImage;
		}
		
		private function setCreatedByImg(createdByImg:String):void{
			this.createdByImage=createdByImg;
		}
		
		[Bindable]
		public function getPointsForIndex(index:int):int{
			return getEntityAtIndex(index).points;
		}
		
		[Bindable]
		public function getSlideImage():String{
			return getCurrentSlideJsonObj().imgSmall;
		}
		
		[Bindable]
		public function getLogoImage():String{
			return jsonObject.logoImg;
		}
		[Bindable]
		public function getCreatedByRatingImg():String{
			return getCreatedByJsonObject().ratingImg;
		}
		
		public function getTSlideText():String{
			return getCurrentSlideJsonObj().text;
		}
		public function getNumberOfSlides():int{
			return jsonObject.slides.length;
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
		
		[Bindable]
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
			//			trace("completeHandler: " + loader.data);
			
			jsonObject= JSON.parse(loader.data);
			setCreatedByImg(getCreatedByJsonObject().imgSmall);
			//			trace("Read :" + jsonObject);
		}
		
		
	}
}