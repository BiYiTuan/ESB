package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.figure.IFigure;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;

	public class FigureCopyFromCanvasCMD extends EABEditorCommand{
		
		
		public function FigureCopyFromCanvasCMD(){
			super();
		}

		override public function execute(event :EABFrameworkEvent) :void{
			
			var feModel :FigureEditorModel = this.getActiveEditorModel();
			if(feModel == null)
				return;
			
			var selectedFigures :Array = feModel.selectedFigures;
				
			var xml :XML =<copy/>;
			
			for(var i:int =0; i<selectedFigures.length; i++){
				xml.appendChild( IFigure(selectedFigures[i]).outputAllInformation() );
			}
			
			EABConsoleModelLocator.getInstance().getEditorNavigatorModel().xmlOfCopyFigures = xml;			
		}
	}
}