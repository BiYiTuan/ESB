package eab.console.model
{
	/**
	 * The manager of FigureID.
	 */
	public class FigureIDManager
	{
		private var maxId:int = 2;

		public function FigureIDManager(){
			
		}
		/**
		 * Create a new FigureID and return it.
		 */
		public function getAvailabelId():int {
			return ++maxId;
		}
		
		public function setAvailabelId(id:int):void{
			this.maxId=id;
		}
	}
}