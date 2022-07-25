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



class ActorEvents_57 extends ActorScript
{
	public var MusicBar:Actor;
	public var _MusicBarCount:Float;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("MusicBar", "MusicBar");
		nameMap.set("MusicBarCount", "_MusicBarCount");
		_MusicBarCount = 0;
		
	}
	
	override public function init()
	{
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				actor.setAnimation("UpHover");
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				actor.setAnimation("UpDefault");
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				actor.setAnimation("UpClicked");
				if((_MusicBarCount == 0))
				{
					MusicBar.setAnimation("MusicBar1");
				}
				if((_MusicBarCount == 1))
				{
					MusicBar.setAnimation("MusicBar2");
				}
				if((_MusicBarCount == 2))
				{
					MusicBar.setAnimation("MusicBar3");
				}
				if((_MusicBarCount == 3))
				{
					MusicBar.setAnimation("MusicBar4");
				}
				if((_MusicBarCount == 4))
				{
					MusicBar.setAnimation("MusicBar5");
				}
				if((_MusicBarCount == 5))
				{
					MusicBar.setAnimation("MusicBar6");
				}
				if((_MusicBarCount == 6))
				{
					MusicBar.setAnimation("MusicBar7");
				}
				if((_MusicBarCount == 7))
				{
					MusicBar.setAnimation("MusicBar8");
				}
				if((_MusicBarCount == 8))
				{
					MusicBar.setAnimation("MusicBar9");
				}
				if((_MusicBarCount == 9))
				{
					MusicBar.setAnimation("MusicBar10");
				}
				if((_MusicBarCount == 10))
				{
					MusicBar.setAnimation("MusicBar11");
				}
				if((_MusicBarCount == 11))
				{
					MusicBar.setAnimation("MusicBar12");
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 5 == mouseState)
			{
				actor.setAnimation("UpHover");
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}