varying vec3 v_Position;       // This will be passed into the fragment shader.
varying vec4 v_Color;          // This will be passed into the fragment shader.
varying vec3 v_Normal;         // This will be passed into the fragment shader.

uniform vec3 lightColor;
 
// The entry point for our vertex shader.
void main()
{
    v_Position = vec3(modelViewMatrix * vec4(position,1.0));
 
    v_Color = vec4(lightColor,1.0);
 
    // Transform the normal's orientation into eye space.
    v_Normal = vec3(modelViewMatrix * vec4(normal, 0.0));
 
    // gl_Position is a special variable used to store the final position.
    // Multiply the vertex by the matrix to get the final point in normalized screen coordinates.
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0);
}