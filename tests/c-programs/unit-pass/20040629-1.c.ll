; ModuleID = './20040629-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32 }
%struct.anon.0 = type { i32 }
%struct.anon.1 = type { i32 }

@b = common global %struct.anon zeroinitializer, align 4
@c = common global %struct.anon.0 zeroinitializer, align 4
@d = common global %struct.anon.1 zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @ret1() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %2 = and i32 %1, 63
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @ret2() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %2 = lshr i32 %1, 6
  %3 = and i32 %2, 2047
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ret3() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %2 = lshr i32 %1, 17
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @ret4() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %2 = and i32 %1, 31
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @ret5() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %2 = lshr i32 %1, 5
  %3 = and i32 %2, 1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ret6() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %2 = lshr i32 %1, 6
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @ret7() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %2 = and i32 %1, 65535
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @ret8() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %2 = lshr i32 %1, 16
  %3 = and i32 %2, 255
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ret9() #0 {
  %1 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %2 = lshr i32 %1, 24
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define void @fn1_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = and i32 %3, 63
  %5 = add i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 63
  %8 = and i32 %6, -64
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 2047
  %6 = add i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = and i32 %6, 2047
  %9 = shl i32 %8, 6
  %10 = and i32 %7, -131009
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 17
  %5 = add i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 32767
  %8 = shl i32 %7, 17
  %9 = and i32 %6, 131071
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = and i32 %3, 31
  %5 = add i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 31
  %8 = and i32 %6, -32
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 5
  %5 = and i32 %4, 1
  %6 = add i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %8 = and i32 %6, 1
  %9 = shl i32 %8, 5
  %10 = and i32 %7, -33
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = add i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 67108863
  %8 = shl i32 %7, 6
  %9 = and i32 %6, 63
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = and i32 %3, 65535
  %5 = add i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 65535
  %8 = and i32 %6, -65536
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 16
  %5 = and i32 %4, 255
  %6 = add i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %8 = and i32 %6, 255
  %9 = shl i32 %8, 16
  %10 = and i32 %7, -16711681
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 24
  %5 = add i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 24
  %9 = and i32 %6, 16777215
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = add i32 %4, 1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = add i32 %4, 1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = add i32 %4, 1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = add i32 %4, 1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = add i32 %4, 1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = add i32 %4, 1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = add i32 %3, 1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = and i32 %3, 63
  %5 = sub i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 63
  %8 = and i32 %6, -64
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 2047
  %6 = sub i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = and i32 %6, 2047
  %9 = shl i32 %8, 6
  %10 = and i32 %7, -131009
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 17
  %5 = sub i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 32767
  %8 = shl i32 %7, 17
  %9 = and i32 %6, 131071
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = and i32 %3, 31
  %5 = sub i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 31
  %8 = and i32 %6, -32
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 5
  %5 = and i32 %4, 1
  %6 = sub i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %8 = and i32 %6, 1
  %9 = shl i32 %8, 5
  %10 = and i32 %7, -33
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = sub i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 67108863
  %8 = shl i32 %7, 6
  %9 = and i32 %6, 63
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = and i32 %3, 65535
  %5 = sub i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 65535
  %8 = and i32 %6, -65536
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 16
  %5 = and i32 %4, 255
  %6 = sub i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %8 = and i32 %6, 255
  %9 = shl i32 %8, 16
  %10 = and i32 %7, -16711681
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 24
  %5 = sub i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 24
  %9 = and i32 %6, 16777215
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = add i32 %4, -1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = add i32 %4, -1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = add i32 %4, -1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = add i32 %4, -1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = add i32 %4, -1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = add i32 %4, -1
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = add i32 %3, -1
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = and i32 %3, 63
  %5 = and i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 63
  %8 = and i32 %6, -64
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 2047
  %6 = and i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = and i32 %6, 2047
  %9 = shl i32 %8, 6
  %10 = and i32 %7, -131009
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 17
  %5 = and i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 32767
  %8 = shl i32 %7, 17
  %9 = and i32 %6, 131071
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = and i32 %3, 31
  %5 = and i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 31
  %8 = and i32 %6, -32
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 5
  %5 = and i32 %4, 1
  %6 = and i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %8 = and i32 %6, 1
  %9 = shl i32 %8, 5
  %10 = and i32 %7, -33
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 67108863
  %8 = shl i32 %7, 6
  %9 = and i32 %6, 63
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = and i32 %3, 65535
  %5 = and i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 65535
  %8 = and i32 %6, -65536
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 16
  %5 = and i32 %4, 255
  %6 = and i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %8 = and i32 %6, 255
  %9 = shl i32 %8, 16
  %10 = and i32 %7, -16711681
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 24
  %5 = and i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 24
  %9 = and i32 %6, 16777215
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = and i32 %3, 63
  %5 = or i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 63
  %8 = and i32 %6, -64
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 2047
  %6 = or i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = and i32 %6, 2047
  %9 = shl i32 %8, 6
  %10 = and i32 %7, -131009
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 17
  %5 = or i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 32767
  %8 = shl i32 %7, 17
  %9 = and i32 %6, 131071
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = and i32 %3, 31
  %5 = or i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 31
  %8 = and i32 %6, -32
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 5
  %5 = and i32 %4, 1
  %6 = or i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %8 = and i32 %6, 1
  %9 = shl i32 %8, 5
  %10 = and i32 %7, -33
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = or i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 67108863
  %8 = shl i32 %7, 6
  %9 = and i32 %6, 63
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = and i32 %3, 65535
  %5 = or i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 65535
  %8 = and i32 %6, -65536
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 16
  %5 = and i32 %4, 255
  %6 = or i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %8 = and i32 %6, 255
  %9 = shl i32 %8, 16
  %10 = and i32 %7, -16711681
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 24
  %5 = or i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 24
  %9 = and i32 %6, 16777215
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = and i32 %3, 63
  %5 = xor i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 63
  %8 = and i32 %6, -64
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 2047
  %6 = xor i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = and i32 %6, 2047
  %9 = shl i32 %8, 6
  %10 = and i32 %7, -131009
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 17
  %5 = xor i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 32767
  %8 = shl i32 %7, 17
  %9 = and i32 %6, 131071
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = and i32 %3, 31
  %5 = xor i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 31
  %8 = and i32 %6, -32
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 5
  %5 = and i32 %4, 1
  %6 = xor i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %8 = and i32 %6, 1
  %9 = shl i32 %8, 5
  %10 = and i32 %7, -33
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = xor i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 67108863
  %8 = shl i32 %7, 6
  %9 = and i32 %6, 63
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = and i32 %3, 65535
  %5 = xor i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 65535
  %8 = and i32 %6, -65536
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 16
  %5 = and i32 %4, 255
  %6 = xor i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %8 = and i32 %6, 255
  %9 = shl i32 %8, 16
  %10 = and i32 %7, -16711681
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 24
  %5 = xor i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 24
  %9 = and i32 %6, 16777215
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = and i32 %3, 63
  %5 = udiv i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 63
  %8 = and i32 %6, -64
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 2047
  %6 = udiv i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = and i32 %6, 2047
  %9 = shl i32 %8, 6
  %10 = and i32 %7, -131009
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 17
  %5 = udiv i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 32767
  %8 = shl i32 %7, 17
  %9 = and i32 %6, 131071
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = and i32 %3, 31
  %5 = udiv i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 31
  %8 = and i32 %6, -32
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 5
  %5 = and i32 %4, 1
  %6 = udiv i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %8 = and i32 %6, 1
  %9 = shl i32 %8, 5
  %10 = and i32 %7, -33
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = udiv i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 67108863
  %8 = shl i32 %7, 6
  %9 = and i32 %6, 63
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = and i32 %3, 65535
  %5 = udiv i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 65535
  %8 = and i32 %6, -65536
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 16
  %5 = and i32 %4, 255
  %6 = udiv i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %8 = and i32 %6, 255
  %9 = shl i32 %8, 16
  %10 = and i32 %7, -16711681
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_a(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 24
  %5 = udiv i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 24
  %9 = and i32 %6, 16777215
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = and i32 %3, 63
  %5 = urem i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 63
  %8 = and i32 %6, -64
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = and i32 %4, 2047
  %6 = urem i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = and i32 %6, 2047
  %9 = shl i32 %8, 6
  %10 = and i32 %7, -131009
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 17
  %5 = urem i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 32767
  %8 = shl i32 %7, 17
  %9 = and i32 %6, 131071
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = and i32 %3, 31
  %5 = urem i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 31
  %8 = and i32 %6, -32
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 5
  %5 = and i32 %4, 1
  %6 = urem i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %8 = and i32 %6, 1
  %9 = shl i32 %8, 5
  %10 = and i32 %7, -33
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 6
  %5 = urem i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 67108863
  %8 = shl i32 %7, 6
  %9 = and i32 %6, 63
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = and i32 %3, 65535
  %5 = urem i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 65535
  %8 = and i32 %6, -65536
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 16
  %5 = and i32 %4, 255
  %6 = urem i32 %5, %2
  %7 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %8 = and i32 %6, 255
  %9 = shl i32 %8, 16
  %10 = and i32 %7, -16711681
  %11 = or i32 %10, %9
  store i32 %11, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %4 = lshr i32 %3, 24
  %5 = urem i32 %4, %2
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 24
  %9 = and i32 %6, 16777215
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = add nsw i32 %3, 3
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = add nsw i32 %4, 3
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = add nsw i32 %3, 3
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = add nsw i32 %3, 3
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = add nsw i32 %4, 3
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = add nsw i32 %3, 3
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = add nsw i32 %3, 3
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = add nsw i32 %4, 3
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_c(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = add nsw i32 %3, 3
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = sub nsw i32 %3, 7
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = sub nsw i32 %4, 7
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = sub nsw i32 %3, 7
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = sub nsw i32 %3, 7
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = sub nsw i32 %4, 7
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = sub nsw i32 %3, 7
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = sub nsw i32 %3, 7
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = sub nsw i32 %4, 7
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_d(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = sub nsw i32 %3, 7
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = and i32 %3, 21
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = and i32 %4, 21
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = and i32 %3, 21
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = and i32 %3, 21
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = and i32 %4, 21
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 21
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = and i32 %3, 21
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = and i32 %4, 21
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_e(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = and i32 %3, 21
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = or i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = or i32 %4, 19
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = or i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = or i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = or i32 %4, 19
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = or i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = or i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = or i32 %4, 19
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_f(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = or i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = xor i32 %3, 37
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = xor i32 %4, 37
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = xor i32 %3, 37
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = xor i32 %3, 37
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = xor i32 %4, 37
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = xor i32 %3, 37
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = xor i32 %3, 37
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = xor i32 %4, 37
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = xor i32 %3, 37
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = sdiv i32 %3, 17
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = sdiv i32 %4, 17
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = sdiv i32 %3, 17
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = sdiv i32 %3, 17
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = sdiv i32 %4, 17
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = sdiv i32 %3, 17
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = sdiv i32 %3, 17
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = sdiv i32 %4, 17
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = sdiv i32 %3, 17
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn1_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, 63
  %4 = srem i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 63
  %7 = and i32 %5, -64
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn2_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = and i32 %3, 2047
  %5 = srem i32 %4, 19
  %6 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %7 = and i32 %5, 2047
  %8 = shl i32 %7, 6
  %9 = and i32 %6, -131009
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn3_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 17
  %4 = srem i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %4, 32767
  %7 = shl i32 %6, 17
  %8 = and i32 %5, 131071
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn4_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = and i32 %2, 31
  %4 = srem i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 31
  %7 = and i32 %5, -32
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn5_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 5
  %4 = and i32 %3, 1
  %5 = srem i32 %4, 19
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %7 = and i32 %5, 1
  %8 = shl i32 %7, 5
  %9 = and i32 %6, -33
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn6_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 6
  %4 = srem i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %6 = and i32 %4, 67108863
  %7 = shl i32 %6, 6
  %8 = and i32 %5, 63
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn7_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = and i32 %2, 65535
  %4 = srem i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 65535
  %7 = and i32 %5, -65536
  %8 = or i32 %7, %6
  store i32 %8, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn8_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 16
  %4 = and i32 %3, 255
  %5 = srem i32 %4, 19
  %6 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %7 = and i32 %5, 255
  %8 = shl i32 %7, 16
  %9 = and i32 %6, -16711681
  %10 = or i32 %9, %8
  store i32 %10, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @fn9_i(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %3 = lshr i32 %2, 24
  %4 = srem i32 %3, 19
  %5 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %6 = and i32 %4, 255
  %7 = shl i32 %6, 24
  %8 = and i32 %5, 16777215
  %9 = or i32 %8, %7
  store i32 %9, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %3 = and i32 %2, -64
  %4 = or i32 %3, 51
  store i32 %4, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %6 = and i32 %5, -131009
  %7 = or i32 %6, 40704
  store i32 %7, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %8 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %9 = and i32 %8, 131071
  %10 = or i32 %9, -195297280
  store i32 %10, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %11 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %12 = and i32 %11, -32
  %13 = or i32 %12, 21
  store i32 %13, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %14 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %15 = and i32 %14, -33
  %16 = or i32 %15, 32
  store i32 %16, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %17 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %18 = and i32 %17, 63
  %19 = or i32 %18, -2147483648
  store i32 %19, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %20 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %21 = and i32 %20, -65536
  %22 = or i32 %21, 26812
  store i32 %22, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %23 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %24 = and i32 %23, -16711681
  %25 = or i32 %24, 10223616
  store i32 %25, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %26 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %27 = and i32 %26, 16777215
  %28 = or i32 %27, -1157627904
  store i32 %28, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_1(i32 3)
  %29 = call i32 @ret1()
  %30 = icmp ne i32 %29, 54
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:32                                      ; preds = %0
  %33 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %34 = and i32 %33, -64
  %35 = or i32 %34, 51
  store i32 %35, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_1(i32 251)
  %36 = call i32 @ret2()
  %37 = icmp ne i32 %36, 887
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %32
  call void @abort() #2
  unreachable

; <label>:39                                      ; preds = %32
  %40 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %41 = and i32 %40, -131009
  %42 = or i32 %41, 40704
  store i32 %42, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_1(i32 13279)
  %43 = call i32 @ret3()
  %44 = icmp ne i32 %43, 11789
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %39
  call void @abort() #2
  unreachable

; <label>:46                                      ; preds = %39
  %47 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %48 = and i32 %47, -131009
  %49 = or i32 %48, 35712
  store i32 %49, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_1(i32 24)
  %50 = call i32 @ret4()
  %51 = icmp ne i32 %50, 13
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %46
  call void @abort() #2
  unreachable

; <label>:53                                      ; preds = %46
  %54 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %55 = and i32 %54, -32
  %56 = or i32 %55, 21
  store i32 %56, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_1(i32 1)
  %57 = call i32 @ret5()
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %60

; <label>:59                                      ; preds = %53
  call void @abort() #2
  unreachable

; <label>:60                                      ; preds = %53
  %61 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %62 = and i32 %61, -33
  %63 = or i32 %62, 32
  store i32 %63, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_1(i32 264151)
  %64 = call i32 @ret6()
  %65 = icmp ne i32 %64, 33818583
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %60
  call void @abort() #2
  unreachable

; <label>:67                                      ; preds = %60
  %68 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %69 = and i32 %68, 63
  %70 = or i32 %69, -2147483648
  store i32 %70, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_1(i32 713)
  %71 = call i32 @ret7()
  %72 = icmp ne i32 %71, 27525
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %67
  call void @abort() #2
  unreachable

; <label>:74                                      ; preds = %67
  %75 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %76 = and i32 %75, -65536
  %77 = or i32 %76, 26812
  store i32 %77, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_1(i32 17)
  %78 = call i32 @ret8()
  %79 = icmp ne i32 %78, 173
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %74
  call void @abort() #2
  unreachable

; <label>:81                                      ; preds = %74
  %82 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %83 = and i32 %82, -16711681
  %84 = or i32 %83, 10223616
  store i32 %84, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_1(i32 199)
  %85 = call i32 @ret9()
  %86 = icmp ne i32 %85, 130
  br i1 %86, label %87, label %88

; <label>:87                                      ; preds = %81
  call void @abort() #2
  unreachable

; <label>:88                                      ; preds = %81
  %89 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %90 = and i32 %89, 16777215
  %91 = or i32 %90, -1157627904
  store i32 %91, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %92 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %93 = and i32 %92, -64
  %94 = or i32 %93, 51
  store i32 %94, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %95 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %96 = and i32 %95, -131009
  %97 = or i32 %96, 40704
  store i32 %97, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %98 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %99 = and i32 %98, 131071
  %100 = or i32 %99, -195297280
  store i32 %100, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %101 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %102 = and i32 %101, -32
  %103 = or i32 %102, 21
  store i32 %103, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %104 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %105 = and i32 %104, -33
  %106 = or i32 %105, 32
  store i32 %106, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %107 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %108 = and i32 %107, 63
  %109 = or i32 %108, -2147483648
  store i32 %109, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %110 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %111 = and i32 %110, -65536
  %112 = or i32 %111, 26812
  store i32 %112, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %113 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %114 = and i32 %113, -16711681
  %115 = or i32 %114, 10223616
  store i32 %115, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %116 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %117 = and i32 %116, 16777215
  %118 = or i32 %117, -1157627904
  store i32 %118, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_2(i32 3)
  %119 = call i32 @ret1()
  %120 = icmp ne i32 %119, 52
  br i1 %120, label %121, label %122

; <label>:121                                     ; preds = %88
  call void @abort() #2
  unreachable

; <label>:122                                     ; preds = %88
  %123 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %124 = and i32 %123, -64
  %125 = or i32 %124, 51
  store i32 %125, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_2(i32 251)
  %126 = call i32 @ret2()
  %127 = icmp ne i32 %126, 637
  br i1 %127, label %128, label %129

; <label>:128                                     ; preds = %122
  call void @abort() #2
  unreachable

; <label>:129                                     ; preds = %122
  %130 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %131 = and i32 %130, -131009
  %132 = or i32 %131, 40704
  store i32 %132, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_2(i32 13279)
  %133 = call i32 @ret3()
  %134 = icmp ne i32 %133, 31279
  br i1 %134, label %135, label %136

; <label>:135                                     ; preds = %129
  call void @abort() #2
  unreachable

; <label>:136                                     ; preds = %129
  %137 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %138 = and i32 %137, -131009
  %139 = or i32 %138, 35712
  store i32 %139, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_2(i32 24)
  %140 = call i32 @ret4()
  %141 = icmp ne i32 %140, 22
  br i1 %141, label %142, label %143

; <label>:142                                     ; preds = %136
  call void @abort() #2
  unreachable

; <label>:143                                     ; preds = %136
  %144 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %145 = and i32 %144, -32
  %146 = or i32 %145, 21
  store i32 %146, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_2(i32 1)
  %147 = call i32 @ret5()
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %143
  call void @abort() #2
  unreachable

; <label>:150                                     ; preds = %143
  %151 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %152 = and i32 %151, -33
  %153 = or i32 %152, 32
  store i32 %153, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_2(i32 264151)
  %154 = call i32 @ret6()
  %155 = icmp ne i32 %154, 33554433
  br i1 %155, label %156, label %157

; <label>:156                                     ; preds = %150
  call void @abort() #2
  unreachable

; <label>:157                                     ; preds = %150
  %158 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %159 = and i32 %158, 63
  %160 = or i32 %159, -2147483648
  store i32 %160, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_2(i32 713)
  %161 = call i32 @ret7()
  %162 = icmp ne i32 %161, 26813
  br i1 %162, label %163, label %164

; <label>:163                                     ; preds = %157
  call void @abort() #2
  unreachable

; <label>:164                                     ; preds = %157
  %165 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %166 = and i32 %165, -65536
  %167 = or i32 %166, 26812
  store i32 %167, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_2(i32 17)
  %168 = call i32 @ret8()
  %169 = icmp ne i32 %168, 157
  br i1 %169, label %170, label %171

; <label>:170                                     ; preds = %164
  call void @abort() #2
  unreachable

; <label>:171                                     ; preds = %164
  %172 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %173 = and i32 %172, -16711681
  %174 = or i32 %173, 10223616
  store i32 %174, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_2(i32 199)
  %175 = call i32 @ret9()
  %176 = icmp ne i32 %175, 188
  br i1 %176, label %177, label %178

; <label>:177                                     ; preds = %171
  call void @abort() #2
  unreachable

; <label>:178                                     ; preds = %171
  %179 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %180 = and i32 %179, 16777215
  %181 = or i32 %180, -1157627904
  store i32 %181, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %182 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %183 = and i32 %182, -64
  %184 = or i32 %183, 51
  store i32 %184, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %185 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %186 = and i32 %185, -131009
  %187 = or i32 %186, 40704
  store i32 %187, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %188 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %189 = and i32 %188, 131071
  %190 = or i32 %189, -195297280
  store i32 %190, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %191 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %192 = and i32 %191, -32
  %193 = or i32 %192, 21
  store i32 %193, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %194 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %195 = and i32 %194, -33
  %196 = or i32 %195, 32
  store i32 %196, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %197 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %198 = and i32 %197, 63
  %199 = or i32 %198, -2147483648
  store i32 %199, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %200 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %201 = and i32 %200, -65536
  %202 = or i32 %201, 26812
  store i32 %202, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %203 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %204 = and i32 %203, -16711681
  %205 = or i32 %204, 10223616
  store i32 %205, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %206 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %207 = and i32 %206, 16777215
  %208 = or i32 %207, -1157627904
  store i32 %208, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_3(i32 3)
  %209 = call i32 @ret1()
  %210 = icmp ne i32 %209, 52
  br i1 %210, label %211, label %212

; <label>:211                                     ; preds = %178
  call void @abort() #2
  unreachable

; <label>:212                                     ; preds = %178
  %213 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %214 = and i32 %213, -64
  %215 = or i32 %214, 51
  store i32 %215, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_3(i32 251)
  %216 = call i32 @ret2()
  %217 = icmp ne i32 %216, 637
  br i1 %217, label %218, label %219

; <label>:218                                     ; preds = %212
  call void @abort() #2
  unreachable

; <label>:219                                     ; preds = %212
  %220 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %221 = and i32 %220, -131009
  %222 = or i32 %221, 40704
  store i32 %222, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_3(i32 13279)
  %223 = call i32 @ret3()
  %224 = icmp ne i32 %223, 31279
  br i1 %224, label %225, label %226

; <label>:225                                     ; preds = %219
  call void @abort() #2
  unreachable

; <label>:226                                     ; preds = %219
  %227 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %228 = and i32 %227, -131009
  %229 = or i32 %228, 35712
  store i32 %229, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_3(i32 24)
  %230 = call i32 @ret4()
  %231 = icmp ne i32 %230, 22
  br i1 %231, label %232, label %233

; <label>:232                                     ; preds = %226
  call void @abort() #2
  unreachable

; <label>:233                                     ; preds = %226
  %234 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %235 = and i32 %234, -32
  %236 = or i32 %235, 21
  store i32 %236, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_3(i32 1)
  %237 = call i32 @ret5()
  %238 = icmp ne i32 %237, 0
  br i1 %238, label %239, label %240

; <label>:239                                     ; preds = %233
  call void @abort() #2
  unreachable

; <label>:240                                     ; preds = %233
  %241 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %242 = and i32 %241, -33
  %243 = or i32 %242, 32
  store i32 %243, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_3(i32 264151)
  %244 = call i32 @ret6()
  %245 = icmp ne i32 %244, 33554433
  br i1 %245, label %246, label %247

; <label>:246                                     ; preds = %240
  call void @abort() #2
  unreachable

; <label>:247                                     ; preds = %240
  %248 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %249 = and i32 %248, 63
  %250 = or i32 %249, -2147483648
  store i32 %250, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_3(i32 713)
  %251 = call i32 @ret7()
  %252 = icmp ne i32 %251, 26813
  br i1 %252, label %253, label %254

; <label>:253                                     ; preds = %247
  call void @abort() #2
  unreachable

; <label>:254                                     ; preds = %247
  %255 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %256 = and i32 %255, -65536
  %257 = or i32 %256, 26812
  store i32 %257, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_3(i32 17)
  %258 = call i32 @ret8()
  %259 = icmp ne i32 %258, 157
  br i1 %259, label %260, label %261

; <label>:260                                     ; preds = %254
  call void @abort() #2
  unreachable

; <label>:261                                     ; preds = %254
  %262 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %263 = and i32 %262, -16711681
  %264 = or i32 %263, 10223616
  store i32 %264, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_3(i32 199)
  %265 = call i32 @ret9()
  %266 = icmp ne i32 %265, 188
  br i1 %266, label %267, label %268

; <label>:267                                     ; preds = %261
  call void @abort() #2
  unreachable

; <label>:268                                     ; preds = %261
  %269 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %270 = and i32 %269, 16777215
  %271 = or i32 %270, -1157627904
  store i32 %271, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %272 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %273 = and i32 %272, -64
  %274 = or i32 %273, 51
  store i32 %274, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %275 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %276 = and i32 %275, -131009
  %277 = or i32 %276, 40704
  store i32 %277, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %278 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %279 = and i32 %278, 131071
  %280 = or i32 %279, -195297280
  store i32 %280, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %281 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %282 = and i32 %281, -32
  %283 = or i32 %282, 21
  store i32 %283, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %284 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %285 = and i32 %284, -33
  %286 = or i32 %285, 32
  store i32 %286, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %287 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %288 = and i32 %287, 63
  %289 = or i32 %288, -2147483648
  store i32 %289, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %290 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %291 = and i32 %290, -65536
  %292 = or i32 %291, 26812
  store i32 %292, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %293 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %294 = and i32 %293, -16711681
  %295 = or i32 %294, 10223616
  store i32 %295, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %296 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %297 = and i32 %296, 16777215
  %298 = or i32 %297, -1157627904
  store i32 %298, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_4(i32 3)
  %299 = call i32 @ret1()
  %300 = icmp ne i32 %299, 48
  br i1 %300, label %301, label %302

; <label>:301                                     ; preds = %268
  call void @abort() #2
  unreachable

; <label>:302                                     ; preds = %268
  %303 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %304 = and i32 %303, -64
  %305 = or i32 %304, 51
  store i32 %305, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_4(i32 251)
  %306 = call i32 @ret2()
  %307 = icmp ne i32 %306, 385
  br i1 %307, label %308, label %309

; <label>:308                                     ; preds = %302
  call void @abort() #2
  unreachable

; <label>:309                                     ; preds = %302
  %310 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %311 = and i32 %310, -131009
  %312 = or i32 %311, 40704
  store i32 %312, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_4(i32 13279)
  %313 = call i32 @ret3()
  %314 = icmp ne i32 %313, 17999
  br i1 %314, label %315, label %316

; <label>:315                                     ; preds = %309
  call void @abort() #2
  unreachable

; <label>:316                                     ; preds = %309
  %317 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %318 = and i32 %317, -131009
  %319 = or i32 %318, 35712
  store i32 %319, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_4(i32 24)
  %320 = call i32 @ret4()
  %321 = icmp ne i32 %320, 29
  br i1 %321, label %322, label %323

; <label>:322                                     ; preds = %316
  call void @abort() #2
  unreachable

; <label>:323                                     ; preds = %316
  %324 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %325 = and i32 %324, -32
  %326 = or i32 %325, 21
  store i32 %326, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_4(i32 1)
  %327 = call i32 @ret5()
  %328 = icmp ne i32 %327, 0
  br i1 %328, label %329, label %330

; <label>:329                                     ; preds = %323
  call void @abort() #2
  unreachable

; <label>:330                                     ; preds = %323
  %331 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %332 = and i32 %331, -33
  %333 = or i32 %332, 32
  store i32 %333, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_4(i32 264151)
  %334 = call i32 @ret6()
  %335 = icmp ne i32 %334, 33290281
  br i1 %335, label %336, label %337

; <label>:336                                     ; preds = %330
  call void @abort() #2
  unreachable

; <label>:337                                     ; preds = %330
  %338 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %339 = and i32 %338, 63
  %340 = or i32 %339, -2147483648
  store i32 %340, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_4(i32 713)
  %341 = call i32 @ret7()
  %342 = icmp ne i32 %341, 26099
  br i1 %342, label %343, label %344

; <label>:343                                     ; preds = %337
  call void @abort() #2
  unreachable

; <label>:344                                     ; preds = %337
  %345 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %346 = and i32 %345, -65536
  %347 = or i32 %346, 26812
  store i32 %347, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_4(i32 17)
  %348 = call i32 @ret8()
  %349 = icmp ne i32 %348, 139
  br i1 %349, label %350, label %351

; <label>:350                                     ; preds = %344
  call void @abort() #2
  unreachable

; <label>:351                                     ; preds = %344
  %352 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %353 = and i32 %352, -16711681
  %354 = or i32 %353, 10223616
  store i32 %354, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_4(i32 199)
  %355 = call i32 @ret9()
  %356 = icmp ne i32 %355, 244
  br i1 %356, label %357, label %358

; <label>:357                                     ; preds = %351
  call void @abort() #2
  unreachable

; <label>:358                                     ; preds = %351
  %359 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %360 = and i32 %359, 16777215
  %361 = or i32 %360, -1157627904
  store i32 %361, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %362 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %363 = and i32 %362, -64
  %364 = or i32 %363, 51
  store i32 %364, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %365 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %366 = and i32 %365, -131009
  %367 = or i32 %366, 40704
  store i32 %367, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %368 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %369 = and i32 %368, 131071
  %370 = or i32 %369, -195297280
  store i32 %370, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %371 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %372 = and i32 %371, -32
  %373 = or i32 %372, 21
  store i32 %373, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %374 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %375 = and i32 %374, -33
  %376 = or i32 %375, 32
  store i32 %376, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %377 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %378 = and i32 %377, 63
  %379 = or i32 %378, -2147483648
  store i32 %379, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %380 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %381 = and i32 %380, -65536
  %382 = or i32 %381, 26812
  store i32 %382, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %383 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %384 = and i32 %383, -16711681
  %385 = or i32 %384, 10223616
  store i32 %385, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %386 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %387 = and i32 %386, 16777215
  %388 = or i32 %387, -1157627904
  store i32 %388, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_5(i32 3)
  %389 = call i32 @ret1()
  %390 = icmp ne i32 %389, 50
  br i1 %390, label %391, label %392

; <label>:391                                     ; preds = %358
  call void @abort() #2
  unreachable

; <label>:392                                     ; preds = %358
  %393 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %394 = and i32 %393, -64
  %395 = or i32 %394, 51
  store i32 %395, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_5(i32 251)
  %396 = call i32 @ret2()
  %397 = icmp ne i32 %396, 635
  br i1 %397, label %398, label %399

; <label>:398                                     ; preds = %392
  call void @abort() #2
  unreachable

; <label>:399                                     ; preds = %392
  %400 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %401 = and i32 %400, -131009
  %402 = or i32 %401, 40704
  store i32 %402, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_5(i32 13279)
  %403 = call i32 @ret3()
  %404 = icmp ne i32 %403, 31277
  br i1 %404, label %405, label %406

; <label>:405                                     ; preds = %399
  call void @abort() #2
  unreachable

; <label>:406                                     ; preds = %399
  %407 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %408 = and i32 %407, -131009
  %409 = or i32 %408, 35712
  store i32 %409, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_5(i32 24)
  %410 = call i32 @ret4()
  %411 = icmp ne i32 %410, 20
  br i1 %411, label %412, label %413

; <label>:412                                     ; preds = %406
  call void @abort() #2
  unreachable

; <label>:413                                     ; preds = %406
  %414 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %415 = and i32 %414, -32
  %416 = or i32 %415, 21
  store i32 %416, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_5(i32 1)
  %417 = call i32 @ret5()
  %418 = icmp ne i32 %417, 0
  br i1 %418, label %419, label %420

; <label>:419                                     ; preds = %413
  call void @abort() #2
  unreachable

; <label>:420                                     ; preds = %413
  %421 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %422 = and i32 %421, -33
  %423 = or i32 %422, 32
  store i32 %423, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_5(i32 264151)
  %424 = call i32 @ret6()
  %425 = icmp ne i32 %424, 33554431
  br i1 %425, label %426, label %427

; <label>:426                                     ; preds = %420
  call void @abort() #2
  unreachable

; <label>:427                                     ; preds = %420
  %428 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %429 = and i32 %428, 63
  %430 = or i32 %429, -2147483648
  store i32 %430, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_5(i32 713)
  %431 = call i32 @ret7()
  %432 = icmp ne i32 %431, 26811
  br i1 %432, label %433, label %434

; <label>:433                                     ; preds = %427
  call void @abort() #2
  unreachable

; <label>:434                                     ; preds = %427
  %435 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %436 = and i32 %435, -65536
  %437 = or i32 %436, 26812
  store i32 %437, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_5(i32 17)
  %438 = call i32 @ret8()
  %439 = icmp ne i32 %438, 155
  br i1 %439, label %440, label %441

; <label>:440                                     ; preds = %434
  call void @abort() #2
  unreachable

; <label>:441                                     ; preds = %434
  %442 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %443 = and i32 %442, -16711681
  %444 = or i32 %443, 10223616
  store i32 %444, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_5(i32 199)
  %445 = call i32 @ret9()
  %446 = icmp ne i32 %445, 186
  br i1 %446, label %447, label %448

; <label>:447                                     ; preds = %441
  call void @abort() #2
  unreachable

; <label>:448                                     ; preds = %441
  %449 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %450 = and i32 %449, 16777215
  %451 = or i32 %450, -1157627904
  store i32 %451, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %452 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %453 = and i32 %452, -64
  %454 = or i32 %453, 51
  store i32 %454, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %455 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %456 = and i32 %455, -131009
  %457 = or i32 %456, 40704
  store i32 %457, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %458 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %459 = and i32 %458, 131071
  %460 = or i32 %459, -195297280
  store i32 %460, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %461 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %462 = and i32 %461, -32
  %463 = or i32 %462, 21
  store i32 %463, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %464 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %465 = and i32 %464, -33
  %466 = or i32 %465, 32
  store i32 %466, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %467 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %468 = and i32 %467, 63
  %469 = or i32 %468, -2147483648
  store i32 %469, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %470 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %471 = and i32 %470, -65536
  %472 = or i32 %471, 26812
  store i32 %472, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %473 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %474 = and i32 %473, -16711681
  %475 = or i32 %474, 10223616
  store i32 %475, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %476 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %477 = and i32 %476, 16777215
  %478 = or i32 %477, -1157627904
  store i32 %478, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_6(i32 3)
  %479 = call i32 @ret1()
  %480 = icmp ne i32 %479, 50
  br i1 %480, label %481, label %482

; <label>:481                                     ; preds = %448
  call void @abort() #2
  unreachable

; <label>:482                                     ; preds = %448
  %483 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %484 = and i32 %483, -64
  %485 = or i32 %484, 51
  store i32 %485, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_6(i32 251)
  %486 = call i32 @ret2()
  %487 = icmp ne i32 %486, 635
  br i1 %487, label %488, label %489

; <label>:488                                     ; preds = %482
  call void @abort() #2
  unreachable

; <label>:489                                     ; preds = %482
  %490 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %491 = and i32 %490, -131009
  %492 = or i32 %491, 40704
  store i32 %492, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_6(i32 13279)
  %493 = call i32 @ret3()
  %494 = icmp ne i32 %493, 31277
  br i1 %494, label %495, label %496

; <label>:495                                     ; preds = %489
  call void @abort() #2
  unreachable

; <label>:496                                     ; preds = %489
  %497 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %498 = and i32 %497, -131009
  %499 = or i32 %498, 35712
  store i32 %499, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_6(i32 24)
  %500 = call i32 @ret4()
  %501 = icmp ne i32 %500, 20
  br i1 %501, label %502, label %503

; <label>:502                                     ; preds = %496
  call void @abort() #2
  unreachable

; <label>:503                                     ; preds = %496
  %504 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %505 = and i32 %504, -32
  %506 = or i32 %505, 21
  store i32 %506, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_6(i32 1)
  %507 = call i32 @ret5()
  %508 = icmp ne i32 %507, 0
  br i1 %508, label %509, label %510

; <label>:509                                     ; preds = %503
  call void @abort() #2
  unreachable

; <label>:510                                     ; preds = %503
  %511 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %512 = and i32 %511, -33
  %513 = or i32 %512, 32
  store i32 %513, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_6(i32 264151)
  %514 = call i32 @ret6()
  %515 = icmp ne i32 %514, 33554431
  br i1 %515, label %516, label %517

; <label>:516                                     ; preds = %510
  call void @abort() #2
  unreachable

; <label>:517                                     ; preds = %510
  %518 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %519 = and i32 %518, 63
  %520 = or i32 %519, -2147483648
  store i32 %520, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_6(i32 713)
  %521 = call i32 @ret7()
  %522 = icmp ne i32 %521, 26811
  br i1 %522, label %523, label %524

; <label>:523                                     ; preds = %517
  call void @abort() #2
  unreachable

; <label>:524                                     ; preds = %517
  %525 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %526 = and i32 %525, -65536
  %527 = or i32 %526, 26812
  store i32 %527, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_6(i32 17)
  %528 = call i32 @ret8()
  %529 = icmp ne i32 %528, 155
  br i1 %529, label %530, label %531

; <label>:530                                     ; preds = %524
  call void @abort() #2
  unreachable

; <label>:531                                     ; preds = %524
  %532 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %533 = and i32 %532, -16711681
  %534 = or i32 %533, 10223616
  store i32 %534, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_6(i32 199)
  %535 = call i32 @ret9()
  %536 = icmp ne i32 %535, 186
  br i1 %536, label %537, label %538

; <label>:537                                     ; preds = %531
  call void @abort() #2
  unreachable

; <label>:538                                     ; preds = %531
  %539 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %540 = and i32 %539, 16777215
  %541 = or i32 %540, -1157627904
  store i32 %541, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %542 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %543 = and i32 %542, -64
  %544 = or i32 %543, 51
  store i32 %544, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %545 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %546 = and i32 %545, -131009
  %547 = or i32 %546, 40704
  store i32 %547, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %548 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %549 = and i32 %548, 131071
  %550 = or i32 %549, -195297280
  store i32 %550, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %551 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %552 = and i32 %551, -32
  %553 = or i32 %552, 21
  store i32 %553, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %554 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %555 = and i32 %554, -33
  %556 = or i32 %555, 32
  store i32 %556, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %557 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %558 = and i32 %557, 63
  %559 = or i32 %558, -2147483648
  store i32 %559, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %560 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %561 = and i32 %560, -65536
  %562 = or i32 %561, 26812
  store i32 %562, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %563 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %564 = and i32 %563, -16711681
  %565 = or i32 %564, 10223616
  store i32 %565, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %566 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %567 = and i32 %566, 16777215
  %568 = or i32 %567, -1157627904
  store i32 %568, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_7(i32 3)
  %569 = call i32 @ret1()
  %570 = icmp ne i32 %569, 3
  br i1 %570, label %571, label %572

; <label>:571                                     ; preds = %538
  call void @abort() #2
  unreachable

; <label>:572                                     ; preds = %538
  %573 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %574 = and i32 %573, -64
  %575 = or i32 %574, 51
  store i32 %575, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_7(i32 251)
  %576 = call i32 @ret2()
  %577 = icmp ne i32 %576, 120
  br i1 %577, label %578, label %579

; <label>:578                                     ; preds = %572
  call void @abort() #2
  unreachable

; <label>:579                                     ; preds = %572
  %580 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %581 = and i32 %580, -131009
  %582 = or i32 %581, 40704
  store i32 %582, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_7(i32 13279)
  %583 = call i32 @ret3()
  %584 = icmp ne i32 %583, 12814
  br i1 %584, label %585, label %586

; <label>:585                                     ; preds = %579
  call void @abort() #2
  unreachable

; <label>:586                                     ; preds = %579
  %587 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %588 = and i32 %587, -131009
  %589 = or i32 %588, 35712
  store i32 %589, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_7(i32 24)
  %590 = call i32 @ret4()
  %591 = icmp ne i32 %590, 16
  br i1 %591, label %592, label %593

; <label>:592                                     ; preds = %586
  call void @abort() #2
  unreachable

; <label>:593                                     ; preds = %586
  %594 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %595 = and i32 %594, -32
  %596 = or i32 %595, 21
  store i32 %596, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_7(i32 1)
  %597 = call i32 @ret5()
  %598 = icmp ne i32 %597, 1
  br i1 %598, label %599, label %600

; <label>:599                                     ; preds = %593
  call void @abort() #2
  unreachable

; <label>:600                                     ; preds = %593
  %601 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %602 = and i32 %601, -33
  %603 = or i32 %602, 32
  store i32 %603, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_7(i32 264151)
  %604 = call i32 @ret6()
  %605 = icmp ne i32 %604, 0
  br i1 %605, label %606, label %607

; <label>:606                                     ; preds = %600
  call void @abort() #2
  unreachable

; <label>:607                                     ; preds = %600
  %608 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %609 = and i32 %608, 63
  %610 = or i32 %609, -2147483648
  store i32 %610, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_7(i32 713)
  %611 = call i32 @ret7()
  %612 = icmp ne i32 %611, 136
  br i1 %612, label %613, label %614

; <label>:613                                     ; preds = %607
  call void @abort() #2
  unreachable

; <label>:614                                     ; preds = %607
  %615 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %616 = and i32 %615, -65536
  %617 = or i32 %616, 26812
  store i32 %617, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_7(i32 17)
  %618 = call i32 @ret8()
  %619 = icmp ne i32 %618, 16
  br i1 %619, label %620, label %621

; <label>:620                                     ; preds = %614
  call void @abort() #2
  unreachable

; <label>:621                                     ; preds = %614
  %622 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %623 = and i32 %622, -16711681
  %624 = or i32 %623, 10223616
  store i32 %624, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_7(i32 199)
  %625 = call i32 @ret9()
  %626 = icmp ne i32 %625, 131
  br i1 %626, label %627, label %628

; <label>:627                                     ; preds = %621
  call void @abort() #2
  unreachable

; <label>:628                                     ; preds = %621
  %629 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %630 = and i32 %629, 16777215
  %631 = or i32 %630, -1157627904
  store i32 %631, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %632 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %633 = and i32 %632, -64
  %634 = or i32 %633, 51
  store i32 %634, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %635 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %636 = and i32 %635, -131009
  %637 = or i32 %636, 40704
  store i32 %637, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %638 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %639 = and i32 %638, 131071
  %640 = or i32 %639, -195297280
  store i32 %640, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %641 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %642 = and i32 %641, -32
  %643 = or i32 %642, 21
  store i32 %643, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %644 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %645 = and i32 %644, -33
  %646 = or i32 %645, 32
  store i32 %646, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %647 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %648 = and i32 %647, 63
  %649 = or i32 %648, -2147483648
  store i32 %649, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %650 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %651 = and i32 %650, -65536
  %652 = or i32 %651, 26812
  store i32 %652, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %653 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %654 = and i32 %653, -16711681
  %655 = or i32 %654, 10223616
  store i32 %655, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %656 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %657 = and i32 %656, 16777215
  %658 = or i32 %657, -1157627904
  store i32 %658, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_8(i32 3)
  %659 = call i32 @ret1()
  %660 = icmp ne i32 %659, 51
  br i1 %660, label %661, label %662

; <label>:661                                     ; preds = %628
  call void @abort() #2
  unreachable

; <label>:662                                     ; preds = %628
  %663 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %664 = and i32 %663, -64
  %665 = or i32 %664, 51
  store i32 %665, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_8(i32 251)
  %666 = call i32 @ret2()
  %667 = icmp ne i32 %666, 767
  br i1 %667, label %668, label %669

; <label>:668                                     ; preds = %662
  call void @abort() #2
  unreachable

; <label>:669                                     ; preds = %662
  %670 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %671 = and i32 %670, -131009
  %672 = or i32 %671, 40704
  store i32 %672, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_8(i32 13279)
  %673 = call i32 @ret3()
  %674 = icmp ne i32 %673, 31743
  br i1 %674, label %675, label %676

; <label>:675                                     ; preds = %669
  call void @abort() #2
  unreachable

; <label>:676                                     ; preds = %669
  %677 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %678 = and i32 %677, -131009
  %679 = or i32 %678, 35712
  store i32 %679, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_8(i32 24)
  %680 = call i32 @ret4()
  %681 = icmp ne i32 %680, 29
  br i1 %681, label %682, label %683

; <label>:682                                     ; preds = %676
  call void @abort() #2
  unreachable

; <label>:683                                     ; preds = %676
  %684 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %685 = and i32 %684, -32
  %686 = or i32 %685, 21
  store i32 %686, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_8(i32 1)
  %687 = call i32 @ret5()
  %688 = icmp ne i32 %687, 1
  br i1 %688, label %689, label %690

; <label>:689                                     ; preds = %683
  call void @abort() #2
  unreachable

; <label>:690                                     ; preds = %683
  %691 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %692 = and i32 %691, -33
  %693 = or i32 %692, 32
  store i32 %693, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_8(i32 264151)
  %694 = call i32 @ret6()
  %695 = icmp ne i32 %694, 33818583
  br i1 %695, label %696, label %697

; <label>:696                                     ; preds = %690
  call void @abort() #2
  unreachable

; <label>:697                                     ; preds = %690
  %698 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %699 = and i32 %698, 63
  %700 = or i32 %699, -2147483648
  store i32 %700, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_8(i32 713)
  %701 = call i32 @ret7()
  %702 = icmp ne i32 %701, 27389
  br i1 %702, label %703, label %704

; <label>:703                                     ; preds = %697
  call void @abort() #2
  unreachable

; <label>:704                                     ; preds = %697
  %705 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %706 = and i32 %705, -65536
  %707 = or i32 %706, 26812
  store i32 %707, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_8(i32 17)
  %708 = call i32 @ret8()
  %709 = icmp ne i32 %708, 157
  br i1 %709, label %710, label %711

; <label>:710                                     ; preds = %704
  call void @abort() #2
  unreachable

; <label>:711                                     ; preds = %704
  %712 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %713 = and i32 %712, -16711681
  %714 = or i32 %713, 10223616
  store i32 %714, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_8(i32 199)
  %715 = call i32 @ret9()
  %716 = icmp ne i32 %715, 255
  br i1 %716, label %717, label %718

; <label>:717                                     ; preds = %711
  call void @abort() #2
  unreachable

; <label>:718                                     ; preds = %711
  %719 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %720 = and i32 %719, 16777215
  %721 = or i32 %720, -1157627904
  store i32 %721, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %722 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %723 = and i32 %722, -64
  %724 = or i32 %723, 51
  store i32 %724, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %725 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %726 = and i32 %725, -131009
  %727 = or i32 %726, 40704
  store i32 %727, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %728 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %729 = and i32 %728, 131071
  %730 = or i32 %729, -195297280
  store i32 %730, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %731 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %732 = and i32 %731, -32
  %733 = or i32 %732, 21
  store i32 %733, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %734 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %735 = and i32 %734, -33
  %736 = or i32 %735, 32
  store i32 %736, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %737 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %738 = and i32 %737, 63
  %739 = or i32 %738, -2147483648
  store i32 %739, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %740 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %741 = and i32 %740, -65536
  %742 = or i32 %741, 26812
  store i32 %742, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %743 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %744 = and i32 %743, -16711681
  %745 = or i32 %744, 10223616
  store i32 %745, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %746 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %747 = and i32 %746, 16777215
  %748 = or i32 %747, -1157627904
  store i32 %748, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_9(i32 3)
  %749 = call i32 @ret1()
  %750 = icmp ne i32 %749, 48
  br i1 %750, label %751, label %752

; <label>:751                                     ; preds = %718
  call void @abort() #2
  unreachable

; <label>:752                                     ; preds = %718
  %753 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %754 = and i32 %753, -64
  %755 = or i32 %754, 51
  store i32 %755, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_9(i32 251)
  %756 = call i32 @ret2()
  %757 = icmp ne i32 %756, 647
  br i1 %757, label %758, label %759

; <label>:758                                     ; preds = %752
  call void @abort() #2
  unreachable

; <label>:759                                     ; preds = %752
  %760 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %761 = and i32 %760, -131009
  %762 = or i32 %761, 40704
  store i32 %762, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_9(i32 13279)
  %763 = call i32 @ret3()
  %764 = icmp ne i32 %763, 18929
  br i1 %764, label %765, label %766

; <label>:765                                     ; preds = %759
  call void @abort() #2
  unreachable

; <label>:766                                     ; preds = %759
  %767 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %768 = and i32 %767, -131009
  %769 = or i32 %768, 35712
  store i32 %769, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_9(i32 24)
  %770 = call i32 @ret4()
  %771 = icmp ne i32 %770, 13
  br i1 %771, label %772, label %773

; <label>:772                                     ; preds = %766
  call void @abort() #2
  unreachable

; <label>:773                                     ; preds = %766
  %774 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %775 = and i32 %774, -32
  %776 = or i32 %775, 21
  store i32 %776, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_9(i32 1)
  %777 = call i32 @ret5()
  %778 = icmp ne i32 %777, 0
  br i1 %778, label %779, label %780

; <label>:779                                     ; preds = %773
  call void @abort() #2
  unreachable

; <label>:780                                     ; preds = %773
  %781 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %782 = and i32 %781, -33
  %783 = or i32 %782, 32
  store i32 %783, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_9(i32 264151)
  %784 = call i32 @ret6()
  %785 = icmp ne i32 %784, 33818583
  br i1 %785, label %786, label %787

; <label>:786                                     ; preds = %780
  call void @abort() #2
  unreachable

; <label>:787                                     ; preds = %780
  %788 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %789 = and i32 %788, 63
  %790 = or i32 %789, -2147483648
  store i32 %790, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_9(i32 713)
  %791 = call i32 @ret7()
  %792 = icmp ne i32 %791, 27253
  br i1 %792, label %793, label %794

; <label>:793                                     ; preds = %787
  call void @abort() #2
  unreachable

; <label>:794                                     ; preds = %787
  %795 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %796 = and i32 %795, -65536
  %797 = or i32 %796, 26812
  store i32 %797, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_9(i32 17)
  %798 = call i32 @ret8()
  %799 = icmp ne i32 %798, 141
  br i1 %799, label %800, label %801

; <label>:800                                     ; preds = %794
  call void @abort() #2
  unreachable

; <label>:801                                     ; preds = %794
  %802 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %803 = and i32 %802, -16711681
  %804 = or i32 %803, 10223616
  store i32 %804, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_9(i32 199)
  %805 = call i32 @ret9()
  %806 = icmp ne i32 %805, 124
  br i1 %806, label %807, label %808

; <label>:807                                     ; preds = %801
  call void @abort() #2
  unreachable

; <label>:808                                     ; preds = %801
  %809 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %810 = and i32 %809, 16777215
  %811 = or i32 %810, -1157627904
  store i32 %811, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %812 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %813 = and i32 %812, -64
  %814 = or i32 %813, 51
  store i32 %814, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %815 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %816 = and i32 %815, -131009
  %817 = or i32 %816, 40704
  store i32 %817, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %818 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %819 = and i32 %818, 131071
  %820 = or i32 %819, -195297280
  store i32 %820, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %821 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %822 = and i32 %821, -32
  %823 = or i32 %822, 21
  store i32 %823, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %824 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %825 = and i32 %824, -33
  %826 = or i32 %825, 32
  store i32 %826, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %827 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %828 = and i32 %827, 63
  %829 = or i32 %828, -2147483648
  store i32 %829, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %830 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %831 = and i32 %830, -65536
  %832 = or i32 %831, 26812
  store i32 %832, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %833 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %834 = and i32 %833, -16711681
  %835 = or i32 %834, 10223616
  store i32 %835, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %836 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %837 = and i32 %836, 16777215
  %838 = or i32 %837, -1157627904
  store i32 %838, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_a(i32 3)
  %839 = call i32 @ret1()
  %840 = icmp ne i32 %839, 17
  br i1 %840, label %841, label %842

; <label>:841                                     ; preds = %808
  call void @abort() #2
  unreachable

; <label>:842                                     ; preds = %808
  %843 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %844 = and i32 %843, -64
  %845 = or i32 %844, 51
  store i32 %845, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_a(i32 251)
  %846 = call i32 @ret2()
  %847 = icmp ne i32 %846, 2
  br i1 %847, label %848, label %849

; <label>:848                                     ; preds = %842
  call void @abort() #2
  unreachable

; <label>:849                                     ; preds = %842
  %850 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %851 = and i32 %850, -131009
  %852 = or i32 %851, 40704
  store i32 %852, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_a(i32 13279)
  %853 = call i32 @ret3()
  %854 = icmp ne i32 %853, 2
  br i1 %854, label %855, label %856

; <label>:855                                     ; preds = %849
  call void @abort() #2
  unreachable

; <label>:856                                     ; preds = %849
  %857 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %858 = and i32 %857, -131009
  %859 = or i32 %858, 35712
  store i32 %859, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_a(i32 24)
  %860 = call i32 @ret4()
  %861 = icmp ne i32 %860, 0
  br i1 %861, label %862, label %863

; <label>:862                                     ; preds = %856
  call void @abort() #2
  unreachable

; <label>:863                                     ; preds = %856
  %864 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %865 = and i32 %864, -32
  %866 = or i32 %865, 21
  store i32 %866, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_a(i32 1)
  %867 = call i32 @ret5()
  %868 = icmp ne i32 %867, 1
  br i1 %868, label %869, label %870

; <label>:869                                     ; preds = %863
  call void @abort() #2
  unreachable

; <label>:870                                     ; preds = %863
  %871 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %872 = and i32 %871, -33
  %873 = or i32 %872, 32
  store i32 %873, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_a(i32 264151)
  %874 = call i32 @ret6()
  %875 = icmp ne i32 %874, 127
  br i1 %875, label %876, label %877

; <label>:876                                     ; preds = %870
  call void @abort() #2
  unreachable

; <label>:877                                     ; preds = %870
  %878 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %879 = and i32 %878, 63
  %880 = or i32 %879, -2147483648
  store i32 %880, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_a(i32 713)
  %881 = call i32 @ret7()
  %882 = icmp ne i32 %881, 37
  br i1 %882, label %883, label %884

; <label>:883                                     ; preds = %877
  call void @abort() #2
  unreachable

; <label>:884                                     ; preds = %877
  %885 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %886 = and i32 %885, -65536
  %887 = or i32 %886, 26812
  store i32 %887, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_a(i32 17)
  %888 = call i32 @ret8()
  %889 = icmp ne i32 %888, 9
  br i1 %889, label %890, label %891

; <label>:890                                     ; preds = %884
  call void @abort() #2
  unreachable

; <label>:891                                     ; preds = %884
  %892 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %893 = and i32 %892, -16711681
  %894 = or i32 %893, 10223616
  store i32 %894, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_a(i32 199)
  %895 = call i32 @ret9()
  %896 = icmp ne i32 %895, 0
  br i1 %896, label %897, label %898

; <label>:897                                     ; preds = %891
  call void @abort() #2
  unreachable

; <label>:898                                     ; preds = %891
  %899 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %900 = and i32 %899, 16777215
  %901 = or i32 %900, -1157627904
  store i32 %901, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %902 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %903 = and i32 %902, -64
  %904 = or i32 %903, 51
  store i32 %904, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %905 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %906 = and i32 %905, -131009
  %907 = or i32 %906, 40704
  store i32 %907, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %908 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %909 = and i32 %908, 131071
  %910 = or i32 %909, -195297280
  store i32 %910, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %911 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %912 = and i32 %911, -32
  %913 = or i32 %912, 21
  store i32 %913, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %914 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %915 = and i32 %914, -33
  %916 = or i32 %915, 32
  store i32 %916, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %917 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %918 = and i32 %917, 63
  %919 = or i32 %918, -2147483648
  store i32 %919, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %920 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %921 = and i32 %920, -65536
  %922 = or i32 %921, 26812
  store i32 %922, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %923 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %924 = and i32 %923, -16711681
  %925 = or i32 %924, 10223616
  store i32 %925, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %926 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %927 = and i32 %926, 16777215
  %928 = or i32 %927, -1157627904
  store i32 %928, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_b(i32 3)
  %929 = call i32 @ret1()
  %930 = icmp ne i32 %929, 0
  br i1 %930, label %931, label %932

; <label>:931                                     ; preds = %898
  call void @abort() #2
  unreachable

; <label>:932                                     ; preds = %898
  %933 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %934 = and i32 %933, -64
  %935 = or i32 %934, 51
  store i32 %935, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_b(i32 251)
  %936 = call i32 @ret2()
  %937 = icmp ne i32 %936, 134
  br i1 %937, label %938, label %939

; <label>:938                                     ; preds = %932
  call void @abort() #2
  unreachable

; <label>:939                                     ; preds = %932
  %940 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %941 = and i32 %940, -131009
  %942 = or i32 %941, 40704
  store i32 %942, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_b(i32 13279)
  %943 = call i32 @ret3()
  %944 = icmp ne i32 %943, 4720
  br i1 %944, label %945, label %946

; <label>:945                                     ; preds = %939
  call void @abort() #2
  unreachable

; <label>:946                                     ; preds = %939
  %947 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %948 = and i32 %947, -131009
  %949 = or i32 %948, 35712
  store i32 %949, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_b(i32 24)
  %950 = call i32 @ret4()
  %951 = icmp ne i32 %950, 21
  br i1 %951, label %952, label %953

; <label>:952                                     ; preds = %946
  call void @abort() #2
  unreachable

; <label>:953                                     ; preds = %946
  %954 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %955 = and i32 %954, -32
  %956 = or i32 %955, 21
  store i32 %956, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_b(i32 1)
  %957 = call i32 @ret5()
  %958 = icmp ne i32 %957, 0
  br i1 %958, label %959, label %960

; <label>:959                                     ; preds = %953
  call void @abort() #2
  unreachable

; <label>:960                                     ; preds = %953
  %961 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %962 = and i32 %961, -33
  %963 = or i32 %962, 32
  store i32 %963, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_b(i32 264151)
  %964 = call i32 @ret6()
  %965 = icmp ne i32 %964, 7255
  br i1 %965, label %966, label %967

; <label>:966                                     ; preds = %960
  call void @abort() #2
  unreachable

; <label>:967                                     ; preds = %960
  %968 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %969 = and i32 %968, 63
  %970 = or i32 %969, -2147483648
  store i32 %970, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_b(i32 713)
  %971 = call i32 @ret7()
  %972 = icmp ne i32 %971, 431
  br i1 %972, label %973, label %974

; <label>:973                                     ; preds = %967
  call void @abort() #2
  unreachable

; <label>:974                                     ; preds = %967
  %975 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %976 = and i32 %975, -65536
  %977 = or i32 %976, 26812
  store i32 %977, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_b(i32 17)
  %978 = call i32 @ret8()
  %979 = icmp ne i32 %978, 3
  br i1 %979, label %980, label %981

; <label>:980                                     ; preds = %974
  call void @abort() #2
  unreachable

; <label>:981                                     ; preds = %974
  %982 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %983 = and i32 %982, -16711681
  %984 = or i32 %983, 10223616
  store i32 %984, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_b(i32 199)
  %985 = call i32 @ret9()
  %986 = icmp ne i32 %985, 187
  br i1 %986, label %987, label %988

; <label>:987                                     ; preds = %981
  call void @abort() #2
  unreachable

; <label>:988                                     ; preds = %981
  %989 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %990 = and i32 %989, 16777215
  %991 = or i32 %990, -1157627904
  store i32 %991, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %992 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %993 = and i32 %992, -64
  %994 = or i32 %993, 51
  store i32 %994, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %995 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %996 = and i32 %995, -131009
  %997 = or i32 %996, 40704
  store i32 %997, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %998 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %999 = and i32 %998, 131071
  %1000 = or i32 %999, -195297280
  store i32 %1000, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1001 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1002 = and i32 %1001, -32
  %1003 = or i32 %1002, 21
  store i32 %1003, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1004 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1005 = and i32 %1004, -33
  %1006 = or i32 %1005, 32
  store i32 %1006, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1007 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1008 = and i32 %1007, 63
  %1009 = or i32 %1008, -2147483648
  store i32 %1009, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1010 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1011 = and i32 %1010, -65536
  %1012 = or i32 %1011, 26812
  store i32 %1012, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1013 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1014 = and i32 %1013, -16711681
  %1015 = or i32 %1014, 10223616
  store i32 %1015, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1016 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1017 = and i32 %1016, 16777215
  %1018 = or i32 %1017, -1157627904
  store i32 %1018, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_c(i32 3)
  %1019 = call i32 @ret1()
  %1020 = icmp ne i32 %1019, 54
  br i1 %1020, label %1021, label %1022

; <label>:1021                                    ; preds = %988
  call void @abort() #2
  unreachable

; <label>:1022                                    ; preds = %988
  %1023 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1024 = and i32 %1023, -64
  %1025 = or i32 %1024, 51
  store i32 %1025, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_c(i32 251)
  %1026 = call i32 @ret2()
  %1027 = icmp ne i32 %1026, 639
  br i1 %1027, label %1028, label %1029

; <label>:1028                                    ; preds = %1022
  call void @abort() #2
  unreachable

; <label>:1029                                    ; preds = %1022
  %1030 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1031 = and i32 %1030, -131009
  %1032 = or i32 %1031, 40704
  store i32 %1032, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_c(i32 13279)
  %1033 = call i32 @ret3()
  %1034 = icmp ne i32 %1033, 31281
  br i1 %1034, label %1035, label %1036

; <label>:1035                                    ; preds = %1029
  call void @abort() #2
  unreachable

; <label>:1036                                    ; preds = %1029
  %1037 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1038 = and i32 %1037, -131009
  %1039 = or i32 %1038, 35712
  store i32 %1039, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_c(i32 24)
  %1040 = call i32 @ret4()
  %1041 = icmp ne i32 %1040, 24
  br i1 %1041, label %1042, label %1043

; <label>:1042                                    ; preds = %1036
  call void @abort() #2
  unreachable

; <label>:1043                                    ; preds = %1036
  %1044 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1045 = and i32 %1044, -32
  %1046 = or i32 %1045, 21
  store i32 %1046, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_c(i32 1)
  %1047 = call i32 @ret5()
  %1048 = icmp ne i32 %1047, 0
  br i1 %1048, label %1049, label %1050

; <label>:1049                                    ; preds = %1043
  call void @abort() #2
  unreachable

; <label>:1050                                    ; preds = %1043
  %1051 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1052 = and i32 %1051, -33
  %1053 = or i32 %1052, 32
  store i32 %1053, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_c(i32 264151)
  %1054 = call i32 @ret6()
  %1055 = icmp ne i32 %1054, 33554435
  br i1 %1055, label %1056, label %1057

; <label>:1056                                    ; preds = %1050
  call void @abort() #2
  unreachable

; <label>:1057                                    ; preds = %1050
  %1058 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1059 = and i32 %1058, 63
  %1060 = or i32 %1059, -2147483648
  store i32 %1060, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_c(i32 713)
  %1061 = call i32 @ret7()
  %1062 = icmp ne i32 %1061, 26815
  br i1 %1062, label %1063, label %1064

; <label>:1063                                    ; preds = %1057
  call void @abort() #2
  unreachable

; <label>:1064                                    ; preds = %1057
  %1065 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1066 = and i32 %1065, -65536
  %1067 = or i32 %1066, 26812
  store i32 %1067, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_c(i32 17)
  %1068 = call i32 @ret8()
  %1069 = icmp ne i32 %1068, 159
  br i1 %1069, label %1070, label %1071

; <label>:1070                                    ; preds = %1064
  call void @abort() #2
  unreachable

; <label>:1071                                    ; preds = %1064
  %1072 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1073 = and i32 %1072, -16711681
  %1074 = or i32 %1073, 10223616
  store i32 %1074, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_c(i32 199)
  %1075 = call i32 @ret9()
  %1076 = icmp ne i32 %1075, 190
  br i1 %1076, label %1077, label %1078

; <label>:1077                                    ; preds = %1071
  call void @abort() #2
  unreachable

; <label>:1078                                    ; preds = %1071
  %1079 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1080 = and i32 %1079, 16777215
  %1081 = or i32 %1080, -1157627904
  store i32 %1081, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1082 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1083 = and i32 %1082, -64
  %1084 = or i32 %1083, 51
  store i32 %1084, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1085 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1086 = and i32 %1085, -131009
  %1087 = or i32 %1086, 40704
  store i32 %1087, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1088 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1089 = and i32 %1088, 131071
  %1090 = or i32 %1089, -195297280
  store i32 %1090, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1091 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1092 = and i32 %1091, -32
  %1093 = or i32 %1092, 21
  store i32 %1093, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1094 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1095 = and i32 %1094, -33
  %1096 = or i32 %1095, 32
  store i32 %1096, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1097 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1098 = and i32 %1097, 63
  %1099 = or i32 %1098, -2147483648
  store i32 %1099, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1100 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1101 = and i32 %1100, -65536
  %1102 = or i32 %1101, 26812
  store i32 %1102, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1103 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1104 = and i32 %1103, -16711681
  %1105 = or i32 %1104, 10223616
  store i32 %1105, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1106 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1107 = and i32 %1106, 16777215
  %1108 = or i32 %1107, -1157627904
  store i32 %1108, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_d(i32 3)
  %1109 = call i32 @ret1()
  %1110 = icmp ne i32 %1109, 44
  br i1 %1110, label %1111, label %1112

; <label>:1111                                    ; preds = %1078
  call void @abort() #2
  unreachable

; <label>:1112                                    ; preds = %1078
  %1113 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1114 = and i32 %1113, -64
  %1115 = or i32 %1114, 51
  store i32 %1115, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_d(i32 251)
  %1116 = call i32 @ret2()
  %1117 = icmp ne i32 %1116, 629
  br i1 %1117, label %1118, label %1119

; <label>:1118                                    ; preds = %1112
  call void @abort() #2
  unreachable

; <label>:1119                                    ; preds = %1112
  %1120 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1121 = and i32 %1120, -131009
  %1122 = or i32 %1121, 40704
  store i32 %1122, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_d(i32 13279)
  %1123 = call i32 @ret3()
  %1124 = icmp ne i32 %1123, 31271
  br i1 %1124, label %1125, label %1126

; <label>:1125                                    ; preds = %1119
  call void @abort() #2
  unreachable

; <label>:1126                                    ; preds = %1119
  %1127 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1128 = and i32 %1127, -131009
  %1129 = or i32 %1128, 35712
  store i32 %1129, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_d(i32 24)
  %1130 = call i32 @ret4()
  %1131 = icmp ne i32 %1130, 14
  br i1 %1131, label %1132, label %1133

; <label>:1132                                    ; preds = %1126
  call void @abort() #2
  unreachable

; <label>:1133                                    ; preds = %1126
  %1134 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1135 = and i32 %1134, -32
  %1136 = or i32 %1135, 21
  store i32 %1136, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_d(i32 1)
  %1137 = call i32 @ret5()
  %1138 = icmp ne i32 %1137, 0
  br i1 %1138, label %1139, label %1140

; <label>:1139                                    ; preds = %1133
  call void @abort() #2
  unreachable

; <label>:1140                                    ; preds = %1133
  %1141 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1142 = and i32 %1141, -33
  %1143 = or i32 %1142, 32
  store i32 %1143, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_d(i32 264151)
  %1144 = call i32 @ret6()
  %1145 = icmp ne i32 %1144, 33554425
  br i1 %1145, label %1146, label %1147

; <label>:1146                                    ; preds = %1140
  call void @abort() #2
  unreachable

; <label>:1147                                    ; preds = %1140
  %1148 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1149 = and i32 %1148, 63
  %1150 = or i32 %1149, -2147483648
  store i32 %1150, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_d(i32 713)
  %1151 = call i32 @ret7()
  %1152 = icmp ne i32 %1151, 26805
  br i1 %1152, label %1153, label %1154

; <label>:1153                                    ; preds = %1147
  call void @abort() #2
  unreachable

; <label>:1154                                    ; preds = %1147
  %1155 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1156 = and i32 %1155, -65536
  %1157 = or i32 %1156, 26812
  store i32 %1157, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_d(i32 17)
  %1158 = call i32 @ret8()
  %1159 = icmp ne i32 %1158, 149
  br i1 %1159, label %1160, label %1161

; <label>:1160                                    ; preds = %1154
  call void @abort() #2
  unreachable

; <label>:1161                                    ; preds = %1154
  %1162 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1163 = and i32 %1162, -16711681
  %1164 = or i32 %1163, 10223616
  store i32 %1164, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_d(i32 199)
  %1165 = call i32 @ret9()
  %1166 = icmp ne i32 %1165, 180
  br i1 %1166, label %1167, label %1168

; <label>:1167                                    ; preds = %1161
  call void @abort() #2
  unreachable

; <label>:1168                                    ; preds = %1161
  %1169 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1170 = and i32 %1169, 16777215
  %1171 = or i32 %1170, -1157627904
  store i32 %1171, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1172 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1173 = and i32 %1172, -64
  %1174 = or i32 %1173, 51
  store i32 %1174, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1175 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1176 = and i32 %1175, -131009
  %1177 = or i32 %1176, 40704
  store i32 %1177, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1178 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1179 = and i32 %1178, 131071
  %1180 = or i32 %1179, -195297280
  store i32 %1180, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1181 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1182 = and i32 %1181, -32
  %1183 = or i32 %1182, 21
  store i32 %1183, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1184 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1185 = and i32 %1184, -33
  %1186 = or i32 %1185, 32
  store i32 %1186, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1187 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1188 = and i32 %1187, 63
  %1189 = or i32 %1188, -2147483648
  store i32 %1189, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1190 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1191 = and i32 %1190, -65536
  %1192 = or i32 %1191, 26812
  store i32 %1192, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1193 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1194 = and i32 %1193, -16711681
  %1195 = or i32 %1194, 10223616
  store i32 %1195, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1196 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1197 = and i32 %1196, 16777215
  %1198 = or i32 %1197, -1157627904
  store i32 %1198, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_e(i32 3)
  %1199 = call i32 @ret1()
  %1200 = icmp ne i32 %1199, 17
  br i1 %1200, label %1201, label %1202

; <label>:1201                                    ; preds = %1168
  call void @abort() #2
  unreachable

; <label>:1202                                    ; preds = %1168
  %1203 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1204 = and i32 %1203, -64
  %1205 = or i32 %1204, 51
  store i32 %1205, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_e(i32 251)
  %1206 = call i32 @ret2()
  %1207 = icmp ne i32 %1206, 20
  br i1 %1207, label %1208, label %1209

; <label>:1208                                    ; preds = %1202
  call void @abort() #2
  unreachable

; <label>:1209                                    ; preds = %1202
  %1210 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1211 = and i32 %1210, -131009
  %1212 = or i32 %1211, 40704
  store i32 %1212, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_e(i32 13279)
  %1213 = call i32 @ret3()
  %1214 = icmp ne i32 %1213, 4
  br i1 %1214, label %1215, label %1216

; <label>:1215                                    ; preds = %1209
  call void @abort() #2
  unreachable

; <label>:1216                                    ; preds = %1209
  %1217 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1218 = and i32 %1217, -131009
  %1219 = or i32 %1218, 35712
  store i32 %1219, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_e(i32 24)
  %1220 = call i32 @ret4()
  %1221 = icmp ne i32 %1220, 21
  br i1 %1221, label %1222, label %1223

; <label>:1222                                    ; preds = %1216
  call void @abort() #2
  unreachable

; <label>:1223                                    ; preds = %1216
  %1224 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1225 = and i32 %1224, -32
  %1226 = or i32 %1225, 21
  store i32 %1226, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_e(i32 1)
  %1227 = call i32 @ret5()
  %1228 = icmp ne i32 %1227, 1
  br i1 %1228, label %1229, label %1230

; <label>:1229                                    ; preds = %1223
  call void @abort() #2
  unreachable

; <label>:1230                                    ; preds = %1223
  %1231 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1232 = and i32 %1231, -33
  %1233 = or i32 %1232, 32
  store i32 %1233, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_e(i32 264151)
  %1234 = call i32 @ret6()
  %1235 = icmp ne i32 %1234, 0
  br i1 %1235, label %1236, label %1237

; <label>:1236                                    ; preds = %1230
  call void @abort() #2
  unreachable

; <label>:1237                                    ; preds = %1230
  %1238 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1239 = and i32 %1238, 63
  %1240 = or i32 %1239, -2147483648
  store i32 %1240, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_e(i32 713)
  %1241 = call i32 @ret7()
  %1242 = icmp ne i32 %1241, 20
  br i1 %1242, label %1243, label %1244

; <label>:1243                                    ; preds = %1237
  call void @abort() #2
  unreachable

; <label>:1244                                    ; preds = %1237
  %1245 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1246 = and i32 %1245, -65536
  %1247 = or i32 %1246, 26812
  store i32 %1247, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_e(i32 17)
  %1248 = call i32 @ret8()
  %1249 = icmp ne i32 %1248, 20
  br i1 %1249, label %1250, label %1251

; <label>:1250                                    ; preds = %1244
  call void @abort() #2
  unreachable

; <label>:1251                                    ; preds = %1244
  %1252 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1253 = and i32 %1252, -16711681
  %1254 = or i32 %1253, 10223616
  store i32 %1254, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_e(i32 199)
  %1255 = call i32 @ret9()
  %1256 = icmp ne i32 %1255, 17
  br i1 %1256, label %1257, label %1258

; <label>:1257                                    ; preds = %1251
  call void @abort() #2
  unreachable

; <label>:1258                                    ; preds = %1251
  %1259 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1260 = and i32 %1259, 16777215
  %1261 = or i32 %1260, -1157627904
  store i32 %1261, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1262 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1263 = and i32 %1262, -64
  %1264 = or i32 %1263, 51
  store i32 %1264, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1265 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1266 = and i32 %1265, -131009
  %1267 = or i32 %1266, 40704
  store i32 %1267, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1268 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1269 = and i32 %1268, 131071
  %1270 = or i32 %1269, -195297280
  store i32 %1270, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1271 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1272 = and i32 %1271, -32
  %1273 = or i32 %1272, 21
  store i32 %1273, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1274 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1275 = and i32 %1274, -33
  %1276 = or i32 %1275, 32
  store i32 %1276, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1277 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1278 = and i32 %1277, 63
  %1279 = or i32 %1278, -2147483648
  store i32 %1279, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1280 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1281 = and i32 %1280, -65536
  %1282 = or i32 %1281, 26812
  store i32 %1282, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1283 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1284 = and i32 %1283, -16711681
  %1285 = or i32 %1284, 10223616
  store i32 %1285, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1286 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1287 = and i32 %1286, 16777215
  %1288 = or i32 %1287, -1157627904
  store i32 %1288, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_f(i32 3)
  %1289 = call i32 @ret1()
  %1290 = icmp ne i32 %1289, 51
  br i1 %1290, label %1291, label %1292

; <label>:1291                                    ; preds = %1258
  call void @abort() #2
  unreachable

; <label>:1292                                    ; preds = %1258
  %1293 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1294 = and i32 %1293, -64
  %1295 = or i32 %1294, 51
  store i32 %1295, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_f(i32 251)
  %1296 = call i32 @ret2()
  %1297 = icmp ne i32 %1296, 639
  br i1 %1297, label %1298, label %1299

; <label>:1298                                    ; preds = %1292
  call void @abort() #2
  unreachable

; <label>:1299                                    ; preds = %1292
  %1300 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1301 = and i32 %1300, -131009
  %1302 = or i32 %1301, 40704
  store i32 %1302, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_f(i32 13279)
  %1303 = call i32 @ret3()
  %1304 = icmp ne i32 %1303, 31295
  br i1 %1304, label %1305, label %1306

; <label>:1305                                    ; preds = %1299
  call void @abort() #2
  unreachable

; <label>:1306                                    ; preds = %1299
  %1307 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1308 = and i32 %1307, -131009
  %1309 = or i32 %1308, 35712
  store i32 %1309, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_f(i32 24)
  %1310 = call i32 @ret4()
  %1311 = icmp ne i32 %1310, 23
  br i1 %1311, label %1312, label %1313

; <label>:1312                                    ; preds = %1306
  call void @abort() #2
  unreachable

; <label>:1313                                    ; preds = %1306
  %1314 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1315 = and i32 %1314, -32
  %1316 = or i32 %1315, 21
  store i32 %1316, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_f(i32 1)
  %1317 = call i32 @ret5()
  %1318 = icmp ne i32 %1317, 1
  br i1 %1318, label %1319, label %1320

; <label>:1319                                    ; preds = %1313
  call void @abort() #2
  unreachable

; <label>:1320                                    ; preds = %1313
  %1321 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1322 = and i32 %1321, -33
  %1323 = or i32 %1322, 32
  store i32 %1323, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_f(i32 264151)
  %1324 = call i32 @ret6()
  %1325 = icmp ne i32 %1324, 33554451
  br i1 %1325, label %1326, label %1327

; <label>:1326                                    ; preds = %1320
  call void @abort() #2
  unreachable

; <label>:1327                                    ; preds = %1320
  %1328 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1329 = and i32 %1328, 63
  %1330 = or i32 %1329, -2147483648
  store i32 %1330, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_f(i32 713)
  %1331 = call i32 @ret7()
  %1332 = icmp ne i32 %1331, 26815
  br i1 %1332, label %1333, label %1334

; <label>:1333                                    ; preds = %1327
  call void @abort() #2
  unreachable

; <label>:1334                                    ; preds = %1327
  %1335 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1336 = and i32 %1335, -65536
  %1337 = or i32 %1336, 26812
  store i32 %1337, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_f(i32 17)
  %1338 = call i32 @ret8()
  %1339 = icmp ne i32 %1338, 159
  br i1 %1339, label %1340, label %1341

; <label>:1340                                    ; preds = %1334
  call void @abort() #2
  unreachable

; <label>:1341                                    ; preds = %1334
  %1342 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1343 = and i32 %1342, -16711681
  %1344 = or i32 %1343, 10223616
  store i32 %1344, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_f(i32 199)
  %1345 = call i32 @ret9()
  %1346 = icmp ne i32 %1345, 187
  br i1 %1346, label %1347, label %1348

; <label>:1347                                    ; preds = %1341
  call void @abort() #2
  unreachable

; <label>:1348                                    ; preds = %1341
  %1349 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1350 = and i32 %1349, 16777215
  %1351 = or i32 %1350, -1157627904
  store i32 %1351, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1352 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1353 = and i32 %1352, -64
  %1354 = or i32 %1353, 51
  store i32 %1354, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1355 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1356 = and i32 %1355, -131009
  %1357 = or i32 %1356, 40704
  store i32 %1357, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1358 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1359 = and i32 %1358, 131071
  %1360 = or i32 %1359, -195297280
  store i32 %1360, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1361 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1362 = and i32 %1361, -32
  %1363 = or i32 %1362, 21
  store i32 %1363, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1364 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1365 = and i32 %1364, -33
  %1366 = or i32 %1365, 32
  store i32 %1366, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1367 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1368 = and i32 %1367, 63
  %1369 = or i32 %1368, -2147483648
  store i32 %1369, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1370 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1371 = and i32 %1370, -65536
  %1372 = or i32 %1371, 26812
  store i32 %1372, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1373 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1374 = and i32 %1373, -16711681
  %1375 = or i32 %1374, 10223616
  store i32 %1375, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1376 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1377 = and i32 %1376, 16777215
  %1378 = or i32 %1377, -1157627904
  store i32 %1378, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_g(i32 3)
  %1379 = call i32 @ret1()
  %1380 = icmp ne i32 %1379, 22
  br i1 %1380, label %1381, label %1382

; <label>:1381                                    ; preds = %1348
  call void @abort() #2
  unreachable

; <label>:1382                                    ; preds = %1348
  %1383 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1384 = and i32 %1383, -64
  %1385 = or i32 %1384, 51
  store i32 %1385, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_g(i32 251)
  %1386 = call i32 @ret2()
  %1387 = icmp ne i32 %1386, 601
  br i1 %1387, label %1388, label %1389

; <label>:1388                                    ; preds = %1382
  call void @abort() #2
  unreachable

; <label>:1389                                    ; preds = %1382
  %1390 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1391 = and i32 %1390, -131009
  %1392 = or i32 %1391, 40704
  store i32 %1392, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_g(i32 13279)
  %1393 = call i32 @ret3()
  %1394 = icmp ne i32 %1393, 31243
  br i1 %1394, label %1395, label %1396

; <label>:1395                                    ; preds = %1389
  call void @abort() #2
  unreachable

; <label>:1396                                    ; preds = %1389
  %1397 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1398 = and i32 %1397, -131009
  %1399 = or i32 %1398, 35712
  store i32 %1399, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_g(i32 24)
  %1400 = call i32 @ret4()
  %1401 = icmp ne i32 %1400, 16
  br i1 %1401, label %1402, label %1403

; <label>:1402                                    ; preds = %1396
  call void @abort() #2
  unreachable

; <label>:1403                                    ; preds = %1396
  %1404 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1405 = and i32 %1404, -32
  %1406 = or i32 %1405, 21
  store i32 %1406, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_g(i32 1)
  %1407 = call i32 @ret5()
  %1408 = icmp ne i32 %1407, 0
  br i1 %1408, label %1409, label %1410

; <label>:1409                                    ; preds = %1403
  call void @abort() #2
  unreachable

; <label>:1410                                    ; preds = %1403
  %1411 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1412 = and i32 %1411, -33
  %1413 = or i32 %1412, 32
  store i32 %1413, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_g(i32 264151)
  %1414 = call i32 @ret6()
  %1415 = icmp ne i32 %1414, 33554469
  br i1 %1415, label %1416, label %1417

; <label>:1416                                    ; preds = %1410
  call void @abort() #2
  unreachable

; <label>:1417                                    ; preds = %1410
  %1418 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1419 = and i32 %1418, 63
  %1420 = or i32 %1419, -2147483648
  store i32 %1420, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_g(i32 713)
  %1421 = call i32 @ret7()
  %1422 = icmp ne i32 %1421, 26777
  br i1 %1422, label %1423, label %1424

; <label>:1423                                    ; preds = %1417
  call void @abort() #2
  unreachable

; <label>:1424                                    ; preds = %1417
  %1425 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1426 = and i32 %1425, -65536
  %1427 = or i32 %1426, 26812
  store i32 %1427, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_g(i32 17)
  %1428 = call i32 @ret8()
  %1429 = icmp ne i32 %1428, 185
  br i1 %1429, label %1430, label %1431

; <label>:1430                                    ; preds = %1424
  call void @abort() #2
  unreachable

; <label>:1431                                    ; preds = %1424
  %1432 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1433 = and i32 %1432, -16711681
  %1434 = or i32 %1433, 10223616
  store i32 %1434, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_g(i32 199)
  %1435 = call i32 @ret9()
  %1436 = icmp ne i32 %1435, 158
  br i1 %1436, label %1437, label %1438

; <label>:1437                                    ; preds = %1431
  call void @abort() #2
  unreachable

; <label>:1438                                    ; preds = %1431
  %1439 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1440 = and i32 %1439, 16777215
  %1441 = or i32 %1440, -1157627904
  store i32 %1441, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1442 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1443 = and i32 %1442, -64
  %1444 = or i32 %1443, 51
  store i32 %1444, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1445 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1446 = and i32 %1445, -131009
  %1447 = or i32 %1446, 40704
  store i32 %1447, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1448 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1449 = and i32 %1448, 131071
  %1450 = or i32 %1449, -195297280
  store i32 %1450, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1451 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1452 = and i32 %1451, -32
  %1453 = or i32 %1452, 21
  store i32 %1453, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1454 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1455 = and i32 %1454, -33
  %1456 = or i32 %1455, 32
  store i32 %1456, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1457 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1458 = and i32 %1457, 63
  %1459 = or i32 %1458, -2147483648
  store i32 %1459, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1460 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1461 = and i32 %1460, -65536
  %1462 = or i32 %1461, 26812
  store i32 %1462, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1463 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1464 = and i32 %1463, -16711681
  %1465 = or i32 %1464, 10223616
  store i32 %1465, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1466 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1467 = and i32 %1466, 16777215
  %1468 = or i32 %1467, -1157627904
  store i32 %1468, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_h(i32 3)
  %1469 = call i32 @ret1()
  %1470 = icmp ne i32 %1469, 3
  br i1 %1470, label %1471, label %1472

; <label>:1471                                    ; preds = %1438
  call void @abort() #2
  unreachable

; <label>:1472                                    ; preds = %1438
  %1473 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1474 = and i32 %1473, -64
  %1475 = or i32 %1474, 51
  store i32 %1475, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_h(i32 251)
  %1476 = call i32 @ret2()
  %1477 = icmp ne i32 %1476, 37
  br i1 %1477, label %1478, label %1479

; <label>:1478                                    ; preds = %1472
  call void @abort() #2
  unreachable

; <label>:1479                                    ; preds = %1472
  %1480 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1481 = and i32 %1480, -131009
  %1482 = or i32 %1481, 40704
  store i32 %1482, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_h(i32 13279)
  %1483 = call i32 @ret3()
  %1484 = icmp ne i32 %1483, 1839
  br i1 %1484, label %1485, label %1486

; <label>:1485                                    ; preds = %1479
  call void @abort() #2
  unreachable

; <label>:1486                                    ; preds = %1479
  %1487 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1488 = and i32 %1487, -131009
  %1489 = or i32 %1488, 35712
  store i32 %1489, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_h(i32 24)
  %1490 = call i32 @ret4()
  %1491 = icmp ne i32 %1490, 1
  br i1 %1491, label %1492, label %1493

; <label>:1492                                    ; preds = %1486
  call void @abort() #2
  unreachable

; <label>:1493                                    ; preds = %1486
  %1494 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1495 = and i32 %1494, -32
  %1496 = or i32 %1495, 21
  store i32 %1496, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_h(i32 1)
  %1497 = call i32 @ret5()
  %1498 = icmp ne i32 %1497, 0
  br i1 %1498, label %1499, label %1500

; <label>:1499                                    ; preds = %1493
  call void @abort() #2
  unreachable

; <label>:1500                                    ; preds = %1493
  %1501 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1502 = and i32 %1501, -33
  %1503 = or i32 %1502, 32
  store i32 %1503, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_h(i32 264151)
  %1504 = call i32 @ret6()
  %1505 = icmp ne i32 %1504, 1973790
  br i1 %1505, label %1506, label %1507

; <label>:1506                                    ; preds = %1500
  call void @abort() #2
  unreachable

; <label>:1507                                    ; preds = %1500
  %1508 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1509 = and i32 %1508, 63
  %1510 = or i32 %1509, -2147483648
  store i32 %1510, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_h(i32 713)
  %1511 = call i32 @ret7()
  %1512 = icmp ne i32 %1511, 1577
  br i1 %1512, label %1513, label %1514

; <label>:1513                                    ; preds = %1507
  call void @abort() #2
  unreachable

; <label>:1514                                    ; preds = %1507
  %1515 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1516 = and i32 %1515, -65536
  %1517 = or i32 %1516, 26812
  store i32 %1517, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_h(i32 17)
  %1518 = call i32 @ret8()
  %1519 = icmp ne i32 %1518, 9
  br i1 %1519, label %1520, label %1521

; <label>:1520                                    ; preds = %1514
  call void @abort() #2
  unreachable

; <label>:1521                                    ; preds = %1514
  %1522 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1523 = and i32 %1522, -16711681
  %1524 = or i32 %1523, 10223616
  store i32 %1524, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_h(i32 199)
  %1525 = call i32 @ret9()
  %1526 = icmp ne i32 %1525, 11
  br i1 %1526, label %1527, label %1528

; <label>:1527                                    ; preds = %1521
  call void @abort() #2
  unreachable

; <label>:1528                                    ; preds = %1521
  %1529 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1530 = and i32 %1529, 16777215
  %1531 = or i32 %1530, -1157627904
  store i32 %1531, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1532 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1533 = and i32 %1532, -64
  %1534 = or i32 %1533, 51
  store i32 %1534, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1535 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1536 = and i32 %1535, -131009
  %1537 = or i32 %1536, 40704
  store i32 %1537, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1538 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1539 = and i32 %1538, 131071
  %1540 = or i32 %1539, -195297280
  store i32 %1540, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1541 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1542 = and i32 %1541, -32
  %1543 = or i32 %1542, 21
  store i32 %1543, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1544 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1545 = and i32 %1544, -33
  %1546 = or i32 %1545, 32
  store i32 %1546, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1547 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1548 = and i32 %1547, 63
  %1549 = or i32 %1548, -2147483648
  store i32 %1549, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1550 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1551 = and i32 %1550, -65536
  %1552 = or i32 %1551, 26812
  store i32 %1552, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1553 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1554 = and i32 %1553, -16711681
  %1555 = or i32 %1554, 10223616
  store i32 %1555, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1556 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1557 = and i32 %1556, 16777215
  %1558 = or i32 %1557, -1157627904
  store i32 %1558, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn1_i(i32 3)
  %1559 = call i32 @ret1()
  %1560 = icmp ne i32 %1559, 13
  br i1 %1560, label %1561, label %1562

; <label>:1561                                    ; preds = %1528
  call void @abort() #2
  unreachable

; <label>:1562                                    ; preds = %1528
  %1563 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1564 = and i32 %1563, -64
  %1565 = or i32 %1564, 51
  store i32 %1565, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn2_i(i32 251)
  %1566 = call i32 @ret2()
  %1567 = icmp ne i32 %1566, 9
  br i1 %1567, label %1568, label %1569

; <label>:1568                                    ; preds = %1562
  call void @abort() #2
  unreachable

; <label>:1569                                    ; preds = %1562
  %1570 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1571 = and i32 %1570, -131009
  %1572 = or i32 %1571, 40704
  store i32 %1572, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn3_i(i32 13279)
  %1573 = call i32 @ret3()
  %1574 = icmp ne i32 %1573, 4
  br i1 %1574, label %1575, label %1576

; <label>:1575                                    ; preds = %1569
  call void @abort() #2
  unreachable

; <label>:1576                                    ; preds = %1569
  %1577 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  %1578 = and i32 %1577, -131009
  %1579 = or i32 %1578, 35712
  store i32 %1579, i32* getelementptr inbounds (%struct.anon, %struct.anon* @b, i32 0, i32 0), align 4
  call void @fn4_i(i32 24)
  %1580 = call i32 @ret4()
  %1581 = icmp ne i32 %1580, 2
  br i1 %1581, label %1582, label %1583

; <label>:1582                                    ; preds = %1576
  call void @abort() #2
  unreachable

; <label>:1583                                    ; preds = %1576
  %1584 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1585 = and i32 %1584, -32
  %1586 = or i32 %1585, 21
  store i32 %1586, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn5_i(i32 1)
  %1587 = call i32 @ret5()
  %1588 = icmp ne i32 %1587, 1
  br i1 %1588, label %1589, label %1590

; <label>:1589                                    ; preds = %1583
  call void @abort() #2
  unreachable

; <label>:1590                                    ; preds = %1583
  %1591 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1592 = and i32 %1591, -33
  %1593 = or i32 %1592, 32
  store i32 %1593, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn6_i(i32 264151)
  %1594 = call i32 @ret6()
  %1595 = icmp ne i32 %1594, 14
  br i1 %1595, label %1596, label %1597

; <label>:1596                                    ; preds = %1590
  call void @abort() #2
  unreachable

; <label>:1597                                    ; preds = %1590
  %1598 = load i32, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  %1599 = and i32 %1598, 63
  %1600 = or i32 %1599, -2147483648
  store i32 %1600, i32* getelementptr inbounds (%struct.anon.0, %struct.anon.0* @c, i32 0, i32 0), align 4
  call void @fn7_i(i32 713)
  %1601 = call i32 @ret7()
  %1602 = icmp ne i32 %1601, 3
  br i1 %1602, label %1603, label %1604

; <label>:1603                                    ; preds = %1597
  call void @abort() #2
  unreachable

; <label>:1604                                    ; preds = %1597
  %1605 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1606 = and i32 %1605, -65536
  %1607 = or i32 %1606, 26812
  store i32 %1607, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn8_i(i32 17)
  %1608 = call i32 @ret8()
  %1609 = icmp ne i32 %1608, 4
  br i1 %1609, label %1610, label %1611

; <label>:1610                                    ; preds = %1604
  call void @abort() #2
  unreachable

; <label>:1611                                    ; preds = %1604
  %1612 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1613 = and i32 %1612, -16711681
  %1614 = or i32 %1613, 10223616
  store i32 %1614, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  call void @fn9_i(i32 199)
  %1615 = call i32 @ret9()
  %1616 = icmp ne i32 %1615, 16
  br i1 %1616, label %1617, label %1618

; <label>:1617                                    ; preds = %1611
  call void @abort() #2
  unreachable

; <label>:1618                                    ; preds = %1611
  %1619 = load i32, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  %1620 = and i32 %1619, 16777215
  %1621 = or i32 %1620, -1157627904
  store i32 %1621, i32* getelementptr inbounds (%struct.anon.1, %struct.anon.1* @d, i32 0, i32 0), align 4
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
