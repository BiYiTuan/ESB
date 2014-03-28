package eab.console.commands
{
	import eab.framework.commands.EABCommand;
	import eab.framework.control.EABFrameworkEvent;
	import eab.console.figure.ConnectionFigure;
	import eab.console.figure.IFigure;
	import eab.console.model.FigureEditorModel;
	import eab.console.model.EABConsoleModelLocator;
	/**
	 * Move figures down.
	 */ 
	public class MoveDownCMD extends EABCommand
	{
		public function MoveDownCMD(){
			super();
		}
		/**
		 * @param event{fileID}
		 */ 
		override public function execute(event:EABFrameworkEvent):void{
			
//			var fileID :String = event.data.fileID;
//			
//			var feModel :FigureEditorModel = 
//					EABConsoleModelLocator.getInstance().getEditorNavigatorModel().getFigureEditorModel(fileID);
//			
//			var selectedFigures :Array = feModel.selectedFigures;
//			
//			var i:int;
//			var conn:Array=new Array();
//			for(i=0;i<selectedFigures.length;i++){
//				IFigure(selectedFigures[i]).setxy(IFigure(selectedFigures[i]).getx(),IFigure(selectedFigures[i]).gety()+5);
//				if(selectedFigures[i] is ConnectionFigure){
//					conn.push(selectedFigures[i]);
//				}
//			}
//			for(i=0;i<conn.length;i++){
//				ConnectionFigure(conn[i]).autoSetAnchor();
//			}
//			for(i=0;i<selectedFigures.length;i++){
//				IFigure(selectedFigures[i]).updateDraw();
//			}
			
		}
		
	}
}