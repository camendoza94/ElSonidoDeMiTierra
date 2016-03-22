/// Contact(obj, hsp, vsp)
obj = argument[0];


// Horizontal Collision.
if (place_meeting(x+hspd, y, obj)){
    while(!place_meeting(x + sign(hspd), y, obj)){
        x += sign(hspd);
    }
    hspd = 0;
}

// Vertical Collision.
if (place_meeting(x, y+vspd, obj)){
    while(!place_meeting(x, y + sign(vspd), obj)){
        y += sign(vspd);
    }
    vspd = 0;
}

// Apply x and y hsp and vsp.
x += hspd;
y += vspd;
