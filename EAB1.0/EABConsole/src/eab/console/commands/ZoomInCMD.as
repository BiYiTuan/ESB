package eab.console.commands
{
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.FigureEditorModel;
	import eab.framework.control.EABFrameworkEvent;

	public class ZoomInCMD extends EABEditorCommand
	{
		public function ZoomInCMD(){
			super();
		}

		override public function execute(event:EABFrameworkEvent):void{			
			var feModel :FigureEditorModel = this.getActiveEditorModel();
			
			if(feModel == null)
				return;
			
			feModel.showingMultiple *= 1.2;
		}
		
	}
}