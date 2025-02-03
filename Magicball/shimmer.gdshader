shader_type spatial;
render_mode unshaded;


uniform float cycle_interval : hint_range(0.5, 5.0) = 1.0;
uniform float shine_speed : hint_range(1.0, 5.0) = 3.0;
uniform float shine_width : hint_range(1.0, 100.0) = 3.0;

void fragment( )
{
	vec3 fPos = (VERTEX.xyz * 4.0);
	float width = shine_width * 0.001 * cycle_interval;
	float frequency = floor( sin( fPos.x * cycle_interval + TIME * shine_speed * cycle_interval ) + width );

	vec3 white = vec3(1.0, 1.0, 1.0);
	ALBEDO = white;
	ALPHA = clamp( ( 1.0 - dot( NORMAL, VIEW ) ) * frequency * white.r, 0.0, 1.0 );
}
