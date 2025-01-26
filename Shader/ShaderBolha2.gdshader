shader_type canvas_item;

const vec4 corVerde = vec4(0.122, 0.718, 0.0, 1.0);
uniform float velocidade = 1.0;
uniform float magnitude = 1.0;

void vertex() {
	vec2 newPos = vec2(VERTEX.x + sin(VERTEX.y * TIME * velocidade) * magnitude, VERTEX.y + cos(VERTEX.x * TIME * velocidade));
	VERTEX = newPos;
}

void fragment() {
	
}