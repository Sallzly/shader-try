shader_type spatial;

uniform sampler2D noise;
uniform float height_scale : hint_range(0.0, 1.0, 0.01) = 1.0;
uniform sampler2D normalmap;
varying vec2 tex_position;
varying vec3 fPos;

void vertex() {
	// Called for every vertex the material is visible on.
	tex_position = VERTEX.xz / 2.0 + 0.5;
	float height = texture(noise, tex_position).x;
  	VERTEX.y += height * height_scale;
	fPos = VERTEX.xyz * sin(TIME);
}

void fragment() {
	// Called for every pixel the material is visible on.
	 NORMAL_MAP = texture(normalmap, tex_position).xyz;
	vec3 newPos = fPos * height_scale;
	vec3 blue = vec3(0.0, 0.1, 0.8);
	vec3 white = vec3(1.0, 1.0, 1.0);
	if (fPos.y < VERTEX.y){
		ALBEDO = white;
	}
	else{
			ALBEDO = blue;
	}

}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
