varying vec4 V_Normal_VCS;
varying vec4 V_ViewPosition;
uniform vec3 lightColor;
uniform vec3 ambientColor;
uniform vec3 lightPosition;
uniform float kAmbient;
uniform float kDiffuse;
uniform float kSpecular;
uniform float shininess;

void main() {
	V_Normal_VCS = vec4(normalize(normalMatrix * normal), 1.0);
	V_ViewPosition = modelViewMatrix * vec4(position, 1.0);

	gl_Position = projectionMatrix *  modelViewMatrix * vec4(position, 1.0);
}