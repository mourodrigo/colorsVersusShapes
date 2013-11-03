package 
{
	import org.flixel.*;
	
		/**
	 * ...
	 * @author mourodrigo
	 */
	public class inimigo1 extends FlxSprite
	{
		public var selfwidth:Number = 10;
		public var selfheight:Number = 10;
		public var colorState:Number = 1;
		public var xVelocity:Number = 20;
		public var currentColor:uint= 0xFFFF0000;
		public var lastColor:uint;

		public function inimigo1() 
		{
			super((FlxG.width / 2) - selfwidth/2, 0);
			makeGraphic(selfwidth, selfheight, currentColor);
			kill();
			
			}
			
		override public function update():void {
			super.update();
			
			
			if (currentColor != lastColor) {
				lastColor = currentColor;
				makeGraphic(selfwidth, selfheight, currentColor);
			}
			
			if (x < 5) {
				velocity.x = xVelocity;
				y = y + 10;
			}
			if (x > FlxG.width - selfwidth) {
				velocity.x = -xVelocity;
				y = y + 10;
			}
			
		}
	}
	
}