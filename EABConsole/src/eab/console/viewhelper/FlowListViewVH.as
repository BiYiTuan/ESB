package eab.console.viewhelper
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.FlowListModel;
	import eab.console.view.FlowAddView;
	import eab.console.view.FlowListView;
	import eab.console.events.FlowListViewAppEvent;
	import eab.control.events.PageChangeEvent;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewHelper;	
	
	import mx.managers.PopUpManager;
	import mx.core.Application;	
	
	import flash.events.ContextMenuEvent;
	import flash.display.DisplayObject;

	public class FlowListViewVH extends ViewHelper
	{
		public static const VH_KEY :String = "FlowListViewVH";
		
		private var flowListModel:FlowListModel;
      	
		public function FlowListViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.flowListModel = EABConsoleModelLocator.getInstance().getFlowListModel();
		}

		public static function getViewHelperKey() :String{
			return VH_KEY;
		}

		public function get flowListView() : FlowListView{
			return this.view as FlowListView;
		}
		
		public function pageChagedHandle(event:PageChangeEvent):void{
			flowListModel.currentPage = event._pageIndex;
			flowListModel.countPerPage = event._countPerPage;
			flowListModel.refresh();
		}     
		
		public function addFlow(event : ContextMenuEvent):void{
			var popup:FlowAddView = FlowAddView(PopUpManager.createPopUp(DisplayObject(Application.application), FlowAddView, true));
			PopUpManager.centerPopUp(popup);
			popup.addEventListener("flowAdd", doAddFlow);
		}
		
		public function menuSelect(event : ContextMenuEvent):void{
			flowListView.flowList.selectedIndex = flowListView.lastRollOverIndex;
		}
		
		public function doAddFlow(event : EABFrameworkEvent) : void{
			new FlowListViewAppEvent(FlowListViewAppEvent.OPEN_FLOW_EDIT, 
				event.data).dispatch();
		}
	}
}
