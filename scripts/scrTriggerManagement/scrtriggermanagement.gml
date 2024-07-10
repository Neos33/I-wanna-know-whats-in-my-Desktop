// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function trigger_dynamic() constructor
{
	action_begin = function () {}
	action_end = function () {}
	action_step = function () {}
}

function run_trigger()
{
	action.action_step();
}

function set_next_trigger(next_trigger)
{
	if current_trigger > 1
	{
		trigger_index[current_trigger - 1] = false;
		current_trigger--;
		triggered = false;	
		trigger_in_action = false;
		trigger_index[current_trigger - 1] = true;
		action.action_end();
		print("Next trigger is ready");
		print(string_interp("Triggers remaining: {0}", current_trigger));
		action = next_trigger;
		action.action_begin();
	}
}

function init_trigger(trigger_main, total_triggers = 1)
{
	action = trigger_main;
	current_trigger = total_triggers;
	action.action_begin();
	trigger_in_action = false;
	triggered = false;
	trigger_index = array_create(total_triggers,false);
	trigger_index[total_triggers - 1] = true;
}

function reset_trigger()
{
	trigger++;
	global.basicTrigger[trigger] = false;
}