#define MOD_ADD(x, N) do { \
	x = x + 1; \
	if(x == N) { \
		x = 0; \
	} \
} while(0)

#define MIN(a, b) (a < b ? a : b)
#define MAX(a, b) (a > b ? a : b)

#define CPE(val, msg, err_code) \
	if(val) { fprintf(stderr, msg); fprintf(stderr, " Error %d \n", err_code); \
	exit(err_code);}

#define ct_assert(condition) ((void) sizeof(char[-1 + 2 * !!(condition)]))

#define range_assert(x, a, b) (assert(x >= a && x <= b))

#define likely(x)      __builtin_expect(!!(x), 1)
#define unlikely(x)    __builtin_expect(!!(x), 0)
#define forceinline inline __attribute__((always_inline))
#define _unused(x) ((void)(x))

#define is_aligned(x, A) (((uint64_t) x) % A == 0)

#define LOG(...) fprintf(stdout, __VA_ARGS__)
