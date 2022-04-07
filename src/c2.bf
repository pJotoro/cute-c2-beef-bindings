using System;

namespace CuteC2Bindings
{
	static class c2
	{
		public const let MAX_POLYGON_VERTS = 8;

		[CRepr]
		public struct v {
			public float x;
			public float y;
		}

		[CRepr]
		public struct r {
			public float c;
			public float s;
		}

		[CRepr]
		public struct m {
			public v x;
			public v y;
		}

		[CRepr]
		public struct x {
			public v p;
			public r r;
		}

		[CRepr]
		public struct h {
			public v n;
			public float d;
		}

		[CRepr]
		public struct Circle {
			public v p;
			public float r;
		}

		[CRepr]
		public struct AABB {
			public v min;
			public v max;
		}

		[CRepr]
		public struct Capsule {
			public v a;
			public v b;
			public float r;
		}

		[CRepr]
		public struct Poly {
			public int32 count;
			public v[MAX_POLYGON_VERTS] verts;
			public v[MAX_POLYGON_VERTS] norms;
		}

		[CRepr]
		public struct Ray {
			public v p;
			public v d;
			public float t;
		}

		[CRepr]
		public struct Raycast {
			public float t;
			public v n;
		}

		[CRepr]
		public struct Manifold {
			public int32 count;
			public float[2] depths;
			public v[2] contact_points;
			public v n;
		}

		[LinkName("c2CircletoCircle")]
		public static extern int32 CircletoCircle(Circle A, Circle B);

		[LinkName("c2CircletoAABB")]
		public static extern int32 CircletoAABB(Circle A, AABB B);

		[LinkName("c2CircletoCapsule")]
		public static extern int32 CircletoCapsule(Circle A, Capsule B);

		[LinkName("c2AABBtoAABB")]
		public static extern int32 AABBtoAABB(AABB A, AABB B);

		[LinkName("c2AABBtoCapsule")]
		public static extern int32 AABBtoCapsule(AABB A, Capsule B);

		[LinkName("c2CapsuletoCapsule")]
		public static extern int32 CapsuletoCapsule(Capsule A, Capsule B);

		[LinkName("c2CircletoPoly")]
		public static extern int32 CircletoPoly(Capsule A, Capsule B);

		[LinkName("c2AABBtoPoly")]
		public static extern int32 AABBtoPoly(AABB A, Poly* B, x* bx);

		[LinkName("c2CapsuletoPoly")]
		public static extern int32 CapsuletoPoly(Capsule A, Poly* B, x* bx);

		[LinkName("c2PolytoPoly")]
		public static extern int32 PolytoPoly(Poly* A, x* ax, Poly* B, x* bx);


		[LinkName("c2RaytoCircle")]
		public static extern int32 RaytoCircle(Ray A, Circle B, Raycast* _out);

		[LinkName("c2RaytoAABB")]
		public static extern int32 RaytoAABB(Ray A, AABB B, Raycast* _out);

		[LinkName("c2RaytoCapsule")]
		public static extern int32 RaytoCapsule(Ray A, Capsule B, Raycast* _out);

		[LinkName("c2RaytoPoly")]
		public static extern int32 RaytoPoly(Ray A, Poly* B, x* bx_ptr, Raycast* _out);

		[LinkName("c2CircletoCircleManifold")]
		public static extern void CircletoCircleManifold(Circle A, Circle B, Manifold* m);

		[LinkName("c2CircletoAABBManifold")]
		public static extern void CircletoAABBManifold(Circle A, AABB B, Manifold* m);

		[LinkName("c2CircletoCapsuleManifold")]
		public static extern void CircletoCapsuleManifold(Circle A, Capsule B, Manifold* m);

		[LinkName("c2AABBtoAABBManifold")]
		public static extern void AABBtoAABBManifold(AABB A, AABB B, Manifold* m);

		[LinkName("c2AABBtoCapsuleManifold")]
		public static extern void AABBtoCapsuleManifold(AABB A, Capsule B, Manifold* m);

		[LinkName("c2CapsuletoCapsuleManifold")]
		public static extern void CapsuletoCapsuleManifold(Capsule A, Capsule B, Manifold* m);

		[LinkName("c2CircletoPolyManifold")]
		public static extern void CircletoPolyManifold(Circle A, Poly* B, x* bx, Manifold* m);

		[LinkName("c2AABBtoPolyManifold")]
		public static extern void AABBtoPolyManifold(AABB A, Poly* B, x* bx, Manifold* m);

		[LinkName("c2CapsuletoPolyManifold")]
		public static extern void CapsuletoPolyManifold(Capsule A, Poly* B, x* bx, Manifold* m);

		[LinkName("c2PolytoPolyManifold")]
		public static extern void PolytoPolyManifold(Poly* A, x* ax, Poly* B, x* bx, Manifold* m);
		
		public enum TYPE : int32 {
			NONE,
			CIRCLE,
			AABB,
			CAPSULE,
			POLY,
		}

		[CRepr]
		public struct GJKCache {
			public float metric;
			public int32 count;
			public int32[3] iA;
			public int32[3] iB;
			public float div;
		}

		[LinkName("c2GJK")]
		public static extern float GJK(void* A, TYPE typeA, x* ax_ptr, void* B, TYPE typeB, x* bx_ptr, v* outA, v* outB, int32 use_radius, int32* iterations, GJKCache* cache);

		[CRepr]
		public struct TOIResult {
			public int32 hit;
			public float toi;
			public v n;
			public v p;
			public int32 iterations;
		}
	
		[LinkName("c2TOI")]
		public static extern TOIResult TOI(void* A, TYPE typeA, x* ax_ptr, v vA, void* B, TYPE typeB, x* bx_ptr, v vB, int32 use_radius);

		[LinkName("c2Inflate")]
		public static extern void Inflate(void* shape, TYPE type, float skin_factor);

		[LinkName("c2Hull")]
		public static extern int32 Hull(v* verts, int32 count);

		[LinkName("c2Norms")]
		public static extern void Norms(v* verts, v* norms, int32 count);

		[LinkName("c2MakePoly")]
		public static extern void MakePoly(Poly* p);

		[LinkName("c2Collided")]
		public static extern int32 Collided(void* A, x* ax, TYPE typeA, void* B, x* bx, TYPE typeB);

		[LinkName("c2Collide")]
		public static extern void Collide(void* A, x* ax, TYPE typeA, void* B, x* bx, TYPE typeB, Manifold* m);

		[LinkName("c2CastRay")]
		public static extern int32 CastRay(Ray A, void* B, x* bx, TYPE typeB, Raycast* _out);

		public const let GJK_ITERS = 20;

		[CRepr]
		public struct Proxy {
			public float radius;
			public int32 count;
			public v[MAX_POLYGON_VERTS] verts;
		}

		[CRepr]
		public struct sv {
			public v sA;
			public v sB;
			public v p;
			public float u;
			public int32 iA;
			public int32 iB;
		}

		[CRepr]
		public struct Simplex {
			public sv a, b, c, d;
			public float div;
			public int32 count;
		}
	}
}