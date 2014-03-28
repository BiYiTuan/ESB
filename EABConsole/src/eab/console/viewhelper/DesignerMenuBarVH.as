package eab.console.viewhelper
{
	import eab.console.events.DesignerMenuBarAppEvent;
	import eab.console.events.DesignerToolBarAppEvent;
	import eab.console.events.FigureCanvasAppEvent;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.view.DesignerMenuBar;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.FlowListView;
	import eab.console.view.SaveFileWindow;
	import eab.console.view.ServiceListView;
	import eab.framework.view.ViewHelper;
	import eab.framework.view.ViewLocator;
	
	import mx.events.CloseEvent;
	import mx.events.MenuEvent;

	public class DesignerMenuBarVH extends ViewHelper
	{

        public static const VH_KEY :String = "DesignerMenuBarVH";    
		private var figureEditorNavigatorModel:EditorNavigatorModel;

		public function DesignerMenuBarVH(document : Object, id : String)
		{
			super();
			initialized(document, id);
		}

		private function get designerMenuBar() :DesignerMenuBar{
			return this.view as DesignerMenuBar;
		}
		
		public function getActiveEditorID():String{
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
				
			if(editorNavigatorVH.getCurrentChildType() != EditorNavigatorChild.FLOW_EDIT_VIEW)
				return null;
			
			return editorNavigatorVH.getCurrentChildID();
		}

		public function menuClick(event:MenuEvent) :void{
			
			switch(int(event.item.@id))
			{
				case 1: //new service
					this.onNewServiceHandle();
					break;					
				case 2://new flow
					this.onNewFlowHandle();
					break;			
				case 11://Cut
					this.onCutHandle();
					break;					
				case 12://Copy
					this.onCopyHandle();
					break;					
				case 13://Paste
					this.onPasteHandle();
					break;					
				case 14://Select All
					this.onSelectAll();		
					break;						
				case 21://save local
					this.onSaveLocalHandle();
					break;					
				case 22://save db
					this.onSaveDBHandle();
					break;												
				case 23://deploy
					this.onDeployHandel();
					break;					
				case 31://About
					this.onAboutHandle();
					break;				
				default:
					break;
			}
		}
		
		private function onNewServiceHandle():void{
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
		
		private function onNewFlowHandle():void{
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
		
		private function onSaveLocalHandle():void {
			new DesignerToolBarAppEvent(DesignerToolBarAppEvent.FLOW_SAVE_LOCAL,
				{}).dispatch();
		}
		
		private function onSaveDBHandle():void{
			new DesignerToolBarAppEvent(DesignerToolBarAppEvent.FLOW_SAVE_DB,
				{}).dispatch();
		}
		
		private function onDeployHandel():void{
			new DesignerToolBarAppEvent(DesignerToolBarAppEvent.FLOW_DEPLOY,
				{}).dispatch();
		}
		
		private function onCutHandle():void{
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
		
		private function onCopyHandle():void{
			var editorID : String = getActiveEditorID();
			
			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURES_COPY,
					{editorID :editorID} ).dispatch();
			}
		}
		
		private function onPasteHandle():void{
			var editorID : String = getActiveEditorID();

			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.FIGURES_PASTE,
					{editorID :editorID} ).dispatch();
			
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Canvas_Children_Changed,
					{canvas :null}).dispatch();
			}
		}
		
		private function onSelectAll():void{
			var editorID : String = getActiveEditorID();
			
			if(editorID != null){
				new FigureCanvasAppEvent(FigureCanvasAppEvent.Select_All,
					{editorID :editorID} ).dispatch();
			}
		}		
		
		private function onAboutHandle():void{			
			new FigureCanvasAppEvent(FigureCanvasAppEvent.About_Info).dispatch();
		}
	}

}