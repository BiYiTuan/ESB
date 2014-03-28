package eab.console.view
{
	import mx.binding.utils.BindingUtils;
	import mx.controls.TextArea;
	
	import eab.console.model.*;
	import eab.console.viewhelper.BpelEditorVH;
	
	/**
	 * The editor for BPEL file.
	 */
	public class BpelEditor extends EditorNavigatorChild{
		
		private var _textArea :TextArea = new TextArea;
		
		private var _bpelEditorModel :BpelEditorModel = null;
		
		private var bpelEditorVH :BpelEditorVH;

		/**
		 * Initialize the BPELEditor.
		 */
		public function BpelEditor(filePath :String, fileName :String, beModel :BpelEditorModel){
			
//			super(beModel.fileID, filePath);
			
			this.percentHeight = 100;
			this.setStyle("headerHeight","5");
			this.percentWidth = 100;
			_textArea.percentHeight=100;
			_textArea.percentWidth=100;
			this.addChild(_textArea);
			
			this.label = fileName;
//			this.type = EditorNavigatorChild.BPEL_EDITOR_TYPE;
			
			//model
			this._bpelEditorModel = beModel;

			//view helper
			this.bpelEditorVH = new BpelEditorVH(this, BpelEditorVH.getViewHelperKey(beModel.fileID));
			
			BindingUtils.bindProperty(textArea, "htmlText" ,this._bpelEditorModel, "bpelText");
		}
		/**
		 * Return BPELEditorModel.
		 */
		public function get bpelEditorModel():BpelEditorModel {
			return this._bpelEditorModel;
		}
		/**
		 * Return textArea.
		 */
		public function get textArea() :TextArea{
			return this._textArea;
		}
		/**
		 * Return the content of the textArea.
		 */
		public function getBPELString() :String{
			return this._textArea.htmlText;
		}
	}
}