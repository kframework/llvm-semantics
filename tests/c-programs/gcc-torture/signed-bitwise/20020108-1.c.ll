; ModuleID = './20020108-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_0(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 0
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_1(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 1
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_2(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 2
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_3(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 3
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_4(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 4
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_5(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 5
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_6(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 6
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @ashift_qi_7(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = shl i32 %3, 7
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_0(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 0
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_1(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 1
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_2(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 2
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_3(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 3
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_4(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 4
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_5(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 5
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_6(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 6
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i8 @lshiftrt_qi_7(i8 zeroext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = ashr i32 %3, 7
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_0(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 0
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_1(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 1
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_2(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 2
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_3(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 3
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_4(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 4
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_5(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 5
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_6(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 6
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define signext i8 @ashiftrt_qi_7(i8 signext %n) #0 {
  %1 = alloca i8, align 1
  store i8 %n, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = ashr i32 %3, 7
  %5 = trunc i32 %4 to i8
  ret i8 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_0(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 0
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_1(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 1
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_2(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 2
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_3(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_4(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 4
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_5(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 5
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_6(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 6
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_7(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 7
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_8(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 8
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_9(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 9
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_10(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 10
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_11(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 11
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_12(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 12
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_13(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 13
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_14(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 14
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @ashift_hi_15(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = shl i32 %3, 15
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_0(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 0
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_1(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 1
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_2(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 2
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_3(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_4(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 4
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_5(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 5
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_6(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 6
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_7(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 7
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_8(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 8
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_9(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 9
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_10(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 10
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_11(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 11
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_12(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 12
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_13(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 13
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_14(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 14
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define zeroext i16 @lshiftrt_hi_15(i16 zeroext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = ashr i32 %3, 15
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_0(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 0
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_1(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 1
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_2(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 2
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_3(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 3
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_4(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 4
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_5(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 5
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_6(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 6
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_7(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 7
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_8(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 8
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_9(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 9
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_10(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 10
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_11(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 11
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_12(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 12
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_13(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 13
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_14(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 14
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define signext i16 @ashiftrt_hi_15(i16 signext %n) #0 {
  %1 = alloca i16, align 2
  store i16 %n, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = ashr i32 %3, 15
  %5 = trunc i32 %4 to i16
  ret i16 %5
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_0(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 0
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_1(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_2(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 2
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_3(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 3
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_4(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_5(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 5
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_6(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 6
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_7(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 7
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_8(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 8
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_9(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 9
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_10(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 10
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_11(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 11
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_12(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 12
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_13(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 13
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_14(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 14
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_15(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 15
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_16(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 16
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_17(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 17
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_18(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 18
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_19(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 19
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_20(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 20
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_21(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 21
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_22(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 22
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_23(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 23
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_24(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 24
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_25(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 25
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_26(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 26
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_27(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 27
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_28(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 28
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_29(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 29
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_30(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 30
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashift_si_31(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = shl i32 %2, 31
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_0(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 0
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_1(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_2(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 2
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_3(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 3
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_4(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_5(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 5
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_6(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 6
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_7(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 7
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_8(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 8
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_9(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 9
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_10(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 10
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_11(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 11
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_12(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 12
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_13(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 13
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_14(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 14
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_15(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 15
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_16(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 16
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_17(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 17
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_18(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 18
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_19(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 19
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_20(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 20
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_21(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 21
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_22(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 22
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_23(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 23
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_24(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 24
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_25(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 25
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_26(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 26
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_27(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 27
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_28(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 28
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_29(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 29
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_30(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 30
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @lshiftrt_si_31(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 31
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_0(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 0
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_1(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_2(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 2
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_3(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 3
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_4(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_5(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 5
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_6(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 6
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_7(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 7
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_8(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 8
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_9(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 9
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_10(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 10
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_11(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 11
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_12(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 12
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_13(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 13
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_14(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 14
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_15(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 15
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_16(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 16
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_17(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 17
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_18(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 18
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_19(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 19
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_20(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 20
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_21(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 21
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_22(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 22
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_23(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 23
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_24(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 24
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_25(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 25
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_26(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 26
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_27(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 27
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_28(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 28
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_29(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 29
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_30(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 30
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @ashiftrt_si_31(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 31
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call zeroext i8 @ashift_qi_0(i8 zeroext -1)
  %3 = zext i8 %2 to i32
  %4 = icmp ne i32 %3, 255
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = call zeroext i8 @ashift_qi_1(i8 zeroext -1)
  %8 = zext i8 %7 to i32
  %9 = icmp ne i32 %8, 254
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %6
  %12 = call zeroext i8 @ashift_qi_2(i8 zeroext -1)
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 252
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %11
  %17 = call zeroext i8 @ashift_qi_3(i8 zeroext -1)
  %18 = zext i8 %17 to i32
  %19 = icmp ne i32 %18, 248
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %16
  %22 = call zeroext i8 @ashift_qi_4(i8 zeroext -1)
  %23 = zext i8 %22 to i32
  %24 = icmp ne i32 %23, 240
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %21
  %27 = call zeroext i8 @ashift_qi_5(i8 zeroext -1)
  %28 = zext i8 %27 to i32
  %29 = icmp ne i32 %28, 224
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %26
  call void @abort() #2
  unreachable

; <label>:31                                      ; preds = %26
  %32 = call zeroext i8 @ashift_qi_6(i8 zeroext -1)
  %33 = zext i8 %32 to i32
  %34 = icmp ne i32 %33, 192
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %31
  call void @abort() #2
  unreachable

; <label>:36                                      ; preds = %31
  %37 = call zeroext i8 @ashift_qi_7(i8 zeroext -1)
  %38 = zext i8 %37 to i32
  %39 = icmp ne i32 %38, 128
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %36
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %36
  %42 = call zeroext i8 @lshiftrt_qi_0(i8 zeroext -1)
  %43 = zext i8 %42 to i32
  %44 = icmp ne i32 %43, 255
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %41
  call void @abort() #2
  unreachable

; <label>:46                                      ; preds = %41
  %47 = call zeroext i8 @lshiftrt_qi_1(i8 zeroext -1)
  %48 = zext i8 %47 to i32
  %49 = icmp ne i32 %48, 127
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %46
  call void @abort() #2
  unreachable

; <label>:51                                      ; preds = %46
  %52 = call zeroext i8 @lshiftrt_qi_2(i8 zeroext -1)
  %53 = zext i8 %52 to i32
  %54 = icmp ne i32 %53, 63
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %51
  call void @abort() #2
  unreachable

; <label>:56                                      ; preds = %51
  %57 = call zeroext i8 @lshiftrt_qi_3(i8 zeroext -1)
  %58 = zext i8 %57 to i32
  %59 = icmp ne i32 %58, 31
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %56
  call void @abort() #2
  unreachable

; <label>:61                                      ; preds = %56
  %62 = call zeroext i8 @lshiftrt_qi_4(i8 zeroext -1)
  %63 = zext i8 %62 to i32
  %64 = icmp ne i32 %63, 15
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %61
  call void @abort() #2
  unreachable

; <label>:66                                      ; preds = %61
  %67 = call zeroext i8 @lshiftrt_qi_5(i8 zeroext -1)
  %68 = zext i8 %67 to i32
  %69 = icmp ne i32 %68, 7
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %66
  call void @abort() #2
  unreachable

; <label>:71                                      ; preds = %66
  %72 = call zeroext i8 @lshiftrt_qi_6(i8 zeroext -1)
  %73 = zext i8 %72 to i32
  %74 = icmp ne i32 %73, 3
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %71
  call void @abort() #2
  unreachable

; <label>:76                                      ; preds = %71
  %77 = call zeroext i8 @lshiftrt_qi_7(i8 zeroext -1)
  %78 = zext i8 %77 to i32
  %79 = icmp ne i32 %78, 1
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %76
  call void @abort() #2
  unreachable

; <label>:81                                      ; preds = %76
  %82 = call signext i8 @ashiftrt_qi_0(i8 signext -1)
  %83 = sext i8 %82 to i32
  %84 = icmp ne i32 %83, -1
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %81
  call void @abort() #2
  unreachable

; <label>:86                                      ; preds = %81
  %87 = call signext i8 @ashiftrt_qi_1(i8 signext -1)
  %88 = sext i8 %87 to i32
  %89 = icmp ne i32 %88, -1
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %86
  call void @abort() #2
  unreachable

; <label>:91                                      ; preds = %86
  %92 = call signext i8 @ashiftrt_qi_2(i8 signext -1)
  %93 = sext i8 %92 to i32
  %94 = icmp ne i32 %93, -1
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %91
  call void @abort() #2
  unreachable

; <label>:96                                      ; preds = %91
  %97 = call signext i8 @ashiftrt_qi_3(i8 signext -1)
  %98 = sext i8 %97 to i32
  %99 = icmp ne i32 %98, -1
  br i1 %99, label %100, label %101

; <label>:100                                     ; preds = %96
  call void @abort() #2
  unreachable

; <label>:101                                     ; preds = %96
  %102 = call signext i8 @ashiftrt_qi_4(i8 signext -1)
  %103 = sext i8 %102 to i32
  %104 = icmp ne i32 %103, -1
  br i1 %104, label %105, label %106

; <label>:105                                     ; preds = %101
  call void @abort() #2
  unreachable

; <label>:106                                     ; preds = %101
  %107 = call signext i8 @ashiftrt_qi_5(i8 signext -1)
  %108 = sext i8 %107 to i32
  %109 = icmp ne i32 %108, -1
  br i1 %109, label %110, label %111

; <label>:110                                     ; preds = %106
  call void @abort() #2
  unreachable

; <label>:111                                     ; preds = %106
  %112 = call signext i8 @ashiftrt_qi_6(i8 signext -1)
  %113 = sext i8 %112 to i32
  %114 = icmp ne i32 %113, -1
  br i1 %114, label %115, label %116

; <label>:115                                     ; preds = %111
  call void @abort() #2
  unreachable

; <label>:116                                     ; preds = %111
  %117 = call signext i8 @ashiftrt_qi_7(i8 signext -1)
  %118 = sext i8 %117 to i32
  %119 = icmp ne i32 %118, -1
  br i1 %119, label %120, label %121

; <label>:120                                     ; preds = %116
  call void @abort() #2
  unreachable

; <label>:121                                     ; preds = %116
  %122 = call signext i8 @ashiftrt_qi_0(i8 signext 0)
  %123 = sext i8 %122 to i32
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %121
  call void @abort() #2
  unreachable

; <label>:126                                     ; preds = %121
  %127 = call signext i8 @ashiftrt_qi_1(i8 signext 0)
  %128 = sext i8 %127 to i32
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %130, label %131

; <label>:130                                     ; preds = %126
  call void @abort() #2
  unreachable

; <label>:131                                     ; preds = %126
  %132 = call signext i8 @ashiftrt_qi_2(i8 signext 0)
  %133 = sext i8 %132 to i32
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %135, label %136

; <label>:135                                     ; preds = %131
  call void @abort() #2
  unreachable

; <label>:136                                     ; preds = %131
  %137 = call signext i8 @ashiftrt_qi_3(i8 signext 0)
  %138 = sext i8 %137 to i32
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %136
  call void @abort() #2
  unreachable

; <label>:141                                     ; preds = %136
  %142 = call signext i8 @ashiftrt_qi_4(i8 signext 0)
  %143 = sext i8 %142 to i32
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %141
  call void @abort() #2
  unreachable

; <label>:146                                     ; preds = %141
  %147 = call signext i8 @ashiftrt_qi_5(i8 signext 0)
  %148 = sext i8 %147 to i32
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %151

; <label>:150                                     ; preds = %146
  call void @abort() #2
  unreachable

; <label>:151                                     ; preds = %146
  %152 = call signext i8 @ashiftrt_qi_6(i8 signext 0)
  %153 = sext i8 %152 to i32
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %156

; <label>:155                                     ; preds = %151
  call void @abort() #2
  unreachable

; <label>:156                                     ; preds = %151
  %157 = call signext i8 @ashiftrt_qi_7(i8 signext 0)
  %158 = sext i8 %157 to i32
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %161

; <label>:160                                     ; preds = %156
  call void @abort() #2
  unreachable

; <label>:161                                     ; preds = %156
  %162 = call zeroext i16 @ashift_hi_0(i16 zeroext -1)
  %163 = zext i16 %162 to i32
  %164 = icmp ne i32 %163, 65535
  br i1 %164, label %165, label %166

; <label>:165                                     ; preds = %161
  call void @abort() #2
  unreachable

; <label>:166                                     ; preds = %161
  %167 = call zeroext i16 @ashift_hi_1(i16 zeroext -1)
  %168 = zext i16 %167 to i32
  %169 = icmp ne i32 %168, 65534
  br i1 %169, label %170, label %171

; <label>:170                                     ; preds = %166
  call void @abort() #2
  unreachable

; <label>:171                                     ; preds = %166
  %172 = call zeroext i16 @ashift_hi_2(i16 zeroext -1)
  %173 = zext i16 %172 to i32
  %174 = icmp ne i32 %173, 65532
  br i1 %174, label %175, label %176

; <label>:175                                     ; preds = %171
  call void @abort() #2
  unreachable

; <label>:176                                     ; preds = %171
  %177 = call zeroext i16 @ashift_hi_3(i16 zeroext -1)
  %178 = zext i16 %177 to i32
  %179 = icmp ne i32 %178, 65528
  br i1 %179, label %180, label %181

; <label>:180                                     ; preds = %176
  call void @abort() #2
  unreachable

; <label>:181                                     ; preds = %176
  %182 = call zeroext i16 @ashift_hi_4(i16 zeroext -1)
  %183 = zext i16 %182 to i32
  %184 = icmp ne i32 %183, 65520
  br i1 %184, label %185, label %186

; <label>:185                                     ; preds = %181
  call void @abort() #2
  unreachable

; <label>:186                                     ; preds = %181
  %187 = call zeroext i16 @ashift_hi_5(i16 zeroext -1)
  %188 = zext i16 %187 to i32
  %189 = icmp ne i32 %188, 65504
  br i1 %189, label %190, label %191

; <label>:190                                     ; preds = %186
  call void @abort() #2
  unreachable

; <label>:191                                     ; preds = %186
  %192 = call zeroext i16 @ashift_hi_6(i16 zeroext -1)
  %193 = zext i16 %192 to i32
  %194 = icmp ne i32 %193, 65472
  br i1 %194, label %195, label %196

; <label>:195                                     ; preds = %191
  call void @abort() #2
  unreachable

; <label>:196                                     ; preds = %191
  %197 = call zeroext i16 @ashift_hi_7(i16 zeroext -1)
  %198 = zext i16 %197 to i32
  %199 = icmp ne i32 %198, 65408
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %196
  call void @abort() #2
  unreachable

; <label>:201                                     ; preds = %196
  %202 = call zeroext i16 @ashift_hi_8(i16 zeroext -1)
  %203 = zext i16 %202 to i32
  %204 = icmp ne i32 %203, 65280
  br i1 %204, label %205, label %206

; <label>:205                                     ; preds = %201
  call void @abort() #2
  unreachable

; <label>:206                                     ; preds = %201
  %207 = call zeroext i16 @ashift_hi_9(i16 zeroext -1)
  %208 = zext i16 %207 to i32
  %209 = icmp ne i32 %208, 65024
  br i1 %209, label %210, label %211

; <label>:210                                     ; preds = %206
  call void @abort() #2
  unreachable

; <label>:211                                     ; preds = %206
  %212 = call zeroext i16 @ashift_hi_10(i16 zeroext -1)
  %213 = zext i16 %212 to i32
  %214 = icmp ne i32 %213, 64512
  br i1 %214, label %215, label %216

; <label>:215                                     ; preds = %211
  call void @abort() #2
  unreachable

; <label>:216                                     ; preds = %211
  %217 = call zeroext i16 @ashift_hi_11(i16 zeroext -1)
  %218 = zext i16 %217 to i32
  %219 = icmp ne i32 %218, 63488
  br i1 %219, label %220, label %221

; <label>:220                                     ; preds = %216
  call void @abort() #2
  unreachable

; <label>:221                                     ; preds = %216
  %222 = call zeroext i16 @ashift_hi_12(i16 zeroext -1)
  %223 = zext i16 %222 to i32
  %224 = icmp ne i32 %223, 61440
  br i1 %224, label %225, label %226

; <label>:225                                     ; preds = %221
  call void @abort() #2
  unreachable

; <label>:226                                     ; preds = %221
  %227 = call zeroext i16 @ashift_hi_13(i16 zeroext -1)
  %228 = zext i16 %227 to i32
  %229 = icmp ne i32 %228, 57344
  br i1 %229, label %230, label %231

; <label>:230                                     ; preds = %226
  call void @abort() #2
  unreachable

; <label>:231                                     ; preds = %226
  %232 = call zeroext i16 @ashift_hi_14(i16 zeroext -1)
  %233 = zext i16 %232 to i32
  %234 = icmp ne i32 %233, 49152
  br i1 %234, label %235, label %236

; <label>:235                                     ; preds = %231
  call void @abort() #2
  unreachable

; <label>:236                                     ; preds = %231
  %237 = call zeroext i16 @ashift_hi_15(i16 zeroext -1)
  %238 = zext i16 %237 to i32
  %239 = icmp ne i32 %238, 32768
  br i1 %239, label %240, label %241

; <label>:240                                     ; preds = %236
  call void @abort() #2
  unreachable

; <label>:241                                     ; preds = %236
  %242 = call zeroext i16 @lshiftrt_hi_0(i16 zeroext -1)
  %243 = zext i16 %242 to i32
  %244 = icmp ne i32 %243, 65535
  br i1 %244, label %245, label %246

; <label>:245                                     ; preds = %241
  call void @abort() #2
  unreachable

; <label>:246                                     ; preds = %241
  %247 = call zeroext i16 @lshiftrt_hi_1(i16 zeroext -1)
  %248 = zext i16 %247 to i32
  %249 = icmp ne i32 %248, 32767
  br i1 %249, label %250, label %251

; <label>:250                                     ; preds = %246
  call void @abort() #2
  unreachable

; <label>:251                                     ; preds = %246
  %252 = call zeroext i16 @lshiftrt_hi_2(i16 zeroext -1)
  %253 = zext i16 %252 to i32
  %254 = icmp ne i32 %253, 16383
  br i1 %254, label %255, label %256

; <label>:255                                     ; preds = %251
  call void @abort() #2
  unreachable

; <label>:256                                     ; preds = %251
  %257 = call zeroext i16 @lshiftrt_hi_3(i16 zeroext -1)
  %258 = zext i16 %257 to i32
  %259 = icmp ne i32 %258, 8191
  br i1 %259, label %260, label %261

; <label>:260                                     ; preds = %256
  call void @abort() #2
  unreachable

; <label>:261                                     ; preds = %256
  %262 = call zeroext i16 @lshiftrt_hi_4(i16 zeroext -1)
  %263 = zext i16 %262 to i32
  %264 = icmp ne i32 %263, 4095
  br i1 %264, label %265, label %266

; <label>:265                                     ; preds = %261
  call void @abort() #2
  unreachable

; <label>:266                                     ; preds = %261
  %267 = call zeroext i16 @lshiftrt_hi_5(i16 zeroext -1)
  %268 = zext i16 %267 to i32
  %269 = icmp ne i32 %268, 2047
  br i1 %269, label %270, label %271

; <label>:270                                     ; preds = %266
  call void @abort() #2
  unreachable

; <label>:271                                     ; preds = %266
  %272 = call zeroext i16 @lshiftrt_hi_6(i16 zeroext -1)
  %273 = zext i16 %272 to i32
  %274 = icmp ne i32 %273, 1023
  br i1 %274, label %275, label %276

; <label>:275                                     ; preds = %271
  call void @abort() #2
  unreachable

; <label>:276                                     ; preds = %271
  %277 = call zeroext i16 @lshiftrt_hi_7(i16 zeroext -1)
  %278 = zext i16 %277 to i32
  %279 = icmp ne i32 %278, 511
  br i1 %279, label %280, label %281

; <label>:280                                     ; preds = %276
  call void @abort() #2
  unreachable

; <label>:281                                     ; preds = %276
  %282 = call zeroext i16 @lshiftrt_hi_8(i16 zeroext -1)
  %283 = zext i16 %282 to i32
  %284 = icmp ne i32 %283, 255
  br i1 %284, label %285, label %286

; <label>:285                                     ; preds = %281
  call void @abort() #2
  unreachable

; <label>:286                                     ; preds = %281
  %287 = call zeroext i16 @lshiftrt_hi_9(i16 zeroext -1)
  %288 = zext i16 %287 to i32
  %289 = icmp ne i32 %288, 127
  br i1 %289, label %290, label %291

; <label>:290                                     ; preds = %286
  call void @abort() #2
  unreachable

; <label>:291                                     ; preds = %286
  %292 = call zeroext i16 @lshiftrt_hi_10(i16 zeroext -1)
  %293 = zext i16 %292 to i32
  %294 = icmp ne i32 %293, 63
  br i1 %294, label %295, label %296

; <label>:295                                     ; preds = %291
  call void @abort() #2
  unreachable

; <label>:296                                     ; preds = %291
  %297 = call zeroext i16 @lshiftrt_hi_11(i16 zeroext -1)
  %298 = zext i16 %297 to i32
  %299 = icmp ne i32 %298, 31
  br i1 %299, label %300, label %301

; <label>:300                                     ; preds = %296
  call void @abort() #2
  unreachable

; <label>:301                                     ; preds = %296
  %302 = call zeroext i16 @lshiftrt_hi_12(i16 zeroext -1)
  %303 = zext i16 %302 to i32
  %304 = icmp ne i32 %303, 15
  br i1 %304, label %305, label %306

; <label>:305                                     ; preds = %301
  call void @abort() #2
  unreachable

; <label>:306                                     ; preds = %301
  %307 = call zeroext i16 @lshiftrt_hi_13(i16 zeroext -1)
  %308 = zext i16 %307 to i32
  %309 = icmp ne i32 %308, 7
  br i1 %309, label %310, label %311

; <label>:310                                     ; preds = %306
  call void @abort() #2
  unreachable

; <label>:311                                     ; preds = %306
  %312 = call zeroext i16 @lshiftrt_hi_14(i16 zeroext -1)
  %313 = zext i16 %312 to i32
  %314 = icmp ne i32 %313, 3
  br i1 %314, label %315, label %316

; <label>:315                                     ; preds = %311
  call void @abort() #2
  unreachable

; <label>:316                                     ; preds = %311
  %317 = call zeroext i16 @lshiftrt_hi_15(i16 zeroext -1)
  %318 = zext i16 %317 to i32
  %319 = icmp ne i32 %318, 1
  br i1 %319, label %320, label %321

; <label>:320                                     ; preds = %316
  call void @abort() #2
  unreachable

; <label>:321                                     ; preds = %316
  %322 = call signext i16 @ashiftrt_hi_0(i16 signext -1)
  %323 = sext i16 %322 to i32
  %324 = icmp ne i32 %323, -1
  br i1 %324, label %325, label %326

; <label>:325                                     ; preds = %321
  call void @abort() #2
  unreachable

; <label>:326                                     ; preds = %321
  %327 = call signext i16 @ashiftrt_hi_1(i16 signext -1)
  %328 = sext i16 %327 to i32
  %329 = icmp ne i32 %328, -1
  br i1 %329, label %330, label %331

; <label>:330                                     ; preds = %326
  call void @abort() #2
  unreachable

; <label>:331                                     ; preds = %326
  %332 = call signext i16 @ashiftrt_hi_2(i16 signext -1)
  %333 = sext i16 %332 to i32
  %334 = icmp ne i32 %333, -1
  br i1 %334, label %335, label %336

; <label>:335                                     ; preds = %331
  call void @abort() #2
  unreachable

; <label>:336                                     ; preds = %331
  %337 = call signext i16 @ashiftrt_hi_3(i16 signext -1)
  %338 = sext i16 %337 to i32
  %339 = icmp ne i32 %338, -1
  br i1 %339, label %340, label %341

; <label>:340                                     ; preds = %336
  call void @abort() #2
  unreachable

; <label>:341                                     ; preds = %336
  %342 = call signext i16 @ashiftrt_hi_4(i16 signext -1)
  %343 = sext i16 %342 to i32
  %344 = icmp ne i32 %343, -1
  br i1 %344, label %345, label %346

; <label>:345                                     ; preds = %341
  call void @abort() #2
  unreachable

; <label>:346                                     ; preds = %341
  %347 = call signext i16 @ashiftrt_hi_5(i16 signext -1)
  %348 = sext i16 %347 to i32
  %349 = icmp ne i32 %348, -1
  br i1 %349, label %350, label %351

; <label>:350                                     ; preds = %346
  call void @abort() #2
  unreachable

; <label>:351                                     ; preds = %346
  %352 = call signext i16 @ashiftrt_hi_6(i16 signext -1)
  %353 = sext i16 %352 to i32
  %354 = icmp ne i32 %353, -1
  br i1 %354, label %355, label %356

; <label>:355                                     ; preds = %351
  call void @abort() #2
  unreachable

; <label>:356                                     ; preds = %351
  %357 = call signext i16 @ashiftrt_hi_7(i16 signext -1)
  %358 = sext i16 %357 to i32
  %359 = icmp ne i32 %358, -1
  br i1 %359, label %360, label %361

; <label>:360                                     ; preds = %356
  call void @abort() #2
  unreachable

; <label>:361                                     ; preds = %356
  %362 = call signext i16 @ashiftrt_hi_8(i16 signext -1)
  %363 = sext i16 %362 to i32
  %364 = icmp ne i32 %363, -1
  br i1 %364, label %365, label %366

; <label>:365                                     ; preds = %361
  call void @abort() #2
  unreachable

; <label>:366                                     ; preds = %361
  %367 = call signext i16 @ashiftrt_hi_9(i16 signext -1)
  %368 = sext i16 %367 to i32
  %369 = icmp ne i32 %368, -1
  br i1 %369, label %370, label %371

; <label>:370                                     ; preds = %366
  call void @abort() #2
  unreachable

; <label>:371                                     ; preds = %366
  %372 = call signext i16 @ashiftrt_hi_10(i16 signext -1)
  %373 = sext i16 %372 to i32
  %374 = icmp ne i32 %373, -1
  br i1 %374, label %375, label %376

; <label>:375                                     ; preds = %371
  call void @abort() #2
  unreachable

; <label>:376                                     ; preds = %371
  %377 = call signext i16 @ashiftrt_hi_11(i16 signext -1)
  %378 = sext i16 %377 to i32
  %379 = icmp ne i32 %378, -1
  br i1 %379, label %380, label %381

; <label>:380                                     ; preds = %376
  call void @abort() #2
  unreachable

; <label>:381                                     ; preds = %376
  %382 = call signext i16 @ashiftrt_hi_12(i16 signext -1)
  %383 = sext i16 %382 to i32
  %384 = icmp ne i32 %383, -1
  br i1 %384, label %385, label %386

; <label>:385                                     ; preds = %381
  call void @abort() #2
  unreachable

; <label>:386                                     ; preds = %381
  %387 = call signext i16 @ashiftrt_hi_13(i16 signext -1)
  %388 = sext i16 %387 to i32
  %389 = icmp ne i32 %388, -1
  br i1 %389, label %390, label %391

; <label>:390                                     ; preds = %386
  call void @abort() #2
  unreachable

; <label>:391                                     ; preds = %386
  %392 = call signext i16 @ashiftrt_hi_14(i16 signext -1)
  %393 = sext i16 %392 to i32
  %394 = icmp ne i32 %393, -1
  br i1 %394, label %395, label %396

; <label>:395                                     ; preds = %391
  call void @abort() #2
  unreachable

; <label>:396                                     ; preds = %391
  %397 = call signext i16 @ashiftrt_hi_15(i16 signext -1)
  %398 = sext i16 %397 to i32
  %399 = icmp ne i32 %398, -1
  br i1 %399, label %400, label %401

; <label>:400                                     ; preds = %396
  call void @abort() #2
  unreachable

; <label>:401                                     ; preds = %396
  %402 = call signext i16 @ashiftrt_hi_0(i16 signext 0)
  %403 = sext i16 %402 to i32
  %404 = icmp ne i32 %403, 0
  br i1 %404, label %405, label %406

; <label>:405                                     ; preds = %401
  call void @abort() #2
  unreachable

; <label>:406                                     ; preds = %401
  %407 = call signext i16 @ashiftrt_hi_1(i16 signext 0)
  %408 = sext i16 %407 to i32
  %409 = icmp ne i32 %408, 0
  br i1 %409, label %410, label %411

; <label>:410                                     ; preds = %406
  call void @abort() #2
  unreachable

; <label>:411                                     ; preds = %406
  %412 = call signext i16 @ashiftrt_hi_2(i16 signext 0)
  %413 = sext i16 %412 to i32
  %414 = icmp ne i32 %413, 0
  br i1 %414, label %415, label %416

; <label>:415                                     ; preds = %411
  call void @abort() #2
  unreachable

; <label>:416                                     ; preds = %411
  %417 = call signext i16 @ashiftrt_hi_3(i16 signext 0)
  %418 = sext i16 %417 to i32
  %419 = icmp ne i32 %418, 0
  br i1 %419, label %420, label %421

; <label>:420                                     ; preds = %416
  call void @abort() #2
  unreachable

; <label>:421                                     ; preds = %416
  %422 = call signext i16 @ashiftrt_hi_4(i16 signext 0)
  %423 = sext i16 %422 to i32
  %424 = icmp ne i32 %423, 0
  br i1 %424, label %425, label %426

; <label>:425                                     ; preds = %421
  call void @abort() #2
  unreachable

; <label>:426                                     ; preds = %421
  %427 = call signext i16 @ashiftrt_hi_5(i16 signext 0)
  %428 = sext i16 %427 to i32
  %429 = icmp ne i32 %428, 0
  br i1 %429, label %430, label %431

; <label>:430                                     ; preds = %426
  call void @abort() #2
  unreachable

; <label>:431                                     ; preds = %426
  %432 = call signext i16 @ashiftrt_hi_6(i16 signext 0)
  %433 = sext i16 %432 to i32
  %434 = icmp ne i32 %433, 0
  br i1 %434, label %435, label %436

; <label>:435                                     ; preds = %431
  call void @abort() #2
  unreachable

; <label>:436                                     ; preds = %431
  %437 = call signext i16 @ashiftrt_hi_7(i16 signext 0)
  %438 = sext i16 %437 to i32
  %439 = icmp ne i32 %438, 0
  br i1 %439, label %440, label %441

; <label>:440                                     ; preds = %436
  call void @abort() #2
  unreachable

; <label>:441                                     ; preds = %436
  %442 = call signext i16 @ashiftrt_hi_8(i16 signext 0)
  %443 = sext i16 %442 to i32
  %444 = icmp ne i32 %443, 0
  br i1 %444, label %445, label %446

; <label>:445                                     ; preds = %441
  call void @abort() #2
  unreachable

; <label>:446                                     ; preds = %441
  %447 = call signext i16 @ashiftrt_hi_9(i16 signext 0)
  %448 = sext i16 %447 to i32
  %449 = icmp ne i32 %448, 0
  br i1 %449, label %450, label %451

; <label>:450                                     ; preds = %446
  call void @abort() #2
  unreachable

; <label>:451                                     ; preds = %446
  %452 = call signext i16 @ashiftrt_hi_10(i16 signext 0)
  %453 = sext i16 %452 to i32
  %454 = icmp ne i32 %453, 0
  br i1 %454, label %455, label %456

; <label>:455                                     ; preds = %451
  call void @abort() #2
  unreachable

; <label>:456                                     ; preds = %451
  %457 = call signext i16 @ashiftrt_hi_11(i16 signext 0)
  %458 = sext i16 %457 to i32
  %459 = icmp ne i32 %458, 0
  br i1 %459, label %460, label %461

; <label>:460                                     ; preds = %456
  call void @abort() #2
  unreachable

; <label>:461                                     ; preds = %456
  %462 = call signext i16 @ashiftrt_hi_12(i16 signext 0)
  %463 = sext i16 %462 to i32
  %464 = icmp ne i32 %463, 0
  br i1 %464, label %465, label %466

; <label>:465                                     ; preds = %461
  call void @abort() #2
  unreachable

; <label>:466                                     ; preds = %461
  %467 = call signext i16 @ashiftrt_hi_13(i16 signext 0)
  %468 = sext i16 %467 to i32
  %469 = icmp ne i32 %468, 0
  br i1 %469, label %470, label %471

; <label>:470                                     ; preds = %466
  call void @abort() #2
  unreachable

; <label>:471                                     ; preds = %466
  %472 = call signext i16 @ashiftrt_hi_14(i16 signext 0)
  %473 = sext i16 %472 to i32
  %474 = icmp ne i32 %473, 0
  br i1 %474, label %475, label %476

; <label>:475                                     ; preds = %471
  call void @abort() #2
  unreachable

; <label>:476                                     ; preds = %471
  %477 = call signext i16 @ashiftrt_hi_15(i16 signext 0)
  %478 = sext i16 %477 to i32
  %479 = icmp ne i32 %478, 0
  br i1 %479, label %480, label %481

; <label>:480                                     ; preds = %476
  call void @abort() #2
  unreachable

; <label>:481                                     ; preds = %476
  %482 = call i32 @ashift_si_0(i32 -1)
  %483 = icmp ne i32 %482, -1
  br i1 %483, label %484, label %485

; <label>:484                                     ; preds = %481
  call void @abort() #2
  unreachable

; <label>:485                                     ; preds = %481
  %486 = call i32 @ashift_si_1(i32 -1)
  %487 = icmp ne i32 %486, -2
  br i1 %487, label %488, label %489

; <label>:488                                     ; preds = %485
  call void @abort() #2
  unreachable

; <label>:489                                     ; preds = %485
  %490 = call i32 @ashift_si_2(i32 -1)
  %491 = icmp ne i32 %490, -4
  br i1 %491, label %492, label %493

; <label>:492                                     ; preds = %489
  call void @abort() #2
  unreachable

; <label>:493                                     ; preds = %489
  %494 = call i32 @ashift_si_3(i32 -1)
  %495 = icmp ne i32 %494, -8
  br i1 %495, label %496, label %497

; <label>:496                                     ; preds = %493
  call void @abort() #2
  unreachable

; <label>:497                                     ; preds = %493
  %498 = call i32 @ashift_si_4(i32 -1)
  %499 = icmp ne i32 %498, -16
  br i1 %499, label %500, label %501

; <label>:500                                     ; preds = %497
  call void @abort() #2
  unreachable

; <label>:501                                     ; preds = %497
  %502 = call i32 @ashift_si_5(i32 -1)
  %503 = icmp ne i32 %502, -32
  br i1 %503, label %504, label %505

; <label>:504                                     ; preds = %501
  call void @abort() #2
  unreachable

; <label>:505                                     ; preds = %501
  %506 = call i32 @ashift_si_6(i32 -1)
  %507 = icmp ne i32 %506, -64
  br i1 %507, label %508, label %509

; <label>:508                                     ; preds = %505
  call void @abort() #2
  unreachable

; <label>:509                                     ; preds = %505
  %510 = call i32 @ashift_si_7(i32 -1)
  %511 = icmp ne i32 %510, -128
  br i1 %511, label %512, label %513

; <label>:512                                     ; preds = %509
  call void @abort() #2
  unreachable

; <label>:513                                     ; preds = %509
  %514 = call i32 @ashift_si_8(i32 -1)
  %515 = icmp ne i32 %514, -256
  br i1 %515, label %516, label %517

; <label>:516                                     ; preds = %513
  call void @abort() #2
  unreachable

; <label>:517                                     ; preds = %513
  %518 = call i32 @ashift_si_9(i32 -1)
  %519 = icmp ne i32 %518, -512
  br i1 %519, label %520, label %521

; <label>:520                                     ; preds = %517
  call void @abort() #2
  unreachable

; <label>:521                                     ; preds = %517
  %522 = call i32 @ashift_si_10(i32 -1)
  %523 = icmp ne i32 %522, -1024
  br i1 %523, label %524, label %525

; <label>:524                                     ; preds = %521
  call void @abort() #2
  unreachable

; <label>:525                                     ; preds = %521
  %526 = call i32 @ashift_si_11(i32 -1)
  %527 = icmp ne i32 %526, -2048
  br i1 %527, label %528, label %529

; <label>:528                                     ; preds = %525
  call void @abort() #2
  unreachable

; <label>:529                                     ; preds = %525
  %530 = call i32 @ashift_si_12(i32 -1)
  %531 = icmp ne i32 %530, -4096
  br i1 %531, label %532, label %533

; <label>:532                                     ; preds = %529
  call void @abort() #2
  unreachable

; <label>:533                                     ; preds = %529
  %534 = call i32 @ashift_si_13(i32 -1)
  %535 = icmp ne i32 %534, -8192
  br i1 %535, label %536, label %537

; <label>:536                                     ; preds = %533
  call void @abort() #2
  unreachable

; <label>:537                                     ; preds = %533
  %538 = call i32 @ashift_si_14(i32 -1)
  %539 = icmp ne i32 %538, -16384
  br i1 %539, label %540, label %541

; <label>:540                                     ; preds = %537
  call void @abort() #2
  unreachable

; <label>:541                                     ; preds = %537
  %542 = call i32 @ashift_si_15(i32 -1)
  %543 = icmp ne i32 %542, -32768
  br i1 %543, label %544, label %545

; <label>:544                                     ; preds = %541
  call void @abort() #2
  unreachable

; <label>:545                                     ; preds = %541
  %546 = call i32 @ashift_si_16(i32 -1)
  %547 = icmp ne i32 %546, -65536
  br i1 %547, label %548, label %549

; <label>:548                                     ; preds = %545
  call void @abort() #2
  unreachable

; <label>:549                                     ; preds = %545
  %550 = call i32 @ashift_si_17(i32 -1)
  %551 = icmp ne i32 %550, -131072
  br i1 %551, label %552, label %553

; <label>:552                                     ; preds = %549
  call void @abort() #2
  unreachable

; <label>:553                                     ; preds = %549
  %554 = call i32 @ashift_si_18(i32 -1)
  %555 = icmp ne i32 %554, -262144
  br i1 %555, label %556, label %557

; <label>:556                                     ; preds = %553
  call void @abort() #2
  unreachable

; <label>:557                                     ; preds = %553
  %558 = call i32 @ashift_si_19(i32 -1)
  %559 = icmp ne i32 %558, -524288
  br i1 %559, label %560, label %561

; <label>:560                                     ; preds = %557
  call void @abort() #2
  unreachable

; <label>:561                                     ; preds = %557
  %562 = call i32 @ashift_si_20(i32 -1)
  %563 = icmp ne i32 %562, -1048576
  br i1 %563, label %564, label %565

; <label>:564                                     ; preds = %561
  call void @abort() #2
  unreachable

; <label>:565                                     ; preds = %561
  %566 = call i32 @ashift_si_21(i32 -1)
  %567 = icmp ne i32 %566, -2097152
  br i1 %567, label %568, label %569

; <label>:568                                     ; preds = %565
  call void @abort() #2
  unreachable

; <label>:569                                     ; preds = %565
  %570 = call i32 @ashift_si_22(i32 -1)
  %571 = icmp ne i32 %570, -4194304
  br i1 %571, label %572, label %573

; <label>:572                                     ; preds = %569
  call void @abort() #2
  unreachable

; <label>:573                                     ; preds = %569
  %574 = call i32 @ashift_si_23(i32 -1)
  %575 = icmp ne i32 %574, -8388608
  br i1 %575, label %576, label %577

; <label>:576                                     ; preds = %573
  call void @abort() #2
  unreachable

; <label>:577                                     ; preds = %573
  %578 = call i32 @ashift_si_24(i32 -1)
  %579 = icmp ne i32 %578, -16777216
  br i1 %579, label %580, label %581

; <label>:580                                     ; preds = %577
  call void @abort() #2
  unreachable

; <label>:581                                     ; preds = %577
  %582 = call i32 @ashift_si_25(i32 -1)
  %583 = icmp ne i32 %582, -33554432
  br i1 %583, label %584, label %585

; <label>:584                                     ; preds = %581
  call void @abort() #2
  unreachable

; <label>:585                                     ; preds = %581
  %586 = call i32 @ashift_si_26(i32 -1)
  %587 = icmp ne i32 %586, -67108864
  br i1 %587, label %588, label %589

; <label>:588                                     ; preds = %585
  call void @abort() #2
  unreachable

; <label>:589                                     ; preds = %585
  %590 = call i32 @ashift_si_27(i32 -1)
  %591 = icmp ne i32 %590, -134217728
  br i1 %591, label %592, label %593

; <label>:592                                     ; preds = %589
  call void @abort() #2
  unreachable

; <label>:593                                     ; preds = %589
  %594 = call i32 @ashift_si_28(i32 -1)
  %595 = icmp ne i32 %594, -268435456
  br i1 %595, label %596, label %597

; <label>:596                                     ; preds = %593
  call void @abort() #2
  unreachable

; <label>:597                                     ; preds = %593
  %598 = call i32 @ashift_si_29(i32 -1)
  %599 = icmp ne i32 %598, -536870912
  br i1 %599, label %600, label %601

; <label>:600                                     ; preds = %597
  call void @abort() #2
  unreachable

; <label>:601                                     ; preds = %597
  %602 = call i32 @ashift_si_30(i32 -1)
  %603 = icmp ne i32 %602, -1073741824
  br i1 %603, label %604, label %605

; <label>:604                                     ; preds = %601
  call void @abort() #2
  unreachable

; <label>:605                                     ; preds = %601
  %606 = call i32 @ashift_si_31(i32 -1)
  %607 = icmp ne i32 %606, -2147483648
  br i1 %607, label %608, label %609

; <label>:608                                     ; preds = %605
  call void @abort() #2
  unreachable

; <label>:609                                     ; preds = %605
  %610 = call i32 @lshiftrt_si_0(i32 -1)
  %611 = icmp ne i32 %610, -1
  br i1 %611, label %612, label %613

; <label>:612                                     ; preds = %609
  call void @abort() #2
  unreachable

; <label>:613                                     ; preds = %609
  %614 = call i32 @lshiftrt_si_1(i32 -1)
  %615 = icmp ne i32 %614, 2147483647
  br i1 %615, label %616, label %617

; <label>:616                                     ; preds = %613
  call void @abort() #2
  unreachable

; <label>:617                                     ; preds = %613
  %618 = call i32 @lshiftrt_si_2(i32 -1)
  %619 = icmp ne i32 %618, 1073741823
  br i1 %619, label %620, label %621

; <label>:620                                     ; preds = %617
  call void @abort() #2
  unreachable

; <label>:621                                     ; preds = %617
  %622 = call i32 @lshiftrt_si_3(i32 -1)
  %623 = icmp ne i32 %622, 536870911
  br i1 %623, label %624, label %625

; <label>:624                                     ; preds = %621
  call void @abort() #2
  unreachable

; <label>:625                                     ; preds = %621
  %626 = call i32 @lshiftrt_si_4(i32 -1)
  %627 = icmp ne i32 %626, 268435455
  br i1 %627, label %628, label %629

; <label>:628                                     ; preds = %625
  call void @abort() #2
  unreachable

; <label>:629                                     ; preds = %625
  %630 = call i32 @lshiftrt_si_5(i32 -1)
  %631 = icmp ne i32 %630, 134217727
  br i1 %631, label %632, label %633

; <label>:632                                     ; preds = %629
  call void @abort() #2
  unreachable

; <label>:633                                     ; preds = %629
  %634 = call i32 @lshiftrt_si_6(i32 -1)
  %635 = icmp ne i32 %634, 67108863
  br i1 %635, label %636, label %637

; <label>:636                                     ; preds = %633
  call void @abort() #2
  unreachable

; <label>:637                                     ; preds = %633
  %638 = call i32 @lshiftrt_si_7(i32 -1)
  %639 = icmp ne i32 %638, 33554431
  br i1 %639, label %640, label %641

; <label>:640                                     ; preds = %637
  call void @abort() #2
  unreachable

; <label>:641                                     ; preds = %637
  %642 = call i32 @lshiftrt_si_8(i32 -1)
  %643 = icmp ne i32 %642, 16777215
  br i1 %643, label %644, label %645

; <label>:644                                     ; preds = %641
  call void @abort() #2
  unreachable

; <label>:645                                     ; preds = %641
  %646 = call i32 @lshiftrt_si_9(i32 -1)
  %647 = icmp ne i32 %646, 8388607
  br i1 %647, label %648, label %649

; <label>:648                                     ; preds = %645
  call void @abort() #2
  unreachable

; <label>:649                                     ; preds = %645
  %650 = call i32 @lshiftrt_si_10(i32 -1)
  %651 = icmp ne i32 %650, 4194303
  br i1 %651, label %652, label %653

; <label>:652                                     ; preds = %649
  call void @abort() #2
  unreachable

; <label>:653                                     ; preds = %649
  %654 = call i32 @lshiftrt_si_11(i32 -1)
  %655 = icmp ne i32 %654, 2097151
  br i1 %655, label %656, label %657

; <label>:656                                     ; preds = %653
  call void @abort() #2
  unreachable

; <label>:657                                     ; preds = %653
  %658 = call i32 @lshiftrt_si_12(i32 -1)
  %659 = icmp ne i32 %658, 1048575
  br i1 %659, label %660, label %661

; <label>:660                                     ; preds = %657
  call void @abort() #2
  unreachable

; <label>:661                                     ; preds = %657
  %662 = call i32 @lshiftrt_si_13(i32 -1)
  %663 = icmp ne i32 %662, 524287
  br i1 %663, label %664, label %665

; <label>:664                                     ; preds = %661
  call void @abort() #2
  unreachable

; <label>:665                                     ; preds = %661
  %666 = call i32 @lshiftrt_si_14(i32 -1)
  %667 = icmp ne i32 %666, 262143
  br i1 %667, label %668, label %669

; <label>:668                                     ; preds = %665
  call void @abort() #2
  unreachable

; <label>:669                                     ; preds = %665
  %670 = call i32 @lshiftrt_si_15(i32 -1)
  %671 = icmp ne i32 %670, 131071
  br i1 %671, label %672, label %673

; <label>:672                                     ; preds = %669
  call void @abort() #2
  unreachable

; <label>:673                                     ; preds = %669
  %674 = call i32 @lshiftrt_si_16(i32 -1)
  %675 = icmp ne i32 %674, 65535
  br i1 %675, label %676, label %677

; <label>:676                                     ; preds = %673
  call void @abort() #2
  unreachable

; <label>:677                                     ; preds = %673
  %678 = call i32 @lshiftrt_si_17(i32 -1)
  %679 = icmp ne i32 %678, 32767
  br i1 %679, label %680, label %681

; <label>:680                                     ; preds = %677
  call void @abort() #2
  unreachable

; <label>:681                                     ; preds = %677
  %682 = call i32 @lshiftrt_si_18(i32 -1)
  %683 = icmp ne i32 %682, 16383
  br i1 %683, label %684, label %685

; <label>:684                                     ; preds = %681
  call void @abort() #2
  unreachable

; <label>:685                                     ; preds = %681
  %686 = call i32 @lshiftrt_si_19(i32 -1)
  %687 = icmp ne i32 %686, 8191
  br i1 %687, label %688, label %689

; <label>:688                                     ; preds = %685
  call void @abort() #2
  unreachable

; <label>:689                                     ; preds = %685
  %690 = call i32 @lshiftrt_si_20(i32 -1)
  %691 = icmp ne i32 %690, 4095
  br i1 %691, label %692, label %693

; <label>:692                                     ; preds = %689
  call void @abort() #2
  unreachable

; <label>:693                                     ; preds = %689
  %694 = call i32 @lshiftrt_si_21(i32 -1)
  %695 = icmp ne i32 %694, 2047
  br i1 %695, label %696, label %697

; <label>:696                                     ; preds = %693
  call void @abort() #2
  unreachable

; <label>:697                                     ; preds = %693
  %698 = call i32 @lshiftrt_si_22(i32 -1)
  %699 = icmp ne i32 %698, 1023
  br i1 %699, label %700, label %701

; <label>:700                                     ; preds = %697
  call void @abort() #2
  unreachable

; <label>:701                                     ; preds = %697
  %702 = call i32 @lshiftrt_si_23(i32 -1)
  %703 = icmp ne i32 %702, 511
  br i1 %703, label %704, label %705

; <label>:704                                     ; preds = %701
  call void @abort() #2
  unreachable

; <label>:705                                     ; preds = %701
  %706 = call i32 @lshiftrt_si_24(i32 -1)
  %707 = icmp ne i32 %706, 255
  br i1 %707, label %708, label %709

; <label>:708                                     ; preds = %705
  call void @abort() #2
  unreachable

; <label>:709                                     ; preds = %705
  %710 = call i32 @lshiftrt_si_25(i32 -1)
  %711 = icmp ne i32 %710, 127
  br i1 %711, label %712, label %713

; <label>:712                                     ; preds = %709
  call void @abort() #2
  unreachable

; <label>:713                                     ; preds = %709
  %714 = call i32 @lshiftrt_si_26(i32 -1)
  %715 = icmp ne i32 %714, 63
  br i1 %715, label %716, label %717

; <label>:716                                     ; preds = %713
  call void @abort() #2
  unreachable

; <label>:717                                     ; preds = %713
  %718 = call i32 @lshiftrt_si_27(i32 -1)
  %719 = icmp ne i32 %718, 31
  br i1 %719, label %720, label %721

; <label>:720                                     ; preds = %717
  call void @abort() #2
  unreachable

; <label>:721                                     ; preds = %717
  %722 = call i32 @lshiftrt_si_28(i32 -1)
  %723 = icmp ne i32 %722, 15
  br i1 %723, label %724, label %725

; <label>:724                                     ; preds = %721
  call void @abort() #2
  unreachable

; <label>:725                                     ; preds = %721
  %726 = call i32 @lshiftrt_si_29(i32 -1)
  %727 = icmp ne i32 %726, 7
  br i1 %727, label %728, label %729

; <label>:728                                     ; preds = %725
  call void @abort() #2
  unreachable

; <label>:729                                     ; preds = %725
  %730 = call i32 @lshiftrt_si_30(i32 -1)
  %731 = icmp ne i32 %730, 3
  br i1 %731, label %732, label %733

; <label>:732                                     ; preds = %729
  call void @abort() #2
  unreachable

; <label>:733                                     ; preds = %729
  %734 = call i32 @lshiftrt_si_31(i32 -1)
  %735 = icmp ne i32 %734, 1
  br i1 %735, label %736, label %737

; <label>:736                                     ; preds = %733
  call void @abort() #2
  unreachable

; <label>:737                                     ; preds = %733
  %738 = call i32 @ashiftrt_si_0(i32 -1)
  %739 = icmp ne i32 %738, -1
  br i1 %739, label %740, label %741

; <label>:740                                     ; preds = %737
  call void @abort() #2
  unreachable

; <label>:741                                     ; preds = %737
  %742 = call i32 @ashiftrt_si_1(i32 -1)
  %743 = icmp ne i32 %742, -1
  br i1 %743, label %744, label %745

; <label>:744                                     ; preds = %741
  call void @abort() #2
  unreachable

; <label>:745                                     ; preds = %741
  %746 = call i32 @ashiftrt_si_2(i32 -1)
  %747 = icmp ne i32 %746, -1
  br i1 %747, label %748, label %749

; <label>:748                                     ; preds = %745
  call void @abort() #2
  unreachable

; <label>:749                                     ; preds = %745
  %750 = call i32 @ashiftrt_si_3(i32 -1)
  %751 = icmp ne i32 %750, -1
  br i1 %751, label %752, label %753

; <label>:752                                     ; preds = %749
  call void @abort() #2
  unreachable

; <label>:753                                     ; preds = %749
  %754 = call i32 @ashiftrt_si_4(i32 -1)
  %755 = icmp ne i32 %754, -1
  br i1 %755, label %756, label %757

; <label>:756                                     ; preds = %753
  call void @abort() #2
  unreachable

; <label>:757                                     ; preds = %753
  %758 = call i32 @ashiftrt_si_5(i32 -1)
  %759 = icmp ne i32 %758, -1
  br i1 %759, label %760, label %761

; <label>:760                                     ; preds = %757
  call void @abort() #2
  unreachable

; <label>:761                                     ; preds = %757
  %762 = call i32 @ashiftrt_si_6(i32 -1)
  %763 = icmp ne i32 %762, -1
  br i1 %763, label %764, label %765

; <label>:764                                     ; preds = %761
  call void @abort() #2
  unreachable

; <label>:765                                     ; preds = %761
  %766 = call i32 @ashiftrt_si_7(i32 -1)
  %767 = icmp ne i32 %766, -1
  br i1 %767, label %768, label %769

; <label>:768                                     ; preds = %765
  call void @abort() #2
  unreachable

; <label>:769                                     ; preds = %765
  %770 = call i32 @ashiftrt_si_8(i32 -1)
  %771 = icmp ne i32 %770, -1
  br i1 %771, label %772, label %773

; <label>:772                                     ; preds = %769
  call void @abort() #2
  unreachable

; <label>:773                                     ; preds = %769
  %774 = call i32 @ashiftrt_si_9(i32 -1)
  %775 = icmp ne i32 %774, -1
  br i1 %775, label %776, label %777

; <label>:776                                     ; preds = %773
  call void @abort() #2
  unreachable

; <label>:777                                     ; preds = %773
  %778 = call i32 @ashiftrt_si_10(i32 -1)
  %779 = icmp ne i32 %778, -1
  br i1 %779, label %780, label %781

; <label>:780                                     ; preds = %777
  call void @abort() #2
  unreachable

; <label>:781                                     ; preds = %777
  %782 = call i32 @ashiftrt_si_11(i32 -1)
  %783 = icmp ne i32 %782, -1
  br i1 %783, label %784, label %785

; <label>:784                                     ; preds = %781
  call void @abort() #2
  unreachable

; <label>:785                                     ; preds = %781
  %786 = call i32 @ashiftrt_si_12(i32 -1)
  %787 = icmp ne i32 %786, -1
  br i1 %787, label %788, label %789

; <label>:788                                     ; preds = %785
  call void @abort() #2
  unreachable

; <label>:789                                     ; preds = %785
  %790 = call i32 @ashiftrt_si_13(i32 -1)
  %791 = icmp ne i32 %790, -1
  br i1 %791, label %792, label %793

; <label>:792                                     ; preds = %789
  call void @abort() #2
  unreachable

; <label>:793                                     ; preds = %789
  %794 = call i32 @ashiftrt_si_14(i32 -1)
  %795 = icmp ne i32 %794, -1
  br i1 %795, label %796, label %797

; <label>:796                                     ; preds = %793
  call void @abort() #2
  unreachable

; <label>:797                                     ; preds = %793
  %798 = call i32 @ashiftrt_si_15(i32 -1)
  %799 = icmp ne i32 %798, -1
  br i1 %799, label %800, label %801

; <label>:800                                     ; preds = %797
  call void @abort() #2
  unreachable

; <label>:801                                     ; preds = %797
  %802 = call i32 @ashiftrt_si_16(i32 -1)
  %803 = icmp ne i32 %802, -1
  br i1 %803, label %804, label %805

; <label>:804                                     ; preds = %801
  call void @abort() #2
  unreachable

; <label>:805                                     ; preds = %801
  %806 = call i32 @ashiftrt_si_17(i32 -1)
  %807 = icmp ne i32 %806, -1
  br i1 %807, label %808, label %809

; <label>:808                                     ; preds = %805
  call void @abort() #2
  unreachable

; <label>:809                                     ; preds = %805
  %810 = call i32 @ashiftrt_si_18(i32 -1)
  %811 = icmp ne i32 %810, -1
  br i1 %811, label %812, label %813

; <label>:812                                     ; preds = %809
  call void @abort() #2
  unreachable

; <label>:813                                     ; preds = %809
  %814 = call i32 @ashiftrt_si_19(i32 -1)
  %815 = icmp ne i32 %814, -1
  br i1 %815, label %816, label %817

; <label>:816                                     ; preds = %813
  call void @abort() #2
  unreachable

; <label>:817                                     ; preds = %813
  %818 = call i32 @ashiftrt_si_20(i32 -1)
  %819 = icmp ne i32 %818, -1
  br i1 %819, label %820, label %821

; <label>:820                                     ; preds = %817
  call void @abort() #2
  unreachable

; <label>:821                                     ; preds = %817
  %822 = call i32 @ashiftrt_si_21(i32 -1)
  %823 = icmp ne i32 %822, -1
  br i1 %823, label %824, label %825

; <label>:824                                     ; preds = %821
  call void @abort() #2
  unreachable

; <label>:825                                     ; preds = %821
  %826 = call i32 @ashiftrt_si_22(i32 -1)
  %827 = icmp ne i32 %826, -1
  br i1 %827, label %828, label %829

; <label>:828                                     ; preds = %825
  call void @abort() #2
  unreachable

; <label>:829                                     ; preds = %825
  %830 = call i32 @ashiftrt_si_23(i32 -1)
  %831 = icmp ne i32 %830, -1
  br i1 %831, label %832, label %833

; <label>:832                                     ; preds = %829
  call void @abort() #2
  unreachable

; <label>:833                                     ; preds = %829
  %834 = call i32 @ashiftrt_si_24(i32 -1)
  %835 = icmp ne i32 %834, -1
  br i1 %835, label %836, label %837

; <label>:836                                     ; preds = %833
  call void @abort() #2
  unreachable

; <label>:837                                     ; preds = %833
  %838 = call i32 @ashiftrt_si_25(i32 -1)
  %839 = icmp ne i32 %838, -1
  br i1 %839, label %840, label %841

; <label>:840                                     ; preds = %837
  call void @abort() #2
  unreachable

; <label>:841                                     ; preds = %837
  %842 = call i32 @ashiftrt_si_26(i32 -1)
  %843 = icmp ne i32 %842, -1
  br i1 %843, label %844, label %845

; <label>:844                                     ; preds = %841
  call void @abort() #2
  unreachable

; <label>:845                                     ; preds = %841
  %846 = call i32 @ashiftrt_si_27(i32 -1)
  %847 = icmp ne i32 %846, -1
  br i1 %847, label %848, label %849

; <label>:848                                     ; preds = %845
  call void @abort() #2
  unreachable

; <label>:849                                     ; preds = %845
  %850 = call i32 @ashiftrt_si_28(i32 -1)
  %851 = icmp ne i32 %850, -1
  br i1 %851, label %852, label %853

; <label>:852                                     ; preds = %849
  call void @abort() #2
  unreachable

; <label>:853                                     ; preds = %849
  %854 = call i32 @ashiftrt_si_29(i32 -1)
  %855 = icmp ne i32 %854, -1
  br i1 %855, label %856, label %857

; <label>:856                                     ; preds = %853
  call void @abort() #2
  unreachable

; <label>:857                                     ; preds = %853
  %858 = call i32 @ashiftrt_si_30(i32 -1)
  %859 = icmp ne i32 %858, -1
  br i1 %859, label %860, label %861

; <label>:860                                     ; preds = %857
  call void @abort() #2
  unreachable

; <label>:861                                     ; preds = %857
  %862 = call i32 @ashiftrt_si_31(i32 -1)
  %863 = icmp ne i32 %862, -1
  br i1 %863, label %864, label %865

; <label>:864                                     ; preds = %861
  call void @abort() #2
  unreachable

; <label>:865                                     ; preds = %861
  %866 = call i32 @ashiftrt_si_0(i32 0)
  %867 = icmp ne i32 %866, 0
  br i1 %867, label %868, label %869

; <label>:868                                     ; preds = %865
  call void @abort() #2
  unreachable

; <label>:869                                     ; preds = %865
  %870 = call i32 @ashiftrt_si_1(i32 0)
  %871 = icmp ne i32 %870, 0
  br i1 %871, label %872, label %873

; <label>:872                                     ; preds = %869
  call void @abort() #2
  unreachable

; <label>:873                                     ; preds = %869
  %874 = call i32 @ashiftrt_si_2(i32 0)
  %875 = icmp ne i32 %874, 0
  br i1 %875, label %876, label %877

; <label>:876                                     ; preds = %873
  call void @abort() #2
  unreachable

; <label>:877                                     ; preds = %873
  %878 = call i32 @ashiftrt_si_3(i32 0)
  %879 = icmp ne i32 %878, 0
  br i1 %879, label %880, label %881

; <label>:880                                     ; preds = %877
  call void @abort() #2
  unreachable

; <label>:881                                     ; preds = %877
  %882 = call i32 @ashiftrt_si_4(i32 0)
  %883 = icmp ne i32 %882, 0
  br i1 %883, label %884, label %885

; <label>:884                                     ; preds = %881
  call void @abort() #2
  unreachable

; <label>:885                                     ; preds = %881
  %886 = call i32 @ashiftrt_si_5(i32 0)
  %887 = icmp ne i32 %886, 0
  br i1 %887, label %888, label %889

; <label>:888                                     ; preds = %885
  call void @abort() #2
  unreachable

; <label>:889                                     ; preds = %885
  %890 = call i32 @ashiftrt_si_6(i32 0)
  %891 = icmp ne i32 %890, 0
  br i1 %891, label %892, label %893

; <label>:892                                     ; preds = %889
  call void @abort() #2
  unreachable

; <label>:893                                     ; preds = %889
  %894 = call i32 @ashiftrt_si_7(i32 0)
  %895 = icmp ne i32 %894, 0
  br i1 %895, label %896, label %897

; <label>:896                                     ; preds = %893
  call void @abort() #2
  unreachable

; <label>:897                                     ; preds = %893
  %898 = call i32 @ashiftrt_si_8(i32 0)
  %899 = icmp ne i32 %898, 0
  br i1 %899, label %900, label %901

; <label>:900                                     ; preds = %897
  call void @abort() #2
  unreachable

; <label>:901                                     ; preds = %897
  %902 = call i32 @ashiftrt_si_9(i32 0)
  %903 = icmp ne i32 %902, 0
  br i1 %903, label %904, label %905

; <label>:904                                     ; preds = %901
  call void @abort() #2
  unreachable

; <label>:905                                     ; preds = %901
  %906 = call i32 @ashiftrt_si_10(i32 0)
  %907 = icmp ne i32 %906, 0
  br i1 %907, label %908, label %909

; <label>:908                                     ; preds = %905
  call void @abort() #2
  unreachable

; <label>:909                                     ; preds = %905
  %910 = call i32 @ashiftrt_si_11(i32 0)
  %911 = icmp ne i32 %910, 0
  br i1 %911, label %912, label %913

; <label>:912                                     ; preds = %909
  call void @abort() #2
  unreachable

; <label>:913                                     ; preds = %909
  %914 = call i32 @ashiftrt_si_12(i32 0)
  %915 = icmp ne i32 %914, 0
  br i1 %915, label %916, label %917

; <label>:916                                     ; preds = %913
  call void @abort() #2
  unreachable

; <label>:917                                     ; preds = %913
  %918 = call i32 @ashiftrt_si_13(i32 0)
  %919 = icmp ne i32 %918, 0
  br i1 %919, label %920, label %921

; <label>:920                                     ; preds = %917
  call void @abort() #2
  unreachable

; <label>:921                                     ; preds = %917
  %922 = call i32 @ashiftrt_si_14(i32 0)
  %923 = icmp ne i32 %922, 0
  br i1 %923, label %924, label %925

; <label>:924                                     ; preds = %921
  call void @abort() #2
  unreachable

; <label>:925                                     ; preds = %921
  %926 = call i32 @ashiftrt_si_15(i32 0)
  %927 = icmp ne i32 %926, 0
  br i1 %927, label %928, label %929

; <label>:928                                     ; preds = %925
  call void @abort() #2
  unreachable

; <label>:929                                     ; preds = %925
  %930 = call i32 @ashiftrt_si_16(i32 0)
  %931 = icmp ne i32 %930, 0
  br i1 %931, label %932, label %933

; <label>:932                                     ; preds = %929
  call void @abort() #2
  unreachable

; <label>:933                                     ; preds = %929
  %934 = call i32 @ashiftrt_si_17(i32 0)
  %935 = icmp ne i32 %934, 0
  br i1 %935, label %936, label %937

; <label>:936                                     ; preds = %933
  call void @abort() #2
  unreachable

; <label>:937                                     ; preds = %933
  %938 = call i32 @ashiftrt_si_18(i32 0)
  %939 = icmp ne i32 %938, 0
  br i1 %939, label %940, label %941

; <label>:940                                     ; preds = %937
  call void @abort() #2
  unreachable

; <label>:941                                     ; preds = %937
  %942 = call i32 @ashiftrt_si_19(i32 0)
  %943 = icmp ne i32 %942, 0
  br i1 %943, label %944, label %945

; <label>:944                                     ; preds = %941
  call void @abort() #2
  unreachable

; <label>:945                                     ; preds = %941
  %946 = call i32 @ashiftrt_si_20(i32 0)
  %947 = icmp ne i32 %946, 0
  br i1 %947, label %948, label %949

; <label>:948                                     ; preds = %945
  call void @abort() #2
  unreachable

; <label>:949                                     ; preds = %945
  %950 = call i32 @ashiftrt_si_21(i32 0)
  %951 = icmp ne i32 %950, 0
  br i1 %951, label %952, label %953

; <label>:952                                     ; preds = %949
  call void @abort() #2
  unreachable

; <label>:953                                     ; preds = %949
  %954 = call i32 @ashiftrt_si_22(i32 0)
  %955 = icmp ne i32 %954, 0
  br i1 %955, label %956, label %957

; <label>:956                                     ; preds = %953
  call void @abort() #2
  unreachable

; <label>:957                                     ; preds = %953
  %958 = call i32 @ashiftrt_si_23(i32 0)
  %959 = icmp ne i32 %958, 0
  br i1 %959, label %960, label %961

; <label>:960                                     ; preds = %957
  call void @abort() #2
  unreachable

; <label>:961                                     ; preds = %957
  %962 = call i32 @ashiftrt_si_24(i32 0)
  %963 = icmp ne i32 %962, 0
  br i1 %963, label %964, label %965

; <label>:964                                     ; preds = %961
  call void @abort() #2
  unreachable

; <label>:965                                     ; preds = %961
  %966 = call i32 @ashiftrt_si_25(i32 0)
  %967 = icmp ne i32 %966, 0
  br i1 %967, label %968, label %969

; <label>:968                                     ; preds = %965
  call void @abort() #2
  unreachable

; <label>:969                                     ; preds = %965
  %970 = call i32 @ashiftrt_si_26(i32 0)
  %971 = icmp ne i32 %970, 0
  br i1 %971, label %972, label %973

; <label>:972                                     ; preds = %969
  call void @abort() #2
  unreachable

; <label>:973                                     ; preds = %969
  %974 = call i32 @ashiftrt_si_27(i32 0)
  %975 = icmp ne i32 %974, 0
  br i1 %975, label %976, label %977

; <label>:976                                     ; preds = %973
  call void @abort() #2
  unreachable

; <label>:977                                     ; preds = %973
  %978 = call i32 @ashiftrt_si_28(i32 0)
  %979 = icmp ne i32 %978, 0
  br i1 %979, label %980, label %981

; <label>:980                                     ; preds = %977
  call void @abort() #2
  unreachable

; <label>:981                                     ; preds = %977
  %982 = call i32 @ashiftrt_si_29(i32 0)
  %983 = icmp ne i32 %982, 0
  br i1 %983, label %984, label %985

; <label>:984                                     ; preds = %981
  call void @abort() #2
  unreachable

; <label>:985                                     ; preds = %981
  %986 = call i32 @ashiftrt_si_30(i32 0)
  %987 = icmp ne i32 %986, 0
  br i1 %987, label %988, label %989

; <label>:988                                     ; preds = %985
  call void @abort() #2
  unreachable

; <label>:989                                     ; preds = %985
  %990 = call i32 @ashiftrt_si_31(i32 0)
  %991 = icmp ne i32 %990, 0
  br i1 %991, label %992, label %993

; <label>:992                                     ; preds = %989
  call void @abort() #2
  unreachable

; <label>:993                                     ; preds = %989
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %995 = load i32, i32* %1
  ret i32 %995
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
