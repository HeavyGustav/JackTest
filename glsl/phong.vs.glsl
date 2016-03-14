uniform vec3 lightColor;

varying vec3 v_Position;       // This will be passed into the fragment shader.
varying vec4 v_Color;          // This will be passed into the fragment shader.
varying vec3 v_Normal;

void main()
{
    v_Position = vec3(modelViewMatrix * vec4(position,1.0));
 
    v_Color = vec4(lightColor,1.0);
 
    v_Normal = vec3(modelViewMatrix * vec4(normal, 0.0));
 
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
 }