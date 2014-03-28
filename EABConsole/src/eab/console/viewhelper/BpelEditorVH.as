package eab.console.viewhelper
{
	import eab.framework.view.ViewHelper;
	import eab.console.view.BpelEditor;
	
	/**
	 * The ViewHelper of BPELEditor.
	 * Used to isolate command classes from the implementation details of a view.
	 */
	public class BpelEditorVH extends ViewHelper{
					
		/**
		 * Return the key of BPELEditorVH.
		 */
		public static function getViewHelperKey(fileID :String) :String{
			return "VH:" + fileID;
		}
		
		/**
		 * Initialize BpelEditor with BPELEditorVH.
		 */
		public function BpelEditorVH(document : Object, id : String){
			super();
			initialized(document, id);
		}
		/**
		 * Return BPELEditor.
		 */
		private function get bpelEditor() :BpelEditor{
			return this.view as BpelEditor;
		}
		/**
		 * Return the filePath binding with this BPELEditorVH.
		 */
		public function get filePath():String{
//			return this.bpelEditor.filePath;
			return "";
		}
		/**
		 * Set the filePath binding with this BPELEditorVH.
		 */
		public function set filePath(filePath :String):void{
//			this.bpelEditor.filePath = filePath;
			this.bpelEditor.label = filePath.substring(filePath.lastIndexOf("\\", filePath.length) + 1, filePath.length);
		}
		/**
		 * Get the content of the BPELText in BPELEditor.
		 */
		public function getbpelTextString():String{
			return this.bpelEditor.textArea.htmlText;
		}
		/**
		 * Updata the content of the BPELText in BPELEditor.
		 */
		public function updateTextArea( bpelString :String ):void{
			this.bpelEditor.textArea.htmlText = bpelString;
		}
	}
}