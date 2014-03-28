package eab.console.figure.arrow
{
	import flash.display.*;
	
	public class SolidArrow extends AbstractArrow
	{
		public function SolidArrow()
		{
			super();
			this.arrowId=1;
		}
		
		override public function drawArrow(sprite:Sprite):void{
			sprite.graphics.beginFill(0x000000);
			sprite.graphics.moveTo(this.headPoint.x,this.headPoint.y);
			sprite.graphics.lineTo(this.leftPoint.x,this.leftPoint.y);
			sprite.graphics.lineTo(this.rightPoint.x,this.rightPoint.y);
			sprite.graphics.lineTo(this.headPoint.x,this.headPoint.y);
			sprite.graphics.endFill();
		}		
	}
}