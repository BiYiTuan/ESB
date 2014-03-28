package eab.control.events
{
	import flash.events.Event;

	public class PageChangeEvent extends Event
	{
		
		public static const PAGECHANGED:String="pageChange";
		
		public var _pageIndex:int;
		
		public var _countPerPage:int;		
		
		public function PageChangeEvent(pageIndex:int, countPerPage:int, type:String, 
			bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			 _pageIndex=pageIndex;
			 
			 _countPerPage=countPerPage;
		}
	}
}