package
{
    import org.flixel.*;
 
    public class GameState extends FlxState
    {
		//BASE
		public var base:Base;
		
		//TIROS
		public var tiros:FlxGroup;
		public var tiroYVelocity:Number = 75;
		public var tempoTiro:Number = 0;
		public var tempoTiroMax:Number = 0.4;
		
		//CORES
		public var corAzul:uint = 0xFF0000FF;
		public var corVermelho:uint = 0xFFFF0000;
		public var corVerde:uint = 0xFF00FF00;
		public var corAmarelo:uint = 0xFFFFFF66;
		public var corBranco:uint = 0xFFFFFFFF;
		
		//INIMIGOS
		public var inimigos1:FlxGroup;
		public var inimigos1Velocidade:Number = 2;
		
		override public function create():void
        {
			FlxG.mouse.show();
			//BASE
			base = new Base;
			add(base);
			
			//TIROS
			tiros = new FlxGroup();
			for (var i:int = 0; i < 50; i++) {
				tiros.add(new Tiro());
			}
			add(tiros);
			
			//INIMIGOS
			inimigos1 = new FlxGroup();
			for (var x:int = 0; x < 10; x++) {
				inimigos1.add(new inimigo1);
			}
			add(inimigos1);
			
			var ini:inimigo1= inimigos1.getFirstAvailable() as inimigo1;
				
				if (ini != null) {
					ini.reset(FlxG.width / 2, 0);
					ini.velocity.x = -ini.xVelocity;
					
				}
			
			super.create();
			
		}
		
		/*
		public function colisaoNave(a: Ship, b: FlxSprite):void {
		
				
		}
		*/
		override public function update():void
        {
			tempoTiro -= FlxG.elapsed;
			if ((FlxG.keys.pressed("Q") ||
				FlxG.keys.pressed("W") ||
				FlxG.keys.pressed("E") ||
				FlxG.keys.pressed("R")) && tempoTiro <= 0) {
				
				tempoTiro = tempoTiroMax;
				
				var t:Tiro = tiros.getFirstAvailable() as Tiro;
				
				if (t != null) {
					t.reset(base.x, base.y);
					t.velocity.y = -tiroYVelocity;
				}
				
				if (FlxG.keys.pressed("Q")){
					base.currentColor = corVermelho;
					t.currentColor = corVermelho;
				}else if (FlxG.keys.pressed("W")) {
					base.currentColor= corVerde;
					t.currentColor = corVerde;
				}else if (FlxG.keys.pressed("E")){
					base.currentColor= corAmarelo;
					t.currentColor = corAmarelo;
				}else if (FlxG.keys.pressed("R")){
					base.currentColor= corAzul;
					t.currentColor = corAzul;
				} 

				
				
			}
			super.update();
			
		}
		
	}
}