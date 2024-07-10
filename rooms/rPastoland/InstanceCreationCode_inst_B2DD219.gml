//visible = false;
sprite_index = sprS1_SpikeUp;
depth -= 1;
myTrap = new trigger_dynamic();

myTrap.action_begin = function()
{
	t = 0;
}
myTrap.action_step = function()
{
	if exists()
		t++;
	else
		t = -1;
	
	switch t
	{
		case 1:
			_spike[0] = Create(x,y+32,layer,objSpikeUp,,,,,,,,);
			_spike[0] . moveX = -32;
			_spike[0] . visible = false;
			
			_spike[1] = Create(x,y+32,layer,objSpikeUp,,,,,,,,);
			_spike[1] . moveX = -64;
			_spike[1] . visible = false;
			
			_spike[2] = Create(x,y+32,layer,objSpikeUp,,,,,,,,);
			_spike[2] . moveX = 32;
			_spike[2] . visible = false;
			
			_spike[3] = Create(x,y+32,layer,objSpikeUp,,,,,,,,);
			_spike[3] . moveX = 64;
			_spike[3] . visible = false;
		break;
		
		case 2:
			scale_to_destination(,,0,4,true,,,15);
			moveY_to_position(,,-32*4,true,,,15);
			play_sfx(sndBlockChange);
		break;
		
		case 50:
			scale_to_destination(,,0,-4,true,,,10);
			moveY_to_position(,,32*4,true,,,10);
		break;
		
		case 60:
			var _total = array_length(_spike);
			for (var i = 0; i < _total; ++i) {
			    with _spike[i]
				{
					y-=32
					moveX_to_position(,,moveX,true,,,15);	
					visible = true;
					depth += 1;
					
				}
			}
			play_sfx(sndSpikeTrap);
		break;
		
		case 90:
			var _total = array_length(_spike);
			for (var i = 0; i < _total; ++i) {
			    with _spike[i]
				{
					moveX_to_position(,,-moveX,true,,,15);	
				}
			}
			play_sfx(sndBlockChange);
		break;
		
		case 130:
			var _total = array_length(_spike);
			for (var i = 0; i < _total; ++i) {
			    with _spike[i]
				{
					moveX_to_position(,,moveX,true,,,20);	
				}
			}
			play_sfx(sndSpikeTrap);
		break;
		
	}
}

init_trigger(myTrap);