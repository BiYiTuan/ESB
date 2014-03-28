package eab.console.commands.flowlist
{
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.FlowEditView;
	import eab.console.model.FlowEditModel;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class FlowEditOpenCMD extends EABCommand	{
		public function FlowEditOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			var index : int = editorNavigatorVH.findChildren(EditorNavigatorChild.FLOW_EDIT_VIEW, String(event.data.flowName));
			
			if(index == -1){

				var flowEditView : FlowEditView = 
					new FlowEditView();
					
				flowEditView.instanceID = String(event.data.flowName);
				flowEditView.label += "-" + flowEditView.instanceID;				
				flowEditView.flowEditModel = 
					new FlowEditModel(String(event.data.flowName), XML(event.data.flowData));
				flowEditView.flowEditViewVH = 
					new FlowEditViewVH(flowEditView, FlowEditViewVH.getViewHelperKey(event.data));
					
				editorNavigatorVH.addChildren(flowEditView);				
			}
			else{
				editorNavigatorVH.editorNavigator.selectedIndex = index;
			}			
		}
	}
}