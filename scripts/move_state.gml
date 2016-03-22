/// move_state()
/*var key_jump = mouse_check_button(mb_left) and mouse_x > view_xview + 80 and mouse_x < view_xview + view_hview - 80;
var key_right = mouse_check_button(mb_left) and (mouse_x > view_xview + view_hview - 80 and mouse_x < view_xview + view_hview);
var key_left = mouse_check_button(mb_left) and (mouse_x > view_xview and mouse_x < view_xview + 80);
*/

if(os_type == os_windows){
    var down = keyboard_check(ord('S'));
    
    
    var up = keyboard_check(ord('W'));
    var up_release = keyboard_check_released(ord('W'));
    var left = keyboard_check(ord('A'));
    var right = keyboard_check(ord('D'));
}else if(os_type == os_android or os_type == os_ios){
    var down = keyboard_check(mb_left) and mouse_x >= 80 and mouse_x <= 688;
    var down_release = mouse_x;
    
    var up = mouse_check_button(mb_left) and mouse_x >= 80 and mouse_x <= 688;
    var up_release = mouse_check_button_released(mb_left);
    var mouse_xx = window_view_mouse_get_x(0);
    var left = (mouse_xx < 80);
    var right = (mouse_xx > 688);
}

if(!place_meeting(x, y+1, Wall)){
    vspd += grav;
    
    // Player is in the air.
        //sprite_index = player_jump;
    image_speed = 0;
    image_index = (vspd > 0);
        
    // Control the jump height.
    if(up_release && vspd < -6){
        vspd = -6;
    }
}else{
    vspd = 0;
    
    // Jumping code.
    if(up){
        vspd = -16;
    }
    
    // Player is on the ground.
    if(hspd == 0){
      //  sprite_index = spr_player_idle;
        image_speed = 0;
    }else{
       // sprite_index = spr_player_walk;
        image_speed = .6;
    }
    
    /*if(down){
        // Rodar.
        sprite_index = spr_player_down;
    }*/
}

if(right){
    hspd = spd;
}

if(left){
    hspd = -spd;
}

// Set the image_xscale
if(hspd != 0){
    image_xscale = sign(hspd);
}

if(!right and !left){
    hspd = 0;
}

Contact(Wall);
Contact(Move_Wall);

// Check to see the ledge_grab_state
var falling = y - yprevious > 0;
//var wasnt_wall = !position_meeting(x + 17)
