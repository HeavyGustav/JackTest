varying vec4 V_ViewPosition;
varying vec4 V_Normal_VCS;
uniform vec3 lightColor;
uniform vec3 ambientColor;
uniform vec3 lightPosition;
uniform float kAmbient;
uniform float kDiffuse;
uniform float kSpecular;
uniform float shininess;


void main() {
	
	vec3 viewVector  = normalize(vec3(-V_ViewPosition));
	vec3 lightVector = normalize( lightPosition );
	vec3 n = vec3(V_Normal_VCS);
	vec3 halfVector = normalize(lightVector + viewVector );
	
    float lam = max(dot(lightVector,n), 0.0);
    float specular = 0.0;
    if(lam > 0.0) {
       float specAngle = max(dot(halfVector, n), 0.0);
       specular = pow(specAngle, shininess);
    }


	vec3 reflectColour = kSpecular*specular * lightColor + kDiffuse*lam * lightColor + kAmbient*ambientColor;
	gl_FragColor = vec4(reflectColour, 1.0);
	
	
	
}
