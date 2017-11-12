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

struct xxx{
	...
	...
} __attribute__((aligned(CACHE_LINE_SIZE)))


#ifndef LOG_LEVEL
#ifdef DEBUG
#define LOG_LEVEL 10
#else // !DEBUG
#define LOG_LEVEL 1
#endif // DEBUG
#endif // LOG_LEVEL

#define LOG(LEVEL, STR) do {\
    if ((LEVEL) < LOG_LEVEL) {\
        printf("%-20s | %3d |  ",__FUNCTION__,__LINE__); \
        printf STR; \
        fflush(stdout); \
    } \
} while(0);
	
	#define is_aligned(x, A)		(((uint64_t) x) % A == 0)
#define LOG(...) 		fprintf(stdout, __VA_ARGS__)
// #define LOG(...) do{}while(0);
#define ERR(...) 		fprintf(stderr, __VA_ARGS__)
#define range_assert(x, a, b)	(assert(x >= a && x <= b))
#define make_nbit_1(x, n)		(x | (1 << n))
#define make_nbit_0(x, n)		(x & ~(1 << n))
#define CASLOCK(lock)   while(!__sync_bool_compare_and_swap(&lock, 0, 1))
#define CASUNLOCK(lock)	assert(lock == 1);  lock = 0
#define assert_range(x, a, b, msg) do { \
	if (x < a || x >= b) { \
		ERR("[ERR] %d <=> %d (%d)\n", a, b, x); \
		ERR("[ADD] %p\n", (void *)(r_nvm_mem + x)); \
		ERR("[MSG] %d\n", msg); \
		assert(0); \
	} \
} while (0);
#define mem_dump(x, n) do { \
	LOG("[MEM_DUMP]%p\n", x); \
	for (int i = 0; i < n; i ++ ) { \
		PRINT_BINARY_CHAR(*(x + i)); \
	} \
} while(0);
