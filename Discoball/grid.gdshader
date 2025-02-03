shader_type spatial;
//render_mode unshaded;

varying vec3 fPos;

void vertex() {
	// Called for every vertex the material is visible on.
	//fPos = VERTEX.xyz * 2.3; //scale factor in the end
}

void fragment() {
	// Called for every pixel the material is visible on.
	//making colours and setting uv
	vec3 uv = vec3(UV, TIME / 5.5);
	vec3 black = vec3(0.0, 0.0, 0.0);
	vec3 white = vec3(1.0, 1.0, 1.0);
	vec3 glowlight = vec3(0.5, 1.0, 1.0);
	//scale of the "tiles"
	float scale = 30.0;
	//making of "tiles"
	vec3 newPosition = (uv) * scale;
	float positions = floor(newPosition.x) + floor(newPosition.y) + floor(newPosition.z);
	//vec3 pattern = mod(positions, 2.0) == 0.0 ? black : white;
	vec3 pattern;
	if (mod(positions, 2.0)== 0.0)
	{
		METALLIC = 0.9;
		ROUGHNESS = 0.0;
		ALPHA = 0.3;
	
		pattern = black;
	}
	else{
		white;
		ROUGHNESS = 0.9;
		METALLIC = 0.0;
		BACKLIGHT = glowlight;
		pattern = white;
	}
	ALBEDO = pattern;
	
	
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
