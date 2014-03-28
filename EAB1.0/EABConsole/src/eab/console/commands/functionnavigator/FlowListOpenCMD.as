package eab.console.commands.functionnavigator
{
	import eab.console.view.FlowListView;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.FlowListViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class FlowListOpenCMD extends EABCommand	{
		public function FlowListOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			if(!ViewLocator.getInstance().registrationExistsFor(FlowListViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new FlowListView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.FLOW_LIST_VIEW);
		}
	}
}