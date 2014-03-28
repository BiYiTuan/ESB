package eab.console.model{
	
	
	import eab.console.figure.*;
	import eab.console.view.*;
	
	/**
	 * Store message of tool panel
	 */
	public class ToolPanelModel{
			
		/**
		 * the selected ToolEntry delegate a Figure
		 */
		private var _selectedFigure : IFigure = null;

		public function get selectedFigure() :IFigure{
			return this._selectedFigure;
		}
		
		public function set selectedFigure(selFigure :IFigure) :void{
			this._selectedFigure = selFigure;
		}
		
	}
}