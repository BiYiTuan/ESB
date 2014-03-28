package eab.console.view{
	
	import eab.console.events.AttributeViewAppEvent;
	import eab.console.figure.*;
	import eab.console.model.*;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Canvas;
	import mx.controls.Tree;
	import mx.core.DragSource;
	import mx.core.IUIComponent;
	import mx.effects.Fade;
	import mx.effects.IEffectInstance;
	import mx.effects.Iris;
	import mx.effects.Parallel;
	import mx.effects.Rotate;
	import mx.effects.WipeDown;
	import mx.events.DragEvent;
	import mx.events.FlexEvent;
	import mx.events.ResizeEvent;
	import mx.events.ScrollEvent;
	import mx.events.ScrollEventDirection;
	import mx.managers.DragManager;
	import mx.managers.PopUpManager;

	public class FigureCanvas extends Canvas{
		
		private static var grapWidth: Number = 25;
		
		private var figureEditorModel : FigureEditorModel = new FigureEditorModel();
		
		private var figureCanvasStateDomain : EABConsoleModelLocator = 
			EABConsoleModelLocator.getInstance();
		
		[Bindable]
		public function get flowViewData() : XML{
			return figureEditorModel.flowViewData;
		}
		
		public function set flowViewData(viewData : XML) : void{
			figureEditorModel.flowViewData = viewData;
			updateFigure();
		}	
		
		[Bindable]
		public function get parameterData() : ArrayCollection{
			return figureEditorModel.parameterData;
		}
		
		public function set parameterData(paraData : ArrayCollection) : void{
			figureEditorModel.parameterData = paraData;
			updateFigure();
		}	
		
		/**
		 * Create a new canvas by the figureEditorModel.
		 */
//		public function FigureCanvas(figureEditorModel :FigureEditorModel){
//			super();
//
//			this.styleName="GraphicalViewerStyle";
//			this.percentWidth = 100;
//			this.percentHeight = 100;
//			
//			this._editorModel = figureEditorModel;
//			
//			this.doubleClickEnabled = true;
//			this.initEventListener();
//		}

		public function FigureCanvas(){
			super();
			
			this.styleName="GraphicalViewerStyle";
			this.percentWidth = 100;
			this.percentHeight = 100;
			
//			this._editorModel = figureEditorModel;
			
			this.doubleClickEnabled = true;
			this.initEventListener();
		}
		
		
		private function initEventListener() :void{
			
			//draw vertical or hierachical lines on the canvas
			this.addEventListener(FlexEvent.CREATION_COMPLETE, onInitializeHandle);
			
			this.addEventListener(ResizeEvent.RESIZE, repaintCanvasHandle);
			
			this.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandle);
			
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandle);
			
			this.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandle);
			
			this.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandle);
			
			this.addEventListener(MouseEvent.CLICK, mouseClickHandle);
			
			this.addEventListener(MouseEvent.ROLL_OUT, mouseRollOutHandle);
			
			this.addEventListener(MouseEvent.ROLL_OVER, mouseRollOverHandle); 
			
			this.addEventListener(FlexEvent.SHOW, showEffectHandle);
			
			this.addEventListener(DragEvent.DRAG_ENTER, dragEnterHandle);
			
			this.addEventListener(DragEvent.DRAG_DROP, dragDropHandle);
			
			this.addEventListener(DragEvent.DRAG_OVER, dragOverHandle);
			
			this.addEventListener(MouseEvent.DOUBLE_CLICK, doubleClickHandle);
			
//			this.addEventListener(FlexEvent.SHOW,showHandle);
			this.addEventListener(FlexEvent.SHOW,onInitializeHandle);
			
			this.addEventListener(ScrollEvent.SCROLL,scrollHandle);
			
		}		
			
		/**
		 * Set the figureEditorModel
		 */
		public function setFigureEditorModel(feModel :FigureEditorModel) :void {
			this.figureEditorModel = feModel;
		}
		
		public function getFigureEditorModel():FigureEditorModel{
			return this.figureEditorModel;
		}
		/**
		 * Change the width of the canvas.
		 */
		public function changeWidth(newWidth :Number) :void {
			this.width = newWidth;
		}
		
		private function doubleClickHandle(event : MouseEvent) : void {
			this.setFocus();
			var ox :Number = FigureCanvas(event.currentTarget).mouseX;
			var oy :Number = FigureCanvas(event.currentTarget).mouseY;
			var point :Point = new Point(ox+this.horizontalScrollPosition,oy+this.verticalScrollPosition);
			
			var tempFigure :IFigure = this.figureEditorModel.rootFigure.getupperfigure(point.x,point.y);
//			if(tempFigure is SubProcessow2Figure) {
//				var figureEditorVH :FigureEditorVH = 
//					ViewLocator.getInstance().getViewHelper(FigureEditorVH.getViewHelperKey(this.figureEditorModel.fileID)) as FigureEditorVH;
//				
//				SubProcessow2Figure(tempFigure).filePath = figureEditorVH.filePath;
//				new FigureCanvasAppEvent(FigureCanvasAppEvent.OPEN_SUBPROCESS, 
//					{subProcessFigure:tempFigure}).dispatch();
//			}
		}

		private function dragOverHandle(event :DragEvent):void{
			if(event.dragInitiator is Tree)
				DragManager.showFeedback(DragManager.COPY);
		}

		private function dragEnterHandle(event:DragEvent):void {
			var ds :DragSource = event.dragSource;
			if(ds.hasFormat("items"))
				DragManager.acceptDragDrop((event.target as IUIComponent));
			else if(ds.hasFormat("treeItems")) {
				DragManager.acceptDragDrop((event.target as IUIComponent));
			}
		}
		
		private function dragDropHandle(event:DragEvent):void {
			var toolPanelModel :ToolPanelModel = EABConsoleModelLocator.getInstance().getToolPanelModel();
			
			if(event.dragSource.hasFormat("items")) {

				var items:Array = event.dragSource.dataForFormat("items") as Array;
				
				for each(var obj:Object in items) {
					var figureData : Object = obj.data;

					if(figureData.id == FigureFactory.LINK_FIGURE_ID)
						return;
					
					var figure:AbstractFigure = FigureFactory.createFigure(figureData.id) as AbstractFigure;
					if(figure == null)
						return;

					if(figure is Startow2Figure){
						var arr:Array=new Array();
						figureEditorModel.rootFigure.ifiguretoarray(arr);
						for(var i:int = 0; i < arr.length; i++){
							if(arr[i] is Startow2Figure){
								var fcfw :FigureCreateFailedWarning = PopUpManager.createPopUp(this,
																	 FigureCreateFailedWarning, true) as FigureCreateFailedWarning;		
								PopUpManager.centerPopUp(fcfw);
								return;
							}
						}
					} 
					
					if(figure is Endow2Figure){
						arr=new Array();
						figureEditorModel.rootFigure.ifiguretoarray(arr);
						for(i = 0; i < arr.length; i++){
							if(arr[i] is Endow2Figure){
								fcfw = PopUpManager.createPopUp(EABConsoleModelLocator.getInstance().getEABConsole(),
																 FigureCreateFailedWarning, true) as FigureCreateFailedWarning;		
								PopUpManager.centerPopUp(fcfw);
								return;
							}
						}
					}
										
					figure.figureName = figureData.name;
					
					if(figure is Activityow2Figure){
						var new_atts:ArrayCollection = new ArrayCollection();
						new_atts.addItem({name: "Service: ", value: figureData.name});
						figure.setAttribute(new_atts);
					}

					figure.setMultiple(this.figureEditorModel._showingMultiple);
					figure.setxy(event.localX,event.localY);
					figure.setID(figureEditorModel.idManager.getAvailabelId());
					
					addChild(figure);
					figureEditorModel.rootFigure.addchild(figure);
					figure.updateDraw();
				}
			}
			else if(event.dragSource.hasFormat("treeItems")) {
				var treeItems : Array = event.dragSource.dataForFormat("treeItems") as Array;
				for each(var treeXml : XML in treeItems) {
//					if(treeXml.@type != FigureEditorNavigatorChild.FIGURE_EDITOR_TYPE)
//						return;
					var idXML : XMLList = treeXml.@ID;
					var fileNameXNL : XMLList = treeXml.@name;
					var fileId : String = idXML.toString();
					var fileName : String = fileNameXNL.toString();
					
					var sbDrawId : int = FigureFactory.nametoid("SubProcess");
					var subProcessFigure : SubProcessow2Figure = SubProcessow2Figure(FigureFactory.createFigure(sbDrawId));

					subProcessFigure.setID(this.figureEditorModel.idManager.getAvailabelId());
					subProcessFigure.setMultiple(this.figureEditorModel._showingMultiple);
					subProcessFigure.setxy(event.localX,event.localY);
					subProcessFigure.setSubProcessFileName(fileName);
					subProcessFigure.setSubProcessFileID(fileId);
					
					this.addChild(subProcessFigure);
					this.figureEditorModel.rootFigure.addchild(subProcessFigure);
					subProcessFigure.updateDraw();
				}
			}
			
		}

		private function UpdateFigureHandle(event:Event):void{
			this.updateFigure();
		}

		private function onInitializeHandle(event :Event): void{
			
			renderCanvas();
			
//			figureEditorModel = new FigureEditorModel(flowViewData);
//			
//			if(flowViewData != null)
//				updateFigure();
			
			
			
//			this.notifyMicroimageUpdate();
		}

		private function repaintCanvasHandle(event :ResizeEvent) :void {
			renderCanvas();
		}
		
		private function mouseMoveHandle(event:MouseEvent):void{
			var ox :Number = FigureCanvas(event.currentTarget).mouseX;
			var oy :Number = FigureCanvas(event.currentTarget).mouseY;
			var point :Point = new Point( ox+this.horizontalScrollPosition, oy+this.verticalScrollPosition );
			figureCanvasStateDomain.getFigureCanvasStateDomain().mouseMove(point,event);
			
//			this.notifyMicroimageUpdate();
		}

		private function mouseDownHandle(event:MouseEvent):void{
			
			
			this.setFocus();
			
			if(this.verticalScrollBar){
				if(Canvas(event.currentTarget).mouseX>=this.verticalScrollBar.x
				&&Canvas(event.currentTarget).mouseX<=this.verticalScrollBar.x+this.verticalScrollBar.width
				&&Canvas(event.currentTarget).mouseY>=this.verticalScrollBar.y
				&&Canvas(event.currentTarget).mouseY<=this.verticalScrollBar.y+this.verticalScrollBar.height){
					return;
				}
			}
			if(this.horizontalScrollBar){
				if(Canvas(event.currentTarget).mouseX>=this.horizontalScrollBar.x
				&&Canvas(event.currentTarget).mouseX<=this.horizontalScrollBar.x+this.horizontalScrollBar.width
				&&Canvas(event.currentTarget).mouseY>=this.horizontalScrollBar.y
				&&Canvas(event.currentTarget).mouseY<=this.horizontalScrollBar.y+this.horizontalScrollBar.height){
					return;
				}
			}			
			
			var ox :Number = FigureCanvas(event.currentTarget).mouseX;
			var oy :Number = FigureCanvas(event.currentTarget).mouseY;
			var point :Point = new Point(ox+this.horizontalScrollPosition,oy+this.verticalScrollPosition);
			
			//if selected, bubble the current figure's attributes event
			var tempFigure :IFigure = this.figureEditorModel.rootFigure.getupperfigure(point.x,point.y);
			new AttributeViewAppEvent(AttributeViewAppEvent.ATTRIBUTEVIEW_UPDATE, 
					{selectedFigure:tempFigure} ).dispatch();
			
			//Delegate
			figureCanvasStateDomain.getFigureCanvasStateDomain().mouseDown(point, event);
		}

		private function mouseUpHandle(event:MouseEvent):void{
			var ox :Number = FigureCanvas(event.currentTarget).mouseX;
			var oy :Number = FigureCanvas(event.currentTarget).mouseY;
			var point :Point = new Point(ox+this.horizontalScrollPosition,oy + this.verticalScrollPosition);
			figureCanvasStateDomain.getFigureCanvasStateDomain().mouseUp(point, event);
		}

		private function keyDownHandle(event:KeyboardEvent):void{
			figureCanvasStateDomain.getFigureCanvasStateDomain().keyDown(event);
		}
		
		
		/**
		 * Delegate
		 * @param event
		 * 
		 */
		private function mouseClickHandle(event:MouseEvent):void{
			var ox:Number = FigureCanvas(event.currentTarget).mouseX;
			var oy:Number = FigureCanvas(event.currentTarget).mouseY;
			var point:Point = new Point(ox+this.horizontalScrollPosition,oy+this.verticalScrollPosition);
			figureCanvasStateDomain.getFigureCanvasStateDomain().mouseClick(point, event);
		}

		private function mouseRollOutHandle(event:MouseEvent):void{
			figureCanvasStateDomain.getFigureCanvasStateDomain().RollOut(event);
			
//			this.notifyMicroimageUpdate();
		}

		private function mouseRollOverHandle(event:MouseEvent):void{
			figureCanvasStateDomain.getFigureCanvasStateDomain().RollOver(event);
			
//			this.notifyMicroimageUpdate();
		}
		
		private function scrollHandle(event:ScrollEvent):void{
			
			switch(event.direction)
			{
				case ScrollEventDirection.VERTICAL:
				if(this.verticalScrollPosition<=0&&event.delta<0){
					return;
				}
				if(this.verticalScrollPosition>=this.verticalScrollBar.maxScrollPosition&&event.delta>0){
					return;
				}
				break;
				
				case ScrollEventDirection.HORIZONTAL:
				if(this.horizontalScrollPosition<=0&&event.delta<0){
					return;
				}
				if(this.horizontalScrollPosition>=this.horizontalScrollBar.maxScrollPosition&&event.delta>0){
					return;
				}
				break;
				
				default:
				break;
				
			}
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		private function showEffectHandle(event:FlexEvent):void{
			var parallel:Parallel=new Parallel();
			var rotate:Rotate=new Rotate();
			rotate.angleFrom=180;
			rotate.angleTo=360;
			var fade:Fade=new Fade();
			fade.alphaFrom=0.0;
			fade.alphaTo=1.0;
			var iris:Iris=new Iris();
			iris.scaleXFrom=1;
			iris.scaleXTo=0;
			iris.scaleYFrom=1;
			iris.scaleYTo=0;
			var wipedown:WipeDown=new WipeDown();
			parallel.addChild(wipedown);
			parallel.addChild(iris);
			parallel.duration = 1600;
			parallel.repeatCount = 1;
			var instance:IEffectInstance = parallel.createInstance(this);
			instance.startEffect();
		}
		
		
		/**
		 * Update the selected figure by new attribute and redraw it.
		 */
		public function updateFigure() :void {
			
			var tempArr :Array = new Array();
			var linkarr :Array = new Array();
			
//			this.figureEditorModel.rootFigure.readInformationToFigure(flowViewData);
			this.figureEditorModel.rootFigure.ifiguretoarray(tempArr);
			this.removeAllChildren();

			var len :int=tempArr.length;
			
			for(var i:int=0; i<len; i++){
				if(tempArr[i] is GraphicalFigure){
					this.addChild(DisplayObject(tempArr[i]));
					IFigure(tempArr[i]).updateDraw();
				}
				else if(tempArr[i] is ConnectionFigure){
					linkarr.push(tempArr[i]);
				}
			}
			
			len = linkarr.length;
			
			for(var j:int=0; j<len; j++){
				this.addChild(DisplayObject(linkarr[j]));
				IFigure(linkarr[j]).updateDraw();
			}
			
		}
		
		/**
		 * paint the gridding line
		 */
		private function renderCanvas() :void {
			this.graphics.clear();
				
			//fill background
			this.graphics.beginFill(0xFFFFFF);
			this.graphics.drawRect(0, 0, this.width, this.height);
			this.graphics.endFill();
				
			this.graphics.lineStyle(1, 0xD8D8DB);
			//draw hirerachical line
			var i : int = 0;
			var totalLength: Number = 0;
			while(totalLength <= this.height){
				this.graphics.moveTo(0, grapWidth * i);
				this.graphics.lineTo(this.width, grapWidth * i);
				totalLength = grapWidth * i;
				i ++;
			}
				
			//reset var
			totalLength = 0;
			var j :int = 0;
				
			//draw vertical lines
			while(totalLength <= this.width){
				this.graphics.moveTo(grapWidth * j, 0);
				this.graphics.lineTo(grapWidth * j, this.height );
				totalLength = grapWidth * j;
				j++;
			}
		}		
	}
}