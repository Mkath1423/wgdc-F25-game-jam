shader_type canvas_item;

uniform float pixel_size = 0.0001; // size of each "pixel block"
uniform float seed = 0.0;       // change for different patterns
uniform vec2 size = vec2(1152.0, 648.0);
// Simple hash function
float hash(vec2 p) {
    return fract(sin(dot(p ,vec2(127.1,311.7)) + seed) * 43758.5453123);
}

vec3 random_color(vec2 pixel_coord) {
    return vec3(hash(pixel_coord + vec2(1.0,0.0)),
                hash(pixel_coord + vec2(0.0,1.0)),
                hash(pixel_coord));
}

void fragment() {
    
    vec2 pixel_coord = floor(UV  / SCREEN_PIXEL_SIZE);

    // Generate color for this block
    vec3 col = random_color(pixel_coord);

    COLOR = vec4(col, 1.0);
}
