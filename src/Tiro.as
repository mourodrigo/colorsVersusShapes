package  
{
	import org.flixel.*;
	
	public class Tiro extends FlxSprite
	{
		public var currentColor:uint;
		public var lastColor:uint;
		public var selfwidth:Number = 2;
		public var selfheight:Number = 5;
		
		public function Tiro() 
		{
			super(0,0);
			makeGraphic(selfwidth, selfheight, 0xFFFF0000);
			
			kill();
		}
		
		override public function update():void {
			if (!onScreen()) {
				kill();
			}
			
			if (currentColor != lastColor) {
				lastColor = currentColor;
				makeGraphic(selfwidth, selfheight, currentColor);
			}

			
			super.update();
		}
		
		
		
	}

}