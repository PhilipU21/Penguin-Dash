package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;
import com.stencyl.graphics.ScaleMode;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Config;
import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.motion.*;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class SceneEvents_7 extends SceneScript
{
	public var _randNum:Float;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("randNum", "_randNum");
		_randNum = 0.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		runPeriodically(1000 * randomInt(2, 4), function(timeTask:TimedTask):Void
		{
			_randNum = randomInt(1, 100);
			if((Engine.engine.getGameAttribute("isAlive") : Bool))
			{
				if((_randNum <= 30))
				{
					createRecycledActor(getActorType(73), 640, 380, Script.FRONT);
				}
				else if((_randNum <= 45))
				{
					createRecycledActor(getActorType(104), 639, 371, Script.FRONT);
				}
				else if((_randNum <= 65))
				{
					createRecycledActor(getActorType(106), 639, 391, Script.FRONT);
				}
				else
				{
					createRecycledActor(getActorType(79), 640, 380, Script.FRONT);
				}
			}
		}, null);
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(101));
				g.drawString("" + (("Score: ") + (("" + (Engine.engine.getGameAttribute("Score") : Float)))), 15, 20);
			}
		});
		
		/* ========================= When Drawing ========================= */
		addWhenDrawingListener(null, function(g:G, x:Float, y:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				g.setFont(getFont(110));
				if(engine.isPaused())
				{
					g.fillColor = Utils.convertColor(Utils.getColorRGB(51,51,51));
					g.alpha = (60/100);
					new BitmapWrapper(new Bitmap(captureScreenshot())).blendMode = BlendMode.MULTIPLY;
					g.fillRect(0, 0, getScreenWidth(), getScreenHeight());
					g.drawString("" + "Game Paused", 320, 240);
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(isKeyPressed("Pause"))
				{
					if(engine.isPaused())
					{
						engine.unpause();
						setScrollSpeedForBackground(engine.getLayerByName("SnowyMountains"), -10, 0);
					}
					else
					{
						engine.pause();
						setScrollSpeedForBackground(engine.getLayerByName("SnowyMountains"), -0.000000001, 0);
					}
				}
			}
		});
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * (Engine.engine.getGameAttribute("PlaneSpawn") : Float), function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				_randNum = randomInt(0, 10);
				if((Engine.engine.getGameAttribute("isAlive") : Bool))
				{
					if((_randNum < 5))
					{
						createRecycledActor(getActorType(102), 640, 58, Script.FRONT);
					}
					else
					{
						createRecycledActor(getActorType(102), 640, 141, Script.FRONT);
					}
				}
			}
		}, null);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}