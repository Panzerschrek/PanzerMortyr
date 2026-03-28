#version 330

layout( location= 0 ) in vec3 v_position;

out vec3 g_position;

void main()
{
	g_position= v_position;
}
