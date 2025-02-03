shader_type spatial;
render_mode blend_mix;

//uniform float shift;

uniform sampler2D textureimage;

void vertex() {
	// Called for every vertex the material is visible on.
}
void fragment() {
	// Called for every pixel the material is visible on.
    vec3 unshifted = texture(textureimage, UV).rgb;
	float shift = TIME / 3.0;
    unshifted += texture(textureimage, UV + vec2(shift, 0)).rgb;
   	unshifted += texture(textureimage, UV + vec2(0, shift)).rgb; 
    unshifted += texture(textureimage, UV + vec2(0, -shift)).rgb;
    unshifted += texture(textureimage, UV + vec2(-shift, 0)).rgb;
    unshifted += texture(textureimage, UV + vec2(shift, shift)).rgb;
   	unshifted += texture(textureimage, UV + vec2(-shift, -shift)).rgb;
	unshifted /= 7.0;
	// works but looks shit, just turns black and back on:
	//vec3 newshifted = unshifted * sin(TIME);
	ALBEDO = unshifted;
	
	
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
