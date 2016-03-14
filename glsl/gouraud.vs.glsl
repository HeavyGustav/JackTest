uniform vec3 lightPosition;      // The position of the light in eye space.
uniform vec3 lightColor;
 
 
varying vec4 v_Color;         // This will be passed into the fragment shader.
 
// The entry point for our vertex shader.
void main()
{
    vec3 modelViewVertex = vec3(modelViewMatrix * vec4(position,1.0));
 
    vec3 modelViewNormal = vec3(modelViewMatrix * vec4(normal, 0.0));
 
    float distance = length(lightPosition - modelViewVertex);

    vec3 lightVector = normalize(lightPosition - modelViewVertex);
    
    float diffuse = max(dot(modelViewNormal, lightVector), 0.1);
  
    v_Color = vec4(lightColor * diffuse,1.0);
 
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}