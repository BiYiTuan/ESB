package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.figure.IFigure;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	/**
	 * Selected all figures.
	 */ 
	public class SelectAllCMD extends EABCommand
	{
		public function SelectAllCMD(){
			super();
		}
		/**
		 * @param event {fileID}
		 */
		override public function execute(event:EABFrameworkEvent):void{
			
//			var fileID :String = event.data.fileID;
//			var feNavModel :EditorNavigatorModel = EABConsoleModelLocator.getInstance().getEditorNavigatorModel();
//			
//			var feModel :FigureEditorModel = feNavModel.getFigureEditorModel(fileID);
//			
//			var selectedfigure:Array=feModel.selectedFigures;
//			feModel.rootFigure.ifiguretoarray(selectedfigure);
//			
//			var i:int;
//			for(i=0;i<selectedfigure.length;i++){
//				IFigure(selectedfigure[i]).setSelected(true);
//				IFigure(selectedfigure[i]).updateDraw();
//			}

		}
		
	}
}