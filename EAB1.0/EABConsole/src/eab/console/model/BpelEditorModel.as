package eab.console.model
{
	import eab.framework.view.ViewLocator;
	import eab.console.business.BpelCreator;
	import eab.console.figure.ProcessFigure;
	import eab.console.viewhelper.BpelEditorVH;
	/**
	 * The model of BPELEditor.
	 */
	public class BpelEditorModel{

		// modelLocator
		private var orDesModelLoc :EABConsoleModelLocator = EABConsoleModelLocator.getInstance();
		
		private var feNavModel :EditorNavigatorModel = 
				EABConsoleModelLocator.getInstance().getEditorNavigatorModel();
		private var bpelEditorVH :BpelEditorVH;		
		
		private var _fileID :String;
		
		private var _relativeFigureFileID :String;
		
		private var _bpelText :String;
		
		private var _backupbpelText :String = null;
		
		private var bpelCreator :BpelCreator = new BpelCreator();
		
		public function BpelEditorModel(fileID :String, relativeFigureFileID :String){
			this._fileID = fileID;
			this._relativeFigureFileID = relativeFigureFileID;
		}
		
		public function get fileID():String{
			return this._fileID;
		}
		
		public function get relativeFigureFileID() :String{
			return this._relativeFigureFileID;
		}
		
		
		/**
		 * use the relative figureFile to init bpel textArea. 
		 * if can not find the figureFile, then do nothing.
		 */
		public function updateBpelTextByFigure() :String{
//			var feModel :FigureEditorModel = feNavModel.getFigureEditorModel(_relativeFigureFileID);
//			if( feModel != null ){
//				this._bpelText = bpelCreator.outBpelStirng( ProcessFigure(feModel.rootFigure) );
//			}
			return this._bpelText;
		}
		/**
		 * If BPELText is Changed, return true,
		 * or else return false.
		 */
		public function isChanged() : Boolean {
			var isChanged : Boolean = true;
			
			this._backupbpelText = this._bpelText;
			if(this._backupbpelText != null) {
				if( ViewLocator.getInstance().registrationExistsFor(BpelEditorVH.getViewHelperKey(this.fileID)))
					bpelEditorVH = ViewLocator.getInstance().getViewHelper(BpelEditorVH.getViewHelperKey(this.fileID)) as BpelEditorVH;
				var currentbpelText : String = bpelEditorVH.getbpelTextString();
				if(this._backupbpelText.localeCompare(currentbpelText) == 0) {
					isChanged = false;
				}
			}
			return isChanged;
		}
		
		/**
		 * Use the activeFigureEditorModel.rootFigure to init bpel textArea
		 */
		public function updateBpelTextByActiveFEModel() :String{
//			this._bpelText = bpelCreator.outBpelStirng(
//					ProcessFigure(orDesModelLoc.getFigureEditorNavigatorModel().activeFigureEditorModel.rootFigure) );
			return this._bpelText;
		}
		/**
		 * Use the BPELText to init bpel textArea
		 */
		public function updateBpelTextByBpelText(message :String) :void{
			this._bpelText = message;
		}
		/**
		 * Get the current content of BPELEditor's BPELText.
		 */
		public function getcurrentbpelText() :String{
			if( ViewLocator.getInstance().registrationExistsFor(BpelEditorVH.getViewHelperKey(this.fileID)))
					bpelEditorVH = ViewLocator.getInstance().getViewHelper(BpelEditorVH.getViewHelperKey(this.fileID)) as BpelEditorVH;
			var currentbpelText : String = bpelEditorVH.getbpelTextString();
			return currentbpelText;
		}
		public function get bpelText() :String{
			return this._bpelText;
		}
		public function set bpelText(bpelText :String):void{
			this._bpelText = bpelText;
		}
	}
	
}