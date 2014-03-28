package eab.console.commands.functionnavigator
{
	import eab.console.view.ServiceListView;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.ServiceListViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class ServiceListOpenCMD extends EABCommand	{
		public function ServiceListOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			if(!ViewLocator.getInstance().registrationExistsFor(ServiceListViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new ServiceListView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.SERVICE_LIST_VIEW);
		}
	}
}