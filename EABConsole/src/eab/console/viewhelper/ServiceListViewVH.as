package eab.console.viewhelper
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ServiceListModel;
	import eab.console.view.ServiceAddView;
	import eab.console.view.ServiceListView;
	import eab.control.events.PageChangeEvent;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewHelper;
	
	import flash.events.ContextMenuEvent;
	import flash.display.DisplayObject;
	
	import mx.managers.PopUpManager;
	import mx.core.Application;	

	public class ServiceListViewVH extends ViewHelper
	{
		public static const VH_KEY :String = "ServiceListViewVH";
		
		private var serviceListModel:ServiceListModel;
      	
		public function ServiceListViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.serviceListModel = EABConsoleModelLocator.getInstance().getServiceListModel();
		}

		public static function getViewHelperKey() :String{
			return VH_KEY;
		}

		public function get serviceListView() : ServiceListView{
			return this.view as ServiceListView;
		}
		
		public function pageChagedHandle(event:PageChangeEvent):void{
			serviceListModel.currentPage = event._pageIndex;
			serviceListModel.countPerPage = event._countPerPage;
			serviceListModel.refresh();
		}      
		
		public function addService(event : ContextMenuEvent):void{
			var popup:ServiceAddView = ServiceAddView(PopUpManager.createPopUp(DisplayObject(Application.application), ServiceAddView, true));
			PopUpManager.centerPopUp(popup);
			popup.addEventListener("serviceAdd", doAddService);
		}
		
		public function deleteService(event : ContextMenuEvent):void{
			serviceListModel.deleteService(serviceListView.serviceList.selectedItem);
		}
		
		public function menuSelect(event : ContextMenuEvent):void{
			serviceListView.serviceList.selectedIndex = serviceListView.lastRollOverIndex;
		}
		
		public function doAddService(event : EABFrameworkEvent) : void{
			serviceListModel.addService(event.data);
		}
	}
}
