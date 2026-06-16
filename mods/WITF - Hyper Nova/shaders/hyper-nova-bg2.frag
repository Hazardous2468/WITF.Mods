#pragma header

const vec2 iResolution = vec2(1280.0, 720.0);

uniform float aaaaaa;
uniform float iTime;
uniform float NUM_LAYERS;
uniform float ZOOM;
uniform bool generateNebula;
uniform float ySpeed;


#define pi 3.14159265358979323846264338327950288419716939937510
mat2 Rot(float a){
	float s = sin(a), c=cos(a);
	return mat2(c,-s,s,c);
}
float Hash21(vec2 p){
	p = fract(p*vec2(123.34, 456.21));
	p += dot(p,p+45.32);
	return fract(p.x*p.y);
}

//2D signed hash function:
        vec2 Hash2(vec2 P){return 1.-2.*fract(cos(P.x*vec2(91.52,-74.27)+P.y*vec2(-39.07,09.78))*939.24);}

        //2D Perlin gradient noise.
        float Perlin(vec2 P, float tim)
        {
            P += tim;
            vec2 F = floor(P);
            vec2 S = P-F;
            //Bi-quintic interpolation for mixing the cells.
            vec4 M = (S*S*S*(6.*S*S-15.*S+10.)).xyxy;
            M = M*vec4(-1,-1,1,1)+vec4(1,1,0,0);
            
            //Add up the gradients.
            return (dot(Hash2(F+vec2(0,0)),S-vec2(0,0))*M.x+dot(Hash2(F+vec2(1,0)),S-vec2(1,0))*M.z)*M.y+
                (dot(Hash2(F+vec2(0,1)),S-vec2(0,1))*M.x+dot(Hash2(F+vec2(1,1)),S-vec2(1,1))*M.z)*M.w+.5;
        }
        float Star(vec2 uv, float flare){
            float d = length(uv);
            float m = .05/d;//smoothstep(.2,.05,d); 
            
            
            float rays = max(0.,1.-abs(uv.x*uv.y * 1000.));
            m += rays*flare;
            uv*=Rot(pi/4.);
            rays = max(0.,1.-abs(uv.x*uv.y * 1000.));
            m += rays*.3*flare;
            
            m *= smoothstep(1.0,0.2,d);
            
            return m;
        }
        
        vec3 StarLayer(vec2 uv){
            vec3 col = vec3(0.);
            
            vec2 gv = fract(uv)-0.5;
            vec2 id = floor(uv);
            
            for(int y=-1;y<=1;y++){
                for(int x=-1;x<=1;x++){    
                    vec2 offset = vec2(x,y);
                    float n = Hash21(id+offset); //random between 0-1
                    float size = fract(n*345.32);
                    float star = Star(gv-offset- vec2(n, fract(n*34.))+0.5 ,smoothstep(.9,1.0,size)*.4);
                    vec3 color = sin(vec3(.2,.3,.9)*(fract(n*2345.2)*123.2))*0.5+0.5;
                    color = color*vec3(1.5,0.5,1.5);
                    star *= sin(iTime*1.5+n*(pi*2.0))*0.5+0.75;
                    col += star * size * color;
                }
           }
           return col;
        }

        float NebulaGenerator(vec2 uv){
            float tim = iTime*0.25;
            vec2 P = uv;
            P *= 100.;
            float noise = .4*Perlin(P/64.,tim)+.3*Perlin(P/32.,-tim)+.2*Perlin(P/16.,tim)+.1*Perlin(P/8.,-tim);
            noise = clamp(noise,0.0,0.875);
            noise = pow(noise, 8.);
            noise *= 10.;
            return noise;
         }
         vec3 NebulaLayer(vec2 uv, float i){
            vec3 col=vec3(0.);
            float noise = NebulaGenerator(uv);
            vec2 r = vec2(i,fract(i*22.1)) * 6969.;
            vec3 color = sin(vec3(.2,.3,.9)*(fract(Hash21(r)*2345.2)*123.2))*0.5+0.5;
            color = color*vec3(0.4,0.175,0.5);
            if(i==-1.) color= vec3(0.1,0.1,0.1);
            col += vec3(noise,noise,noise) * color;
            return col;
         }

void main() {
	 if(aaaaaa > 0.01){
                vec2 co = openfl_TextureCoordv * iResolution;
                vec2 uv = (co-.5*iResolution.xy)/iResolution.y;
                vec3 col = vec3(0.);

                float t = iTime * .075;

                for(float i=0.;i<1.;i+=1./NUM_LAYERS){
                    float depth = fract(i+t);
                    float scale = mix(ZOOM, .5, depth);
                    float fade = depth * smoothstep(1.,.9,depth);
                    vec2 u = uv * Rot(depth*1.0);
                    if(generateNebula){col += NebulaLayer(u*scale+(i*453.2), i)*fade*1.5;}
                    col += StarLayer(u*scale+(i*453.2))*fade*.75;
                }
                col *= vec3(aaaaaa);
                gl_FragColor = vec4(col,aaaaaa);
            }else{
                gl_FragColor = vec4(0.0);
            }
}

