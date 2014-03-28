package eab.console.viewhelper
{
	import eab.console.events.DesignerToolBarAppEvent;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.DesignerToolBar;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.SaveFileWindow;
	import eab.framework.view.ViewHelper;
	import eab.framework.view.ViewLocator;
	import eab.console.view.FlowListView;
	import eab.console.view.ServiceListView;
	
	import flash.events.MouseEvent;
	
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;

	public class DesignerToolBarVH extends ViewHelper
	{

        public static const VH_KEY :String = "DesignerToolBarVH";

		public function DesignerToolBarVH(document : Object, id : String){
			super();
			initialized(document, id);	
		}

		private function get designerToolBar() :DesignerToolBar{
			return this.view as DesignerToolBar;
		}
		
		public function getActiveEditorID():String{
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
				
			if(editorNavigatorVH.getCurrentChildType() != EditorNavigatorChild.FLOW_EDIT_VIEW)
				return null;
			
			return editorNavigatorVH.getCurrentChildID();
		}
		
		public function newServiceHandler(event:MouseEvent):void{
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;			
					
			if(!ViewLocator.getInstance().registrationExistsFor(ServiceListViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new ServiceListView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.SERVICE_LIST_VIEW);		
						
			var serviceListVH : ServiceListViewVH = 
				ViewLocator.getInstance().getViewHelper(ServiceListViewVH.VH_KEY) as ServiceListViewVH;						
			serviceListVH.addService(null);
		}

		public function newFlowHandler(event:MouseEvent):void{
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;			
			
			if(!ViewLocator.getInstance().registrationExistsFor(FlowListViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new FlowListView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.FLOW_LIST_VIEW);				
				
			var flowListVH : FlowListViewVH = 
				ViewLocator.getInstance().getViewHelper(FlowListViewVH.VH_KEY) as FlowListViewVH;
			flowListVH.addFlow(null);
		}

		public function onSaveLocalHandler(event :MouseEvent):void {
			new DesignerToolBarAppEvent(DesignerToolBarAppEvent.FLOW_SAVE_LOCAL,
				{}).dispatch();
		}

		public function onSaveDBHandler(event :MouseEvent):void{
			new DesignerToolBarAppEvent(DesignerToolBarAppEvent.FLOW_SAVE_DB,
				{}).dispatch();
		}
		
		public function onDeployHandler(event:MouseEvent):void{
			new DesignerToolBarAppEvent(DesignerToolBarAppEvent.FLOW_DEPLOY,
				{}).dispatch();
		}

		public function onCutHandler(event:MouseEvent):void{
			var editorID : String = getActiveEditorID();
			
			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURES_COPY,
					{editorID :editorID} ).dispatch();
				new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURE_DELETE_FROM_CANVAS,
					{editorID :editorID} ).dispatch();
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Canvas_Children_Changed,
					{canvas :null}).dispatch();
			}
		}

		public function onCopyHandler(event:MouseEvent):void{
			var editorID : String = getActiveEditorID();
			
			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURES_COPY,
					{editorID :editorID} ).dispatch();
			}
		}

		public function onPasteHandler(event:MouseEvent):void{
			var editorID : String = getActiveEditorID();

			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURES_PASTE,
					{editorID :editorID} ).dispatch();
			
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Canvas_Children_Changed,
					{canvas :null}).dispatch();
			}
		}

		public function onZoomInHandler(event:MouseEvent):void{
			var editorID : String = getActiveEditorID();
			
			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Zoom_In,
					{editorID :editorID} ).dispatch();
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Canvas_Children_Changed,
					{canvas :null}).dispatch();
			}
		}

		public function onZoomOutHandler(event:MouseEvent):void{
			var editorID : String = getActiveEditorID();

			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Zoom_Out,
					{editorID :editorID} ).dispatch();
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Canvas_Children_Changed,
					{canvas :null}).dispatch();
			}
		}
	}
}