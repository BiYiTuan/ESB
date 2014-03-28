package eab.console.commands.functionnavigator
{
	import eab.console.view.ProtocolListView;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.ProtocolListViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class ProtocolListOpenCMD extends EABCommand	{
		public function ProtocolListOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			if(!ViewLocator.getInstance().registrationExistsFor(ProtocolListViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new ProtocolListView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.PROTOCOL_LIST_VIEW);
		}
	}
}