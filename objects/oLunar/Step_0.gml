//get player input 
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//calculate movement
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting (x,y+1,oWall)) && (key_jump)
{
	vsp = -7;
}

//horizontal collisions
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//vericatl collisions
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Animation
if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sLunarA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 0; else image_index = 1;
}
else 
{
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sLunar;
	}
	else
	{
	sprite_index = sLunarR;
	}
}
if (hsp != 0) image_xscale = sign(hsp);