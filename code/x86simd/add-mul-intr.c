#include <stdio.h>
#include <string.h>
#include <x86intrin.h>

// 16 ビット符号付き整数 × 8 の 128 ビットベクトルを出力
void print_vec(char *name, __m128i vec)
{
	// 128 ビットベクトルの各要素を配列 v にコピー
	unsigned short v[8];
	memcpy(v, &vec, sizeof(v));
	printf("%s: %d, %d, %d, %d, %d, %d, %d, %d\n",
	       name, v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7]);
}

int main(void)
{
	// 16 ビット符号付き整数 × 8 の 128 ビットベクトル
	__m128i vec1 = _mm_set_epi16(7, 6, 5, 4, 3, 2, 1, 0);
	__m128i vec2 = _mm_set_epi16(3, 4, 5, 6, 7, 8, 9, 10);
	print_vec("vec1", vec1);
	print_vec("vec2", vec2);
	// vec2 ← <+> vec1
	vec2 = _mm_add_epi16(vec2, vec1);
	print_vec("vec1", vec1);
	print_vec("vec2", vec2);
	// vec1 ← <*> vec2
	vec1 = _mm_mullo_epi16(vec1, vec2);
	print_vec("vec1", vec1);
	print_vec("vec2", vec2);
	return 0;
}
