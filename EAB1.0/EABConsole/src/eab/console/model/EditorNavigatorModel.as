package eab.console.model{
	
	import flash.utils.Dictionary;

	public class EditorNavigatorModel{

		/**
		 * The model of active figureEditor.
		 */
		private var _activeFEModel :FigureEditorModel;
		
		/**
		 * The model of active BPELEditor.
		 */
		private var _activeBEModel :BpelEditorModel;

		/**
		 * A hash map, keyed on fileID with a FigureEditorModel as the value.
		 */
		private var figureEditorModelMap : Dictionary = new Dictionary();
		
		/**
		 * A hash map, keyed on fileID with a BPELEditorModel as the value.
		 */
		private var bpelEditorModelMap : Dictionary = new Dictionary();

		/**
		 * The xml form of the selected figure just for copy and paste operation.
		 */
		private var _xmlOfCopyFigures :XML;
		
		
		public function EditorNavigatorModel(){
			
		}
		
		public function get xmlOfCopyFigures():XML{
			return this._xmlOfCopyFigures;
		}
		
		public function set xmlOfCopyFigures(xml :XML):void{
			this._xmlOfCopyFigures=xml;
		}
		
		public function get activeFigureEditorModel() :FigureEditorModel{
			
			return this._activeFEModel;
		}
		
		public function set activeFigureEditorModel(figureEditorModel :FigureEditorModel) :void{
			this._activeFEModel = figureEditorModel;
		}
		
		public function get activeBpelEditorModel():BpelEditorModel{
			return this._activeBEModel;
		}
		
		public function set activeBpelEditorModel(bpelEditorModel:BpelEditorModel):void{
			this._activeBEModel = bpelEditorModel;
		}
		
		/**
		 * creat a new figureEditorModel with the parameter, if a model for the fileID 
		 * already exist, then just return the old model.
		 * 
		 * @param fileID
		 * @return 
		 */
//		public function addFigureEditorModel(fileID :String) :FigureEditorModel{
//			var feModel :FigureEditorModel =  this.figureEditorModelMap[fileID];
//			if(feModel == null) {
//				feModel = new FigureEditorModel(fileID);
//				this.figureEditorModelMap[fileID] = feModel;
//   			}
// 			return feModel;
//		}
		
		public function deleteFigureEditorModel(fileID :String) :void {
			delete this.figureEditorModelMap[fileID];
		}
		
		public function getFigureEditorModel(fileID :String) :FigureEditorModel {
			return this.figureEditorModelMap[fileID];
		}
		
 		
 		/**
 		 * creat a new bpelEditorModel with the parameter, if a model for the fileID
		 * already exist, then just return the old model.
		 * 
 		 * @param fileID
 		 * @return
 		 */
 		public function addBpelEditorModel(fileID :String, relativeFigFileID :String) :BpelEditorModel{
 			var beModel :BpelEditorModel =  this.bpelEditorModelMap[fileID];
			if(beModel == null) {
				beModel = new BpelEditorModel(fileID, relativeFigFileID);
				this.bpelEditorModelMap[fileID] = beModel;
   			}
 			return beModel;
 		}
 		
 		public function deleteBpelEditorModel(fileID :String) :void {
			delete this.bpelEditorModelMap[fileID];
		}
		
		public function getBpelEditorModel(fileID :String) :BpelEditorModel {
			return this.bpelEditorModelMap[fileID];
		}
	}
}