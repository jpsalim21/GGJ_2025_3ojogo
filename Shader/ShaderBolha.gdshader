shader_type canvas_item;

uniform float joao;
uniform float speedx;
uniform float speedy;
const vec4 corVerde = vec4(0.122, 0.718, 0.0, 1.0);

void vertex() {
	vec2 newPos = vec2(VERTEX.x + sin(TIME)* sin(UV.x*joao+TIME*speedx) * 5.0 * sin(VERTEX.x), VERTEX.y + sin(UV.x*joao+TIME*speedy) * cos(TIME) * -5.0 * sin(VERTEX.y));
	VERTEX = newPos;
}

void fragment() {
	if(abs((COLOR - corVerde).x) < 0.2){
		COLOR.a = 0.0;  
	}
}
