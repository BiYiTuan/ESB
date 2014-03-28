package eab.control.scheduling.samples
{	
	import eab.control.scheduling.scheduleClasses.layout.IVerticalLinesLayout;
	import eab.control.scheduling.scheduleClasses.layout.VerticalLinesLayoutItem;
	import eab.control.scheduling.scheduleClasses.lineRenderer.ILineRenderer;
	import eab.control.scheduling.scheduleClasses.lineRenderer.LineRenderer;
	import eab.control.scheduling.scheduleClasses.viewers.VerticalLinesViewer;
	
	public class SolidVerticalLinesViewer extends VerticalLinesViewer 
	{
		override protected function render( layout : IVerticalLinesLayout ) : void 
		{
			var lineRenderer : ILineRenderer = new LineRenderer();
			lineRenderer.weight = verticalGridLineThickness;
			lineRenderer.color = verticalGridLineColor;
			lineRenderer.alpha = verticalGridLineAlpha;
			
			for each( var item : VerticalLinesLayoutItem in layout.items )
			{
				super.drawLineForItem( item, lineRenderer );
			}
		}		
		
	}
}