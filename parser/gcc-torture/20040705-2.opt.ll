; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040705-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8, [3 x i8], i64 }
%1 = type { [2 x i8], i8, i8, i64 }
%struct.anon = type { i8, [2 x i8], i8, i64 }

@b = common global %struct.anon zeroinitializer, align 8
@c = common global %0 zeroinitializer, align 8
@d = common global %1 zeroinitializer, align 8

define i32 @ret1() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %bf.clear = and i32 %0, 63
  ret i32 %bf.clear
}

define i32 @ret2() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  ret i32 %bf.clear
}

define i32 @ret3() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 17
  ret i32 %1
}

define i32 @ret4() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %bf.clear = and i32 %0, 31
  ret i32 %bf.clear
}

define i32 @ret5() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  ret i32 %bf.clear
}

define i32 @ret6() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 6
  ret i32 %1
}

define i32 @ret7() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %bf.clear = and i32 %0, 65535
  ret i32 %bf.clear
}

define i32 @ret8() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  ret i32 %bf.clear
}

define i32 @ret9() nounwind uwtable readonly {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 24
  ret i32 %1
}

define void @fn1_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %add = add i32 %0, %x
  %1 = and i32 %add, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %add1 = shl i32 %x, 6
  %1 = add i32 %0, %add1
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %add1 = shl i32 %x, 17
  %1 = add i32 %0, %add1
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %add = add i32 %0, %x
  %1 = and i32 %add, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %add1 = shl i32 %x, 5
  %1 = add i32 %0, %add1
  %2 = and i32 %1, 32
  %3 = and i32 %0, -33
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %add1 = shl i32 %x, 6
  %1 = add i32 %0, %add1
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %add = add i32 %0, %x
  %1 = and i32 %add, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %add1 = shl i32 %x, 16
  %1 = add i32 %0, %add1
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_1(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %add1 = shl i32 %x, 24
  %1 = add i32 %0, %add1
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %inc = add i32 %0, 1
  %1 = and i32 %inc, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 64
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 131072
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %inc = add i32 %0, 1
  %1 = and i32 %inc, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = add i32 %0, 64
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %inc = add i32 %0, 1
  %1 = and i32 %inc, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 65536
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_2(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 16777216
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %inc = add i32 %0, 1
  %1 = and i32 %inc, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 64
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 131072
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %inc = add i32 %0, 1
  %1 = and i32 %inc, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = add i32 %0, 64
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %inc = add i32 %0, 1
  %1 = and i32 %inc, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 65536
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_3(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 16777216
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %sub = sub i32 %0, %x
  %1 = and i32 %sub, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %sub1 = shl i32 %x, 6
  %1 = sub i32 %0, %sub1
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %sub1 = shl i32 %x, 17
  %1 = sub i32 %0, %sub1
  %2 = and i32 %1, -131072
  %3 = and i32 %0, 131071
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %sub = sub i32 %0, %x
  %1 = and i32 %sub, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %sub1 = shl i32 %x, 5
  %1 = sub i32 %0, %sub1
  %2 = and i32 %1, 32
  %3 = and i32 %0, -33
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %sub1 = shl i32 %x, 6
  %1 = sub i32 %0, %sub1
  %2 = and i32 %1, -64
  %3 = and i32 %0, 63
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %sub = sub i32 %0, %x
  %1 = and i32 %sub, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %sub1 = shl i32 %x, 16
  %1 = sub i32 %0, %sub1
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_4(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %sub1 = shl i32 %x, 24
  %1 = sub i32 %0, %sub1
  %2 = and i32 %1, -16777216
  %3 = and i32 %0, 16777215
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %dec = add i32 %0, 63
  %1 = and i32 %dec, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 131008
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, -131072
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %dec = add i32 %0, 31
  %1 = and i32 %dec, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = add i32 %0, -64
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %dec = add i32 %0, 65535
  %1 = and i32 %dec, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 16711680
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_5(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, -16777216
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %dec = add i32 %0, 63
  %1 = and i32 %dec, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 131008
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, -131072
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %dec = add i32 %0, 31
  %1 = and i32 %dec, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = add i32 %0, -64
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %dec = add i32 %0, 65535
  %1 = and i32 %dec, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 16711680
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_6(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, -16777216
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = or i32 %x, -64
  %2 = and i32 %0, %1
  store i32 %2, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = shl i32 %x, 6
  %2 = or i32 %1, -131009
  %3 = and i32 %0, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %and1 = shl i32 %x, 17
  %1 = or i32 %and1, 131071
  %2 = and i32 %0, %1
  store i32 %2, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = or i32 %x, -32
  %2 = and i32 %0, %1
  store i32 %2, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = shl i32 %x, 5
  %2 = or i32 %1, -33
  %3 = and i32 %0, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %and1 = shl i32 %x, 6
  %1 = or i32 %and1, 63
  %2 = and i32 %0, %1
  store i32 %2, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = or i32 %x, -65536
  %2 = and i32 %0, %1
  store i32 %2, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = shl i32 %x, 16
  %2 = or i32 %1, -16711681
  %3 = and i32 %0, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_7(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %and1 = shl i32 %x, 24
  %1 = or i32 %and1, 16777215
  %2 = and i32 %0, %1
  store i32 %2, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = and i32 %x, 63
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %or1 = shl i32 %x, 6
  %1 = and i32 %or1, 131008
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = shl i32 %x, 17
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = and i32 %x, 31
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %or1 = shl i32 %x, 5
  %1 = and i32 %or1, 32
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = shl i32 %x, 6
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = and i32 %x, 65535
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %or1 = shl i32 %x, 16
  %1 = and i32 %or1, 16711680
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_8(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = shl i32 %x, 24
  %2 = or i32 %0, %1
  store i32 %2, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %xor = xor i32 %0, %x
  %1 = and i32 %xor, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %xor1 = shl i32 %x, 6
  %1 = xor i32 %0, %xor1
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = shl i32 %x, 17
  %.masked = and i32 %0, -131072
  %2 = xor i32 %.masked, %1
  %3 = and i32 %0, 131071
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %xor = xor i32 %0, %x
  %1 = and i32 %xor, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %xor1 = shl i32 %x, 5
  %1 = xor i32 %0, %xor1
  %2 = and i32 %1, 32
  %3 = and i32 %0, -33
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = shl i32 %x, 6
  %.masked = and i32 %0, -64
  %2 = xor i32 %.masked, %1
  %3 = and i32 %0, 63
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %xor = xor i32 %0, %x
  %1 = and i32 %xor, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %xor1 = shl i32 %x, 16
  %1 = xor i32 %0, %xor1
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_9(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = shl i32 %x, 24
  %.masked = and i32 %0, -16777216
  %2 = xor i32 %.masked, %1
  %3 = and i32 %0, 16777215
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %bf.clear = and i32 %0, 63
  %div = udiv i32 %bf.clear, %x
  %1 = and i32 %div, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %div = udiv i32 %bf.clear, %x
  %2 = shl nuw nsw i32 %div, 6
  %3 = and i32 %2, 131008
  %4 = and i32 %0, -131009
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 17
  %div = udiv i32 %1, %x
  %2 = shl nuw i32 %div, 17
  %3 = and i32 %0, 131071
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %bf.clear = and i32 %0, 31
  %div = udiv i32 %bf.clear, %x
  %1 = and i32 %div, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %div = udiv i32 %bf.clear, %x
  %2 = shl nuw nsw i32 %div, 5
  %3 = and i32 %2, 32
  %4 = and i32 %0, -33
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 6
  %div = udiv i32 %1, %x
  %2 = shl nuw i32 %div, 6
  %3 = and i32 %0, 63
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %bf.clear = and i32 %0, 65535
  %div = udiv i32 %bf.clear, %x
  %1 = and i32 %div, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %div = udiv i32 %bf.clear, %x
  %2 = shl nuw nsw i32 %div, 16
  %3 = and i32 %2, 16711680
  %4 = and i32 %0, -16711681
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_a(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 24
  %div = udiv i32 %1, %x
  %2 = shl nuw i32 %div, 24
  %3 = and i32 %0, 16777215
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %bf.clear = and i32 %0, 63
  %rem = urem i32 %bf.clear, %x
  %1 = and i32 %rem, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %rem = urem i32 %bf.clear, %x
  %2 = shl nuw nsw i32 %rem, 6
  %3 = and i32 %2, 131008
  %4 = and i32 %0, -131009
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 17
  %rem = urem i32 %1, %x
  %2 = shl nuw i32 %rem, 17
  %3 = and i32 %0, 131071
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %bf.clear = and i32 %0, 31
  %rem = urem i32 %bf.clear, %x
  %1 = and i32 %rem, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %rem = urem i32 %bf.clear, %x
  %2 = shl nuw nsw i32 %rem, 5
  %3 = and i32 %2, 32
  %4 = and i32 %0, -33
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 6
  %rem = urem i32 %1, %x
  %2 = shl nuw i32 %rem, 6
  %3 = and i32 %0, 63
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %bf.clear = and i32 %0, 65535
  %rem = urem i32 %bf.clear, %x
  %1 = and i32 %rem, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %rem = urem i32 %bf.clear, %x
  %2 = shl nuw nsw i32 %rem, 16
  %3 = and i32 %2, 16711680
  %4 = and i32 %0, -16711681
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_b(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 24
  %rem = urem i32 %1, %x
  %2 = shl nuw i32 %rem, 24
  %3 = and i32 %0, 16777215
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %add = add nsw i32 %0, 3
  %1 = and i32 %add, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 192
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 393216
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %add = add nsw i32 %0, 3
  %1 = and i32 %add, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = add i32 %0, 192
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %add = add nsw i32 %0, 3
  %1 = and i32 %add, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 196608
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_c(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 50331648
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %sub = add nsw i32 %0, 57
  %1 = and i32 %sub, 63
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, 130624
  %2 = and i32 %1, 131008
  %3 = and i32 %0, -131009
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = add i32 %0, -917504
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %sub = add nsw i32 %0, 25
  %1 = and i32 %sub, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = add i32 %0, -448
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %sub = add nsw i32 %0, 65529
  %1 = and i32 %sub, 65535
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, 16318464
  %2 = and i32 %1, 16711680
  %3 = and i32 %0, -16711681
  %4 = or i32 %2, %3
  store i32 %4, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_d(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = add i32 %0, -117440512
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = and i32 %0, -43
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = and i32 %0, -129665
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = and i32 %0, 2883583
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = and i32 %0, -11
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_e(i32 %x) nounwind uwtable readnone {
entry:
  ret void
}

define void @fn6_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = and i32 %0, 1407
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = and i32 %0, -65515
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = and i32 %0, -15335425
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_e(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = and i32 %0, 369098751
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = or i32 %0, 19
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = or i32 %0, 1216
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = or i32 %0, 2490368
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = or i32 %0, 19
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = or i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = or i32 %0, 1216
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = or i32 %0, 19
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = or i32 %0, 1245184
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = or i32 %0, 318767104
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = xor i32 %0, 37
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = xor i32 %0, 2368
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = xor i32 %0, 4849664
  store i32 %1, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 5
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 32
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = xor i32 %0, 2368
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = xor i32 %0, 37
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = xor i32 %0, 2424832
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_g(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = xor i32 %0, 620756992
  store i32 %1, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %bf.clear = and i32 %0, 63
  %div = udiv i32 %bf.clear, 17
  %1 = and i32 %div, 3
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %div = udiv i32 %bf.clear, 17
  %2 = shl nuw nsw i32 %div, 6
  %3 = and i32 %2, 8128
  %4 = and i32 %0, -131009
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 17
  %div = udiv i32 %1, 17
  %2 = shl nuw nsw i32 %div, 17
  %3 = and i32 %2, 268304384
  %4 = and i32 %0, 131071
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %bf.clear = and i32 %0, 31
  %div = udiv i32 %bf.clear, 17
  %1 = and i32 %div, 1
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = and i32 %0, -33
  store i32 %1, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 6
  %div = udiv i32 %1, 17
  %2 = shl nuw nsw i32 %div, 6
  %3 = and i32 %2, 268435392
  %4 = and i32 %0, 63
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %bf.clear = and i32 %0, 65535
  %div = udiv i32 %bf.clear, 17
  %1 = and i32 %div, 4095
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %div = udiv i32 %bf.clear, 17
  %2 = shl nuw nsw i32 %div, 16
  %3 = and i32 %2, 983040
  %4 = and i32 %0, -16711681
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_h(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 24
  %div = udiv i32 %1, 17
  %2 = shl nuw nsw i32 %div, 24
  %3 = and i32 %2, 251658240
  %4 = and i32 %0, 16777215
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn1_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %bf.clear = and i32 %0, 63
  %rem = urem i32 %bf.clear, 19
  %1 = and i32 %rem, 31
  %2 = and i32 %0, -64
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn2_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %rem = urem i32 %bf.clear, 19
  %2 = shl nuw nsw i32 %rem, 6
  %3 = and i32 %2, 1984
  %4 = and i32 %0, -131009
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn3_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 8
  %1 = lshr i32 %0, 17
  %rem = urem i32 %1, 19
  %2 = shl nuw nsw i32 %rem, 17
  %3 = and i32 %2, 4063232
  %4 = and i32 %0, 131071
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 8
  ret void
}

define void @fn4_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %bf.clear = and i32 %0, 31
  %rem = urem i32 %bf.clear, 19
  %1 = and i32 %rem, 31
  %2 = and i32 %0, -32
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn5_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %rem = urem i32 %bf.clear, 19
  %2 = shl nuw nsw i32 %rem, 5
  %3 = and i32 %2, 32
  %4 = and i32 %0, -33
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn6_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c to i32*), align 8
  %1 = lshr i32 %0, 6
  %rem = urem i32 %1, 19
  %2 = shl nuw nsw i32 %rem, 6
  %3 = and i32 %2, 1984
  %4 = and i32 %0, 63
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%0* @c to i32*), align 8
  ret void
}

define void @fn7_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %bf.clear = and i32 %0, 65535
  %rem = urem i32 %bf.clear, 19
  %1 = and i32 %rem, 31
  %2 = and i32 %0, -65536
  %3 = or i32 %1, %2
  store i32 %3, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn8_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %rem = urem i32 %bf.clear, 19
  %2 = shl nuw nsw i32 %rem, 16
  %3 = and i32 %2, 2031616
  %4 = and i32 %0, -16711681
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define void @fn9_i(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* bitcast (%1* @d to i32*), align 8
  %1 = lshr i32 %0, 24
  %rem = urem i32 %1, 19
  %2 = shl nuw nsw i32 %rem, 24
  %3 = and i32 %2, 520093696
  %4 = and i32 %0, 16777215
  %5 = or i32 %3, %4
  store i32 %5, i32* bitcast (%1* @d to i32*), align 8
  ret void
}

define i32 @main() nounwind uwtable {
if.end644:
  store i32 560051, i32* bitcast (%struct.anon* @b to i32*), align 8
  store i32 -2147483595, i32* bitcast (%0* @c to i32*), align 8
  store i32 -1147377476, i32* bitcast (%1* @d to i32*), align 8
  ret i32 0
}
