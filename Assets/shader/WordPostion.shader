Shader "Custom/WordPostion" {
	Properties {
		_Color1("color1", Color) = (1,1,1,1)
		_Color2("color2", Color) = (1,1,1,1)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:vert  

		#pragma target 3.0

		fixed4 _Color1;
		fixed4 _Color2;

		struct Input {
			float2 uv_MainTex;
			float3 vertex;
		};

		void vert(inout appdata_full v, out Input IN) {
			UNITY_INITIALIZE_OUTPUT(Input, IN);
			IN.vertex = mul(unity_ObjectToWorld, v.vertex);  //顶点坐标转换成3d世界坐标
		}

		void surf (Input IN, inout SurfaceOutput o) {
			o.Alpha = 1;
			if (IN.vertex.y > 0) {
				o.Albedo = _Color1.rgb;
			}
			else {
				o.Albedo = _Color2.rgb;
			}
		}
		ENDCG
	}
	FallBack "Diffuse"
}
