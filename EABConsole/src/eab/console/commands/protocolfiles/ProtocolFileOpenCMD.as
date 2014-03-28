package eab.console.commands.protocolfiles
{
	import eab.console.view.ProtocolFilesView;
	import eab.console.view.EditorNavigatorChild;
	import eab.console.viewhelper.EditorNavigatorVH;
	import eab.console.viewhelper.ProtocolFilesViewVH;
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.ProtocolFilesModel;
	
	public class ProtocolFileOpenCMD extends EABCommand	{
		public function ProtocolFileOpenCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{		
			var editorNavigatorVH : EditorNavigatorVH = 
				ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;

			if(!ViewLocator.getInstance().registrationExistsFor(ProtocolFilesViewVH.VH_KEY))
				return;
			else {
				var protocolFilesModel:ProtocolFilesModel = EABConsoleModelLocator.getInstance().getProtocolFilesModel();
				editorNavigatorVH.activateChildren(EditorNavigatorChild.PROTOCOL_FILES_VIEW);
				protocolFilesModel.curFilePath = event.data.@absoluteFilePath;
				protocolFilesModel.refreshFile();
			}
		}
	}
}