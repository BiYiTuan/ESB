package eab.console.commands
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.FunctionNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.viewhelper.FunctionNavigatorViewVH;
	import eab.console.business.EABConsoleServiceLocator;
	/**
	 * Create a new project in fileNavigator.
	 */ 
	public class NewProjectCMD extends EABCommand
	{
		public function NewProjectCMD(){
			super();
		}
		/**
		 * @param event {projectName}
		 */
		override public function execute(event :EABFrameworkEvent) :void{
//			var fileNavigatorViewVH :FunctionNavigatorViewVH = 
//					ViewLocator.getInstance().getViewHelper(FunctionNavigatorViewVH.VH_KEY) as FunctionNavigatorViewVH;
//			var fileNavigatorViewModel :FunctionNavigatorViewModel =
//					EABConsoleModelLocator.getInstance().getFileNavigatorViewModel();
//					
//			var exist:Boolean = false;
//			for(var i :int = 0; i < fileNavigatorViewModel.xmlList.length(); i++){
//				if(event.data.projectName == fileNavigatorViewModel.xmlList[i].@name)
//					exist = true;
//			}
//			if(exist)
//				Alert.show("This project name is exist.");
//			else{
//				var remote :RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("navigator");
//				remote.createNewProject(event.data.projectName);
//				remote.addEventListener(FaultEvent.FAULT,fault);
//				
//				var newProjectNode:XML = <folder/>;
//				newProjectNode.@ID="0";
//				newProjectNode.@name=event.data.projectName;
//				newProjectNode.@type="project";
//				fileNavigatorViewModel.xmlListCollection.addItem(newProjectNode);
//   			}
		}
		
		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }
	}
}