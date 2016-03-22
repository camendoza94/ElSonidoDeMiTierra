/// ledge_grab_state

if(os_type == os_windows){
    var up = keyboard_check(ord('W'));
    var down = keyboard_check(ord('S'));
}else if(os_type == os_android or os_type == os_ios){

}

if(down){
    state = move_state;
}

if(up){
    vspd = -16; // 16 is the jump height.
    state = move_state;
}
