//Draw bar
draw_sprite(sInfluencebar_bg,0,influencebar_x,influencebar_y);
draw_sprite_stretched(sInfluencebar,0,influencebar_x,influencebar_y,min((global.hp/global.hp_max)*influencebar_width, influencebar_width), influencebar_height);
draw_sprite(sInfluencebar_border,0,influencebar_x,influencebar_y);