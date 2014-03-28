package eab.console.viewhelper
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.InstanceListModel;
	import eab.console.view.InstanceListView;
	import eab.control.events.PageChangeEvent;
	import eab.framework.view.ViewHelper;
	import eab.console.events.InstanceListViewAppEvent;
	
	import flash.events.MouseEvent;
	import flash.events.ContextMenuEvent;

	public class InstanceListViewVH extends ViewHelper
	{
		public static const VH_KEY :String = "InstanceListViewVH";
		
		private var instanceListModel:InstanceListModel;
      	
		public function InstanceListViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.instanceListModel = EABConsoleModelLocator.getInstance().getInstanceListModel();
		}

		public static function getViewHelperKey() :String{
			return VH_KEY;
		}

		public function get instanceListView() : InstanceListView{
			return this.view as InstanceListView;
		}
		
		public function pageChagedHandle(event:PageChangeEvent):void{
			instanceListModel.currentPage = event._pageIndex;
			instanceListModel.countPerPage = event._countPerPage;
			instanceListModel.refresh();
		}      
		
		public function doubleClickHandle(event:MouseEvent):void{
			new InstanceListViewAppEvent(InstanceListViewAppEvent.OPEN_INSTANCE_MONITOR, 
				this.instanceListView.instanceList.selectedItem).dispatch();
		}
		
		public function deleteInstance(event : ContextMenuEvent):void{
			instanceListModel.deleteInstance(instanceListView.instanceList.selectedItem);
		}
		
		public function menuSelect(event : ContextMenuEvent):void{
			instanceListView.instanceList.selectedIndex = instanceListView.lastRollOverIndex;
		}
	}
}
