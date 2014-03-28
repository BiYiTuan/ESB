package eab.console.commands
{
	import eab.console.figure.AbstractFigure;
	import eab.console.figure.ConnectionFigure;
	import eab.console.figure.Endow2Figure;
	import eab.console.figure.FigureFactory;
	import eab.console.figure.IFigure;
	import eab.console.figure.ProcessFigure;
	import eab.console.figure.Startow2Figure;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.FigureEditorModel;
	import eab.console.view.FigureCreateFailedWarning;
	import eab.console.viewhelper.FlowEditViewVH;
	import eab.framework.control.EABFrameworkEvent;
	
	import mx.managers.PopUpManager;

	public class FigurePasteToCanvasCMD extends EABEditorCommand{		
		
		public function FigurePasteToCanvasCMD(){
			super();
		}
		
		override public function execute(event :EABFrameworkEvent) :void{			
			
			var feVH :FlowEditViewVH = this.getActiveEditorViewHelper();
			
			var feModel :FigureEditorModel = this.getActiveEditorModel();
			
			if(feModel == null)
				return;
			
			var selectedFigures :Array = feModel.selectedFigures;
			
			var rootfigure :ProcessFigure = ProcessFigure(feModel.rootFigure);
			
			if(EABConsoleModelLocator.getInstance().getEditorNavigatorModel().xmlOfCopyFigures != null){
						
				var xml:XML = EABConsoleModelLocator.getInstance().getEditorNavigatorModel().xmlOfCopyFigures;
				
				var fig :IFigure;
				var connection :Array = new Array();
				var figList :XMLList = xml.elements("Figure");
				var i :int;
				var mapobject :Object = new Object();
				
				var j:int;
				var arr:Array;
				var fcfw:FigureCreateFailedWarning;
						
				for(i=0;i<figList.length();i++){
					
					fig = FigureFactory.createFigure( int(XML(figList[i]).@drawid) );
					
					if(fig is Startow2Figure){
						arr=new Array();
						feModel.rootFigure.ifiguretoarray(arr);
						for(j=0;j<arr.length;j++){
							if(arr[j] is Startow2Figure){
								break;
							}
							else{
								continue;
							}
						}
						if(j<arr.length){
							fcfw = PopUpManager.createPopUp(this.getActiveEditorView(),
																 FigureCreateFailedWarning, true) as FigureCreateFailedWarning;
							PopUpManager.centerPopUp(fcfw);
							continue;
						}
					}
					if(fig is Endow2Figure){
						arr=new Array();
						feModel.rootFigure.ifiguretoarray(arr);
						for(j=0;j<arr.length;j++){
							if(arr[j] is Endow2Figure){
								break;
							}
							else{
								continue;
							}
						}
						if(j<arr.length){
							fcfw = PopUpManager.createPopUp(this.getActiveEditorView(),
																 FigureCreateFailedWarning, true) as FigureCreateFailedWarning;
							PopUpManager.centerPopUp(fcfw);
							continue;
						}
					}					
					
					fig.readInformationToFigure( XML(figList[i]));
					
					var copiedNode_id:int = feModel.idManager.getAvailabelId();

					mapobject[fig.getID().toString()] = copiedNode_id;
							
					fig.setID(copiedNode_id);
							
					if(fig is ConnectionFigure){
						connection.push(fig);
					}else{
						if(feVH){
							feVH.addFigureToCanvas( AbstractFigure(fig) );
							rootfigure.addchild(fig);
							fig.ifiguretoarray(selectedFigures);
						}
					}
				}
						
				var cf:ConnectionFigure;

				for(i=0;i<connection.length;i++){
					cf=ConnectionFigure(connection[i]);
					if(mapobject.hasOwnProperty(cf.getStartFigureId().toString())&&mapobject.hasOwnProperty(cf.getEndFigureId().toString())){
						cf.setStartFigure(rootfigure.searchchildWithId(mapobject[cf.getStartFigureId().toString()]));
						cf.setEndFigure(rootfigure.searchchildWithId(mapobject[cf.getEndFigureId().toString()]));
						rootfigure.addchild(cf);
						if(feVH){
							feVH.addFigureToCanvas( AbstractFigure(cf) );
							cf.ifiguretoarray(selectedFigures);
						}	
					}else{
						continue;
					}
				}
				
				
				for(i=0;i<selectedFigures.length;i++){
					fig=IFigure(selectedFigures[i]);
					fig.setSelected(true);
					fig.setMultiple(feModel._showingMultiple);
					if(fig is ConnectionFigure){
						continue;
					}
					fig.setposition(fig.getdrawx()+50,fig.getdrawy()+50);
				}
						
				
				for(i=0;i<selectedFigures.length;i++){
					fig=IFigure(selectedFigures[i]);
					if(fig is ConnectionFigure){
						ConnectionFigure(fig).autoSetAnchor();
					}
					fig.updateDraw();
				}						
			}
		}
	}
}