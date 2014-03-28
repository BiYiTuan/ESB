package eab.console.viewhelper
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import mx.containers.HDividedBox;
	import mx.events.DividerEvent;
	import mx.events.ItemClickEvent;
	
	import eab.framework.view.ViewHelper;
	import eab.console.events.FigureEditorAppEvent;
	import eab.console.figure.IFigure;
	import eab.console.model.EditorNavigatorModel;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.view.FigureEditor;
	
	/**
	 * The ViewHelper of FigureEditor.
	 * Used to isolate command classes from the implementation details of a view.
	 */
	public class FigureEditorVH extends ViewHelper{
		
		/**
		 * Return the key of FigureEditorVH.
		 */
		public static function getViewHelperKey(fileID :String) :String{
			return "VH:" + fileID;
		}
		
		/**
		 * Initialize FigureEditor with FigureEditorVH.
		 */
		public function FigureEditorVH(document : Object, id : String){
			super();
			initialized(document, id);
		}
		
		/**
		 * Return FigureEditor
		 */
		private function get figureEditor() :FigureEditor{
			return this.view as FigureEditor;
		}

		/**
		 * Return the filePath binding with this BPELEditorVH.
		 */
		public function get filePath():String{
//			return this.figureEditor.filePath;
			return "";
		}
		
		/**
		 * Set the filePath binding with this BPELEditorVH.
		 */
		public function set filePath(filePath :String):void{
//			this.figureEditor.filePath = filePath;
			this.figureEditor.label = filePath.substring(filePath.lastIndexOf("\\", filePath.length) + 1, filePath.length);
		}
		/**
		 * Set the content of bpelText in figureEditor.
		 */
		public function setFEXMLContent(xmlString :String) :void {
			this.figureEditor.setXMLContent(xmlString);
		} 
		
		/**
		 * update the canvas
		 */
		public function updateFigureCanvas() :void{
			this.figureEditor.figureCanvas.updateFigure();
		}
		
		public function loadGraphFile() :void{
			this.figureEditor.loadGraphFile();
		}
		/**
		 * Remove figures form the canvas.
		 */
		public function removeFiguresFromCanvas(figure :DisplayObject) :void{
			if(this.figureEditor.figureCanvas.contains(figure)){
				this.figureEditor.figureCanvas.removeChild(figure);
			}
		}
		/**
		 * add figures to canvas.
		 */
		public function addFigureToCanvas(figure :DisplayObject) :void{
			this.figureEditor.figureCanvas.addChild(figure);
		}
		
		/**
		 * Handler of BPEL view
		 * @param event
		 */
		public function onItemClickHandle(event :ItemClickEvent) :void{
			var bnLabel :String = event.label;
			
			if(bnLabel == "BPEL") {
				new FigureEditorAppEvent(FigureEditorAppEvent.CHANGE_To_XML_VIEW,
				{figureEditor:this.view}).dispatch();
			}
		}
		
		/**
		 * SystemEvent handle
		 * @param event
		 */
		public function dividerReleaseHandle(event :DividerEvent) :void {
			var newWidth :Number = HDividedBox(event.target).getDividerAt(0).x;
			this.figureEditor.figureCanvas.changeWidth(newWidth);
		}
		
	}
}