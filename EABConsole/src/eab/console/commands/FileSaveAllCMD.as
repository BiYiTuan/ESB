package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.framework.view.ViewLocator;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.viewhelper.EditorNavigatorVH;
	/**
	 * Save the all open file.
	 */ 
	public class FileSaveAllCMD extends EABCommand
	{
		private var figureEditorNavigatorVH :EditorNavigatorVH;
		private var figureEditorNavigatorModel :EditorNavigatorModel;
		public function FileSaveAllCMD(){
			figureEditorNavigatorVH = ViewLocator.getInstance().getViewHelper(EditorNavigatorVH.VH_KEY) as EditorNavigatorVH;
		}
		/**
		 * 
		 * @param event 
		 * 
		 */
		override public function execute(event :EABFrameworkEvent) :void{
			
		}

	}
}