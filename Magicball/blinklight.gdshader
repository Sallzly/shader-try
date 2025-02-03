shader_type spatial;
render_mode unshaded;

uniform float blink_speed : hint_range(0.0, 1.0) = 1.0;


void fragment( )
{
	float time = blink_speed + sin(TIME);
	
	vec3 white = vec3(1.0, 1.0, 1.0);
	
	EMISSION = white;
	RIM = 0.5;
	ALPHA = clamp(time * white.r , 0.0, 0.5);
	}
void light() {
    DIFFUSE_LIGHT += clamp(dot(NORMAL, LIGHT), 0.0, 1.0) * ATTENUATION * LIGHT_COLOR;
}