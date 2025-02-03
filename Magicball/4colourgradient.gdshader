shader_type spatial;
render_mode blend_mix;
	
	
varying vec3 fPos;
	
void vertex() {
	fPos = VERTEX.xyz * 2.3; //scale factor in the end
} 

void fragment() {
	// Called for every pixel the material is visible on.
	//making the 4 colours
vec3 red = vec3(1.0, 0.0, 0.0);
vec3 blue = vec3(0.0, 0.0, 1.0);
vec3 green = vec3(0.0, 1.0, 0.0);
vec3 white = vec3(1.0, 1.0, 1.0);
//mixing the colors on x and y axis
vec3 color = mix(red, blue, fPos.x);
vec3 color1 = mix(green, white, fPos.x);
vec3 mixed = mix(color, color1, fPos.y);
//adding time into the mix
vec3 newPosition = fPos * (sin(TIME) * PI / 4.7 ) * 1.0;
vec3 mixed1 = mix(red, blue, newPosition.y);
vec3 mixed2 = mix(green, white, newPosition.y);
vec3 movemixed = mix(mixed1, mixed2, newPosition.x);

ALBEDO = movemixed;

SSS_STRENGTH = 0.2;
SSS_TRANSMITTANCE_COLOR = vec4(movemixed, 1.0);
ROUGHNESS = 0.8;
METALLIC = 0.2;
RIM = 0.9;
RIM_TINT = 0.8;
RADIANCE = vec4(movemixed, 1.0);
EMISSION = movemixed * 0.0;

}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
