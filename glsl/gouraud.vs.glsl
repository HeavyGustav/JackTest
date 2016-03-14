uniform vec3 lightColor;
uniform vec3 ambientColor;
uniform vec3 lightPosition;
uniform float kAmbient;
uniform float kDiffuse;
uniform float kSpecular;
uniform float shininess;

varying vec4 V_Color;
 
 
// The entry point for our vertex shader.
void main()
{
    vec3 modelViewVertex = vec3(modelViewMatrix * vec4(position,1.0));
 
    vec3 modelViewNormal = vec3(modelViewMatrix * vec4(normal, 0.0));
 
    float distance = length(lightPosition - modelViewVertex);
 
    vec3 lightVector = normalize(lightPosition - modelViewVertex);
 
    float diffuse = max(dot(modelViewNormal, lightVector), 0.1);
  
    V_Color = vec4(lightColor,1.0) * diffuse * vec4(ambientColor,1.0) * kAmbient * kSpecular * shininess;
 
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position,1.0);
}