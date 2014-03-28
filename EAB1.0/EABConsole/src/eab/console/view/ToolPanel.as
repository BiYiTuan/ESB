package eab.console.view{

	import eab.console.business.EABConsoleServiceLocator;
	import eab.console.events.ToolPanelAppEvent;
	import eab.console.figure.FigureFactory;
	import eab.console.model.EABConsoleModelLocator;
	import eab.console.other.Localizator;
	import eab.console.state.SelectionState;
	
	import flash.events.MouseEvent;
	
	import mx.containers.Accordion;
	import mx.containers.Box;
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.controls.LinkButton;
	import mx.events.ListEvent;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class ToolPanel extends Box{
		
		[Bindable]
        [Embed(source="../assets/icon/container/palette.gif")]
        public var palette :Class;

		[Bindable]
        [Embed(source="../assets/icon/accordion/folder.gif")]
        public var folder :Class;
		
		private var accordion :Accordion = new Accordion();
		
		private var basicBox :VBox;
		
		private var basicToolTile :ToolTile = new ToolTile();
		
		private var serviceBox :VBox;
		
		private var serviceToolTile :ToolTile = new ToolTile();		
	
		private var basicArray :Array = new Array();
		
		private var serviceArray :Array = new Array();
		
		private var localizator :Localizator;
						  
		private var isSelected:Boolean=false;
		
		public function ToolPanel(){
			super();
			this.percentHeight = 100;
			this.percentWidth = 100;
			this.localizator = Localizator.getInstance();
			this.label = localizator.getText('toolpanel.label');
			this.icon = palette;

			initAccordion();			
			addChild(accordion);
			
			updateServiceBox();
		}
		
		private function initAccordion() :void{
			
			accordion.percentHeight = 100;
			accordion.percentWidth = 100;
			accordion.buttonMode = true;
			
			initBasicBox();			
			initServiceBox();
			
			accordion.addChild(basicBox);
			accordion.addChild(serviceBox);
			
			setHeader();
		}
		
		private function initBasicData() :void{		
			var figureArray : Array = FigureFactory.listBasicFigure();

			for each(var key:Object in figureArray){
				basicArray.push({data:null, id:key, name:FigureFactory.id2name(key as int)});
			}
		}
		
		private function initBasicBox() :void{
			initBasicData();
			basicBox = new VBox();
			basicBox.label = localizator.getText('toolpanel.basic');
			basicBox.percentHeight = 100;
			basicBox.percentWidth = 100;
			basicToolTile.setToolData(basicArray);
			basicBox.addChild(basicToolTile);
			basicToolTile.initArray();
			basicToolTile.addEventListener(ListEvent.ITEM_CLICK, this.itemClickHandle);
			basicBox.addEventListener(MouseEvent.CLICK,basicboxClickHandle);
		}
		
		private function initServiceBox() :void{			
			serviceBox = new VBox();
			serviceBox.label = localizator.getText('toolpanel.service');
			serviceBox.percentHeight = 100;
			serviceBox.percentWidth = 100;			
			
			serviceBox.addChild(serviceToolTile);
						
			serviceToolTile.addEventListener(ListEvent.ITEM_CLICK, this.itemClickHandle);
			serviceBox.addEventListener(MouseEvent.CLICK, serviceboxClickHandle);
		}
		
		private function updateServiceBox():void{
			var ro : RemoteObject = EABConsoleServiceLocator.getInstance().GetRemoteObject("services");
			ro.listService(1, 1000);
            ro.addEventListener(ResultEvent.RESULT, getServiceListResult);
            ro.addEventListener(FaultEvent.FAULT, fault);
		}
		
		private function getServiceListResult(event :ResultEvent):void{
			for each(var item:Object in event.result.valueOf()){
				serviceArray.push({id:FigureFactory.ACTIVITY_FIGURE_ID, name:item.uniqueServiceName, data:item});
			}
			serviceToolTile.setToolData(serviceArray);
			serviceToolTile.initArray();
   		}
   		
 		private function fault(event :FaultEvent):void{
        	Alert.show("Remote invoke error: "+event.message);
        }  
		
		private function setHeader() :void{			
			var idx :uint; 
            var len :uint = accordion.numChildren; 
            var btn:Button; 
            for (idx=0; idx<len; idx++) { 
                btn = accordion.getHeaderAt(idx); 
                btn.useHandCursor = true; 
                btn.buttonMode = true; 
                btn.setStyle("icon", folder); 
            } 

		}
		
		private function itemClickHandle(event : ListEvent) :void {
			
			isSelected=true;
			var selectedFigureData :Object = event.itemRenderer.data.data;
			var selectedFigId : int = selectedFigureData.id;
			
			new ToolPanelAppEvent( ToolPanelAppEvent.SELECT_FIGURE,
				{selectedFigureId :selectedFigId, figureData : selectedFigureData} ).dispatch();
	
		}
		
		private function basicboxClickHandle(event:MouseEvent):void{
			if(!isSelected){
				this.resetAllSelections();
			}
			else{
				isSelected=false;
			}
		}
		
		private function serviceboxClickHandle(event:MouseEvent):void{
			if(!isSelected){
				this.resetAllSelections();
			}
			else{
				isSelected=false;
			}
			
		}

		public function resetAllSelections():void{
			this.basicToolTile.selectedIndex=-1;
			this.serviceToolTile.selectedIndex=-1;
			EABConsoleModelLocator.getInstance().getFigureCanvasStateDomain().setFCActiveState(new SelectionState());
		}
	}
}