package eab.console.commands.functionnavigator
{
	import eab.console.view.InstanceListView;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.InstanceListViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class InstanceListOpenCMD extends EABCommand	{
		public function InstanceListOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			if(!ViewLocator.getInstance().registrationExistsFor(InstanceListViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new InstanceListView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.INSTANCE_LIST_VIEW);
		}
	}
}