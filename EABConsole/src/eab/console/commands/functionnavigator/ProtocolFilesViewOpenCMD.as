package eab.console.commands.functionnavigator
{
	import eab.console.view.ProtocolFilesView
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.ProtocolFilesViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	
	public class ProtocolFilesViewOpenCMD extends EABCommand	{
		public function ProtocolFilesViewOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			if(!ViewLocator.getInstance().registrationExistsFor(ProtocolFilesViewVH.VH_KEY))
				editorNavigatorVH.addChildren(new ProtocolFilesView());
			else
				editorNavigatorVH.activateChildren(EditorNavigatorChild.PROTOCOL_FILES_VIEW);
		}
	}
}