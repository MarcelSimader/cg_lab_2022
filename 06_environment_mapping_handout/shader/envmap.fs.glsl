/**
 * simple environment mapping shader
 * Created by Clemens Birklbauer on 08.04.2016.
 */

//need to specify how "precise" float should be
precision mediump float;

varying vec3 v_normalVec;
varying vec3 v_cameraRayVec;

uniform bool u_useReflection;

uniform samplerCube u_texCube;

//entry point again
void main() {
  vec3 normalVec = normalize(v_normalVec);
  vec3 cameraRayVec = normalize(v_cameraRayVec);

  //TASK 3.2: compute reflected camera ray (assign to texCoords)
  vec3 texCoords = u_useReflection
    ? reflect(cameraRayVec, normalVec)
    : cameraRayVec;

  //TASK 3.3: do texture lookup in cube map using the textureCube function
  gl_FragColor = textureCube(u_texCube, texCoords);
}
