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



class ActorEvents_75 extends ActorScript
{
	public var _touchGround:Bool;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("touchGround", "_touchGround");
		_touchGround = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		_touchGround = true;
		Engine.engine.setGameAttribute("isAlive", true);
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((((Engine.engine.getGameAttribute("isAlive") : Bool) && _touchGround) && (!(isKeyPressed("Jump")) && !(isKeyDown("Slide")))))
				{
					actor.setAnimation("Walk");
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((((Engine.engine.getGameAttribute("isAlive") : Bool) && _touchGround) && isKeyPressed("Jump")))
				{
					_touchGround = false;
					actor.setAnimation("Jump");
					actor.setYVelocity(-30);
					if((Engine.engine.getGameAttribute("sfxOn") : Bool))
					{
						playSoundOnChannel(getSound(87), Std.int((Engine.engine.getGameAttribute("jumpSound") : Float)));
						setVolumeForChannel(40/100, Std.int((Engine.engine.getGameAttribute("jumpSound") : Float)));
					}
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((Engine.engine.getGameAttribute("isAlive") : Bool) && isKeyDown("Slide")))
				{
					actor.setAnimation("Slide");
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(!((Engine.engine.getGameAttribute("isAlive") : Bool)))
				{
					actor.setAnimation("Die");
				}
			}
		});
		
		/* ======================= Member of Group ======================== */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAsAny(getActorGroup(3),event.otherActor.getType(),event.otherActor.getGroup()))
			{
				Engine.engine.setGameAttribute("isAlive", false);
				if(((Engine.engine.getGameAttribute("Score") : Float) > (Engine.engine.getGameAttribute("Highscore") : Float)))
				{
					Engine.engine.setGameAttribute("Highscore", (Engine.engine.getGameAttribute("Score") : Float));
				}
				switchScene(GameModel.get().scenes.get(8).getID(), createFadeOut(2, Utils.getColorRGB(0,0,0)), createFadeIn(2, Utils.getColorRGB(0,0,0)));
				if((Engine.engine.getGameAttribute("musicOn") : Bool))
				{
					playSoundOnChannel(getSound(83), Std.int((Engine.engine.getGameAttribute("gameOverMusic") : Float)));
					setVolumeForChannel(30/100, Std.int((Engine.engine.getGameAttribute("gameOverMusic") : Float)));
				}
				if((Engine.engine.getGameAttribute("sfxOn") : Bool))
				{
					playSoundOnChannel(getSound(88), Std.int((Engine.engine.getGameAttribute("hitSound") : Float)));
					setVolumeForChannel(30/100, Std.int((Engine.engine.getGameAttribute("hitSound") : Float)));
				}
			}
		});
		
		/* ======================= Member of Group ======================== */
		addCollisionListener(actor, function(event:Collision, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && sameAsAny(getActorGroup(1),event.otherActor.getType(),event.otherActor.getGroup()))
			{
				_touchGround = true;
			}
		});
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * 0.1, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				if((Engine.engine.getGameAttribute("isAlive") : Bool))
				{
					Engine.engine.setGameAttribute("Score", ((Engine.engine.getGameAttribute("Score") : Float) + 1));
				}
			}
		}, actor);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}