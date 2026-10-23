import unittest;
import bigint;

fn test_bigint_zero() {
  start_test("bigint_zero");
  let a = bigint_zero();
  assert_equal(a.negative, false);
  assert_equal(a.limbs.len, 0);
}

fn test_bigint_new() {
  start_test("bigint_new");
  let a = bigint_new(0);
  let a_expected = BigInt{negative: false, limbs: []};
  assert_equal(a, a_expected);

  let b = bigint_new(1234);
  let b_expected = BigInt{negative: false, limbs: [1234]};
  assert_equal(b, b_expected);

  let c = bigint_new(-9223372036854775808); // min_int
  let c_expected = BigInt{negative: true, limbs: [0, 0x80000000]};
  assert_equal(c, c_expected);
}

fn test_bigint_new_string() {
  start_test("bigint_new_string");

  let zero_str : u8[] = "0";
  let zero = bigint_new(zero_str);
  let zero_expected = BigInt{negative: false, limbs: []};
  assert_equal(zero, zero_expected);

  let neg_zero_str : u8[] = "-0";
  let neg_zero = bigint_new(neg_zero_str);
  let neg_zero_expected = BigInt{negative: false, limbs: []};
  assert_equal(neg_zero, neg_zero_expected);

  let one_str : u8[] = "1";
  let one = bigint_new(one_str);
  let one_expected = BigInt{negative: false, limbs: [1]};
  assert_equal(one, one_expected);

  let neg_one_str : u8[] = "-1";
  let neg_one = bigint_new(neg_one_str);
  let neg_one_expected = BigInt{negative: true, limbs: [1]};
  assert_equal(neg_one, neg_one_expected);

  let small_str : u8[] = "123456789";
  let small = bigint_new(small_str);
  let small_expected = BigInt{negative: false, limbs: [123456789]};
  assert_equal(small, small_expected);

  let neg_small_str : u8[] = "-123456789";
  let neg_small = bigint_new(neg_small_str);
  let neg_small_expected = BigInt{negative: true, limbs: [123456789]};
  assert_equal(neg_small, neg_small_expected);

  let two32_str : u8[] = "4294967296";
  let two32 = bigint_new(two32_str);
  let two32_expected = BigInt{negative: false, limbs: [0, 1]};
  assert_equal(two32, two32_expected);

  let neg_two32_str : u8[] = "-4294967296";
  let neg_two32 = bigint_new(neg_two32_str);
  let neg_two32_expected = BigInt{negative: true, limbs: [0, 1]};
  assert_equal(neg_two32, neg_two32_expected);

  let max_u32_str : u8[] = "4294967295";
  let max_u32 = bigint_new(max_u32_str);
  let max_u32_expected = BigInt{negative: false, limbs: [0xFFFFFFFF]};
  assert_equal(max_u32, max_u32_expected);

  let two64_str : u8[] = "18446744073709551616";
  let two64 = bigint_new(two64_str);
  let two64_expected = BigInt{negative: false, limbs: [0, 0, 1]};
  assert_equal(two64, two64_expected);

  let leading_zeroes_str : u8[] = "00000123";
  let leading_zeroes = bigint_new(leading_zeroes_str);
  let leading_zeroes_expected = BigInt{negative: false, limbs: [123]};
  assert_equal(leading_zeroes, leading_zeroes_expected);

  let leading_zeroes_neg_str : u8[] = "-00000123";
  let leading_zeroes_neg = bigint_new(leading_zeroes_neg_str);
  let leading_zeroes_neg_expected = BigInt{negative: true, limbs: [123]};
  assert_equal(leading_zeroes_neg, leading_zeroes_neg_expected);
}

fn test_bigint_abs() {
  start_test("bigint_abs");
  let zero = bigint_zero();
  let abs_zero = bigint_abs(zero);
  assert_equal(abs_zero, zero);

  let num_1234 = bigint_new(1234);
  let b = bigint_abs(num_1234);
  assert_equal(b, num_1234);

  let num_minus_1234 = bigint_new(-1234);
  let c = bigint_abs(num_minus_1234);
  assert_equal(c, num_1234);
}

fn test_bigint_is_zero() {
  start_test("bigint_is_zero");

  let zero = bigint_zero();
  let one = bigint_new(1);
  let minus_one = bigint_new(-1);

  assert_equal(bigint_is_zero(zero), true);
  assert_equal(bigint_is_zero(one), false);
  assert_equal(bigint_is_zero(minus_one), false);
}

fn test_bigint_neg() {
  start_test("bigint_neg");

  let zero = bigint_zero();
  let neg_zero = bigint_neg(zero);
  assert_equal(neg_zero.negative, false);
  assert_equal(neg_zero.limbs.len, 0);

  let a = bigint_new(1234);
  let b = bigint_neg(a);
  assert_equal(b.negative, true);
  assert_equal(b.limbs.len, 1);
  assert_equal(b.limbs[0], 1234);

  let c = bigint_neg(b);
  assert_equal(c.negative, false);
  assert_equal(c.limbs.len, 1);
  assert_equal(c.limbs[0], 1234);
}

fn test_bigint_eq_ne() {
  start_test("bigint_eq_ne");

  let a = bigint_new(1234);
  let b = bigint_new(1234);
  let c = bigint_new(-1234);
  let d = bigint_new(1235);
  let zero = bigint_zero();

  assert_equal(bigint_eq(a, b), true);
  assert_equal(bigint_ne(a, b), false);

  assert_equal(bigint_eq(a, c), false);
  assert_equal(bigint_ne(a, c), true);

  assert_equal(bigint_eq(a, d), false);
  assert_equal(bigint_ne(a, d), true);

  let one = bigint_new(1);
  assert_equal(bigint_eq(zero, zero), true);
  assert_equal(bigint_ne(zero, one), true);
}

fn test_bigint_magnitude_eq_gt() {
  start_test("bigint_magnitude_eq_gt");

  let a : u32[] = [42];
  let b : u32[] = [42];
  let c : u32[] = [43];
  let d : u32[] = [0, 1]; // 2^32
  let e : u32[] = [0xFFFFFFFF]; // 2^32 - 1
  let zero : u32[] = [];

  assert_equal(bigint_magnitude_gt(c, a), true);
  assert_equal(bigint_magnitude_gt(a, c), false);
  assert_equal(bigint_magnitude_gt(a, b), false);

  assert_equal(bigint_magnitude_gt(d, e), true);
  assert_equal(bigint_magnitude_gt(e, d), false);

  assert_equal(bigint_magnitude_gt(a, zero), true);
  assert_equal(bigint_magnitude_gt(zero, a), false);
  assert_equal(bigint_magnitude_gt(zero, zero), false);
}

fn test_bigint_comparisons() {
  start_test("bigint_comparisons");

  let minus_ten = bigint_new(-10);
  let minus_five = bigint_new(-5);
  let zero = bigint_zero();
  let five = bigint_new(5);
  let ten = bigint_new(10);

  assert_equal(bigint_gt(ten, five), true);
  assert_equal(bigint_gt(five, ten), false);
  assert_equal(bigint_ge(ten, ten), true);
  assert_equal(bigint_ge(five, ten), false);

  assert_equal(bigint_gt(minus_five, minus_ten), true);
  assert_equal(bigint_gt(minus_ten, minus_five), false);
  assert_equal(bigint_ge(minus_five, minus_five), true);
  assert_equal(bigint_ge(minus_ten, minus_five), false);

  assert_equal(bigint_gt(five, minus_five), true);
  assert_equal(bigint_gt(minus_five, five), false);

  assert_equal(bigint_gt(zero, minus_five), true);
  assert_equal(bigint_gt(zero, five), false);
  assert_equal(bigint_ge(zero, zero), true);

  assert_equal(bigint_lt(five, ten), true);
  assert_equal(bigint_lt(ten, five), false);
  assert_equal(bigint_le(five, five), true);
  assert_equal(bigint_le(ten, five), false);

  assert_equal(bigint_lt(minus_ten, minus_five), true);
  assert_equal(bigint_le(minus_ten, minus_ten), true);
  assert_equal(bigint_lt(minus_five, minus_ten), false);

  assert_equal(bigint_lt(minus_five, zero), true);
  assert_equal(bigint_lt(zero, five), true);
  assert_equal(bigint_le(zero, minus_five), false);
}

fn test_bigint_magnitude_add() {
  start_test("bigint_magnitude_add");

  let empty : u32[] = [];
  let a : u32[] = [1];
  let b : u32[] = [2];
  let c : u32[] = [0xFFFFFFFF];
  let d : u32[] = [1];
  let e : u32[] = [0xFFFFFFFF, 0xFFFFFFFF];
  let f : u32[] = [1];

  let r0 = bigint_magnitude_add(empty, empty);
  assert_equal(r0.len, 0);

  let r1 = bigint_magnitude_add(a, b);
  assert_equal(r1.len, 1);
  assert_equal(r1[0], 3);

  // Carry into a new limb: 2^32 - 1 + 1 = 2^32.
  let r2 = bigint_magnitude_add(c, d);
  assert_equal(r2.len, 2);
  assert_equal(r2[0], 0);
  assert_equal(r2[1], 1);

  // Carry propagates through multiple limbs.
  let r3 = bigint_magnitude_add(e, f);
  assert_equal(r3.len, 3);
  assert_equal(r3[0], 0);
  assert_equal(r3[1], 0);
  assert_equal(r3[2], 1);
}

fn test_bigint_magnitude_sub() {
  start_test("bigint_magnitude_sub");

  let a : u32[] = [3];
  let b : u32[] = [2];

  let r1 = bigint_magnitude_sub(a, b);
  assert_equal(r1.len, 1);
  assert_equal(r1[0], 1);

  // 2^32 - 1 = [0xFFFFFFFF].
  let c : u32[] = [0, 1];
  let d : u32[] = [1];

  let r2 = bigint_magnitude_sub(c, d);
  assert_equal(r2.len, 1);
  assert_equal(r2[0], 0xFFFFFFFF);

  // Borrow propagates across multiple limbs.
  let e : u32[] = [0, 0, 1];
  let f : u32[] = [1];

  let r3 = bigint_magnitude_sub(e, f);
  assert_equal(r3.len, 2);
  assert_equal(r3[0], 0xFFFFFFFF);
  assert_equal(r3[1], 0xFFFFFFFF);
}

fn test_bigint_add() {
  start_test("bigint_add");

  let a = bigint_new(5);
  let b = bigint_new(3);
  let r1 = bigint_add(a, b);

  assert_equal(r1.negative, false);
  assert_equal(r1.limbs.len, 1);
  assert_equal(r1.limbs[0], 8);

  let c = bigint_new(-5);
  let d = bigint_new(-3);
  let r2 = bigint_add(c, d);

  assert_equal(r2.negative, true);
  assert_equal(r2.limbs.len, 1);
  assert_equal(r2.limbs[0], 8);

  let e = bigint_new(5);
  let f = bigint_new(-3);
  let r3 = bigint_add(e, f);

  assert_equal(r3.negative, false);
  assert_equal(r3.limbs.len, 1);
  assert_equal(r3.limbs[0], 2);

  let g = bigint_new(3);
  let h = bigint_new(-5);
  let r4 = bigint_add(g, h);

  assert_equal(r4.negative, true);
  assert_equal(r4.limbs.len, 1);
  assert_equal(r4.limbs[0], 2);

  let i = bigint_new(5);
  let j = bigint_new(-5);
  let r5 = bigint_add(i, j);

  assert_equal(r5.negative, false);
  assert_equal(r5.limbs.len, 0);

  // Cross a limb boundary.
  let k = bigint_new(4294967295);
  let l = bigint_new(1);
  let r6 = bigint_add(k, l);

  assert_equal(r6.negative, false);
  assert_equal(r6.limbs.len, 2);
  assert_equal(r6.limbs[0], 0);
  assert_equal(r6.limbs[1], 1);

  // Adding zero.
  let zero = bigint_zero();
  let minus_42 = bigint_new(-42);
  let r7 = bigint_add(zero, minus_42);

  assert_equal(r7.negative, true);
  assert_equal(r7.limbs.len, 1);
  assert_equal(r7.limbs[0], 42);
}

fn test_bigint_sub() {
  start_test("bigint_sub");

  let a = bigint_new(5);
  let b = bigint_new(3);
  let r1 = bigint_sub(a, b);

  assert_equal(r1.negative, false);
  assert_equal(r1.limbs.len, 1);
  assert_equal(r1.limbs[0], 2);

  let c = bigint_new(3);
  let d = bigint_new(5);
  let r2 = bigint_sub(c, d);

  assert_equal(r2.negative, true);
  assert_equal(r2.limbs.len, 1);
  assert_equal(r2.limbs[0], 2);

  let e = bigint_new(-5);
  let f = bigint_new(-3);
  let r3 = bigint_sub(e, f);

  assert_equal(r3.negative, true);
  assert_equal(r3.limbs.len, 1);
  assert_equal(r3.limbs[0], 2);

  let g = bigint_new(-3);
  let h = bigint_new(-5);
  let r4 = bigint_sub(g, h);

  assert_equal(r4.negative, false);
  assert_equal(r4.limbs.len, 1);
  assert_equal(r4.limbs[0], 2);

  let i = bigint_new(5);
  let j = bigint_new(5);
  let r5 = bigint_sub(i, j);

  assert_equal(r5.negative, false);
  assert_equal(r5.limbs.len, 0);

  // Subtract across a limb boundary: 2^32 - 1.
  let k = bigint_new(4294967296);
  let l = bigint_new(1);
  let r6 = bigint_sub(k, l);

  assert_equal(r6.negative, false);
  assert_equal(r6.limbs.len, 1);
  assert_equal(r6.limbs[0], 0xFFFFFFFF);
}

fn test_bigint_magnitude_mul_u32() {
  start_test("bigint_magnitude_mul_u32");

  let zero : u32[] = [];
  let five : u32[] = [5];
  let uint32_max : u32[] = [0xFFFFFFFF];
  let uint64_max : u32[] = [0xFFFFFFFF, 0xFFFFFFFF];
  let a : u32[] = [1, 1];
  let b : u32[] = [0xFFFFFFFF, 1];

  assert_equal(bigint_magnitude_mul_u32(zero, 0), []);
  assert_equal(bigint_magnitude_mul_u32(zero, 5), []);
  assert_equal(bigint_magnitude_mul_u32(five, 0), []);
  assert_equal(bigint_magnitude_mul_u32(five, 1), [5]);
  assert_equal(bigint_magnitude_mul_u32(five, 3), [15]);
  assert_equal(bigint_magnitude_mul_u32(uint32_max, 1), [0xFFFFFFFF]);
  assert_equal(bigint_magnitude_mul_u32(uint32_max, 2), [0xFFFFFFFE, 1]);
  assert_equal(bigint_magnitude_mul_u32(uint32_max, 0xFFFFFFFF), [1, 0xFFFFFFFE]);
  assert_equal(bigint_magnitude_mul_u32(a, 2), [2, 2]);
  assert_equal(bigint_magnitude_mul_u32(b, 2), [0xFFFFFFFE, 3]);
}

fn test_bigint_magnitude_mul() {
  start_test("bigint_magnitude_mul");

  let empty_a : u32[] = [];
  let empty_b : u32[] = [];
  let one : u32[] = [1];
  let two : u32[] = [2];
  let three : u32[] = [3];
  let four : u32[] = [4];
  let five : u32[] = [5];
  let six : u32[] = [6];
  let a : u32[] = [1, 1];
  let b : u32[] = [1, 1];
  let c : u32[] = [2, 3];
  let d : u32[] = [4, 5];
  let max : u32[] = [0xFFFFFFFF];
  let max_pair : u32[] = [0xFFFFFFFF, 0xFFFFFFFF];
  let high : u32[] = [0, 1];

  assert_equal(bigint_magnitude_mul(empty_a, empty_b), []);
  assert_equal(bigint_magnitude_mul(empty_a, one), []);
  assert_equal(bigint_magnitude_mul(one, empty_b), []);
  assert_equal(bigint_magnitude_mul(three, four), [12]);
  assert_equal(bigint_magnitude_mul(five, six), [30]);
  assert_equal(bigint_magnitude_mul(max, two), [0xFFFFFFFE, 1]);
  assert_equal(bigint_magnitude_mul(a, b), [1, 2, 1]);
  assert_equal(bigint_magnitude_mul(c, d), [8, 22, 15]);
  assert_equal(bigint_magnitude_mul(max, max), [1, 0xFFFFFFFE]);
  assert_equal(bigint_magnitude_mul(high, two), [0, 2]);
  assert_equal(bigint_magnitude_mul(max_pair, two), [0xFFFFFFFE, 0xFFFFFFFF, 1]);
}

fn test_bigint_mul() {
  start_test("bigint_mul");

  let zero = bigint_new(0);
  let one = bigint_new(1);
  let neg_one = bigint_new(-1);
  let five = bigint_new(5);
  let six = bigint_new(6);
  let seven = bigint_new(7);
  let neg_six = bigint_new(-6);
  let neg_seven = bigint_new(-7);

  let a = bigint_mul(zero, five);
  let a_expected = BigInt{negative: false, limbs: []};
  assert_equal(a, a_expected);

  let b = bigint_mul(five, zero);
  let b_expected = BigInt{negative: false, limbs: []};
  assert_equal(b, b_expected);

  let c = bigint_mul(one, one);
  let c_expected = BigInt{negative: false, limbs: [1]};
  assert_equal(c, c_expected);

  let d = bigint_mul(six, seven);
  let d_expected = BigInt{negative: false, limbs: [42]};
  assert_equal(d, d_expected);

  let e = bigint_mul(neg_six, seven);
  let e_expected = BigInt{negative: true, limbs: [42]};
  assert_equal(e, e_expected);

  let f = bigint_mul(six, neg_seven);
  let f_expected = BigInt{negative: true, limbs: [42]};
  assert_equal(f, f_expected);

  let g = bigint_mul(neg_six, neg_seven);
  let g_expected = BigInt{negative: false, limbs: [42]};
  assert_equal(g, g_expected);

  let h = bigint_mul(neg_one, one);
  let h_expected = BigInt{negative: true, limbs: [1]};
  assert_equal(h, h_expected);

  let i = bigint_mul(neg_one, neg_one);
  let i_expected = BigInt{negative: false, limbs: [1]};
  assert_equal(i, i_expected);

  let j = bigint_mul(zero, neg_one);
  let j_expected = BigInt{negative: false, limbs: []};
  assert_equal(j, j_expected);

  // 2^32 * 2 = 2^33
  let large_a = BigInt{negative: false, limbs: [0, 1]};
  let large_b = bigint_new(2);
  let k = bigint_mul(large_a, large_b);
  let k_expected = BigInt{negative: false, limbs: [0, 2]};
  assert_equal(k, k_expected);

  // (2^32 - 1)^2 = 2^64 - 2^33 + 1
  let max_a = BigInt{negative: false, limbs: [0xFFFFFFFF]};
  let max_b = BigInt{negative: false, limbs: [0xFFFFFFFF]};
  let l = bigint_mul(max_a, max_b);
  let l_expected = BigInt{negative: false, limbs: [1, 0xFFFFFFFE]};
  assert_equal(l, l_expected);

  // Negative multi-limb value times positive value.
  let multi_neg = BigInt{negative: true, limbs: [0, 1]};
  let multi_pos = BigInt{negative: false, limbs: [2]};
  let m = bigint_mul(multi_neg, multi_pos);
  let m_expected = BigInt{negative: true, limbs: [0, 2]};
  assert_equal(m, m_expected);

  // Negative multi-limb value times negative value.
  let minus_2 = BigInt{negative: true, limbs: [2]};
  let n = bigint_mul(multi_neg, minus_2);
  let n_expected = BigInt{negative: false, limbs: [0, 2]};
  assert_equal(n, n_expected);
}

fn test_bigint_magnitude_div_u32() {
  start_test("bigint_magnitude_div_u32");

  let empty : u32[] = [];
  let one : u32[] = [1];
  let nine : u32[] = [9];
  let ten : u32[] = [10];
  let eleven : u32[] = [11];
  let hundred : u32[] = [100];
  let max : u32[] = [0xFFFFFFFF];
  let two32 : u32[] = [0, 1];
  let two32_plus_one : u32[] = [1, 1];
  let large : u32[] = [0xFFFFFFFF, 0xFFFFFFFF];

  // 0 / 10 = 0 remainder 0
  let q0, r0 = bigint_magnitude_div_u32(empty, 10);
  let q0_expected : u32[] = [];
  let r0_expected : u32 = 0;
  assert_equal(q0, q0_expected);
  assert_equal(r0, r0_expected);

  // 1 / 10 = 0 remainder 1
  let q1, r1 = bigint_magnitude_div_u32(one, 10);
  let q1_expected : u32[] = [];
  let r1_expected : u32 = 1;
  assert_equal(q1, q1_expected);
  assert_equal(r1, r1_expected);

  // 9 / 10 = 0 remainder 9
  let q2, r2 = bigint_magnitude_div_u32(nine, 10);
  let q2_expected : u32[] = [];
  let r2_expected : u32 = 9;
  assert_equal(q2, q2_expected);
  assert_equal(r2, r2_expected);

  // 10 / 10 = 1 remainder 0
  let q3, r3 = bigint_magnitude_div_u32(ten, 10);
  let q3_expected : u32[] = [1];
  let r3_expected : u32 = 0;
  assert_equal(q3, q3_expected);
  assert_equal(r3, r3_expected);

  // 11 / 10 = 1 remainder 1
  let q4, r4 = bigint_magnitude_div_u32(eleven, 10);
  let q4_expected : u32[] = [1];
  let r4_expected : u32 = 1;
  assert_equal(q4, q4_expected);
  assert_equal(r4, r4_expected);

  // 100 / 10 = 10 remainder 0
  let q5, r5 = bigint_magnitude_div_u32(hundred, 10);
  let q5_expected : u32[] = [10];
  let r5_expected : u32 = 0;
  assert_equal(q5, q5_expected);
  assert_equal(r5, r5_expected);

  // (2^32 - 1) / 10 = 429496729 remainder 5
  let q6, r6 = bigint_magnitude_div_u32(max, 10);
  let q6_expected : u32[] = [429496729];
  let r6_expected : u32 = 5;
  assert_equal(q6, q6_expected);
  assert_equal(r6, r6_expected);

  // 2^32 / 10 = 429496729 remainder 6
  let q7, r7 = bigint_magnitude_div_u32(two32, 10);
  let q7_expected : u32[] = [429496729];
  let r7_expected : u32 = 6;
  assert_equal(q7, q7_expected);
  assert_equal(r7, r7_expected);

  // (2^32 + 1) / 10 = 429496729 remainder 7
  let q8, r8 = bigint_magnitude_div_u32(two32_plus_one, 10);
  let q8_expected : u32[] = [429496729];
  let r8_expected : u32 = 7;
  assert_equal(q8, q8_expected);
  assert_equal(r8, r8_expected);

  // (2^64 - 1) / 10 = 1844674407370955161 remainder 5
  let q9, r9 = bigint_magnitude_div_u32(large, 10);
  let q9_expected : u32[] = [2576980377, 429496729];
  let r9_expected : u32 = 5;
  assert_equal(q9, q9_expected);
  assert_equal(r9, r9_expected);
}

fn test_bigint_to_s() {
  start_test("bigint_to_s");

  let zero = bigint_new(0);
  let zero_expected : u8[] = "0";
  let zero_str = bigint_to_s(zero);
  assert_equal(zero_str, zero_expected);

  let one = bigint_new(1);
  let one_expected : u8[] = "1";
  let one_str = bigint_to_s(one);
  assert_equal(one_str, one_expected);

  let neg_one = bigint_new(-1);
  let neg_one_expected : u8[] = "-1";
  let neg_one_str = bigint_to_s(neg_one);
  assert_equal(neg_one_str, neg_one_expected);

  let positive = bigint_new(123456789);
  let positive_expected : u8[] = "123456789";
  let positive_str = bigint_to_s(positive);
  assert_equal(positive_str, positive_expected);

  let negative = bigint_new(-123456789);
  let negative_expected : u8[] = "-123456789";
  let negative_str = bigint_to_s(negative);
  assert_equal(negative_str, negative_expected);

  // 2^32
  let two32 = BigInt{negative: false, limbs: [0, 1]};
  let two32_expected : u8[] = "4294967296";
  let two32_str = bigint_to_s(two32);
  assert_equal(two32_str, two32_expected);

  let neg_two32 = BigInt{negative: true, limbs: [0, 1]};
  let neg_two32_expected : u8[] = "-4294967296";
  let neg_two32_str = bigint_to_s(neg_two32);
  assert_equal(neg_two32_str, neg_two32_expected);

  // 2^64 - 1
  let max_u64 = BigInt{negative: false, limbs: [0xFFFFFFFF, 0xFFFFFFFF]};
  let max_u64_expected : u8[] = "18446744073709551615";
  let max_u64_str = bigint_to_s(max_u64);
  assert_equal(max_u64_str, max_u64_expected);

  // 2^64
  let two64 = BigInt{negative: false, limbs: [0, 0, 1]};
  let two64_expected : u8[] = "18446744073709551616";
  let two64_str = bigint_to_s(two64);
  assert_equal(two64_str, two64_expected);

  // Several zero digits in the middle and at the end.
  let zeros = BigInt{negative: false, limbs: [0, 0, 1]};
  let zeros_expected : u8[] = "18446744073709551616";
  let zeros_str = bigint_to_s(zeros);
  assert_equal(zeros_str, zeros_expected);

  // Negative multi-limb value.
  let neg_large = BigInt{negative: true, limbs: [0xFFFFFFFF, 0xFFFFFFFF]};
  let neg_large_expected : u8[] = "-18446744073709551615";
  let neg_large_str = bigint_to_s(neg_large);
  assert_equal(neg_large_str, neg_large_expected);
}

fn main() {
  test_bigint_zero();
  test_bigint_new();
  test_bigint_new_string();
  test_bigint_zero();
  test_bigint_abs();
  test_bigint_new();
  test_bigint_abs();
  test_bigint_is_zero();
  test_bigint_neg();
  test_bigint_eq_ne();
  test_bigint_magnitude_eq_gt();
  test_bigint_comparisons();
  test_bigint_magnitude_add();
  test_bigint_magnitude_sub();
  test_bigint_add();
  test_bigint_sub();
  test_bigint_magnitude_mul_u32();
  test_bigint_magnitude_mul();
  test_bigint_mul();
  test_bigint_magnitude_div_u32();
  test_bigint_to_s();

  report_test_results()
}
