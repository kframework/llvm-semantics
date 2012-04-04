; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040629-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, [2 x i8], i8 }
%struct.anon.0 = type { i8, [3 x i8] }
%struct.anon.1 = type { [2 x i8], i8, i8 }

@b = common global %struct.anon zeroinitializer, align 4
@c = common global %struct.anon.0 zeroinitializer, align 4
@d = common global %struct.anon.1 zeroinitializer, align 4

define i32 @ret1() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  ret i32 %bf.clear
}

define i32 @ret2() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  ret i32 %bf.clear
}

define i32 @ret3() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  ret i32 %bf.clear
}

define i32 @ret4() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  ret i32 %bf.clear
}

define i32 @ret5() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  ret i32 %bf.clear
}

define i32 @ret6() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  ret i32 %bf.clear
}

define i32 @ret7() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  ret i32 %bf.clear
}

define i32 @ret8() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  ret i32 %bf.clear
}

define i32 @ret9() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  ret i32 %bf.clear
}

define void @fn1_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %1, 63
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 63
  %2 = and i32 %bf.value, 63
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -64
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 2047
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 2047
  %3 = and i32 %bf.value, 2047
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 17
  %bf.clear = and i32 %2, 32767
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 32767
  %3 = and i32 %bf.value, 32767
  %4 = shl i32 %3, 17
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, 131071
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %1, 31
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 31
  %2 = and i32 %bf.value, 31
  %3 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %4 = and i32 %3, -32
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear = and i32 %2, 1
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 1
  %3 = and i32 %bf.value, 1
  %4 = shl i32 %3, 5
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, -33
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 67108863
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 67108863
  %3 = and i32 %bf.value, 67108863
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, 63
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %1, 65535
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 65535
  %2 = and i32 %bf.value, 65535
  %3 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %4 = and i32 %3, -65536
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 16
  %bf.clear = and i32 %2, 255
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 16
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, -16711681
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 24
  %bf.clear = and i32 %2, 255
  %add = add i32 %bf.clear, %0
  %bf.value = and i32 %add, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 24
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_3(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %inc = add i32 %bf.clear, 1
  %bf.value = and i32 %inc, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %1, 63
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 63
  %2 = and i32 %bf.value, 63
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -64
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 2047
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 2047
  %3 = and i32 %bf.value, 2047
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 17
  %bf.clear = and i32 %2, 32767
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 32767
  %3 = and i32 %bf.value, 32767
  %4 = shl i32 %3, 17
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, 131071
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %1, 31
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 31
  %2 = and i32 %bf.value, 31
  %3 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %4 = and i32 %3, -32
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear = and i32 %2, 1
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 1
  %3 = and i32 %bf.value, 1
  %4 = shl i32 %3, 5
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, -33
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 67108863
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 67108863
  %3 = and i32 %bf.value, 67108863
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, 63
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %1, 65535
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 65535
  %2 = and i32 %bf.value, 65535
  %3 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %4 = and i32 %3, -65536
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 16
  %bf.clear = and i32 %2, 255
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 16
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, -16711681
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_4(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 24
  %bf.clear = and i32 %2, 255
  %sub = sub i32 %bf.clear, %0
  %bf.value = and i32 %sub, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 24
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_5(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_6(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %1, 63
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 63
  %2 = and i32 %bf.value, 63
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -64
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 2047
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 2047
  %3 = and i32 %bf.value, 2047
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 17
  %bf.clear = and i32 %2, 32767
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 32767
  %3 = and i32 %bf.value, 32767
  %4 = shl i32 %3, 17
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, 131071
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %1, 31
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 31
  %2 = and i32 %bf.value, 31
  %3 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %4 = and i32 %3, -32
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear = and i32 %2, 1
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 1
  %3 = and i32 %bf.value, 1
  %4 = shl i32 %3, 5
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, -33
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 67108863
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 67108863
  %3 = and i32 %bf.value, 67108863
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, 63
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %1, 65535
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 65535
  %2 = and i32 %bf.value, 65535
  %3 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %4 = and i32 %3, -65536
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 16
  %bf.clear = and i32 %2, 255
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 16
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, -16711681
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_7(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 24
  %bf.clear = and i32 %2, 255
  %and = and i32 %bf.clear, %0
  %bf.value = and i32 %and, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 24
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %1, 63
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 63
  %2 = and i32 %bf.value, 63
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -64
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 2047
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 2047
  %3 = and i32 %bf.value, 2047
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 17
  %bf.clear = and i32 %2, 32767
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 32767
  %3 = and i32 %bf.value, 32767
  %4 = shl i32 %3, 17
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, 131071
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %1, 31
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 31
  %2 = and i32 %bf.value, 31
  %3 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %4 = and i32 %3, -32
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear = and i32 %2, 1
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 1
  %3 = and i32 %bf.value, 1
  %4 = shl i32 %3, 5
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, -33
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 67108863
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 67108863
  %3 = and i32 %bf.value, 67108863
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, 63
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %1, 65535
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 65535
  %2 = and i32 %bf.value, 65535
  %3 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %4 = and i32 %3, -65536
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 16
  %bf.clear = and i32 %2, 255
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 16
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, -16711681
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_8(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 24
  %bf.clear = and i32 %2, 255
  %or = or i32 %bf.clear, %0
  %bf.value = and i32 %or, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 24
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %1, 63
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 63
  %2 = and i32 %bf.value, 63
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -64
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 2047
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 2047
  %3 = and i32 %bf.value, 2047
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 17
  %bf.clear = and i32 %2, 32767
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 32767
  %3 = and i32 %bf.value, 32767
  %4 = shl i32 %3, 17
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, 131071
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %1, 31
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 31
  %2 = and i32 %bf.value, 31
  %3 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %4 = and i32 %3, -32
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear = and i32 %2, 1
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 1
  %3 = and i32 %bf.value, 1
  %4 = shl i32 %3, 5
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, -33
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 67108863
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 67108863
  %3 = and i32 %bf.value, 67108863
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, 63
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %1, 65535
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 65535
  %2 = and i32 %bf.value, 65535
  %3 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %4 = and i32 %3, -65536
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 16
  %bf.clear = and i32 %2, 255
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 16
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, -16711681
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_9(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 24
  %bf.clear = and i32 %2, 255
  %xor = xor i32 %bf.clear, %0
  %bf.value = and i32 %xor, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 24
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %1, 63
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 63
  %2 = and i32 %bf.value, 63
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -64
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 2047
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 2047
  %3 = and i32 %bf.value, 2047
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 17
  %bf.clear = and i32 %2, 32767
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 32767
  %3 = and i32 %bf.value, 32767
  %4 = shl i32 %3, 17
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, 131071
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %1, 31
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 31
  %2 = and i32 %bf.value, 31
  %3 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %4 = and i32 %3, -32
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear = and i32 %2, 1
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 1
  %3 = and i32 %bf.value, 1
  %4 = shl i32 %3, 5
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, -33
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 67108863
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 67108863
  %3 = and i32 %bf.value, 67108863
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, 63
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %1, 65535
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 65535
  %2 = and i32 %bf.value, 65535
  %3 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %4 = and i32 %3, -65536
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 16
  %bf.clear = and i32 %2, 255
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 16
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, -16711681
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_a(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 24
  %bf.clear = and i32 %2, 255
  %div = udiv i32 %bf.clear, %0
  %bf.value = and i32 %div, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 24
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %1, 63
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 63
  %2 = and i32 %bf.value, 63
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -64
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 2047
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 2047
  %3 = and i32 %bf.value, 2047
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %2 = lshr i32 %1, 17
  %bf.clear = and i32 %2, 32767
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 32767
  %3 = and i32 %bf.value, 32767
  %4 = shl i32 %3, 17
  %5 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = and i32 %5, 131071
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %1, 31
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 31
  %2 = and i32 %bf.value, 31
  %3 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %4 = and i32 %3, -32
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 5
  %bf.clear = and i32 %2, 1
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 1
  %3 = and i32 %bf.value, 1
  %4 = shl i32 %3, 5
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, -33
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %2 = lshr i32 %1, 6
  %bf.clear = and i32 %2, 67108863
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 67108863
  %3 = and i32 %bf.value, 67108863
  %4 = shl i32 %3, 6
  %5 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %6 = and i32 %5, 63
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %1, 65535
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 65535
  %2 = and i32 %bf.value, 65535
  %3 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %4 = and i32 %3, -65536
  %5 = or i32 %4, %2
  store i32 %5, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 16
  %bf.clear = and i32 %2, 255
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 16
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, -16711681
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_b(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %1 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %2 = lshr i32 %1, 24
  %bf.clear = and i32 %2, 255
  %rem = urem i32 %bf.clear, %0
  %bf.value = and i32 %rem, 255
  %3 = and i32 %bf.value, 255
  %4 = shl i32 %3, 24
  %5 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %6 = and i32 %5, 16777215
  %7 = or i32 %6, %4
  store i32 %7, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_c(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %add = add nsw i32 %bf.clear, 3
  %bf.value = and i32 %add, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_d(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %sub = sub nsw i32 %bf.clear, 7
  %bf.value = and i32 %sub, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_e(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %and = and i32 %bf.clear, 21
  %bf.value = and i32 %and, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %or = or i32 %bf.clear, 19
  %bf.value = and i32 %or, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_g(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %xor = xor i32 %bf.clear, 37
  %bf.value = and i32 %xor, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_h(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %div = sdiv i32 %bf.clear, 17
  %bf.value = and i32 %div, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn1_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %bf.clear = and i32 %0, 63
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 63
  %1 = and i32 %bf.value, 63
  %2 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn2_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 2047
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 2047
  %2 = and i32 %bf.value, 2047
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, -131009
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn3_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = lshr i32 %0, 17
  %bf.clear = and i32 %1, 32767
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 32767
  %2 = and i32 %bf.value, 32767
  %3 = shl i32 %2, 17
  %4 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %5 = and i32 %4, 131071
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon* @b to i32*), align 4
  ret void
}

define void @fn4_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %bf.clear = and i32 %0, 31
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 31
  %1 = and i32 %bf.value, 31
  %2 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %3 = and i32 %2, -32
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn5_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 5
  %bf.clear = and i32 %1, 1
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 1
  %2 = and i32 %bf.value, 1
  %3 = shl i32 %2, 5
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, -33
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn6_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %1 = lshr i32 %0, 6
  %bf.clear = and i32 %1, 67108863
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 67108863
  %2 = and i32 %bf.value, 67108863
  %3 = shl i32 %2, 6
  %4 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %5 = and i32 %4, 63
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  ret void
}

define void @fn7_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %bf.clear = and i32 %0, 65535
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 65535
  %1 = and i32 %bf.value, 65535
  %2 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %3 = and i32 %2, -65536
  %4 = or i32 %3, %1
  store i32 %4, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn8_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 16
  %bf.clear = and i32 %1, 255
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 16
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, -16711681
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define void @fn9_i(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %1 = lshr i32 %0, 24
  %bf.clear = and i32 %1, 255
  %rem = srem i32 %bf.clear, 19
  %bf.value = and i32 %rem, 255
  %2 = and i32 %bf.value, 255
  %3 = shl i32 %2, 24
  %4 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %5 = and i32 %4, 16777215
  %6 = or i32 %5, %3
  store i32 %6, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %1 = and i32 %0, -64
  %2 = or i32 %1, 51
  store i32 %2, i32* bitcast (%struct.anon* @b to i32*), align 4
  %3 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %4 = and i32 %3, -131009
  %5 = or i32 %4, 40704
  store i32 %5, i32* bitcast (%struct.anon* @b to i32*), align 4
  %6 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %7 = and i32 %6, 131071
  %8 = or i32 %7, -195297280
  store i32 %8, i32* bitcast (%struct.anon* @b to i32*), align 4
  %9 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %10 = and i32 %9, -32
  %11 = or i32 %10, 21
  store i32 %11, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %12 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %13 = and i32 %12, -33
  %14 = or i32 %13, 32
  store i32 %14, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %15 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %16 = and i32 %15, 63
  %17 = or i32 %16, -2147483648
  store i32 %17, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %18 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %19 = and i32 %18, -65536
  %20 = or i32 %19, 26812
  store i32 %20, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %21 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %22 = and i32 %21, -16711681
  %23 = or i32 %22, 10223616
  store i32 %23, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %24 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %25 = and i32 %24, 16777215
  %26 = or i32 %25, -1157627904
  store i32 %26, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_1(i32 3)
  %call = call i32 @ret1()
  %cmp = icmp ne i32 %call, 54
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %27 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %28 = and i32 %27, -64
  %29 = or i32 %28, 51
  store i32 %29, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_1(i32 251)
  %call1 = call i32 @ret2()
  %cmp2 = icmp ne i32 %call1, 887
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end4:                                          ; preds = %if.end
  %30 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %31 = and i32 %30, -131009
  %32 = or i32 %31, 40704
  store i32 %32, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_1(i32 13279)
  %call5 = call i32 @ret3()
  %cmp6 = icmp ne i32 %call5, 11789
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn
  unreachable

if.end8:                                          ; preds = %if.end4
  %33 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %34 = and i32 %33, -131009
  %35 = or i32 %34, 35712
  store i32 %35, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_1(i32 24)
  %call9 = call i32 @ret4()
  %cmp10 = icmp ne i32 %call9, 13
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn
  unreachable

if.end12:                                         ; preds = %if.end8
  %36 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %37 = and i32 %36, -32
  %38 = or i32 %37, 21
  store i32 %38, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_1(i32 1)
  %call13 = call i32 @ret5()
  %cmp14 = icmp ne i32 %call13, 0
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn
  unreachable

if.end16:                                         ; preds = %if.end12
  %39 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %40 = and i32 %39, -33
  %41 = or i32 %40, 32
  store i32 %41, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_1(i32 264151)
  %call17 = call i32 @ret6()
  %cmp18 = icmp ne i32 %call17, 33818583
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn
  unreachable

if.end20:                                         ; preds = %if.end16
  %42 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %43 = and i32 %42, 63
  %44 = or i32 %43, -2147483648
  store i32 %44, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_1(i32 713)
  %call21 = call i32 @ret7()
  %cmp22 = icmp ne i32 %call21, 27525
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn
  unreachable

if.end24:                                         ; preds = %if.end20
  %45 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %46 = and i32 %45, -65536
  %47 = or i32 %46, 26812
  store i32 %47, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_1(i32 17)
  %call25 = call i32 @ret8()
  %cmp26 = icmp ne i32 %call25, 173
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn
  unreachable

if.end28:                                         ; preds = %if.end24
  %48 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %49 = and i32 %48, -16711681
  %50 = or i32 %49, 10223616
  store i32 %50, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_1(i32 199)
  %call29 = call i32 @ret9()
  %cmp30 = icmp ne i32 %call29, 130
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn
  unreachable

if.end32:                                         ; preds = %if.end28
  %51 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %52 = and i32 %51, 16777215
  %53 = or i32 %52, -1157627904
  store i32 %53, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %54 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %55 = and i32 %54, -64
  %56 = or i32 %55, 51
  store i32 %56, i32* bitcast (%struct.anon* @b to i32*), align 4
  %57 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %58 = and i32 %57, -131009
  %59 = or i32 %58, 40704
  store i32 %59, i32* bitcast (%struct.anon* @b to i32*), align 4
  %60 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %61 = and i32 %60, 131071
  %62 = or i32 %61, -195297280
  store i32 %62, i32* bitcast (%struct.anon* @b to i32*), align 4
  %63 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %64 = and i32 %63, -32
  %65 = or i32 %64, 21
  store i32 %65, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %66 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %67 = and i32 %66, -33
  %68 = or i32 %67, 32
  store i32 %68, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %69 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %70 = and i32 %69, 63
  %71 = or i32 %70, -2147483648
  store i32 %71, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %72 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %73 = and i32 %72, -65536
  %74 = or i32 %73, 26812
  store i32 %74, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %75 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %76 = and i32 %75, -16711681
  %77 = or i32 %76, 10223616
  store i32 %77, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %78 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %79 = and i32 %78, 16777215
  %80 = or i32 %79, -1157627904
  store i32 %80, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_2(i32 3)
  %call33 = call i32 @ret1()
  %cmp34 = icmp ne i32 %call33, 52
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn
  unreachable

if.end36:                                         ; preds = %if.end32
  %81 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %82 = and i32 %81, -64
  %83 = or i32 %82, 51
  store i32 %83, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_2(i32 251)
  %call37 = call i32 @ret2()
  %cmp38 = icmp ne i32 %call37, 637
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn
  unreachable

if.end40:                                         ; preds = %if.end36
  %84 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %85 = and i32 %84, -131009
  %86 = or i32 %85, 40704
  store i32 %86, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_2(i32 13279)
  %call41 = call i32 @ret3()
  %cmp42 = icmp ne i32 %call41, 31279
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn
  unreachable

if.end44:                                         ; preds = %if.end40
  %87 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %88 = and i32 %87, -131009
  %89 = or i32 %88, 35712
  store i32 %89, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_2(i32 24)
  %call45 = call i32 @ret4()
  %cmp46 = icmp ne i32 %call45, 22
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn
  unreachable

if.end48:                                         ; preds = %if.end44
  %90 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %91 = and i32 %90, -32
  %92 = or i32 %91, 21
  store i32 %92, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_2(i32 1)
  %call49 = call i32 @ret5()
  %cmp50 = icmp ne i32 %call49, 0
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn
  unreachable

if.end52:                                         ; preds = %if.end48
  %93 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %94 = and i32 %93, -33
  %95 = or i32 %94, 32
  store i32 %95, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_2(i32 264151)
  %call53 = call i32 @ret6()
  %cmp54 = icmp ne i32 %call53, 33554433
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn
  unreachable

if.end56:                                         ; preds = %if.end52
  %96 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %97 = and i32 %96, 63
  %98 = or i32 %97, -2147483648
  store i32 %98, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_2(i32 713)
  %call57 = call i32 @ret7()
  %cmp58 = icmp ne i32 %call57, 26813
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn
  unreachable

if.end60:                                         ; preds = %if.end56
  %99 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %100 = and i32 %99, -65536
  %101 = or i32 %100, 26812
  store i32 %101, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_2(i32 17)
  %call61 = call i32 @ret8()
  %cmp62 = icmp ne i32 %call61, 157
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn
  unreachable

if.end64:                                         ; preds = %if.end60
  %102 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %103 = and i32 %102, -16711681
  %104 = or i32 %103, 10223616
  store i32 %104, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_2(i32 199)
  %call65 = call i32 @ret9()
  %cmp66 = icmp ne i32 %call65, 188
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn
  unreachable

if.end68:                                         ; preds = %if.end64
  %105 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %106 = and i32 %105, 16777215
  %107 = or i32 %106, -1157627904
  store i32 %107, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %108 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %109 = and i32 %108, -64
  %110 = or i32 %109, 51
  store i32 %110, i32* bitcast (%struct.anon* @b to i32*), align 4
  %111 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %112 = and i32 %111, -131009
  %113 = or i32 %112, 40704
  store i32 %113, i32* bitcast (%struct.anon* @b to i32*), align 4
  %114 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %115 = and i32 %114, 131071
  %116 = or i32 %115, -195297280
  store i32 %116, i32* bitcast (%struct.anon* @b to i32*), align 4
  %117 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %118 = and i32 %117, -32
  %119 = or i32 %118, 21
  store i32 %119, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %120 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %121 = and i32 %120, -33
  %122 = or i32 %121, 32
  store i32 %122, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %123 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %124 = and i32 %123, 63
  %125 = or i32 %124, -2147483648
  store i32 %125, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %126 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %127 = and i32 %126, -65536
  %128 = or i32 %127, 26812
  store i32 %128, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %129 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %130 = and i32 %129, -16711681
  %131 = or i32 %130, 10223616
  store i32 %131, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %132 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %133 = and i32 %132, 16777215
  %134 = or i32 %133, -1157627904
  store i32 %134, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_3(i32 3)
  %call69 = call i32 @ret1()
  %cmp70 = icmp ne i32 %call69, 52
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn
  unreachable

if.end72:                                         ; preds = %if.end68
  %135 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %136 = and i32 %135, -64
  %137 = or i32 %136, 51
  store i32 %137, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_3(i32 251)
  %call73 = call i32 @ret2()
  %cmp74 = icmp ne i32 %call73, 637
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn
  unreachable

if.end76:                                         ; preds = %if.end72
  %138 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %139 = and i32 %138, -131009
  %140 = or i32 %139, 40704
  store i32 %140, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_3(i32 13279)
  %call77 = call i32 @ret3()
  %cmp78 = icmp ne i32 %call77, 31279
  br i1 %cmp78, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end76
  call void @abort() noreturn
  unreachable

if.end80:                                         ; preds = %if.end76
  %141 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %142 = and i32 %141, -131009
  %143 = or i32 %142, 35712
  store i32 %143, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_3(i32 24)
  %call81 = call i32 @ret4()
  %cmp82 = icmp ne i32 %call81, 22
  br i1 %cmp82, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn
  unreachable

if.end84:                                         ; preds = %if.end80
  %144 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %145 = and i32 %144, -32
  %146 = or i32 %145, 21
  store i32 %146, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_3(i32 1)
  %call85 = call i32 @ret5()
  %cmp86 = icmp ne i32 %call85, 0
  br i1 %cmp86, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn
  unreachable

if.end88:                                         ; preds = %if.end84
  %147 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %148 = and i32 %147, -33
  %149 = or i32 %148, 32
  store i32 %149, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_3(i32 264151)
  %call89 = call i32 @ret6()
  %cmp90 = icmp ne i32 %call89, 33554433
  br i1 %cmp90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  call void @abort() noreturn
  unreachable

if.end92:                                         ; preds = %if.end88
  %150 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %151 = and i32 %150, 63
  %152 = or i32 %151, -2147483648
  store i32 %152, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_3(i32 713)
  %call93 = call i32 @ret7()
  %cmp94 = icmp ne i32 %call93, 26813
  br i1 %cmp94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end92
  call void @abort() noreturn
  unreachable

if.end96:                                         ; preds = %if.end92
  %153 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %154 = and i32 %153, -65536
  %155 = or i32 %154, 26812
  store i32 %155, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_3(i32 17)
  %call97 = call i32 @ret8()
  %cmp98 = icmp ne i32 %call97, 157
  br i1 %cmp98, label %if.then99, label %if.end100

if.then99:                                        ; preds = %if.end96
  call void @abort() noreturn
  unreachable

if.end100:                                        ; preds = %if.end96
  %156 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %157 = and i32 %156, -16711681
  %158 = or i32 %157, 10223616
  store i32 %158, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_3(i32 199)
  %call101 = call i32 @ret9()
  %cmp102 = icmp ne i32 %call101, 188
  br i1 %cmp102, label %if.then103, label %if.end104

if.then103:                                       ; preds = %if.end100
  call void @abort() noreturn
  unreachable

if.end104:                                        ; preds = %if.end100
  %159 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %160 = and i32 %159, 16777215
  %161 = or i32 %160, -1157627904
  store i32 %161, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %162 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %163 = and i32 %162, -64
  %164 = or i32 %163, 51
  store i32 %164, i32* bitcast (%struct.anon* @b to i32*), align 4
  %165 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %166 = and i32 %165, -131009
  %167 = or i32 %166, 40704
  store i32 %167, i32* bitcast (%struct.anon* @b to i32*), align 4
  %168 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %169 = and i32 %168, 131071
  %170 = or i32 %169, -195297280
  store i32 %170, i32* bitcast (%struct.anon* @b to i32*), align 4
  %171 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %172 = and i32 %171, -32
  %173 = or i32 %172, 21
  store i32 %173, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %174 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %175 = and i32 %174, -33
  %176 = or i32 %175, 32
  store i32 %176, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %177 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %178 = and i32 %177, 63
  %179 = or i32 %178, -2147483648
  store i32 %179, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %180 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %181 = and i32 %180, -65536
  %182 = or i32 %181, 26812
  store i32 %182, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %183 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %184 = and i32 %183, -16711681
  %185 = or i32 %184, 10223616
  store i32 %185, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %186 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %187 = and i32 %186, 16777215
  %188 = or i32 %187, -1157627904
  store i32 %188, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_4(i32 3)
  %call105 = call i32 @ret1()
  %cmp106 = icmp ne i32 %call105, 48
  br i1 %cmp106, label %if.then107, label %if.end108

if.then107:                                       ; preds = %if.end104
  call void @abort() noreturn
  unreachable

if.end108:                                        ; preds = %if.end104
  %189 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %190 = and i32 %189, -64
  %191 = or i32 %190, 51
  store i32 %191, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_4(i32 251)
  %call109 = call i32 @ret2()
  %cmp110 = icmp ne i32 %call109, 385
  br i1 %cmp110, label %if.then111, label %if.end112

if.then111:                                       ; preds = %if.end108
  call void @abort() noreturn
  unreachable

if.end112:                                        ; preds = %if.end108
  %192 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %193 = and i32 %192, -131009
  %194 = or i32 %193, 40704
  store i32 %194, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_4(i32 13279)
  %call113 = call i32 @ret3()
  %cmp114 = icmp ne i32 %call113, 17999
  br i1 %cmp114, label %if.then115, label %if.end116

if.then115:                                       ; preds = %if.end112
  call void @abort() noreturn
  unreachable

if.end116:                                        ; preds = %if.end112
  %195 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %196 = and i32 %195, -131009
  %197 = or i32 %196, 35712
  store i32 %197, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_4(i32 24)
  %call117 = call i32 @ret4()
  %cmp118 = icmp ne i32 %call117, 29
  br i1 %cmp118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.end116
  call void @abort() noreturn
  unreachable

if.end120:                                        ; preds = %if.end116
  %198 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %199 = and i32 %198, -32
  %200 = or i32 %199, 21
  store i32 %200, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_4(i32 1)
  %call121 = call i32 @ret5()
  %cmp122 = icmp ne i32 %call121, 0
  br i1 %cmp122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end120
  call void @abort() noreturn
  unreachable

if.end124:                                        ; preds = %if.end120
  %201 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %202 = and i32 %201, -33
  %203 = or i32 %202, 32
  store i32 %203, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_4(i32 264151)
  %call125 = call i32 @ret6()
  %cmp126 = icmp ne i32 %call125, 33290281
  br i1 %cmp126, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end124
  call void @abort() noreturn
  unreachable

if.end128:                                        ; preds = %if.end124
  %204 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %205 = and i32 %204, 63
  %206 = or i32 %205, -2147483648
  store i32 %206, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_4(i32 713)
  %call129 = call i32 @ret7()
  %cmp130 = icmp ne i32 %call129, 26099
  br i1 %cmp130, label %if.then131, label %if.end132

if.then131:                                       ; preds = %if.end128
  call void @abort() noreturn
  unreachable

if.end132:                                        ; preds = %if.end128
  %207 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %208 = and i32 %207, -65536
  %209 = or i32 %208, 26812
  store i32 %209, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_4(i32 17)
  %call133 = call i32 @ret8()
  %cmp134 = icmp ne i32 %call133, 139
  br i1 %cmp134, label %if.then135, label %if.end136

if.then135:                                       ; preds = %if.end132
  call void @abort() noreturn
  unreachable

if.end136:                                        ; preds = %if.end132
  %210 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %211 = and i32 %210, -16711681
  %212 = or i32 %211, 10223616
  store i32 %212, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_4(i32 199)
  %call137 = call i32 @ret9()
  %cmp138 = icmp ne i32 %call137, 244
  br i1 %cmp138, label %if.then139, label %if.end140

if.then139:                                       ; preds = %if.end136
  call void @abort() noreturn
  unreachable

if.end140:                                        ; preds = %if.end136
  %213 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %214 = and i32 %213, 16777215
  %215 = or i32 %214, -1157627904
  store i32 %215, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %216 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %217 = and i32 %216, -64
  %218 = or i32 %217, 51
  store i32 %218, i32* bitcast (%struct.anon* @b to i32*), align 4
  %219 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %220 = and i32 %219, -131009
  %221 = or i32 %220, 40704
  store i32 %221, i32* bitcast (%struct.anon* @b to i32*), align 4
  %222 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %223 = and i32 %222, 131071
  %224 = or i32 %223, -195297280
  store i32 %224, i32* bitcast (%struct.anon* @b to i32*), align 4
  %225 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %226 = and i32 %225, -32
  %227 = or i32 %226, 21
  store i32 %227, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %228 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %229 = and i32 %228, -33
  %230 = or i32 %229, 32
  store i32 %230, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %231 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %232 = and i32 %231, 63
  %233 = or i32 %232, -2147483648
  store i32 %233, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %234 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %235 = and i32 %234, -65536
  %236 = or i32 %235, 26812
  store i32 %236, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %237 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %238 = and i32 %237, -16711681
  %239 = or i32 %238, 10223616
  store i32 %239, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %240 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %241 = and i32 %240, 16777215
  %242 = or i32 %241, -1157627904
  store i32 %242, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_5(i32 3)
  %call141 = call i32 @ret1()
  %cmp142 = icmp ne i32 %call141, 50
  br i1 %cmp142, label %if.then143, label %if.end144

if.then143:                                       ; preds = %if.end140
  call void @abort() noreturn
  unreachable

if.end144:                                        ; preds = %if.end140
  %243 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %244 = and i32 %243, -64
  %245 = or i32 %244, 51
  store i32 %245, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_5(i32 251)
  %call145 = call i32 @ret2()
  %cmp146 = icmp ne i32 %call145, 635
  br i1 %cmp146, label %if.then147, label %if.end148

if.then147:                                       ; preds = %if.end144
  call void @abort() noreturn
  unreachable

if.end148:                                        ; preds = %if.end144
  %246 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %247 = and i32 %246, -131009
  %248 = or i32 %247, 40704
  store i32 %248, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_5(i32 13279)
  %call149 = call i32 @ret3()
  %cmp150 = icmp ne i32 %call149, 31277
  br i1 %cmp150, label %if.then151, label %if.end152

if.then151:                                       ; preds = %if.end148
  call void @abort() noreturn
  unreachable

if.end152:                                        ; preds = %if.end148
  %249 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %250 = and i32 %249, -131009
  %251 = or i32 %250, 35712
  store i32 %251, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_5(i32 24)
  %call153 = call i32 @ret4()
  %cmp154 = icmp ne i32 %call153, 20
  br i1 %cmp154, label %if.then155, label %if.end156

if.then155:                                       ; preds = %if.end152
  call void @abort() noreturn
  unreachable

if.end156:                                        ; preds = %if.end152
  %252 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %253 = and i32 %252, -32
  %254 = or i32 %253, 21
  store i32 %254, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_5(i32 1)
  %call157 = call i32 @ret5()
  %cmp158 = icmp ne i32 %call157, 0
  br i1 %cmp158, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end156
  call void @abort() noreturn
  unreachable

if.end160:                                        ; preds = %if.end156
  %255 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %256 = and i32 %255, -33
  %257 = or i32 %256, 32
  store i32 %257, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_5(i32 264151)
  %call161 = call i32 @ret6()
  %cmp162 = icmp ne i32 %call161, 33554431
  br i1 %cmp162, label %if.then163, label %if.end164

if.then163:                                       ; preds = %if.end160
  call void @abort() noreturn
  unreachable

if.end164:                                        ; preds = %if.end160
  %258 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %259 = and i32 %258, 63
  %260 = or i32 %259, -2147483648
  store i32 %260, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_5(i32 713)
  %call165 = call i32 @ret7()
  %cmp166 = icmp ne i32 %call165, 26811
  br i1 %cmp166, label %if.then167, label %if.end168

if.then167:                                       ; preds = %if.end164
  call void @abort() noreturn
  unreachable

if.end168:                                        ; preds = %if.end164
  %261 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %262 = and i32 %261, -65536
  %263 = or i32 %262, 26812
  store i32 %263, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_5(i32 17)
  %call169 = call i32 @ret8()
  %cmp170 = icmp ne i32 %call169, 155
  br i1 %cmp170, label %if.then171, label %if.end172

if.then171:                                       ; preds = %if.end168
  call void @abort() noreturn
  unreachable

if.end172:                                        ; preds = %if.end168
  %264 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %265 = and i32 %264, -16711681
  %266 = or i32 %265, 10223616
  store i32 %266, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_5(i32 199)
  %call173 = call i32 @ret9()
  %cmp174 = icmp ne i32 %call173, 186
  br i1 %cmp174, label %if.then175, label %if.end176

if.then175:                                       ; preds = %if.end172
  call void @abort() noreturn
  unreachable

if.end176:                                        ; preds = %if.end172
  %267 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %268 = and i32 %267, 16777215
  %269 = or i32 %268, -1157627904
  store i32 %269, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %270 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %271 = and i32 %270, -64
  %272 = or i32 %271, 51
  store i32 %272, i32* bitcast (%struct.anon* @b to i32*), align 4
  %273 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %274 = and i32 %273, -131009
  %275 = or i32 %274, 40704
  store i32 %275, i32* bitcast (%struct.anon* @b to i32*), align 4
  %276 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %277 = and i32 %276, 131071
  %278 = or i32 %277, -195297280
  store i32 %278, i32* bitcast (%struct.anon* @b to i32*), align 4
  %279 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %280 = and i32 %279, -32
  %281 = or i32 %280, 21
  store i32 %281, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %282 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %283 = and i32 %282, -33
  %284 = or i32 %283, 32
  store i32 %284, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %285 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %286 = and i32 %285, 63
  %287 = or i32 %286, -2147483648
  store i32 %287, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %288 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %289 = and i32 %288, -65536
  %290 = or i32 %289, 26812
  store i32 %290, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %291 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %292 = and i32 %291, -16711681
  %293 = or i32 %292, 10223616
  store i32 %293, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %294 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %295 = and i32 %294, 16777215
  %296 = or i32 %295, -1157627904
  store i32 %296, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_6(i32 3)
  %call177 = call i32 @ret1()
  %cmp178 = icmp ne i32 %call177, 50
  br i1 %cmp178, label %if.then179, label %if.end180

if.then179:                                       ; preds = %if.end176
  call void @abort() noreturn
  unreachable

if.end180:                                        ; preds = %if.end176
  %297 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %298 = and i32 %297, -64
  %299 = or i32 %298, 51
  store i32 %299, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_6(i32 251)
  %call181 = call i32 @ret2()
  %cmp182 = icmp ne i32 %call181, 635
  br i1 %cmp182, label %if.then183, label %if.end184

if.then183:                                       ; preds = %if.end180
  call void @abort() noreturn
  unreachable

if.end184:                                        ; preds = %if.end180
  %300 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %301 = and i32 %300, -131009
  %302 = or i32 %301, 40704
  store i32 %302, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_6(i32 13279)
  %call185 = call i32 @ret3()
  %cmp186 = icmp ne i32 %call185, 31277
  br i1 %cmp186, label %if.then187, label %if.end188

if.then187:                                       ; preds = %if.end184
  call void @abort() noreturn
  unreachable

if.end188:                                        ; preds = %if.end184
  %303 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %304 = and i32 %303, -131009
  %305 = or i32 %304, 35712
  store i32 %305, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_6(i32 24)
  %call189 = call i32 @ret4()
  %cmp190 = icmp ne i32 %call189, 20
  br i1 %cmp190, label %if.then191, label %if.end192

if.then191:                                       ; preds = %if.end188
  call void @abort() noreturn
  unreachable

if.end192:                                        ; preds = %if.end188
  %306 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %307 = and i32 %306, -32
  %308 = or i32 %307, 21
  store i32 %308, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_6(i32 1)
  %call193 = call i32 @ret5()
  %cmp194 = icmp ne i32 %call193, 0
  br i1 %cmp194, label %if.then195, label %if.end196

if.then195:                                       ; preds = %if.end192
  call void @abort() noreturn
  unreachable

if.end196:                                        ; preds = %if.end192
  %309 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %310 = and i32 %309, -33
  %311 = or i32 %310, 32
  store i32 %311, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_6(i32 264151)
  %call197 = call i32 @ret6()
  %cmp198 = icmp ne i32 %call197, 33554431
  br i1 %cmp198, label %if.then199, label %if.end200

if.then199:                                       ; preds = %if.end196
  call void @abort() noreturn
  unreachable

if.end200:                                        ; preds = %if.end196
  %312 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %313 = and i32 %312, 63
  %314 = or i32 %313, -2147483648
  store i32 %314, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_6(i32 713)
  %call201 = call i32 @ret7()
  %cmp202 = icmp ne i32 %call201, 26811
  br i1 %cmp202, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.end200
  call void @abort() noreturn
  unreachable

if.end204:                                        ; preds = %if.end200
  %315 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %316 = and i32 %315, -65536
  %317 = or i32 %316, 26812
  store i32 %317, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_6(i32 17)
  %call205 = call i32 @ret8()
  %cmp206 = icmp ne i32 %call205, 155
  br i1 %cmp206, label %if.then207, label %if.end208

if.then207:                                       ; preds = %if.end204
  call void @abort() noreturn
  unreachable

if.end208:                                        ; preds = %if.end204
  %318 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %319 = and i32 %318, -16711681
  %320 = or i32 %319, 10223616
  store i32 %320, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_6(i32 199)
  %call209 = call i32 @ret9()
  %cmp210 = icmp ne i32 %call209, 186
  br i1 %cmp210, label %if.then211, label %if.end212

if.then211:                                       ; preds = %if.end208
  call void @abort() noreturn
  unreachable

if.end212:                                        ; preds = %if.end208
  %321 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %322 = and i32 %321, 16777215
  %323 = or i32 %322, -1157627904
  store i32 %323, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %324 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %325 = and i32 %324, -64
  %326 = or i32 %325, 51
  store i32 %326, i32* bitcast (%struct.anon* @b to i32*), align 4
  %327 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %328 = and i32 %327, -131009
  %329 = or i32 %328, 40704
  store i32 %329, i32* bitcast (%struct.anon* @b to i32*), align 4
  %330 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %331 = and i32 %330, 131071
  %332 = or i32 %331, -195297280
  store i32 %332, i32* bitcast (%struct.anon* @b to i32*), align 4
  %333 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %334 = and i32 %333, -32
  %335 = or i32 %334, 21
  store i32 %335, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %336 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %337 = and i32 %336, -33
  %338 = or i32 %337, 32
  store i32 %338, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %339 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %340 = and i32 %339, 63
  %341 = or i32 %340, -2147483648
  store i32 %341, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %342 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %343 = and i32 %342, -65536
  %344 = or i32 %343, 26812
  store i32 %344, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %345 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %346 = and i32 %345, -16711681
  %347 = or i32 %346, 10223616
  store i32 %347, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %348 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %349 = and i32 %348, 16777215
  %350 = or i32 %349, -1157627904
  store i32 %350, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_7(i32 3)
  %call213 = call i32 @ret1()
  %cmp214 = icmp ne i32 %call213, 3
  br i1 %cmp214, label %if.then215, label %if.end216

if.then215:                                       ; preds = %if.end212
  call void @abort() noreturn
  unreachable

if.end216:                                        ; preds = %if.end212
  %351 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %352 = and i32 %351, -64
  %353 = or i32 %352, 51
  store i32 %353, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_7(i32 251)
  %call217 = call i32 @ret2()
  %cmp218 = icmp ne i32 %call217, 120
  br i1 %cmp218, label %if.then219, label %if.end220

if.then219:                                       ; preds = %if.end216
  call void @abort() noreturn
  unreachable

if.end220:                                        ; preds = %if.end216
  %354 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %355 = and i32 %354, -131009
  %356 = or i32 %355, 40704
  store i32 %356, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_7(i32 13279)
  %call221 = call i32 @ret3()
  %cmp222 = icmp ne i32 %call221, 12814
  br i1 %cmp222, label %if.then223, label %if.end224

if.then223:                                       ; preds = %if.end220
  call void @abort() noreturn
  unreachable

if.end224:                                        ; preds = %if.end220
  %357 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %358 = and i32 %357, -131009
  %359 = or i32 %358, 35712
  store i32 %359, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_7(i32 24)
  %call225 = call i32 @ret4()
  %cmp226 = icmp ne i32 %call225, 16
  br i1 %cmp226, label %if.then227, label %if.end228

if.then227:                                       ; preds = %if.end224
  call void @abort() noreturn
  unreachable

if.end228:                                        ; preds = %if.end224
  %360 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %361 = and i32 %360, -32
  %362 = or i32 %361, 21
  store i32 %362, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_7(i32 1)
  %call229 = call i32 @ret5()
  %cmp230 = icmp ne i32 %call229, 1
  br i1 %cmp230, label %if.then231, label %if.end232

if.then231:                                       ; preds = %if.end228
  call void @abort() noreturn
  unreachable

if.end232:                                        ; preds = %if.end228
  %363 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %364 = and i32 %363, -33
  %365 = or i32 %364, 32
  store i32 %365, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_7(i32 264151)
  %call233 = call i32 @ret6()
  %cmp234 = icmp ne i32 %call233, 0
  br i1 %cmp234, label %if.then235, label %if.end236

if.then235:                                       ; preds = %if.end232
  call void @abort() noreturn
  unreachable

if.end236:                                        ; preds = %if.end232
  %366 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %367 = and i32 %366, 63
  %368 = or i32 %367, -2147483648
  store i32 %368, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_7(i32 713)
  %call237 = call i32 @ret7()
  %cmp238 = icmp ne i32 %call237, 136
  br i1 %cmp238, label %if.then239, label %if.end240

if.then239:                                       ; preds = %if.end236
  call void @abort() noreturn
  unreachable

if.end240:                                        ; preds = %if.end236
  %369 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %370 = and i32 %369, -65536
  %371 = or i32 %370, 26812
  store i32 %371, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_7(i32 17)
  %call241 = call i32 @ret8()
  %cmp242 = icmp ne i32 %call241, 16
  br i1 %cmp242, label %if.then243, label %if.end244

if.then243:                                       ; preds = %if.end240
  call void @abort() noreturn
  unreachable

if.end244:                                        ; preds = %if.end240
  %372 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %373 = and i32 %372, -16711681
  %374 = or i32 %373, 10223616
  store i32 %374, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_7(i32 199)
  %call245 = call i32 @ret9()
  %cmp246 = icmp ne i32 %call245, 131
  br i1 %cmp246, label %if.then247, label %if.end248

if.then247:                                       ; preds = %if.end244
  call void @abort() noreturn
  unreachable

if.end248:                                        ; preds = %if.end244
  %375 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %376 = and i32 %375, 16777215
  %377 = or i32 %376, -1157627904
  store i32 %377, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %378 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %379 = and i32 %378, -64
  %380 = or i32 %379, 51
  store i32 %380, i32* bitcast (%struct.anon* @b to i32*), align 4
  %381 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %382 = and i32 %381, -131009
  %383 = or i32 %382, 40704
  store i32 %383, i32* bitcast (%struct.anon* @b to i32*), align 4
  %384 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %385 = and i32 %384, 131071
  %386 = or i32 %385, -195297280
  store i32 %386, i32* bitcast (%struct.anon* @b to i32*), align 4
  %387 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %388 = and i32 %387, -32
  %389 = or i32 %388, 21
  store i32 %389, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %390 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %391 = and i32 %390, -33
  %392 = or i32 %391, 32
  store i32 %392, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %393 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %394 = and i32 %393, 63
  %395 = or i32 %394, -2147483648
  store i32 %395, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %396 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %397 = and i32 %396, -65536
  %398 = or i32 %397, 26812
  store i32 %398, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %399 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %400 = and i32 %399, -16711681
  %401 = or i32 %400, 10223616
  store i32 %401, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %402 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %403 = and i32 %402, 16777215
  %404 = or i32 %403, -1157627904
  store i32 %404, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_8(i32 3)
  %call249 = call i32 @ret1()
  %cmp250 = icmp ne i32 %call249, 51
  br i1 %cmp250, label %if.then251, label %if.end252

if.then251:                                       ; preds = %if.end248
  call void @abort() noreturn
  unreachable

if.end252:                                        ; preds = %if.end248
  %405 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %406 = and i32 %405, -64
  %407 = or i32 %406, 51
  store i32 %407, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_8(i32 251)
  %call253 = call i32 @ret2()
  %cmp254 = icmp ne i32 %call253, 767
  br i1 %cmp254, label %if.then255, label %if.end256

if.then255:                                       ; preds = %if.end252
  call void @abort() noreturn
  unreachable

if.end256:                                        ; preds = %if.end252
  %408 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %409 = and i32 %408, -131009
  %410 = or i32 %409, 40704
  store i32 %410, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_8(i32 13279)
  %call257 = call i32 @ret3()
  %cmp258 = icmp ne i32 %call257, 31743
  br i1 %cmp258, label %if.then259, label %if.end260

if.then259:                                       ; preds = %if.end256
  call void @abort() noreturn
  unreachable

if.end260:                                        ; preds = %if.end256
  %411 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %412 = and i32 %411, -131009
  %413 = or i32 %412, 35712
  store i32 %413, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_8(i32 24)
  %call261 = call i32 @ret4()
  %cmp262 = icmp ne i32 %call261, 29
  br i1 %cmp262, label %if.then263, label %if.end264

if.then263:                                       ; preds = %if.end260
  call void @abort() noreturn
  unreachable

if.end264:                                        ; preds = %if.end260
  %414 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %415 = and i32 %414, -32
  %416 = or i32 %415, 21
  store i32 %416, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_8(i32 1)
  %call265 = call i32 @ret5()
  %cmp266 = icmp ne i32 %call265, 1
  br i1 %cmp266, label %if.then267, label %if.end268

if.then267:                                       ; preds = %if.end264
  call void @abort() noreturn
  unreachable

if.end268:                                        ; preds = %if.end264
  %417 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %418 = and i32 %417, -33
  %419 = or i32 %418, 32
  store i32 %419, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_8(i32 264151)
  %call269 = call i32 @ret6()
  %cmp270 = icmp ne i32 %call269, 33818583
  br i1 %cmp270, label %if.then271, label %if.end272

if.then271:                                       ; preds = %if.end268
  call void @abort() noreturn
  unreachable

if.end272:                                        ; preds = %if.end268
  %420 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %421 = and i32 %420, 63
  %422 = or i32 %421, -2147483648
  store i32 %422, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_8(i32 713)
  %call273 = call i32 @ret7()
  %cmp274 = icmp ne i32 %call273, 27389
  br i1 %cmp274, label %if.then275, label %if.end276

if.then275:                                       ; preds = %if.end272
  call void @abort() noreturn
  unreachable

if.end276:                                        ; preds = %if.end272
  %423 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %424 = and i32 %423, -65536
  %425 = or i32 %424, 26812
  store i32 %425, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_8(i32 17)
  %call277 = call i32 @ret8()
  %cmp278 = icmp ne i32 %call277, 157
  br i1 %cmp278, label %if.then279, label %if.end280

if.then279:                                       ; preds = %if.end276
  call void @abort() noreturn
  unreachable

if.end280:                                        ; preds = %if.end276
  %426 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %427 = and i32 %426, -16711681
  %428 = or i32 %427, 10223616
  store i32 %428, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_8(i32 199)
  %call281 = call i32 @ret9()
  %cmp282 = icmp ne i32 %call281, 255
  br i1 %cmp282, label %if.then283, label %if.end284

if.then283:                                       ; preds = %if.end280
  call void @abort() noreturn
  unreachable

if.end284:                                        ; preds = %if.end280
  %429 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %430 = and i32 %429, 16777215
  %431 = or i32 %430, -1157627904
  store i32 %431, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %432 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %433 = and i32 %432, -64
  %434 = or i32 %433, 51
  store i32 %434, i32* bitcast (%struct.anon* @b to i32*), align 4
  %435 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %436 = and i32 %435, -131009
  %437 = or i32 %436, 40704
  store i32 %437, i32* bitcast (%struct.anon* @b to i32*), align 4
  %438 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %439 = and i32 %438, 131071
  %440 = or i32 %439, -195297280
  store i32 %440, i32* bitcast (%struct.anon* @b to i32*), align 4
  %441 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %442 = and i32 %441, -32
  %443 = or i32 %442, 21
  store i32 %443, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %444 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %445 = and i32 %444, -33
  %446 = or i32 %445, 32
  store i32 %446, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %447 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %448 = and i32 %447, 63
  %449 = or i32 %448, -2147483648
  store i32 %449, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %450 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %451 = and i32 %450, -65536
  %452 = or i32 %451, 26812
  store i32 %452, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %453 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %454 = and i32 %453, -16711681
  %455 = or i32 %454, 10223616
  store i32 %455, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %456 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %457 = and i32 %456, 16777215
  %458 = or i32 %457, -1157627904
  store i32 %458, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_9(i32 3)
  %call285 = call i32 @ret1()
  %cmp286 = icmp ne i32 %call285, 48
  br i1 %cmp286, label %if.then287, label %if.end288

if.then287:                                       ; preds = %if.end284
  call void @abort() noreturn
  unreachable

if.end288:                                        ; preds = %if.end284
  %459 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %460 = and i32 %459, -64
  %461 = or i32 %460, 51
  store i32 %461, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_9(i32 251)
  %call289 = call i32 @ret2()
  %cmp290 = icmp ne i32 %call289, 647
  br i1 %cmp290, label %if.then291, label %if.end292

if.then291:                                       ; preds = %if.end288
  call void @abort() noreturn
  unreachable

if.end292:                                        ; preds = %if.end288
  %462 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %463 = and i32 %462, -131009
  %464 = or i32 %463, 40704
  store i32 %464, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_9(i32 13279)
  %call293 = call i32 @ret3()
  %cmp294 = icmp ne i32 %call293, 18929
  br i1 %cmp294, label %if.then295, label %if.end296

if.then295:                                       ; preds = %if.end292
  call void @abort() noreturn
  unreachable

if.end296:                                        ; preds = %if.end292
  %465 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %466 = and i32 %465, -131009
  %467 = or i32 %466, 35712
  store i32 %467, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_9(i32 24)
  %call297 = call i32 @ret4()
  %cmp298 = icmp ne i32 %call297, 13
  br i1 %cmp298, label %if.then299, label %if.end300

if.then299:                                       ; preds = %if.end296
  call void @abort() noreturn
  unreachable

if.end300:                                        ; preds = %if.end296
  %468 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %469 = and i32 %468, -32
  %470 = or i32 %469, 21
  store i32 %470, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_9(i32 1)
  %call301 = call i32 @ret5()
  %cmp302 = icmp ne i32 %call301, 0
  br i1 %cmp302, label %if.then303, label %if.end304

if.then303:                                       ; preds = %if.end300
  call void @abort() noreturn
  unreachable

if.end304:                                        ; preds = %if.end300
  %471 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %472 = and i32 %471, -33
  %473 = or i32 %472, 32
  store i32 %473, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_9(i32 264151)
  %call305 = call i32 @ret6()
  %cmp306 = icmp ne i32 %call305, 33818583
  br i1 %cmp306, label %if.then307, label %if.end308

if.then307:                                       ; preds = %if.end304
  call void @abort() noreturn
  unreachable

if.end308:                                        ; preds = %if.end304
  %474 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %475 = and i32 %474, 63
  %476 = or i32 %475, -2147483648
  store i32 %476, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_9(i32 713)
  %call309 = call i32 @ret7()
  %cmp310 = icmp ne i32 %call309, 27253
  br i1 %cmp310, label %if.then311, label %if.end312

if.then311:                                       ; preds = %if.end308
  call void @abort() noreturn
  unreachable

if.end312:                                        ; preds = %if.end308
  %477 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %478 = and i32 %477, -65536
  %479 = or i32 %478, 26812
  store i32 %479, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_9(i32 17)
  %call313 = call i32 @ret8()
  %cmp314 = icmp ne i32 %call313, 141
  br i1 %cmp314, label %if.then315, label %if.end316

if.then315:                                       ; preds = %if.end312
  call void @abort() noreturn
  unreachable

if.end316:                                        ; preds = %if.end312
  %480 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %481 = and i32 %480, -16711681
  %482 = or i32 %481, 10223616
  store i32 %482, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_9(i32 199)
  %call317 = call i32 @ret9()
  %cmp318 = icmp ne i32 %call317, 124
  br i1 %cmp318, label %if.then319, label %if.end320

if.then319:                                       ; preds = %if.end316
  call void @abort() noreturn
  unreachable

if.end320:                                        ; preds = %if.end316
  %483 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %484 = and i32 %483, 16777215
  %485 = or i32 %484, -1157627904
  store i32 %485, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %486 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %487 = and i32 %486, -64
  %488 = or i32 %487, 51
  store i32 %488, i32* bitcast (%struct.anon* @b to i32*), align 4
  %489 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %490 = and i32 %489, -131009
  %491 = or i32 %490, 40704
  store i32 %491, i32* bitcast (%struct.anon* @b to i32*), align 4
  %492 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %493 = and i32 %492, 131071
  %494 = or i32 %493, -195297280
  store i32 %494, i32* bitcast (%struct.anon* @b to i32*), align 4
  %495 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %496 = and i32 %495, -32
  %497 = or i32 %496, 21
  store i32 %497, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %498 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %499 = and i32 %498, -33
  %500 = or i32 %499, 32
  store i32 %500, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %501 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %502 = and i32 %501, 63
  %503 = or i32 %502, -2147483648
  store i32 %503, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %504 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %505 = and i32 %504, -65536
  %506 = or i32 %505, 26812
  store i32 %506, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %507 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %508 = and i32 %507, -16711681
  %509 = or i32 %508, 10223616
  store i32 %509, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %510 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %511 = and i32 %510, 16777215
  %512 = or i32 %511, -1157627904
  store i32 %512, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_a(i32 3)
  %call321 = call i32 @ret1()
  %cmp322 = icmp ne i32 %call321, 17
  br i1 %cmp322, label %if.then323, label %if.end324

if.then323:                                       ; preds = %if.end320
  call void @abort() noreturn
  unreachable

if.end324:                                        ; preds = %if.end320
  %513 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %514 = and i32 %513, -64
  %515 = or i32 %514, 51
  store i32 %515, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_a(i32 251)
  %call325 = call i32 @ret2()
  %cmp326 = icmp ne i32 %call325, 2
  br i1 %cmp326, label %if.then327, label %if.end328

if.then327:                                       ; preds = %if.end324
  call void @abort() noreturn
  unreachable

if.end328:                                        ; preds = %if.end324
  %516 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %517 = and i32 %516, -131009
  %518 = or i32 %517, 40704
  store i32 %518, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_a(i32 13279)
  %call329 = call i32 @ret3()
  %cmp330 = icmp ne i32 %call329, 2
  br i1 %cmp330, label %if.then331, label %if.end332

if.then331:                                       ; preds = %if.end328
  call void @abort() noreturn
  unreachable

if.end332:                                        ; preds = %if.end328
  %519 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %520 = and i32 %519, -131009
  %521 = or i32 %520, 35712
  store i32 %521, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_a(i32 24)
  %call333 = call i32 @ret4()
  %cmp334 = icmp ne i32 %call333, 0
  br i1 %cmp334, label %if.then335, label %if.end336

if.then335:                                       ; preds = %if.end332
  call void @abort() noreturn
  unreachable

if.end336:                                        ; preds = %if.end332
  %522 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %523 = and i32 %522, -32
  %524 = or i32 %523, 21
  store i32 %524, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_a(i32 1)
  %call337 = call i32 @ret5()
  %cmp338 = icmp ne i32 %call337, 1
  br i1 %cmp338, label %if.then339, label %if.end340

if.then339:                                       ; preds = %if.end336
  call void @abort() noreturn
  unreachable

if.end340:                                        ; preds = %if.end336
  %525 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %526 = and i32 %525, -33
  %527 = or i32 %526, 32
  store i32 %527, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_a(i32 264151)
  %call341 = call i32 @ret6()
  %cmp342 = icmp ne i32 %call341, 127
  br i1 %cmp342, label %if.then343, label %if.end344

if.then343:                                       ; preds = %if.end340
  call void @abort() noreturn
  unreachable

if.end344:                                        ; preds = %if.end340
  %528 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %529 = and i32 %528, 63
  %530 = or i32 %529, -2147483648
  store i32 %530, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_a(i32 713)
  %call345 = call i32 @ret7()
  %cmp346 = icmp ne i32 %call345, 37
  br i1 %cmp346, label %if.then347, label %if.end348

if.then347:                                       ; preds = %if.end344
  call void @abort() noreturn
  unreachable

if.end348:                                        ; preds = %if.end344
  %531 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %532 = and i32 %531, -65536
  %533 = or i32 %532, 26812
  store i32 %533, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_a(i32 17)
  %call349 = call i32 @ret8()
  %cmp350 = icmp ne i32 %call349, 9
  br i1 %cmp350, label %if.then351, label %if.end352

if.then351:                                       ; preds = %if.end348
  call void @abort() noreturn
  unreachable

if.end352:                                        ; preds = %if.end348
  %534 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %535 = and i32 %534, -16711681
  %536 = or i32 %535, 10223616
  store i32 %536, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_a(i32 199)
  %call353 = call i32 @ret9()
  %cmp354 = icmp ne i32 %call353, 0
  br i1 %cmp354, label %if.then355, label %if.end356

if.then355:                                       ; preds = %if.end352
  call void @abort() noreturn
  unreachable

if.end356:                                        ; preds = %if.end352
  %537 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %538 = and i32 %537, 16777215
  %539 = or i32 %538, -1157627904
  store i32 %539, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %540 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %541 = and i32 %540, -64
  %542 = or i32 %541, 51
  store i32 %542, i32* bitcast (%struct.anon* @b to i32*), align 4
  %543 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %544 = and i32 %543, -131009
  %545 = or i32 %544, 40704
  store i32 %545, i32* bitcast (%struct.anon* @b to i32*), align 4
  %546 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %547 = and i32 %546, 131071
  %548 = or i32 %547, -195297280
  store i32 %548, i32* bitcast (%struct.anon* @b to i32*), align 4
  %549 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %550 = and i32 %549, -32
  %551 = or i32 %550, 21
  store i32 %551, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %552 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %553 = and i32 %552, -33
  %554 = or i32 %553, 32
  store i32 %554, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %555 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %556 = and i32 %555, 63
  %557 = or i32 %556, -2147483648
  store i32 %557, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %558 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %559 = and i32 %558, -65536
  %560 = or i32 %559, 26812
  store i32 %560, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %561 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %562 = and i32 %561, -16711681
  %563 = or i32 %562, 10223616
  store i32 %563, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %564 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %565 = and i32 %564, 16777215
  %566 = or i32 %565, -1157627904
  store i32 %566, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_b(i32 3)
  %call357 = call i32 @ret1()
  %cmp358 = icmp ne i32 %call357, 0
  br i1 %cmp358, label %if.then359, label %if.end360

if.then359:                                       ; preds = %if.end356
  call void @abort() noreturn
  unreachable

if.end360:                                        ; preds = %if.end356
  %567 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %568 = and i32 %567, -64
  %569 = or i32 %568, 51
  store i32 %569, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_b(i32 251)
  %call361 = call i32 @ret2()
  %cmp362 = icmp ne i32 %call361, 134
  br i1 %cmp362, label %if.then363, label %if.end364

if.then363:                                       ; preds = %if.end360
  call void @abort() noreturn
  unreachable

if.end364:                                        ; preds = %if.end360
  %570 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %571 = and i32 %570, -131009
  %572 = or i32 %571, 40704
  store i32 %572, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_b(i32 13279)
  %call365 = call i32 @ret3()
  %cmp366 = icmp ne i32 %call365, 4720
  br i1 %cmp366, label %if.then367, label %if.end368

if.then367:                                       ; preds = %if.end364
  call void @abort() noreturn
  unreachable

if.end368:                                        ; preds = %if.end364
  %573 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %574 = and i32 %573, -131009
  %575 = or i32 %574, 35712
  store i32 %575, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_b(i32 24)
  %call369 = call i32 @ret4()
  %cmp370 = icmp ne i32 %call369, 21
  br i1 %cmp370, label %if.then371, label %if.end372

if.then371:                                       ; preds = %if.end368
  call void @abort() noreturn
  unreachable

if.end372:                                        ; preds = %if.end368
  %576 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %577 = and i32 %576, -32
  %578 = or i32 %577, 21
  store i32 %578, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_b(i32 1)
  %call373 = call i32 @ret5()
  %cmp374 = icmp ne i32 %call373, 0
  br i1 %cmp374, label %if.then375, label %if.end376

if.then375:                                       ; preds = %if.end372
  call void @abort() noreturn
  unreachable

if.end376:                                        ; preds = %if.end372
  %579 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %580 = and i32 %579, -33
  %581 = or i32 %580, 32
  store i32 %581, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_b(i32 264151)
  %call377 = call i32 @ret6()
  %cmp378 = icmp ne i32 %call377, 7255
  br i1 %cmp378, label %if.then379, label %if.end380

if.then379:                                       ; preds = %if.end376
  call void @abort() noreturn
  unreachable

if.end380:                                        ; preds = %if.end376
  %582 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %583 = and i32 %582, 63
  %584 = or i32 %583, -2147483648
  store i32 %584, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_b(i32 713)
  %call381 = call i32 @ret7()
  %cmp382 = icmp ne i32 %call381, 431
  br i1 %cmp382, label %if.then383, label %if.end384

if.then383:                                       ; preds = %if.end380
  call void @abort() noreturn
  unreachable

if.end384:                                        ; preds = %if.end380
  %585 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %586 = and i32 %585, -65536
  %587 = or i32 %586, 26812
  store i32 %587, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_b(i32 17)
  %call385 = call i32 @ret8()
  %cmp386 = icmp ne i32 %call385, 3
  br i1 %cmp386, label %if.then387, label %if.end388

if.then387:                                       ; preds = %if.end384
  call void @abort() noreturn
  unreachable

if.end388:                                        ; preds = %if.end384
  %588 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %589 = and i32 %588, -16711681
  %590 = or i32 %589, 10223616
  store i32 %590, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_b(i32 199)
  %call389 = call i32 @ret9()
  %cmp390 = icmp ne i32 %call389, 187
  br i1 %cmp390, label %if.then391, label %if.end392

if.then391:                                       ; preds = %if.end388
  call void @abort() noreturn
  unreachable

if.end392:                                        ; preds = %if.end388
  %591 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %592 = and i32 %591, 16777215
  %593 = or i32 %592, -1157627904
  store i32 %593, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %594 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %595 = and i32 %594, -64
  %596 = or i32 %595, 51
  store i32 %596, i32* bitcast (%struct.anon* @b to i32*), align 4
  %597 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %598 = and i32 %597, -131009
  %599 = or i32 %598, 40704
  store i32 %599, i32* bitcast (%struct.anon* @b to i32*), align 4
  %600 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %601 = and i32 %600, 131071
  %602 = or i32 %601, -195297280
  store i32 %602, i32* bitcast (%struct.anon* @b to i32*), align 4
  %603 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %604 = and i32 %603, -32
  %605 = or i32 %604, 21
  store i32 %605, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %606 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %607 = and i32 %606, -33
  %608 = or i32 %607, 32
  store i32 %608, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %609 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %610 = and i32 %609, 63
  %611 = or i32 %610, -2147483648
  store i32 %611, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %612 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %613 = and i32 %612, -65536
  %614 = or i32 %613, 26812
  store i32 %614, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %615 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %616 = and i32 %615, -16711681
  %617 = or i32 %616, 10223616
  store i32 %617, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %618 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %619 = and i32 %618, 16777215
  %620 = or i32 %619, -1157627904
  store i32 %620, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_c(i32 3)
  %call393 = call i32 @ret1()
  %cmp394 = icmp ne i32 %call393, 54
  br i1 %cmp394, label %if.then395, label %if.end396

if.then395:                                       ; preds = %if.end392
  call void @abort() noreturn
  unreachable

if.end396:                                        ; preds = %if.end392
  %621 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %622 = and i32 %621, -64
  %623 = or i32 %622, 51
  store i32 %623, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_c(i32 251)
  %call397 = call i32 @ret2()
  %cmp398 = icmp ne i32 %call397, 639
  br i1 %cmp398, label %if.then399, label %if.end400

if.then399:                                       ; preds = %if.end396
  call void @abort() noreturn
  unreachable

if.end400:                                        ; preds = %if.end396
  %624 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %625 = and i32 %624, -131009
  %626 = or i32 %625, 40704
  store i32 %626, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_c(i32 13279)
  %call401 = call i32 @ret3()
  %cmp402 = icmp ne i32 %call401, 31281
  br i1 %cmp402, label %if.then403, label %if.end404

if.then403:                                       ; preds = %if.end400
  call void @abort() noreturn
  unreachable

if.end404:                                        ; preds = %if.end400
  %627 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %628 = and i32 %627, -131009
  %629 = or i32 %628, 35712
  store i32 %629, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_c(i32 24)
  %call405 = call i32 @ret4()
  %cmp406 = icmp ne i32 %call405, 24
  br i1 %cmp406, label %if.then407, label %if.end408

if.then407:                                       ; preds = %if.end404
  call void @abort() noreturn
  unreachable

if.end408:                                        ; preds = %if.end404
  %630 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %631 = and i32 %630, -32
  %632 = or i32 %631, 21
  store i32 %632, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_c(i32 1)
  %call409 = call i32 @ret5()
  %cmp410 = icmp ne i32 %call409, 0
  br i1 %cmp410, label %if.then411, label %if.end412

if.then411:                                       ; preds = %if.end408
  call void @abort() noreturn
  unreachable

if.end412:                                        ; preds = %if.end408
  %633 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %634 = and i32 %633, -33
  %635 = or i32 %634, 32
  store i32 %635, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_c(i32 264151)
  %call413 = call i32 @ret6()
  %cmp414 = icmp ne i32 %call413, 33554435
  br i1 %cmp414, label %if.then415, label %if.end416

if.then415:                                       ; preds = %if.end412
  call void @abort() noreturn
  unreachable

if.end416:                                        ; preds = %if.end412
  %636 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %637 = and i32 %636, 63
  %638 = or i32 %637, -2147483648
  store i32 %638, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_c(i32 713)
  %call417 = call i32 @ret7()
  %cmp418 = icmp ne i32 %call417, 26815
  br i1 %cmp418, label %if.then419, label %if.end420

if.then419:                                       ; preds = %if.end416
  call void @abort() noreturn
  unreachable

if.end420:                                        ; preds = %if.end416
  %639 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %640 = and i32 %639, -65536
  %641 = or i32 %640, 26812
  store i32 %641, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_c(i32 17)
  %call421 = call i32 @ret8()
  %cmp422 = icmp ne i32 %call421, 159
  br i1 %cmp422, label %if.then423, label %if.end424

if.then423:                                       ; preds = %if.end420
  call void @abort() noreturn
  unreachable

if.end424:                                        ; preds = %if.end420
  %642 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %643 = and i32 %642, -16711681
  %644 = or i32 %643, 10223616
  store i32 %644, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_c(i32 199)
  %call425 = call i32 @ret9()
  %cmp426 = icmp ne i32 %call425, 190
  br i1 %cmp426, label %if.then427, label %if.end428

if.then427:                                       ; preds = %if.end424
  call void @abort() noreturn
  unreachable

if.end428:                                        ; preds = %if.end424
  %645 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %646 = and i32 %645, 16777215
  %647 = or i32 %646, -1157627904
  store i32 %647, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %648 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %649 = and i32 %648, -64
  %650 = or i32 %649, 51
  store i32 %650, i32* bitcast (%struct.anon* @b to i32*), align 4
  %651 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %652 = and i32 %651, -131009
  %653 = or i32 %652, 40704
  store i32 %653, i32* bitcast (%struct.anon* @b to i32*), align 4
  %654 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %655 = and i32 %654, 131071
  %656 = or i32 %655, -195297280
  store i32 %656, i32* bitcast (%struct.anon* @b to i32*), align 4
  %657 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %658 = and i32 %657, -32
  %659 = or i32 %658, 21
  store i32 %659, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %660 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %661 = and i32 %660, -33
  %662 = or i32 %661, 32
  store i32 %662, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %663 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %664 = and i32 %663, 63
  %665 = or i32 %664, -2147483648
  store i32 %665, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %666 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %667 = and i32 %666, -65536
  %668 = or i32 %667, 26812
  store i32 %668, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %669 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %670 = and i32 %669, -16711681
  %671 = or i32 %670, 10223616
  store i32 %671, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %672 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %673 = and i32 %672, 16777215
  %674 = or i32 %673, -1157627904
  store i32 %674, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_d(i32 3)
  %call429 = call i32 @ret1()
  %cmp430 = icmp ne i32 %call429, 44
  br i1 %cmp430, label %if.then431, label %if.end432

if.then431:                                       ; preds = %if.end428
  call void @abort() noreturn
  unreachable

if.end432:                                        ; preds = %if.end428
  %675 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %676 = and i32 %675, -64
  %677 = or i32 %676, 51
  store i32 %677, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_d(i32 251)
  %call433 = call i32 @ret2()
  %cmp434 = icmp ne i32 %call433, 629
  br i1 %cmp434, label %if.then435, label %if.end436

if.then435:                                       ; preds = %if.end432
  call void @abort() noreturn
  unreachable

if.end436:                                        ; preds = %if.end432
  %678 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %679 = and i32 %678, -131009
  %680 = or i32 %679, 40704
  store i32 %680, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_d(i32 13279)
  %call437 = call i32 @ret3()
  %cmp438 = icmp ne i32 %call437, 31271
  br i1 %cmp438, label %if.then439, label %if.end440

if.then439:                                       ; preds = %if.end436
  call void @abort() noreturn
  unreachable

if.end440:                                        ; preds = %if.end436
  %681 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %682 = and i32 %681, -131009
  %683 = or i32 %682, 35712
  store i32 %683, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_d(i32 24)
  %call441 = call i32 @ret4()
  %cmp442 = icmp ne i32 %call441, 14
  br i1 %cmp442, label %if.then443, label %if.end444

if.then443:                                       ; preds = %if.end440
  call void @abort() noreturn
  unreachable

if.end444:                                        ; preds = %if.end440
  %684 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %685 = and i32 %684, -32
  %686 = or i32 %685, 21
  store i32 %686, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_d(i32 1)
  %call445 = call i32 @ret5()
  %cmp446 = icmp ne i32 %call445, 0
  br i1 %cmp446, label %if.then447, label %if.end448

if.then447:                                       ; preds = %if.end444
  call void @abort() noreturn
  unreachable

if.end448:                                        ; preds = %if.end444
  %687 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %688 = and i32 %687, -33
  %689 = or i32 %688, 32
  store i32 %689, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_d(i32 264151)
  %call449 = call i32 @ret6()
  %cmp450 = icmp ne i32 %call449, 33554425
  br i1 %cmp450, label %if.then451, label %if.end452

if.then451:                                       ; preds = %if.end448
  call void @abort() noreturn
  unreachable

if.end452:                                        ; preds = %if.end448
  %690 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %691 = and i32 %690, 63
  %692 = or i32 %691, -2147483648
  store i32 %692, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_d(i32 713)
  %call453 = call i32 @ret7()
  %cmp454 = icmp ne i32 %call453, 26805
  br i1 %cmp454, label %if.then455, label %if.end456

if.then455:                                       ; preds = %if.end452
  call void @abort() noreturn
  unreachable

if.end456:                                        ; preds = %if.end452
  %693 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %694 = and i32 %693, -65536
  %695 = or i32 %694, 26812
  store i32 %695, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_d(i32 17)
  %call457 = call i32 @ret8()
  %cmp458 = icmp ne i32 %call457, 149
  br i1 %cmp458, label %if.then459, label %if.end460

if.then459:                                       ; preds = %if.end456
  call void @abort() noreturn
  unreachable

if.end460:                                        ; preds = %if.end456
  %696 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %697 = and i32 %696, -16711681
  %698 = or i32 %697, 10223616
  store i32 %698, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_d(i32 199)
  %call461 = call i32 @ret9()
  %cmp462 = icmp ne i32 %call461, 180
  br i1 %cmp462, label %if.then463, label %if.end464

if.then463:                                       ; preds = %if.end460
  call void @abort() noreturn
  unreachable

if.end464:                                        ; preds = %if.end460
  %699 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %700 = and i32 %699, 16777215
  %701 = or i32 %700, -1157627904
  store i32 %701, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %702 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %703 = and i32 %702, -64
  %704 = or i32 %703, 51
  store i32 %704, i32* bitcast (%struct.anon* @b to i32*), align 4
  %705 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %706 = and i32 %705, -131009
  %707 = or i32 %706, 40704
  store i32 %707, i32* bitcast (%struct.anon* @b to i32*), align 4
  %708 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %709 = and i32 %708, 131071
  %710 = or i32 %709, -195297280
  store i32 %710, i32* bitcast (%struct.anon* @b to i32*), align 4
  %711 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %712 = and i32 %711, -32
  %713 = or i32 %712, 21
  store i32 %713, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %714 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %715 = and i32 %714, -33
  %716 = or i32 %715, 32
  store i32 %716, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %717 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %718 = and i32 %717, 63
  %719 = or i32 %718, -2147483648
  store i32 %719, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %720 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %721 = and i32 %720, -65536
  %722 = or i32 %721, 26812
  store i32 %722, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %723 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %724 = and i32 %723, -16711681
  %725 = or i32 %724, 10223616
  store i32 %725, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %726 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %727 = and i32 %726, 16777215
  %728 = or i32 %727, -1157627904
  store i32 %728, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_e(i32 3)
  %call465 = call i32 @ret1()
  %cmp466 = icmp ne i32 %call465, 17
  br i1 %cmp466, label %if.then467, label %if.end468

if.then467:                                       ; preds = %if.end464
  call void @abort() noreturn
  unreachable

if.end468:                                        ; preds = %if.end464
  %729 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %730 = and i32 %729, -64
  %731 = or i32 %730, 51
  store i32 %731, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_e(i32 251)
  %call469 = call i32 @ret2()
  %cmp470 = icmp ne i32 %call469, 20
  br i1 %cmp470, label %if.then471, label %if.end472

if.then471:                                       ; preds = %if.end468
  call void @abort() noreturn
  unreachable

if.end472:                                        ; preds = %if.end468
  %732 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %733 = and i32 %732, -131009
  %734 = or i32 %733, 40704
  store i32 %734, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_e(i32 13279)
  %call473 = call i32 @ret3()
  %cmp474 = icmp ne i32 %call473, 4
  br i1 %cmp474, label %if.then475, label %if.end476

if.then475:                                       ; preds = %if.end472
  call void @abort() noreturn
  unreachable

if.end476:                                        ; preds = %if.end472
  %735 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %736 = and i32 %735, -131009
  %737 = or i32 %736, 35712
  store i32 %737, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_e(i32 24)
  %call477 = call i32 @ret4()
  %cmp478 = icmp ne i32 %call477, 21
  br i1 %cmp478, label %if.then479, label %if.end480

if.then479:                                       ; preds = %if.end476
  call void @abort() noreturn
  unreachable

if.end480:                                        ; preds = %if.end476
  %738 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %739 = and i32 %738, -32
  %740 = or i32 %739, 21
  store i32 %740, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_e(i32 1)
  %call481 = call i32 @ret5()
  %cmp482 = icmp ne i32 %call481, 1
  br i1 %cmp482, label %if.then483, label %if.end484

if.then483:                                       ; preds = %if.end480
  call void @abort() noreturn
  unreachable

if.end484:                                        ; preds = %if.end480
  %741 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %742 = and i32 %741, -33
  %743 = or i32 %742, 32
  store i32 %743, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_e(i32 264151)
  %call485 = call i32 @ret6()
  %cmp486 = icmp ne i32 %call485, 0
  br i1 %cmp486, label %if.then487, label %if.end488

if.then487:                                       ; preds = %if.end484
  call void @abort() noreturn
  unreachable

if.end488:                                        ; preds = %if.end484
  %744 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %745 = and i32 %744, 63
  %746 = or i32 %745, -2147483648
  store i32 %746, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_e(i32 713)
  %call489 = call i32 @ret7()
  %cmp490 = icmp ne i32 %call489, 20
  br i1 %cmp490, label %if.then491, label %if.end492

if.then491:                                       ; preds = %if.end488
  call void @abort() noreturn
  unreachable

if.end492:                                        ; preds = %if.end488
  %747 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %748 = and i32 %747, -65536
  %749 = or i32 %748, 26812
  store i32 %749, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_e(i32 17)
  %call493 = call i32 @ret8()
  %cmp494 = icmp ne i32 %call493, 20
  br i1 %cmp494, label %if.then495, label %if.end496

if.then495:                                       ; preds = %if.end492
  call void @abort() noreturn
  unreachable

if.end496:                                        ; preds = %if.end492
  %750 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %751 = and i32 %750, -16711681
  %752 = or i32 %751, 10223616
  store i32 %752, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_e(i32 199)
  %call497 = call i32 @ret9()
  %cmp498 = icmp ne i32 %call497, 17
  br i1 %cmp498, label %if.then499, label %if.end500

if.then499:                                       ; preds = %if.end496
  call void @abort() noreturn
  unreachable

if.end500:                                        ; preds = %if.end496
  %753 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %754 = and i32 %753, 16777215
  %755 = or i32 %754, -1157627904
  store i32 %755, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %756 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %757 = and i32 %756, -64
  %758 = or i32 %757, 51
  store i32 %758, i32* bitcast (%struct.anon* @b to i32*), align 4
  %759 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %760 = and i32 %759, -131009
  %761 = or i32 %760, 40704
  store i32 %761, i32* bitcast (%struct.anon* @b to i32*), align 4
  %762 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %763 = and i32 %762, 131071
  %764 = or i32 %763, -195297280
  store i32 %764, i32* bitcast (%struct.anon* @b to i32*), align 4
  %765 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %766 = and i32 %765, -32
  %767 = or i32 %766, 21
  store i32 %767, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %768 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %769 = and i32 %768, -33
  %770 = or i32 %769, 32
  store i32 %770, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %771 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %772 = and i32 %771, 63
  %773 = or i32 %772, -2147483648
  store i32 %773, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %774 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %775 = and i32 %774, -65536
  %776 = or i32 %775, 26812
  store i32 %776, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %777 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %778 = and i32 %777, -16711681
  %779 = or i32 %778, 10223616
  store i32 %779, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %780 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %781 = and i32 %780, 16777215
  %782 = or i32 %781, -1157627904
  store i32 %782, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_f(i32 3)
  %call501 = call i32 @ret1()
  %cmp502 = icmp ne i32 %call501, 51
  br i1 %cmp502, label %if.then503, label %if.end504

if.then503:                                       ; preds = %if.end500
  call void @abort() noreturn
  unreachable

if.end504:                                        ; preds = %if.end500
  %783 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %784 = and i32 %783, -64
  %785 = or i32 %784, 51
  store i32 %785, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_f(i32 251)
  %call505 = call i32 @ret2()
  %cmp506 = icmp ne i32 %call505, 639
  br i1 %cmp506, label %if.then507, label %if.end508

if.then507:                                       ; preds = %if.end504
  call void @abort() noreturn
  unreachable

if.end508:                                        ; preds = %if.end504
  %786 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %787 = and i32 %786, -131009
  %788 = or i32 %787, 40704
  store i32 %788, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_f(i32 13279)
  %call509 = call i32 @ret3()
  %cmp510 = icmp ne i32 %call509, 31295
  br i1 %cmp510, label %if.then511, label %if.end512

if.then511:                                       ; preds = %if.end508
  call void @abort() noreturn
  unreachable

if.end512:                                        ; preds = %if.end508
  %789 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %790 = and i32 %789, -131009
  %791 = or i32 %790, 35712
  store i32 %791, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_f(i32 24)
  %call513 = call i32 @ret4()
  %cmp514 = icmp ne i32 %call513, 23
  br i1 %cmp514, label %if.then515, label %if.end516

if.then515:                                       ; preds = %if.end512
  call void @abort() noreturn
  unreachable

if.end516:                                        ; preds = %if.end512
  %792 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %793 = and i32 %792, -32
  %794 = or i32 %793, 21
  store i32 %794, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_f(i32 1)
  %call517 = call i32 @ret5()
  %cmp518 = icmp ne i32 %call517, 1
  br i1 %cmp518, label %if.then519, label %if.end520

if.then519:                                       ; preds = %if.end516
  call void @abort() noreturn
  unreachable

if.end520:                                        ; preds = %if.end516
  %795 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %796 = and i32 %795, -33
  %797 = or i32 %796, 32
  store i32 %797, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_f(i32 264151)
  %call521 = call i32 @ret6()
  %cmp522 = icmp ne i32 %call521, 33554451
  br i1 %cmp522, label %if.then523, label %if.end524

if.then523:                                       ; preds = %if.end520
  call void @abort() noreturn
  unreachable

if.end524:                                        ; preds = %if.end520
  %798 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %799 = and i32 %798, 63
  %800 = or i32 %799, -2147483648
  store i32 %800, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_f(i32 713)
  %call525 = call i32 @ret7()
  %cmp526 = icmp ne i32 %call525, 26815
  br i1 %cmp526, label %if.then527, label %if.end528

if.then527:                                       ; preds = %if.end524
  call void @abort() noreturn
  unreachable

if.end528:                                        ; preds = %if.end524
  %801 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %802 = and i32 %801, -65536
  %803 = or i32 %802, 26812
  store i32 %803, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_f(i32 17)
  %call529 = call i32 @ret8()
  %cmp530 = icmp ne i32 %call529, 159
  br i1 %cmp530, label %if.then531, label %if.end532

if.then531:                                       ; preds = %if.end528
  call void @abort() noreturn
  unreachable

if.end532:                                        ; preds = %if.end528
  %804 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %805 = and i32 %804, -16711681
  %806 = or i32 %805, 10223616
  store i32 %806, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_f(i32 199)
  %call533 = call i32 @ret9()
  %cmp534 = icmp ne i32 %call533, 187
  br i1 %cmp534, label %if.then535, label %if.end536

if.then535:                                       ; preds = %if.end532
  call void @abort() noreturn
  unreachable

if.end536:                                        ; preds = %if.end532
  %807 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %808 = and i32 %807, 16777215
  %809 = or i32 %808, -1157627904
  store i32 %809, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %810 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %811 = and i32 %810, -64
  %812 = or i32 %811, 51
  store i32 %812, i32* bitcast (%struct.anon* @b to i32*), align 4
  %813 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %814 = and i32 %813, -131009
  %815 = or i32 %814, 40704
  store i32 %815, i32* bitcast (%struct.anon* @b to i32*), align 4
  %816 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %817 = and i32 %816, 131071
  %818 = or i32 %817, -195297280
  store i32 %818, i32* bitcast (%struct.anon* @b to i32*), align 4
  %819 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %820 = and i32 %819, -32
  %821 = or i32 %820, 21
  store i32 %821, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %822 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %823 = and i32 %822, -33
  %824 = or i32 %823, 32
  store i32 %824, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %825 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %826 = and i32 %825, 63
  %827 = or i32 %826, -2147483648
  store i32 %827, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %828 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %829 = and i32 %828, -65536
  %830 = or i32 %829, 26812
  store i32 %830, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %831 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %832 = and i32 %831, -16711681
  %833 = or i32 %832, 10223616
  store i32 %833, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %834 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %835 = and i32 %834, 16777215
  %836 = or i32 %835, -1157627904
  store i32 %836, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_g(i32 3)
  %call537 = call i32 @ret1()
  %cmp538 = icmp ne i32 %call537, 22
  br i1 %cmp538, label %if.then539, label %if.end540

if.then539:                                       ; preds = %if.end536
  call void @abort() noreturn
  unreachable

if.end540:                                        ; preds = %if.end536
  %837 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %838 = and i32 %837, -64
  %839 = or i32 %838, 51
  store i32 %839, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_g(i32 251)
  %call541 = call i32 @ret2()
  %cmp542 = icmp ne i32 %call541, 601
  br i1 %cmp542, label %if.then543, label %if.end544

if.then543:                                       ; preds = %if.end540
  call void @abort() noreturn
  unreachable

if.end544:                                        ; preds = %if.end540
  %840 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %841 = and i32 %840, -131009
  %842 = or i32 %841, 40704
  store i32 %842, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_g(i32 13279)
  %call545 = call i32 @ret3()
  %cmp546 = icmp ne i32 %call545, 31243
  br i1 %cmp546, label %if.then547, label %if.end548

if.then547:                                       ; preds = %if.end544
  call void @abort() noreturn
  unreachable

if.end548:                                        ; preds = %if.end544
  %843 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %844 = and i32 %843, -131009
  %845 = or i32 %844, 35712
  store i32 %845, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_g(i32 24)
  %call549 = call i32 @ret4()
  %cmp550 = icmp ne i32 %call549, 16
  br i1 %cmp550, label %if.then551, label %if.end552

if.then551:                                       ; preds = %if.end548
  call void @abort() noreturn
  unreachable

if.end552:                                        ; preds = %if.end548
  %846 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %847 = and i32 %846, -32
  %848 = or i32 %847, 21
  store i32 %848, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_g(i32 1)
  %call553 = call i32 @ret5()
  %cmp554 = icmp ne i32 %call553, 0
  br i1 %cmp554, label %if.then555, label %if.end556

if.then555:                                       ; preds = %if.end552
  call void @abort() noreturn
  unreachable

if.end556:                                        ; preds = %if.end552
  %849 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %850 = and i32 %849, -33
  %851 = or i32 %850, 32
  store i32 %851, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_g(i32 264151)
  %call557 = call i32 @ret6()
  %cmp558 = icmp ne i32 %call557, 33554469
  br i1 %cmp558, label %if.then559, label %if.end560

if.then559:                                       ; preds = %if.end556
  call void @abort() noreturn
  unreachable

if.end560:                                        ; preds = %if.end556
  %852 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %853 = and i32 %852, 63
  %854 = or i32 %853, -2147483648
  store i32 %854, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_g(i32 713)
  %call561 = call i32 @ret7()
  %cmp562 = icmp ne i32 %call561, 26777
  br i1 %cmp562, label %if.then563, label %if.end564

if.then563:                                       ; preds = %if.end560
  call void @abort() noreturn
  unreachable

if.end564:                                        ; preds = %if.end560
  %855 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %856 = and i32 %855, -65536
  %857 = or i32 %856, 26812
  store i32 %857, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_g(i32 17)
  %call565 = call i32 @ret8()
  %cmp566 = icmp ne i32 %call565, 185
  br i1 %cmp566, label %if.then567, label %if.end568

if.then567:                                       ; preds = %if.end564
  call void @abort() noreturn
  unreachable

if.end568:                                        ; preds = %if.end564
  %858 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %859 = and i32 %858, -16711681
  %860 = or i32 %859, 10223616
  store i32 %860, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_g(i32 199)
  %call569 = call i32 @ret9()
  %cmp570 = icmp ne i32 %call569, 158
  br i1 %cmp570, label %if.then571, label %if.end572

if.then571:                                       ; preds = %if.end568
  call void @abort() noreturn
  unreachable

if.end572:                                        ; preds = %if.end568
  %861 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %862 = and i32 %861, 16777215
  %863 = or i32 %862, -1157627904
  store i32 %863, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %864 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %865 = and i32 %864, -64
  %866 = or i32 %865, 51
  store i32 %866, i32* bitcast (%struct.anon* @b to i32*), align 4
  %867 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %868 = and i32 %867, -131009
  %869 = or i32 %868, 40704
  store i32 %869, i32* bitcast (%struct.anon* @b to i32*), align 4
  %870 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %871 = and i32 %870, 131071
  %872 = or i32 %871, -195297280
  store i32 %872, i32* bitcast (%struct.anon* @b to i32*), align 4
  %873 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %874 = and i32 %873, -32
  %875 = or i32 %874, 21
  store i32 %875, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %876 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %877 = and i32 %876, -33
  %878 = or i32 %877, 32
  store i32 %878, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %879 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %880 = and i32 %879, 63
  %881 = or i32 %880, -2147483648
  store i32 %881, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %882 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %883 = and i32 %882, -65536
  %884 = or i32 %883, 26812
  store i32 %884, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %885 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %886 = and i32 %885, -16711681
  %887 = or i32 %886, 10223616
  store i32 %887, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %888 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %889 = and i32 %888, 16777215
  %890 = or i32 %889, -1157627904
  store i32 %890, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_h(i32 3)
  %call573 = call i32 @ret1()
  %cmp574 = icmp ne i32 %call573, 3
  br i1 %cmp574, label %if.then575, label %if.end576

if.then575:                                       ; preds = %if.end572
  call void @abort() noreturn
  unreachable

if.end576:                                        ; preds = %if.end572
  %891 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %892 = and i32 %891, -64
  %893 = or i32 %892, 51
  store i32 %893, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_h(i32 251)
  %call577 = call i32 @ret2()
  %cmp578 = icmp ne i32 %call577, 37
  br i1 %cmp578, label %if.then579, label %if.end580

if.then579:                                       ; preds = %if.end576
  call void @abort() noreturn
  unreachable

if.end580:                                        ; preds = %if.end576
  %894 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %895 = and i32 %894, -131009
  %896 = or i32 %895, 40704
  store i32 %896, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_h(i32 13279)
  %call581 = call i32 @ret3()
  %cmp582 = icmp ne i32 %call581, 1839
  br i1 %cmp582, label %if.then583, label %if.end584

if.then583:                                       ; preds = %if.end580
  call void @abort() noreturn
  unreachable

if.end584:                                        ; preds = %if.end580
  %897 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %898 = and i32 %897, -131009
  %899 = or i32 %898, 35712
  store i32 %899, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_h(i32 24)
  %call585 = call i32 @ret4()
  %cmp586 = icmp ne i32 %call585, 1
  br i1 %cmp586, label %if.then587, label %if.end588

if.then587:                                       ; preds = %if.end584
  call void @abort() noreturn
  unreachable

if.end588:                                        ; preds = %if.end584
  %900 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %901 = and i32 %900, -32
  %902 = or i32 %901, 21
  store i32 %902, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_h(i32 1)
  %call589 = call i32 @ret5()
  %cmp590 = icmp ne i32 %call589, 0
  br i1 %cmp590, label %if.then591, label %if.end592

if.then591:                                       ; preds = %if.end588
  call void @abort() noreturn
  unreachable

if.end592:                                        ; preds = %if.end588
  %903 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %904 = and i32 %903, -33
  %905 = or i32 %904, 32
  store i32 %905, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_h(i32 264151)
  %call593 = call i32 @ret6()
  %cmp594 = icmp ne i32 %call593, 1973790
  br i1 %cmp594, label %if.then595, label %if.end596

if.then595:                                       ; preds = %if.end592
  call void @abort() noreturn
  unreachable

if.end596:                                        ; preds = %if.end592
  %906 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %907 = and i32 %906, 63
  %908 = or i32 %907, -2147483648
  store i32 %908, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_h(i32 713)
  %call597 = call i32 @ret7()
  %cmp598 = icmp ne i32 %call597, 1577
  br i1 %cmp598, label %if.then599, label %if.end600

if.then599:                                       ; preds = %if.end596
  call void @abort() noreturn
  unreachable

if.end600:                                        ; preds = %if.end596
  %909 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %910 = and i32 %909, -65536
  %911 = or i32 %910, 26812
  store i32 %911, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_h(i32 17)
  %call601 = call i32 @ret8()
  %cmp602 = icmp ne i32 %call601, 9
  br i1 %cmp602, label %if.then603, label %if.end604

if.then603:                                       ; preds = %if.end600
  call void @abort() noreturn
  unreachable

if.end604:                                        ; preds = %if.end600
  %912 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %913 = and i32 %912, -16711681
  %914 = or i32 %913, 10223616
  store i32 %914, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_h(i32 199)
  %call605 = call i32 @ret9()
  %cmp606 = icmp ne i32 %call605, 11
  br i1 %cmp606, label %if.then607, label %if.end608

if.then607:                                       ; preds = %if.end604
  call void @abort() noreturn
  unreachable

if.end608:                                        ; preds = %if.end604
  %915 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %916 = and i32 %915, 16777215
  %917 = or i32 %916, -1157627904
  store i32 %917, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %918 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %919 = and i32 %918, -64
  %920 = or i32 %919, 51
  store i32 %920, i32* bitcast (%struct.anon* @b to i32*), align 4
  %921 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %922 = and i32 %921, -131009
  %923 = or i32 %922, 40704
  store i32 %923, i32* bitcast (%struct.anon* @b to i32*), align 4
  %924 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %925 = and i32 %924, 131071
  %926 = or i32 %925, -195297280
  store i32 %926, i32* bitcast (%struct.anon* @b to i32*), align 4
  %927 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %928 = and i32 %927, -32
  %929 = or i32 %928, 21
  store i32 %929, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %930 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %931 = and i32 %930, -33
  %932 = or i32 %931, 32
  store i32 %932, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %933 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %934 = and i32 %933, 63
  %935 = or i32 %934, -2147483648
  store i32 %935, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %936 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %937 = and i32 %936, -65536
  %938 = or i32 %937, 26812
  store i32 %938, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %939 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %940 = and i32 %939, -16711681
  %941 = or i32 %940, 10223616
  store i32 %941, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %942 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %943 = and i32 %942, 16777215
  %944 = or i32 %943, -1157627904
  store i32 %944, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn1_i(i32 3)
  %call609 = call i32 @ret1()
  %cmp610 = icmp ne i32 %call609, 13
  br i1 %cmp610, label %if.then611, label %if.end612

if.then611:                                       ; preds = %if.end608
  call void @abort() noreturn
  unreachable

if.end612:                                        ; preds = %if.end608
  %945 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %946 = and i32 %945, -64
  %947 = or i32 %946, 51
  store i32 %947, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn2_i(i32 251)
  %call613 = call i32 @ret2()
  %cmp614 = icmp ne i32 %call613, 9
  br i1 %cmp614, label %if.then615, label %if.end616

if.then615:                                       ; preds = %if.end612
  call void @abort() noreturn
  unreachable

if.end616:                                        ; preds = %if.end612
  %948 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %949 = and i32 %948, -131009
  %950 = or i32 %949, 40704
  store i32 %950, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn3_i(i32 13279)
  %call617 = call i32 @ret3()
  %cmp618 = icmp ne i32 %call617, 4
  br i1 %cmp618, label %if.then619, label %if.end620

if.then619:                                       ; preds = %if.end616
  call void @abort() noreturn
  unreachable

if.end620:                                        ; preds = %if.end616
  %951 = load i32* bitcast (%struct.anon* @b to i32*), align 4
  %952 = and i32 %951, -131009
  %953 = or i32 %952, 35712
  store i32 %953, i32* bitcast (%struct.anon* @b to i32*), align 4
  call void @fn4_i(i32 24)
  %call621 = call i32 @ret4()
  %cmp622 = icmp ne i32 %call621, 2
  br i1 %cmp622, label %if.then623, label %if.end624

if.then623:                                       ; preds = %if.end620
  call void @abort() noreturn
  unreachable

if.end624:                                        ; preds = %if.end620
  %954 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %955 = and i32 %954, -32
  %956 = or i32 %955, 21
  store i32 %956, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn5_i(i32 1)
  %call625 = call i32 @ret5()
  %cmp626 = icmp ne i32 %call625, 1
  br i1 %cmp626, label %if.then627, label %if.end628

if.then627:                                       ; preds = %if.end624
  call void @abort() noreturn
  unreachable

if.end628:                                        ; preds = %if.end624
  %957 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %958 = and i32 %957, -33
  %959 = or i32 %958, 32
  store i32 %959, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn6_i(i32 264151)
  %call629 = call i32 @ret6()
  %cmp630 = icmp ne i32 %call629, 14
  br i1 %cmp630, label %if.then631, label %if.end632

if.then631:                                       ; preds = %if.end628
  call void @abort() noreturn
  unreachable

if.end632:                                        ; preds = %if.end628
  %960 = load i32* bitcast (%struct.anon.0* @c to i32*), align 4
  %961 = and i32 %960, 63
  %962 = or i32 %961, -2147483648
  store i32 %962, i32* bitcast (%struct.anon.0* @c to i32*), align 4
  call void @fn7_i(i32 713)
  %call633 = call i32 @ret7()
  %cmp634 = icmp ne i32 %call633, 3
  br i1 %cmp634, label %if.then635, label %if.end636

if.then635:                                       ; preds = %if.end632
  call void @abort() noreturn
  unreachable

if.end636:                                        ; preds = %if.end632
  %963 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %964 = and i32 %963, -65536
  %965 = or i32 %964, 26812
  store i32 %965, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn8_i(i32 17)
  %call637 = call i32 @ret8()
  %cmp638 = icmp ne i32 %call637, 4
  br i1 %cmp638, label %if.then639, label %if.end640

if.then639:                                       ; preds = %if.end636
  call void @abort() noreturn
  unreachable

if.end640:                                        ; preds = %if.end636
  %966 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %967 = and i32 %966, -16711681
  %968 = or i32 %967, 10223616
  store i32 %968, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  call void @fn9_i(i32 199)
  %call641 = call i32 @ret9()
  %cmp642 = icmp ne i32 %call641, 16
  br i1 %cmp642, label %if.then643, label %if.end644

if.then643:                                       ; preds = %if.end640
  call void @abort() noreturn
  unreachable

if.end644:                                        ; preds = %if.end640
  %969 = load i32* bitcast (%struct.anon.1* @d to i32*), align 4
  %970 = and i32 %969, 16777215
  %971 = or i32 %970, -1157627904
  store i32 %971, i32* bitcast (%struct.anon.1* @d to i32*), align 4
  ret i32 0
}

declare void @abort() noreturn
