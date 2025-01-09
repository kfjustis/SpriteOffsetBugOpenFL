package;

import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;
import openfl.events.Event;

class Main extends Sprite
{
	private var container:Sprite;

	public function new()
	{
		super();

		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		// Container for all objects.
		container = new Sprite();
		addChild(container);

		// Window bg rect.
		graphics.beginFill(0x000000);
		graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
		graphics.endFill();

		// Create stage bg.
		var background:Sprite = new Sprite();
		background.graphics.beginFill(0xFFE40066);
		background.graphics.drawRect(0, 0, 800, 600);
		background.graphics.endFill();
		container.addChild(background);

		// Create square.
		var square:Sprite = new Sprite();
		square.graphics.beginFill(0xFF345995);
		square.graphics.drawRect(0, 0, 200, 200);
		square.graphics.endFill();
		square.x = stage.stageWidth - square.width;
		square.y = 200;
		container.addChild(square);

		stage.addEventListener(Event.RESIZE, onResize);

		// Handle resizes.
		onResize(null);
	}

	private function onResize(event:Event):Void {
		// Calculate scale factors
		var scaleX:Float = stage.stageWidth / 800;
		var scaleY:Float = stage.stageHeight / 600;
		var scale:Float = Math.min(scaleX, scaleY); // Maintain aspect ratio
		
		// Scale content
		container.scaleX = scale;
		container.scaleY = scale;
		
		// Center the virtual stage
		container.x = (stage.stageWidth - container.width) / 2;
		container.y = (stage.stageHeight - container.height) / 2;

		// Update window bg rect.
		graphics.beginFill(0x000000);
		graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
		graphics.endFill();
	}
}
