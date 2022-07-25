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



class Design_36_36_ToggleButton extends ActorScript
{
	public var _NormalAnimation:String;
	public var _PressedAnimation:String;
	public var _Down:Bool;
	public var _HoverAnimation:String;
	public var _ActivatedNormalAnimation:String;
	public var _Activated:Bool;
	public var _ActivatedPressedAnimation:String;
	public var _ActivatedHoverAnimation:String;
	public var _ActivateMessage:String;
	public var _DeactiveMessage:String;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Toggle():Void
	{
		if(_Activated)
		{
			_customEvent_DeactivateAction();
			_Activated = false;
		}
		else
		{
			_customEvent_ActivateAction();
			_Activated = true;
		}
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_ActivateAction():Void
	{
		actor.shout("_customEvent_" + _ActivateMessage);
	}
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_DeactivateAction():Void
	{
		actor.shout("_customEvent_" + _DeactiveMessage);
	}
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Normal Animation", "_NormalAnimation");
		nameMap.set("Pressed Animation", "_PressedAnimation");
		nameMap.set("Down", "_Down");
		_Down = false;
		nameMap.set("Hover Animation", "_HoverAnimation");
		nameMap.set("Activated Normal Animation", "_ActivatedNormalAnimation");
		nameMap.set("Activated", "_Activated");
		_Activated = false;
		nameMap.set("Activated Pressed Animation", "_ActivatedPressedAnimation");
		nameMap.set("Activated Hover Animation", "_ActivatedHoverAnimation");
		nameMap.set("Activate Message", "_ActivateMessage");
		_ActivateMessage = "";
		nameMap.set("Deactive Message", "_DeactiveMessage");
		_DeactiveMessage = "";
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		actor.anchorToScreen();
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 3 == mouseState)
			{
				if(_Activated)
				{
					actor.setAnimation(_ActivatedPressedAnimation);
				}
				else
				{
					actor.setAnimation(_PressedAnimation);
				}
				_Down = true;
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 5 == mouseState)
			{
				if(_Down)
				{
					_customEvent_Toggle();
				}
				if(#if mobile true #else false #end)
				{
					if(_Activated)
					{
						actor.setAnimation(_ActivatedNormalAnimation);
					}
					else
					{
						actor.setAnimation(_NormalAnimation);
					}
				}
				else
				{
					if(_Activated)
					{
						actor.setAnimation(_ActivatedHoverAnimation);
					}
					else
					{
						actor.setAnimation(_HoverAnimation);
					}
				}
				_Down = false;
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && 1 == mouseState)
			{
				if(_Activated)
				{
					actor.setAnimation(_ActivatedHoverAnimation);
				}
				else
				{
					actor.setAnimation(_HoverAnimation);
				}
			}
		});
		
		/* =========================== On Actor =========================== */
		addMouseOverActorListener(actor, function(mouseState:Int, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled && -1 == mouseState)
			{
				if(_Activated)
				{
					actor.setAnimation(_ActivatedNormalAnimation);
				}
				else
				{
					actor.setAnimation(_NormalAnimation);
				}
				_Down = false;
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}