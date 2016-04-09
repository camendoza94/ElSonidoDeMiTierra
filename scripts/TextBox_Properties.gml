/// TextBox_Properties(num_text, text_speed);
var txt = Return_Text(room, argument[0]);

// Local variables.
var padding_x = 0;
var padding_y = 0;
var limit_width = sprite_get_width(spr_textbox) - padding_x; 
var limit_height = sprite_get_height(spr_textbox) - padding_y;

// Initial coord(x, y);
var xx = bbox_left + padding_x;
var yy = bbox_top + padding_y;

// Modify the text.
var text_modifier = "";
var line_limit = 0;
var word_width = 0;

for(var i = 1; i < string_length(txt); i++)
{
    if(string_char_at(txt, i) == " "){
        word_width = string_width(text_modifier);
        line_limit += word_width;
        if(line_limit > limit_width){
            string_delete(text_modifier, i, i);
            string_insert(text_modifier, "#", i);
        }
    } 
    text_modifier = string_copy(txt, 1, i);
}

// Draw Text. 
var txt2 = "";
for(var i = 1; i < string_length(txt) * text_speed; i++){
    if(text_speed mod i){
        txt2 = string_copy(txt, 1, i);
        draw_text(xx, yy, txt2);
    }
}
