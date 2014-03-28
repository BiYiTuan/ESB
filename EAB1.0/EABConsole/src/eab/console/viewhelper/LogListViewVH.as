package eab.console.viewhelper
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.LogListModel;
	import eab.console.view.LogListView;
	import eab.control.events.PageChangeEvent;
	import eab.framework.view.ViewHelper;

	public class LogListViewVH extends ViewHelper
	{
		public static const VH_KEY :String = "LogListViewVH";
		
		private var logListModel:LogListModel;
      	
		public function LogListViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.logListModel = EABConsoleModelLocator.getInstance().getLogListModel();
		}

		public static function getViewHelperKey() :String{
			return VH_KEY;
		}

		public function get logListView() : LogListView{
			return this.view as LogListView;
		}
		
		public function pageChagedHandle(event:PageChangeEvent):void{
			logListModel.currentPage = event._pageIndex;
			logListModel.countPerPage = event._countPerPage;
			logListModel.refresh();
		}      
	}
}
