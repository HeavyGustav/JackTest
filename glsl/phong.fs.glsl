
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

    vec3 n = vec3(V_Normal_VCS);
	vec3 viewVector  = vec3(V_ViewPosition);
	vec3 viewDirection = normalize(-viewVector);
	vec3 lightDirec = vec3(viewMatrix * vec4(lightPosition, 0.0));
	vec3 reflectDirection = reflect(-lightDirec, n);

	float specularref = 0.0;
	float angle = max(dot(lightDirec,n), 0.0);
	
if(angle>0.0)
	{
		float specAngle = max(dot(reflectDirection, viewDirection), 0.0);
		specularref = pow(specAngle, shininess);
	}

	vec3 reflectColour = kSpecular * specularref * lightColor + kDiffuse * angle * lightColor + kAmbient * ambientColor;


	gl_FragColor = vec4(reflectColour, 1.0); 
}

