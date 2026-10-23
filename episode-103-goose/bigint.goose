// Always return normalized forms, so no negative 0, no limbs: [1, 0], or any other such nonsense
struct BigInt {
  negative: bool,
  limbs: u32[]
}

fn bigint_zero() -> BigInt {
  return BigInt{negative: false, limbs: []};
}

fn bigint_new(arg: i64) -> BigInt {
  let is_negative = arg < 0;
  var magnitude : u64;
  if arg < 0 {
    // docs say it's all guaranteed two's complement, so MIN_INT is fine here
    magnitude = (-arg) as u64;
  } else {
    magnitude = arg as u64;
  }
  let lo : u32 = (magnitude & 0xFFFFFFFF) as u32;
  let hi : u32 = (magnitude >> 32) as u32;
  if hi != 0 {
    return BigInt{negative: is_negative, limbs: [lo, hi]};
  }
  if lo != 0 {
    return BigInt{negative: is_negative, limbs: [lo]};
  }
  return BigInt{negative: is_negative, limbs: []};
}

// accepts only well formed values
fn bigint_new(arg: u8[]&) -> BigInt {
  var i = 0;
  var is_negative : bool = (arg[0] == '-');
  var result : u32[>..] = [];
  if is_negative { i ++; };
  while i < arg.len {
    let digit : u32[] = [arg[i] - '0'];
    var t0 : u32[] = copy(result);
    var t1 : u32[] = bigint_magnitude_mul_u32(t0, 10);
    var t2 : u32[] = bigint_magnitude_add(t1, digit);
    result = copy(t2);
    i++;
  }
  // normalize leading 0 and negative zero
  while result.len > 0 && result[result.len - 1] == 0 {
    result.pop();
  }
  if (result.len == 0) {
    is_negative = false;
  }
  return BigInt{negative: is_negative, limbs: result};
}

fn bigint_abs(a: BigInt&) -> BigInt {
  return BigInt{ negative: false, limbs: copy(a.limbs) };
}

fn bigint_is_zero(a: BigInt&) -> bool {
  return a.limbs.len == 0;
}

fn bigint_neg(a: BigInt&) -> BigInt {
  if bigint_is_zero(a) {
    return bigint_zero();
  } else {
    return BigInt{ negative: !a.negative, limbs: copy(a.limbs) };
  }
}

fn bigint_eq(a: BigInt&, b: BigInt&) -> bool {
  return a == b;
}

fn bigint_ne(a: BigInt&, b: BigInt&) -> bool {
  return a != b;
}

fn bigint_gt(a: BigInt&, b: BigInt&) -> bool {
  if a.negative {
    if b.negative {
      // a > b
      // -b > -a
      return bigint_magnitude_gt(b.limbs, a.limbs)
    } else {
      return false
    }
  } else {
    if b.negative {
      return true
    } else {
      // a > b
      return bigint_magnitude_gt(a.limbs, b.limbs)
    }
  }
}

fn bigint_ge(a: BigInt&, b: BigInt&) -> bool {
  return !bigint_gt(b, a)
}

fn bigint_lt(a: BigInt&, b: BigInt&) -> bool {
  return bigint_gt(b, a)
}

fn bigint_le(a: BigInt&, b: BigInt&) -> bool {
  return !bigint_gt(a, b)
}

fn bigint_magnitude_gt(a: u32[]&, b: u32[]&) -> bool {
  if a.len > b.len {
    return true;
  } else if b.len > a.len {
    return false;
  }
  let len = a.len;
  for i in len {
    let alimb = a[len - 1 - i];
    let blimb = b[len - 1 - i];
    if alimb > blimb {
      return true;
    } else if blimb > alimb {
      return false;
    }
  }
  return false
}

fn bigint_add(a: BigInt&, b: BigInt&) {
  if a.negative == b.negative {
    return BigInt{
      negative: a.negative,
      limbs: bigint_magnitude_add(a.limbs, b.limbs)
    }
  } else if (bigint_magnitude_gt(a.limbs, b.limbs)) {
    // |a| > |b|
    return BigInt{
      negative: a.negative,
      limbs: bigint_magnitude_sub(a.limbs, b.limbs)
    }
  } else if a.limbs == b.limbs {
    // |a| == |b|
    // special case this, to avoid negative 0
    return bigint_zero();
  } else {
    // |b| > |a|
    return BigInt{
      negative: b.negative,
      limbs: bigint_magnitude_sub(b.limbs, a.limbs)
    }
  }
}

fn bigint_sub(a: BigInt&, b: BigInt&) -> BigInt {
  let bneg = bigint_neg(b);
  return bigint_add(a, bneg)
}

fn bigint_magnitude_add(a: u32[]&, b: u32[]&) -> u32[] {
  var result = [];
  var carry : u64 = 0;
  var i = 0;
  while carry != 0 || i < a.len || i < b.len {
    let alimb : u64 = (if a.len > i { a[i] } else { 0 });
    let blimb : u64 = (if b.len > i { b[i] } else { 0 });
    carry += alimb + blimb;
    result.push((carry & 0xFFFFFFFF) as u32);
    carry >>= 32;
    i ++;
  }
  // no normalization needed, zeroes would work fine here
  return result
}

// assumption: a > b
fn bigint_magnitude_sub(a: u32[]&, b: u32[]&) -> u32[] {
  var result = [];
  var borrow: u64 = 0;
  var i = 0;

  while i < a.len {
    let alimb: u64 = a[i];
    let blimb = (if b.len > i { b[i] } else { 0 });
    let subtrahend : u64 = blimb + borrow;

    if alimb < subtrahend {
      result.push(((alimb + 0x100000000 - subtrahend) & 0xFFFFFFFF) as u32);
      borrow = 1;
    } else {
      result.push((alimb - subtrahend) as u32);
      borrow = 0;
    }
    i ++;
  }

  while result.len > 0 && result[result.len - 1] == 0 {
    result.pop();
  }

  return result;
}

fn bigint_mul(a: BigInt&, b: BigInt&) -> BigInt {
  if bigint_is_zero(a) || bigint_is_zero(b) {
    return bigint_zero()
  }
  return BigInt{
    negative: a.negative != b.negative,
    limbs: bigint_magnitude_mul(a.limbs, b.limbs)
  }
}

fn bigint_magnitude_mul(a: u32[]&, b: u32[]&) -> u32[] {
  var result : u32[>..] = [];

  for i in b.len {
    let partial = bigint_magnitude_mul_u32(a, b[i]);
    var j = 0;
    var carry : u64 = 0;
    while carry != 0 || j < partial.len {
      if i + j >= result.len {
        result.push(0)
      }
      let plimb : u64 = (if j < partial.len { partial[j] } else { 0 });
      carry = carry + result[i + j] + plimb;
      result[i + j] = (carry & 0xFFFFFFFF) as u32;
      carry >>= 32;
      j++;
    }
  }

  return result;
}

fn bigint_magnitude_mul_u32(a: u32[]&, b: u32) -> u32[] {
  if b == 0 {
    return []
  }
  let blimb : u64 = b;
  var result = [];
  var carry : u64 = 0;
  var i = 0;
  while carry != 0 || i < a.len {
    let alimb : u64 = (if i < a.len { a[i] } else { 0 });
    carry += alimb * blimb;
    result.push((carry & 0xFFFFFFFF) as u32);
    carry >>= 32;
    i ++;
  }
  return result;
}

// T is array type not element type, as there are so many array variants
fn array_reverse<T>(a : T&) {
  let len = a.len;
  var i = 0;
  var j = len - 1;
  while i < j {
    let ai = a[i];
    let aj = a[j];
    a[i] = aj;
    a[j] = ai;
    i++;
    j--;
  }
}

fn bigint_magnitude_div_u32(a: u32[]&, b: u32) -> u32[], u32 {
  if a.len == 0 {
    // raise exception here if b == 0?
    return [], 0
  }
  var result : u32[>..] = [];
  var remainder : u64 = 0;
  for i in a.len {
    let j = a.len-i-1;
    remainder = (remainder << 32) + a[j];
    result.push((remainder / b) as u32);
    remainder = remainder % b;
  };
  array_reverse(result);
  while result.len > 0 && result[result.len - 1] == 0 {
    result.pop();
  }
  return result, (remainder as u32);
}

fn bigint_to_s(a: BigInt&) -> u8[] {
  if bigint_is_zero(a) {
    return "0";
  }
  var num : u32[>..] = copy(a.limbs);
  var result : u8[>..] = [];

  while num.len != 0 {
    let numvar : u32[] = copy(num);
    let rest, digit = bigint_magnitude_div_u32(numvar, 10);
    result.push('0' + (digit as u8));
    num = copy(rest);
  }
  if a.negative {
    result.push('-');
  }
  array_reverse(result);
  return result;
}
