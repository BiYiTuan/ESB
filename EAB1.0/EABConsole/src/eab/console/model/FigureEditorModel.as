package eab.console.model{
	
	import eab.console.figure.*;
	
	import mx.binding.utils.BindingUtils;
	import mx.collections.ArrayCollection

	public class FigureEditorModel{
		[Bindable]
		public var _flowViewData : XML;
		
		[Bindable]
		public function get flowViewData() : XML{
			return _flowViewData;
		}
		
		public function set flowViewData(viewData : XML) : void{
			_flowViewData = viewData;
			_rootFigure.readInformationToFigure(flowViewData);
		}	
		
		[Bindable]
		public var _parameterData :ArrayCollection;
		
		[Bindable]
		public function get parameterData() : ArrayCollection{
			return _parameterData;
		}
		
		public function set parameterData(paraData : ArrayCollection) : void{
			_parameterData = paraData;
			_rootFigure.setParameters(paraData);
		}	

		private var _rootFigure : IFigure;

		private var _selectedFigures :Array;

		private var _overFigure:IFigure;
		
		private var _canvasXML:XML = null;
		
		private var _backupCanvasXML : XML = null;
		
		private var _fileID :String;
		
		private var _relativeBpelFileID :String;
		
		[Bindable]
		public var _showingMultiple:Number=1;		
		
		/**
		 * store local id manager
		 */
		public var idManager :FigureIDManager = new FigureIDManager();
		
		
		public function FigureEditorModel(){
			super();
			this._rootFigure = new ProcessFigure();
			this._selectedFigures = new Array();
			
			BindingUtils.bindSetter(this.smChange,this,"_showingMultiple");
		}
		
		public function isChanged() : Boolean {
			var isChanged : Boolean = true;
			
			if(this._canvasXML.toXMLString().localeCompare("<Process/>") == 0) {
				isChanged = false;
			}
			else if(this._backupCanvasXML != null) {
				var backupCanvasXMLString : String = this._backupCanvasXML.toXMLString();
				var currentCanvasXMLString : String = this._canvasXML.toXMLString();
				if(backupCanvasXMLString.localeCompare(currentCanvasXMLString) == 0) {
					isChanged = false;
				}
			}
			
			return isChanged;
		}
		
		public function updateCanvasXML():void{
			this._canvasXML = _rootFigure.outputAllInformation();
		}
		
		public function saveCanvasXML() : void {
			updateCanvasXML();
			this._backupCanvasXML = this._canvasXML.copy();
		}
		
		public function unsaveCanvasXML() : void {
			if(this._backupCanvasXML == null)
				this._canvasXML = <Process/>;
			else
				this._canvasXML = this._backupCanvasXML.copy();
		}
		
		public function get canvasXML() :XML {
			return this._canvasXML;
		}
		
		
		public function get fileID():String{
			return this._fileID;
		}
		
		public function get relativeBpelID():String{
			return this._relativeBpelFileID;
		}
		
		public function set relativeBpelID(bpelID :String) :void{
			this._relativeBpelFileID = bpelID;
		}
		
		public function set showingMultiple(sm:Number):void{
			this._showingMultiple = sm;
		}
		
		public function get showingMultiple():Number{
			return this._showingMultiple;
		}
		
		/**
		 * Clear elements of selectedfigure
		 * redraw selected elements
		 */
		public function resetSelectedFigure() :void{
			for(var i:int=0; i<_selectedFigures.length; i++){
				IFigure(_selectedFigures[i]).setSelected(false);
				IFigure(_selectedFigures[i]).setIsShowContextPanel(false);
				IFigure(_selectedFigures[i]).updateDraw();
			}
			_selectedFigures.splice(0, _selectedFigures.length);
		}
		
		
		/**
		 * Clear elements of selectedfigure not redraw selected elements
		 */
		public function clearSelectedFigure() :void{
			for(var i:int=0; i<_selectedFigures.length; i++){
				IFigure(_selectedFigures[i]).setSelected(false);
			}
			_selectedFigures.splice(0, _selectedFigures.length);
		}
		
		public function get rootFigure() :IFigure{
			return this._rootFigure;
		}
		
		public function get selectedFigures() :Array{
			return this._selectedFigures;
		}
		
		public function get overFigure():IFigure{
			return this._overFigure;
		}
		
		public function set overFigure(ifi:IFigure):void{
			this._overFigure = ifi;
		}
		protected function smChange(sm:Number):void{
			var ar:Array=new Array();
			var con:Array=new Array();
			if(this.rootFigure is ProcessFigure){
				ProcessFigure(this.rootFigure).multiple=this.showingMultiple;
			}
			this.rootFigure.ifiguretoarray(ar);
			var i:int;
			for(i=0;i<ar.length;i++){
				IFigure(ar[i]).setMultiple(this.showingMultiple);
				if(ar[i] is ConnectionFigure){
					con.push(ar[i]);
				}
			}
			for(i=0;i<con.length;i++){
				ConnectionFigure(con[i]).autoSetAnchor();
			}
			for(i=0;i<ar.length;i++){
				IFigure(ar[i]).updateDraw();
			}
		}
		
	}
}