precision mediump float;       // Set the default precision to medium. We don't need as high of a
                               // precision in the fragment shader.
uniform vec3 lightPosition;       // The position of the light in eye space.
 
varying vec3 v_Position;       // Interpolated position for this fragment.
varying vec4 v_Color;          // This is the color from the vertex shader interpolated across the
                               // triangle per fragment.
varying vec3 v_Normal;         // Interpolated normal for this fragment.
 
// The entry point for our fragment shader.
void main()
{
    float distance = length(lightPosition - v_Position);
 
    vec3 lightVector = normalize(lightPosition - v_Position);
 
    float diffuse = max(dot(v_Normal, lightVector), 0.1);
  
    gl_FragColor = v_Color * diffuse;
}