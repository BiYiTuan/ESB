package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;

	public class ZoomOutCMD extends EABEditorCommand
	{
		public function ZoomOutCMD(){
			super();
		}

		override public function execute(event:EABFrameworkEvent):void{			
			var feModel :FigureEditorModel = this.getActiveEditorModel();
			
			if(feModel == null)
				return;
			
			feModel.showingMultiple /= 1.2;			
		}
		
	}
}