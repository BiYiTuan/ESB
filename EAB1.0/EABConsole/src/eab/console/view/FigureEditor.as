package eab.console.view{
	
	import mx.binding.utils.BindingUtils;
	import mx.containers.HBox;
	import mx.containers.HDividedBox;
	import mx.containers.TabNavigator;
	import mx.containers.ViewStack;
	import mx.controls.LinkBar;
	import mx.controls.TextArea;
	import mx.events.DividerEvent;
	import mx.events.FlexEvent;
	import mx.events.ItemClickEvent;
	
	import eab.console.figure.AbstractFigure;
	import eab.console.figure.ConnectionFigure;
	import eab.console.figure.IFigure;
	import eab.console.figure.ProcessFigure;
	import eab.console.model.*;
	import eab.console.other.Localizator;
	import eab.console.viewhelper.FigureEditorVH;
	
	/**
	 * The Editor for figure file.
	 */
	public class FigureEditor extends EditorNavigatorChild{
		
		private var linkBar :LinkBar;
		
		private var viewStack :ViewStack;
		
		private var _graphicalView :HDividedBox;
		
		private var _figureCanvas :FigureCanvas;
		
		private var _toolPanel :ToolPanel;
		
		private var _xmlText :TextArea;
		
		private var _bpelText : TextArea;

		//model attribute
		private var _figureEditorModel :FigureEditorModel = null;
		
		//view helper
		private var figureEditorVH :FigureEditorVH;
		
		private var localizator :Localizator;

		/**
		 * Create a new FigureEditor by filePath, fileName and feModel.
		 */
		public function FigureEditor(filePath :String, fileName :String, feModel :FigureEditorModel){
			
//			super(feModel.fileID, filePath);
			
			//component view init
			this.percentWidth = 100;
			this.percentHeight = 100;
			
//			this.type = EditorNavigatorChild.FIGURE_EDITOR_TYPE;
			this.label = fileName;
			this._figureEditorModel = feModel;
			
			
			//view helper
			figureEditorVH = new FigureEditorVH( this, FigureEditorVH.getViewHelperKey(feModel.fileID) );
			this.localizator = Localizator.getInstance();
			
			viewStack = new ViewStack();
			viewStack.percentHeight = 100;
			viewStack.percentWidth = 100;
			
//			_figureCanvas = new FigureCanvas(_figureEditorModel);
			
			
			_graphicalView = new HDividedBox();
			_graphicalView.percentHeight = 95;
			_graphicalView.percentWidth = 100;
			_graphicalView.setStyle("borderStyle", "solid");
			_graphicalView.label = localizator.getText('figureeditor.graphic');
			_graphicalView.addEventListener(DividerEvent.DIVIDER_RELEASE, figureEditorVH.dividerReleaseHandle);
			
			
			_figureCanvas.percentHeight = 95;
			_figureCanvas.percentWidth = 100;
			_figureCanvas.label= localizator.getText('figureeditor.graphic');
			
			_graphicalView.addChild(_figureCanvas);
			
			_toolPanel = new ToolPanel();
			
			//toolPanel layout
			var toolPanelTabNav :TabNavigator = new TabNavigator();
			toolPanelTabNav.percentWidth = 20;
			toolPanelTabNav.percentHeight = 100;
			toolPanelTabNav.addChild(_toolPanel);
			
			_graphicalView.addChild(toolPanelTabNav);
			
			var xmlHBox :HBox = new HBox();
			xmlHBox.percentWidth = 100;
			xmlHBox.percentHeight = 90;
			xmlHBox.label =  localizator.getText('figureeditor.bpel');//modified from "XML" to "BPEL"
			xmlHBox.percentHeight = 100;
			xmlHBox.percentWidth = 100;
			
			_bpelText = new TextArea();
			_bpelText.percentWidth = 100;
			_bpelText.percentHeight = 100;
			_bpelText.editable = false;	
			BindingUtils.bindSetter(setXMLContent, _bpelText,"text");
			xmlHBox.addChild(_bpelText);
			
//			_xmlText = new TextArea();
//			_xmlText.percentWidth = 100;
//			_xmlText.percentHeight = 100;
//			_xmlText.editable = false;
//			BindingUtils.bindSetter(setXMLContent, _xmlText,"text");
//			xmlHBox.addChild(_xmlText);
			
			
			viewStack.addChild(_graphicalView);
			viewStack.addChild(xmlHBox);
			viewStack.percentHeight = 100;
			viewStack.percentWidth = 100;
			
			linkBar = new LinkBar();
			linkBar.dataProvider = viewStack;
			linkBar.percentHeight = 100;
			linkBar.percentWidth = 40;
			linkBar.addEventListener(ItemClickEvent.ITEM_CLICK, figureEditorVH.onItemClickHandle);
			
			//modified by zjn
//			var bpelButton:LinkButton = new LinkButton();
//			bpelButton.percentWidth = 5;
//			bpelButton.percentHeight = 100;
//			bpelButton.label="Create BPEL";
//			bpelButton.addEventListener(MouseEvent.CLICK, figureEditorVH.onBpelHandle);

			var bpelBox:HBox = new HBox;
			bpelBox.percentWidth = 100;
			bpelBox.percentHeight = 5;
			bpelBox.addChild(linkBar);
//			bpelBox.addChild(bpelButton);
			
			this.addChild(viewStack);
			this.addChild(bpelBox);
			this.setStyle("headerHeight","5");
			
			//must loadGraphFile after figureEditor creation, by lizq
			this.loadGraphFile(); 
		}
		
		/**
		 * Set figureEditorModel.
		 */
		public function set figureEditorModel(feModel:FigureEditorModel):void {
			this._figureEditorModel = feModel;
			this._figureCanvas.setFigureEditorModel(feModel);
		}
		/**
		 * Return figureEditorModel
		 */
		public function get figureEditorModel():FigureEditorModel {
			return this._figureEditorModel;
		}
		
		/**
		 * return figureCanvas.
		 */
		public function get figureCanvas() :FigureCanvas{  
			return this._figureCanvas;
		}
		/**
		 * Return toolPanel.
		 */
		public function get toolPanel():ToolPanel{
			return this._toolPanel;
		}
		/**
		 * Set the content of bpelText.
		 */
		public function setXMLContent(xmlString :String) :void {
			this._bpelText.htmlText = xmlString;
		} 
		/**
		 * return the content of bpelText.
		 */
		public function getXMLContent() :String {
			return this._xmlText.text;
		}
		/**
		 * Initialize the canvas by a graphFile.
		 */
		public function loadGraphFile() :void {
			
			this._figureCanvas.updateFigure();//2009/9/24 为协同添加
			
			if( this.figureEditorModel.canvasXML != null ){
				
				this._figureEditorModel.resetSelectedFigure();
				
				var rootFig :ProcessFigure = ProcessFigure(this._figureEditorModel.rootFigure);
				
				rootFig.readInformationToFigure(this.figureEditorModel.canvasXML);
				
				//to draw the figures
				var figArray :Array = new Array();
				rootFig.ifiguretoarray(figArray);
				
				var fig:IFigure;
				
				var connection :Array = new Array();
				
				for(var i:int=0; i<figArray.length; i++){
					
					fig = figArray[i] as IFigure;
					
					if(fig is ConnectionFigure){
						connection.push(fig);
					}
					AbstractFigure(fig).addEventListener(FlexEvent.CREATION_COMPLETE,CreationComplete);
					this.figureCanvas.addChild(AbstractFigure(fig));
				}
				this._figureEditorModel._showingMultiple=1;

				for(i=0; i<connection.length; i++){
					ConnectionFigure(connection[i]).autoSetAnchor();
				}
			}
			
		}
		private function CreationComplete(event:FlexEvent):void{
			AbstractFigure(event.currentTarget).updateDraw();
			AbstractFigure(event.currentTarget).removeEventListener(FlexEvent.CREATION_COMPLETE,CreationComplete);
		}
	}
}