package eab.console.commands.functionnavigator
{
	import eab.console.view.LogListView;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.LogListViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class LogListOpenCMD extends EABCommand	{
		public function LogListOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			if(!ViewLocator.getInstance().registrationExistsFor(LogListViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new LogListView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.LOG_LIST_VIEW);
		}
	}
}