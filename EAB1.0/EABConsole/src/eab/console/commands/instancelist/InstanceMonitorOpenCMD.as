package eab.console.commands.instancelist
{
	import eab.console.model.InstanceMonitorModel;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.view.InstanceMonitorView;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.InstanceMonitorViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class InstanceMonitorOpenCMD extends EABCommand	{
		public function InstanceMonitorOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			var index : int = editorNavigatorVH.findChildren(EditorNavigatorChild.INSTANCE_MONITOR_VIEW, event.data.id);
			
			if(index == -1){
				var instanceMonitorView : InstanceMonitorView = 
					new InstanceMonitorView();
					
				instanceMonitorView.instanceID = String(event.data.id);
				instanceMonitorView.label += "-" + instanceMonitorView.instanceID;				
				instanceMonitorView.instanceMonitorModel = 
					new InstanceMonitorModel(event.data);
				instanceMonitorView.instanceMonitorViewVH = 
					new InstanceMonitorViewVH(instanceMonitorView, InstanceMonitorViewVH.getViewHelperKey(event.data));
					
				editorNavigatorVH.addChildren(instanceMonitorView);				
			}
			else{
				editorNavigatorVH.editorNavigator.selectedIndex = index;
			}			
		}
	}
}