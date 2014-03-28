package eab.console.viewhelper
{
	import eab.console.model.FlowEditModel;
	import eab.console.view.FlowEditView;
	import eab.control.events.PageChangeEvent;
	import eab.framework.view.ViewHelper;
	
	import flash.display.DisplayObject;

	public class FlowEditViewVH extends ViewHelper
	{	
		public static function getViewHelperKey(data : Object) :String{
			return "FlowEditViewVH:" + data.flowName;
		}
		
		private var flowEditModel : FlowEditModel;
      	
		public function FlowEditViewVH(document : Object, id : String){
			super();
			
			initialized(document, id);
			this.flowEditModel = this.flowEditView.flowEditModel;
		}

		public function get flowEditView() : FlowEditView{
			return this.view as FlowEditView;
		}
		
		public function pageChagedHandle(event:PageChangeEvent):void{
			flowEditModel.currentPage = event._pageIndex;
			flowEditModel.countPerPage = event._countPerPage;
			flowEditModel.refresh();
		}  
		
		public function removeFiguresFromCanvas(figure :DisplayObject) :void{
			if(this.flowEditView.figureCanvas.contains(figure)){
				this.flowEditView.figureCanvas.removeChild(figure);
			}
		}

		public function addFigureToCanvas(figure :DisplayObject) :void{
			this.flowEditView.figureCanvas.addChild(figure);
		}
		
	}
}
