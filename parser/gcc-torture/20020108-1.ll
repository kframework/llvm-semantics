; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020108-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i8 @ashift_qi_0(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 0
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @ashift_qi_1(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 1
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @ashift_qi_2(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 2
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @ashift_qi_3(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 3
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @ashift_qi_4(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 4
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @ashift_qi_5(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 5
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @ashift_qi_6(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 6
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @ashift_qi_7(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shl = shl i32 %conv, 7
  %conv1 = trunc i32 %shl to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_0(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 0
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_1(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 1
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_2(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 2
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_3(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 3
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_4(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 4
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_5(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 5
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_6(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 6
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i8 @lshiftrt_qi_7(i8 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = zext i8 %tmp to i32
  %shr = ashr i32 %conv, 7
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_0(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 0
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_1(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 1
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_2(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 2
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_3(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 3
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_4(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 4
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_5(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 5
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_6(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 6
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_7(i8 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i8, align 1
  store i8 %n, i8* %n.addr, align 1
  %tmp = load i8* %n.addr, align 1
  %conv = sext i8 %tmp to i32
  %shr = ashr i32 %conv, 7
  %conv1 = trunc i32 %shr to i8
  ret i8 %conv1
}

define zeroext i16 @ashift_hi_0(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 0
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_1(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 1
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_2(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 2
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_3(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 3
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_4(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 4
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_5(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 5
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_6(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 6
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_7(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 7
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_8(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 8
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_9(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 9
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_10(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 10
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_11(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 11
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_12(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 12
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_13(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 13
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_14(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 14
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @ashift_hi_15(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shl = shl i32 %conv, 15
  %conv1 = trunc i32 %shl to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_0(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 0
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_1(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 1
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_2(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 2
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_3(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 3
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_4(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 4
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_5(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 5
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_6(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 6
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_7(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 7
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_8(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 8
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_9(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 9
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_10(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 10
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_11(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 11
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_12(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 12
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_13(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 13
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_14(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 14
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define zeroext i16 @lshiftrt_hi_15(i16 zeroext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = zext i16 %tmp to i32
  %shr = ashr i32 %conv, 15
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_0(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 0
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_1(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 1
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_2(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 2
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_3(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 3
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_4(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 4
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_5(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 5
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_6(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 6
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_7(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 7
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_8(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 8
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_9(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 9
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_10(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 10
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_11(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 11
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_12(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 12
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_13(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 13
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_14(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 14
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_15(i16 signext %n) nounwind uwtable {
entry:
  %n.addr = alloca i16, align 2
  store i16 %n, i16* %n.addr, align 2
  %tmp = load i16* %n.addr, align 2
  %conv = sext i16 %tmp to i32
  %shr = ashr i32 %conv, 15
  %conv1 = trunc i32 %shr to i16
  ret i16 %conv1
}

define i32 @ashift_si_0(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 0
  ret i32 %shl
}

define i32 @ashift_si_1(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 1
  ret i32 %shl
}

define i32 @ashift_si_2(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 2
  ret i32 %shl
}

define i32 @ashift_si_3(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 3
  ret i32 %shl
}

define i32 @ashift_si_4(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 4
  ret i32 %shl
}

define i32 @ashift_si_5(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 5
  ret i32 %shl
}

define i32 @ashift_si_6(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 6
  ret i32 %shl
}

define i32 @ashift_si_7(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 7
  ret i32 %shl
}

define i32 @ashift_si_8(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 8
  ret i32 %shl
}

define i32 @ashift_si_9(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 9
  ret i32 %shl
}

define i32 @ashift_si_10(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 10
  ret i32 %shl
}

define i32 @ashift_si_11(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 11
  ret i32 %shl
}

define i32 @ashift_si_12(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 12
  ret i32 %shl
}

define i32 @ashift_si_13(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 13
  ret i32 %shl
}

define i32 @ashift_si_14(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 14
  ret i32 %shl
}

define i32 @ashift_si_15(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 15
  ret i32 %shl
}

define i32 @ashift_si_16(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 16
  ret i32 %shl
}

define i32 @ashift_si_17(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 17
  ret i32 %shl
}

define i32 @ashift_si_18(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 18
  ret i32 %shl
}

define i32 @ashift_si_19(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 19
  ret i32 %shl
}

define i32 @ashift_si_20(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 20
  ret i32 %shl
}

define i32 @ashift_si_21(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 21
  ret i32 %shl
}

define i32 @ashift_si_22(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 22
  ret i32 %shl
}

define i32 @ashift_si_23(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 23
  ret i32 %shl
}

define i32 @ashift_si_24(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 24
  ret i32 %shl
}

define i32 @ashift_si_25(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 25
  ret i32 %shl
}

define i32 @ashift_si_26(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 26
  ret i32 %shl
}

define i32 @ashift_si_27(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 27
  ret i32 %shl
}

define i32 @ashift_si_28(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 28
  ret i32 %shl
}

define i32 @ashift_si_29(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 29
  ret i32 %shl
}

define i32 @ashift_si_30(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 30
  ret i32 %shl
}

define i32 @ashift_si_31(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shl = shl i32 %tmp, 31
  ret i32 %shl
}

define i32 @lshiftrt_si_0(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 0
  ret i32 %shr
}

define i32 @lshiftrt_si_1(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 1
  ret i32 %shr
}

define i32 @lshiftrt_si_2(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 2
  ret i32 %shr
}

define i32 @lshiftrt_si_3(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 3
  ret i32 %shr
}

define i32 @lshiftrt_si_4(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 4
  ret i32 %shr
}

define i32 @lshiftrt_si_5(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 5
  ret i32 %shr
}

define i32 @lshiftrt_si_6(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 6
  ret i32 %shr
}

define i32 @lshiftrt_si_7(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 7
  ret i32 %shr
}

define i32 @lshiftrt_si_8(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 8
  ret i32 %shr
}

define i32 @lshiftrt_si_9(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 9
  ret i32 %shr
}

define i32 @lshiftrt_si_10(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 10
  ret i32 %shr
}

define i32 @lshiftrt_si_11(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 11
  ret i32 %shr
}

define i32 @lshiftrt_si_12(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 12
  ret i32 %shr
}

define i32 @lshiftrt_si_13(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 13
  ret i32 %shr
}

define i32 @lshiftrt_si_14(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 14
  ret i32 %shr
}

define i32 @lshiftrt_si_15(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 15
  ret i32 %shr
}

define i32 @lshiftrt_si_16(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 16
  ret i32 %shr
}

define i32 @lshiftrt_si_17(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 17
  ret i32 %shr
}

define i32 @lshiftrt_si_18(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 18
  ret i32 %shr
}

define i32 @lshiftrt_si_19(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 19
  ret i32 %shr
}

define i32 @lshiftrt_si_20(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 20
  ret i32 %shr
}

define i32 @lshiftrt_si_21(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 21
  ret i32 %shr
}

define i32 @lshiftrt_si_22(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 22
  ret i32 %shr
}

define i32 @lshiftrt_si_23(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 23
  ret i32 %shr
}

define i32 @lshiftrt_si_24(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 24
  ret i32 %shr
}

define i32 @lshiftrt_si_25(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 25
  ret i32 %shr
}

define i32 @lshiftrt_si_26(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 26
  ret i32 %shr
}

define i32 @lshiftrt_si_27(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 27
  ret i32 %shr
}

define i32 @lshiftrt_si_28(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 28
  ret i32 %shr
}

define i32 @lshiftrt_si_29(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 29
  ret i32 %shr
}

define i32 @lshiftrt_si_30(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 30
  ret i32 %shr
}

define i32 @lshiftrt_si_31(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = lshr i32 %tmp, 31
  ret i32 %shr
}

define i32 @ashiftrt_si_0(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 0
  ret i32 %shr
}

define i32 @ashiftrt_si_1(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 1
  ret i32 %shr
}

define i32 @ashiftrt_si_2(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 2
  ret i32 %shr
}

define i32 @ashiftrt_si_3(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 3
  ret i32 %shr
}

define i32 @ashiftrt_si_4(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 4
  ret i32 %shr
}

define i32 @ashiftrt_si_5(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 5
  ret i32 %shr
}

define i32 @ashiftrt_si_6(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 6
  ret i32 %shr
}

define i32 @ashiftrt_si_7(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 7
  ret i32 %shr
}

define i32 @ashiftrt_si_8(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 8
  ret i32 %shr
}

define i32 @ashiftrt_si_9(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 9
  ret i32 %shr
}

define i32 @ashiftrt_si_10(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 10
  ret i32 %shr
}

define i32 @ashiftrt_si_11(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 11
  ret i32 %shr
}

define i32 @ashiftrt_si_12(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 12
  ret i32 %shr
}

define i32 @ashiftrt_si_13(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 13
  ret i32 %shr
}

define i32 @ashiftrt_si_14(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 14
  ret i32 %shr
}

define i32 @ashiftrt_si_15(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 15
  ret i32 %shr
}

define i32 @ashiftrt_si_16(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 16
  ret i32 %shr
}

define i32 @ashiftrt_si_17(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 17
  ret i32 %shr
}

define i32 @ashiftrt_si_18(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 18
  ret i32 %shr
}

define i32 @ashiftrt_si_19(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 19
  ret i32 %shr
}

define i32 @ashiftrt_si_20(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 20
  ret i32 %shr
}

define i32 @ashiftrt_si_21(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 21
  ret i32 %shr
}

define i32 @ashiftrt_si_22(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 22
  ret i32 %shr
}

define i32 @ashiftrt_si_23(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 23
  ret i32 %shr
}

define i32 @ashiftrt_si_24(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 24
  ret i32 %shr
}

define i32 @ashiftrt_si_25(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 25
  ret i32 %shr
}

define i32 @ashiftrt_si_26(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 26
  ret i32 %shr
}

define i32 @ashiftrt_si_27(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 27
  ret i32 %shr
}

define i32 @ashiftrt_si_28(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 28
  ret i32 %shr
}

define i32 @ashiftrt_si_29(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 29
  ret i32 %shr
}

define i32 @ashiftrt_si_30(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 30
  ret i32 %shr
}

define i32 @ashiftrt_si_31(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* %n.addr, align 4
  %shr = ashr i32 %tmp, 31
  ret i32 %shr
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call zeroext i8 @ashift_qi_0(i8 zeroext -1)
  %conv = zext i8 %call to i32
  %cmp = icmp ne i32 %conv, 255
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %call2 = call zeroext i8 @ashift_qi_1(i8 zeroext -1)
  %conv3 = zext i8 %call2 to i32
  %cmp4 = icmp ne i32 %conv3, 254
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end7:                                          ; preds = %if.end
  %call8 = call zeroext i8 @ashift_qi_2(i8 zeroext -1)
  %conv9 = zext i8 %call8 to i32
  %cmp10 = icmp ne i32 %conv9, 252
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  call void @abort() noreturn
  unreachable

if.end13:                                         ; preds = %if.end7
  %call14 = call zeroext i8 @ashift_qi_3(i8 zeroext -1)
  %conv15 = zext i8 %call14 to i32
  %cmp16 = icmp ne i32 %conv15, 248
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end13
  call void @abort() noreturn
  unreachable

if.end19:                                         ; preds = %if.end13
  %call20 = call zeroext i8 @ashift_qi_4(i8 zeroext -1)
  %conv21 = zext i8 %call20 to i32
  %cmp22 = icmp ne i32 %conv21, 240
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end19
  call void @abort() noreturn
  unreachable

if.end25:                                         ; preds = %if.end19
  %call26 = call zeroext i8 @ashift_qi_5(i8 zeroext -1)
  %conv27 = zext i8 %call26 to i32
  %cmp28 = icmp ne i32 %conv27, 224
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end25
  call void @abort() noreturn
  unreachable

if.end31:                                         ; preds = %if.end25
  %call32 = call zeroext i8 @ashift_qi_6(i8 zeroext -1)
  %conv33 = zext i8 %call32 to i32
  %cmp34 = icmp ne i32 %conv33, 192
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end31
  call void @abort() noreturn
  unreachable

if.end37:                                         ; preds = %if.end31
  %call38 = call zeroext i8 @ashift_qi_7(i8 zeroext -1)
  %conv39 = zext i8 %call38 to i32
  %cmp40 = icmp ne i32 %conv39, 128
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end37
  call void @abort() noreturn
  unreachable

if.end43:                                         ; preds = %if.end37
  %call44 = call zeroext i8 @lshiftrt_qi_0(i8 zeroext -1)
  %conv45 = zext i8 %call44 to i32
  %cmp46 = icmp ne i32 %conv45, 255
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end43
  call void @abort() noreturn
  unreachable

if.end49:                                         ; preds = %if.end43
  %call50 = call zeroext i8 @lshiftrt_qi_1(i8 zeroext -1)
  %conv51 = zext i8 %call50 to i32
  %cmp52 = icmp ne i32 %conv51, 127
  br i1 %cmp52, label %if.then54, label %if.end55

if.then54:                                        ; preds = %if.end49
  call void @abort() noreturn
  unreachable

if.end55:                                         ; preds = %if.end49
  %call56 = call zeroext i8 @lshiftrt_qi_2(i8 zeroext -1)
  %conv57 = zext i8 %call56 to i32
  %cmp58 = icmp ne i32 %conv57, 63
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end55
  call void @abort() noreturn
  unreachable

if.end61:                                         ; preds = %if.end55
  %call62 = call zeroext i8 @lshiftrt_qi_3(i8 zeroext -1)
  %conv63 = zext i8 %call62 to i32
  %cmp64 = icmp ne i32 %conv63, 31
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end61
  call void @abort() noreturn
  unreachable

if.end67:                                         ; preds = %if.end61
  %call68 = call zeroext i8 @lshiftrt_qi_4(i8 zeroext -1)
  %conv69 = zext i8 %call68 to i32
  %cmp70 = icmp ne i32 %conv69, 15
  br i1 %cmp70, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.end67
  call void @abort() noreturn
  unreachable

if.end73:                                         ; preds = %if.end67
  %call74 = call zeroext i8 @lshiftrt_qi_5(i8 zeroext -1)
  %conv75 = zext i8 %call74 to i32
  %cmp76 = icmp ne i32 %conv75, 7
  br i1 %cmp76, label %if.then78, label %if.end79

if.then78:                                        ; preds = %if.end73
  call void @abort() noreturn
  unreachable

if.end79:                                         ; preds = %if.end73
  %call80 = call zeroext i8 @lshiftrt_qi_6(i8 zeroext -1)
  %conv81 = zext i8 %call80 to i32
  %cmp82 = icmp ne i32 %conv81, 3
  br i1 %cmp82, label %if.then84, label %if.end85

if.then84:                                        ; preds = %if.end79
  call void @abort() noreturn
  unreachable

if.end85:                                         ; preds = %if.end79
  %call86 = call zeroext i8 @lshiftrt_qi_7(i8 zeroext -1)
  %conv87 = zext i8 %call86 to i32
  %cmp88 = icmp ne i32 %conv87, 1
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end85
  call void @abort() noreturn
  unreachable

if.end91:                                         ; preds = %if.end85
  %call92 = call signext i8 @ashiftrt_qi_0(i8 signext -1)
  %conv93 = sext i8 %call92 to i32
  %cmp94 = icmp ne i32 %conv93, -1
  br i1 %cmp94, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.end91
  call void @abort() noreturn
  unreachable

if.end97:                                         ; preds = %if.end91
  %call98 = call signext i8 @ashiftrt_qi_1(i8 signext -1)
  %conv99 = sext i8 %call98 to i32
  %cmp100 = icmp ne i32 %conv99, -1
  br i1 %cmp100, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.end97
  call void @abort() noreturn
  unreachable

if.end103:                                        ; preds = %if.end97
  %call104 = call signext i8 @ashiftrt_qi_2(i8 signext -1)
  %conv105 = sext i8 %call104 to i32
  %cmp106 = icmp ne i32 %conv105, -1
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %if.end103
  call void @abort() noreturn
  unreachable

if.end109:                                        ; preds = %if.end103
  %call110 = call signext i8 @ashiftrt_qi_3(i8 signext -1)
  %conv111 = sext i8 %call110 to i32
  %cmp112 = icmp ne i32 %conv111, -1
  br i1 %cmp112, label %if.then114, label %if.end115

if.then114:                                       ; preds = %if.end109
  call void @abort() noreturn
  unreachable

if.end115:                                        ; preds = %if.end109
  %call116 = call signext i8 @ashiftrt_qi_4(i8 signext -1)
  %conv117 = sext i8 %call116 to i32
  %cmp118 = icmp ne i32 %conv117, -1
  br i1 %cmp118, label %if.then120, label %if.end121

if.then120:                                       ; preds = %if.end115
  call void @abort() noreturn
  unreachable

if.end121:                                        ; preds = %if.end115
  %call122 = call signext i8 @ashiftrt_qi_5(i8 signext -1)
  %conv123 = sext i8 %call122 to i32
  %cmp124 = icmp ne i32 %conv123, -1
  br i1 %cmp124, label %if.then126, label %if.end127

if.then126:                                       ; preds = %if.end121
  call void @abort() noreturn
  unreachable

if.end127:                                        ; preds = %if.end121
  %call128 = call signext i8 @ashiftrt_qi_6(i8 signext -1)
  %conv129 = sext i8 %call128 to i32
  %cmp130 = icmp ne i32 %conv129, -1
  br i1 %cmp130, label %if.then132, label %if.end133

if.then132:                                       ; preds = %if.end127
  call void @abort() noreturn
  unreachable

if.end133:                                        ; preds = %if.end127
  %call134 = call signext i8 @ashiftrt_qi_7(i8 signext -1)
  %conv135 = sext i8 %call134 to i32
  %cmp136 = icmp ne i32 %conv135, -1
  br i1 %cmp136, label %if.then138, label %if.end139

if.then138:                                       ; preds = %if.end133
  call void @abort() noreturn
  unreachable

if.end139:                                        ; preds = %if.end133
  %call140 = call signext i8 @ashiftrt_qi_0(i8 signext 0)
  %conv141 = sext i8 %call140 to i32
  %cmp142 = icmp ne i32 %conv141, 0
  br i1 %cmp142, label %if.then144, label %if.end145

if.then144:                                       ; preds = %if.end139
  call void @abort() noreturn
  unreachable

if.end145:                                        ; preds = %if.end139
  %call146 = call signext i8 @ashiftrt_qi_1(i8 signext 0)
  %conv147 = sext i8 %call146 to i32
  %cmp148 = icmp ne i32 %conv147, 0
  br i1 %cmp148, label %if.then150, label %if.end151

if.then150:                                       ; preds = %if.end145
  call void @abort() noreturn
  unreachable

if.end151:                                        ; preds = %if.end145
  %call152 = call signext i8 @ashiftrt_qi_2(i8 signext 0)
  %conv153 = sext i8 %call152 to i32
  %cmp154 = icmp ne i32 %conv153, 0
  br i1 %cmp154, label %if.then156, label %if.end157

if.then156:                                       ; preds = %if.end151
  call void @abort() noreturn
  unreachable

if.end157:                                        ; preds = %if.end151
  %call158 = call signext i8 @ashiftrt_qi_3(i8 signext 0)
  %conv159 = sext i8 %call158 to i32
  %cmp160 = icmp ne i32 %conv159, 0
  br i1 %cmp160, label %if.then162, label %if.end163

if.then162:                                       ; preds = %if.end157
  call void @abort() noreturn
  unreachable

if.end163:                                        ; preds = %if.end157
  %call164 = call signext i8 @ashiftrt_qi_4(i8 signext 0)
  %conv165 = sext i8 %call164 to i32
  %cmp166 = icmp ne i32 %conv165, 0
  br i1 %cmp166, label %if.then168, label %if.end169

if.then168:                                       ; preds = %if.end163
  call void @abort() noreturn
  unreachable

if.end169:                                        ; preds = %if.end163
  %call170 = call signext i8 @ashiftrt_qi_5(i8 signext 0)
  %conv171 = sext i8 %call170 to i32
  %cmp172 = icmp ne i32 %conv171, 0
  br i1 %cmp172, label %if.then174, label %if.end175

if.then174:                                       ; preds = %if.end169
  call void @abort() noreturn
  unreachable

if.end175:                                        ; preds = %if.end169
  %call176 = call signext i8 @ashiftrt_qi_6(i8 signext 0)
  %conv177 = sext i8 %call176 to i32
  %cmp178 = icmp ne i32 %conv177, 0
  br i1 %cmp178, label %if.then180, label %if.end181

if.then180:                                       ; preds = %if.end175
  call void @abort() noreturn
  unreachable

if.end181:                                        ; preds = %if.end175
  %call182 = call signext i8 @ashiftrt_qi_7(i8 signext 0)
  %conv183 = sext i8 %call182 to i32
  %cmp184 = icmp ne i32 %conv183, 0
  br i1 %cmp184, label %if.then186, label %if.end187

if.then186:                                       ; preds = %if.end181
  call void @abort() noreturn
  unreachable

if.end187:                                        ; preds = %if.end181
  %call188 = call zeroext i16 @ashift_hi_0(i16 zeroext -1)
  %conv189 = zext i16 %call188 to i32
  %cmp190 = icmp ne i32 %conv189, 65535
  br i1 %cmp190, label %if.then192, label %if.end193

if.then192:                                       ; preds = %if.end187
  call void @abort() noreturn
  unreachable

if.end193:                                        ; preds = %if.end187
  %call194 = call zeroext i16 @ashift_hi_1(i16 zeroext -1)
  %conv195 = zext i16 %call194 to i32
  %cmp196 = icmp ne i32 %conv195, 65534
  br i1 %cmp196, label %if.then198, label %if.end199

if.then198:                                       ; preds = %if.end193
  call void @abort() noreturn
  unreachable

if.end199:                                        ; preds = %if.end193
  %call200 = call zeroext i16 @ashift_hi_2(i16 zeroext -1)
  %conv201 = zext i16 %call200 to i32
  %cmp202 = icmp ne i32 %conv201, 65532
  br i1 %cmp202, label %if.then204, label %if.end205

if.then204:                                       ; preds = %if.end199
  call void @abort() noreturn
  unreachable

if.end205:                                        ; preds = %if.end199
  %call206 = call zeroext i16 @ashift_hi_3(i16 zeroext -1)
  %conv207 = zext i16 %call206 to i32
  %cmp208 = icmp ne i32 %conv207, 65528
  br i1 %cmp208, label %if.then210, label %if.end211

if.then210:                                       ; preds = %if.end205
  call void @abort() noreturn
  unreachable

if.end211:                                        ; preds = %if.end205
  %call212 = call zeroext i16 @ashift_hi_4(i16 zeroext -1)
  %conv213 = zext i16 %call212 to i32
  %cmp214 = icmp ne i32 %conv213, 65520
  br i1 %cmp214, label %if.then216, label %if.end217

if.then216:                                       ; preds = %if.end211
  call void @abort() noreturn
  unreachable

if.end217:                                        ; preds = %if.end211
  %call218 = call zeroext i16 @ashift_hi_5(i16 zeroext -1)
  %conv219 = zext i16 %call218 to i32
  %cmp220 = icmp ne i32 %conv219, 65504
  br i1 %cmp220, label %if.then222, label %if.end223

if.then222:                                       ; preds = %if.end217
  call void @abort() noreturn
  unreachable

if.end223:                                        ; preds = %if.end217
  %call224 = call zeroext i16 @ashift_hi_6(i16 zeroext -1)
  %conv225 = zext i16 %call224 to i32
  %cmp226 = icmp ne i32 %conv225, 65472
  br i1 %cmp226, label %if.then228, label %if.end229

if.then228:                                       ; preds = %if.end223
  call void @abort() noreturn
  unreachable

if.end229:                                        ; preds = %if.end223
  %call230 = call zeroext i16 @ashift_hi_7(i16 zeroext -1)
  %conv231 = zext i16 %call230 to i32
  %cmp232 = icmp ne i32 %conv231, 65408
  br i1 %cmp232, label %if.then234, label %if.end235

if.then234:                                       ; preds = %if.end229
  call void @abort() noreturn
  unreachable

if.end235:                                        ; preds = %if.end229
  %call236 = call zeroext i16 @ashift_hi_8(i16 zeroext -1)
  %conv237 = zext i16 %call236 to i32
  %cmp238 = icmp ne i32 %conv237, 65280
  br i1 %cmp238, label %if.then240, label %if.end241

if.then240:                                       ; preds = %if.end235
  call void @abort() noreturn
  unreachable

if.end241:                                        ; preds = %if.end235
  %call242 = call zeroext i16 @ashift_hi_9(i16 zeroext -1)
  %conv243 = zext i16 %call242 to i32
  %cmp244 = icmp ne i32 %conv243, 65024
  br i1 %cmp244, label %if.then246, label %if.end247

if.then246:                                       ; preds = %if.end241
  call void @abort() noreturn
  unreachable

if.end247:                                        ; preds = %if.end241
  %call248 = call zeroext i16 @ashift_hi_10(i16 zeroext -1)
  %conv249 = zext i16 %call248 to i32
  %cmp250 = icmp ne i32 %conv249, 64512
  br i1 %cmp250, label %if.then252, label %if.end253

if.then252:                                       ; preds = %if.end247
  call void @abort() noreturn
  unreachable

if.end253:                                        ; preds = %if.end247
  %call254 = call zeroext i16 @ashift_hi_11(i16 zeroext -1)
  %conv255 = zext i16 %call254 to i32
  %cmp256 = icmp ne i32 %conv255, 63488
  br i1 %cmp256, label %if.then258, label %if.end259

if.then258:                                       ; preds = %if.end253
  call void @abort() noreturn
  unreachable

if.end259:                                        ; preds = %if.end253
  %call260 = call zeroext i16 @ashift_hi_12(i16 zeroext -1)
  %conv261 = zext i16 %call260 to i32
  %cmp262 = icmp ne i32 %conv261, 61440
  br i1 %cmp262, label %if.then264, label %if.end265

if.then264:                                       ; preds = %if.end259
  call void @abort() noreturn
  unreachable

if.end265:                                        ; preds = %if.end259
  %call266 = call zeroext i16 @ashift_hi_13(i16 zeroext -1)
  %conv267 = zext i16 %call266 to i32
  %cmp268 = icmp ne i32 %conv267, 57344
  br i1 %cmp268, label %if.then270, label %if.end271

if.then270:                                       ; preds = %if.end265
  call void @abort() noreturn
  unreachable

if.end271:                                        ; preds = %if.end265
  %call272 = call zeroext i16 @ashift_hi_14(i16 zeroext -1)
  %conv273 = zext i16 %call272 to i32
  %cmp274 = icmp ne i32 %conv273, 49152
  br i1 %cmp274, label %if.then276, label %if.end277

if.then276:                                       ; preds = %if.end271
  call void @abort() noreturn
  unreachable

if.end277:                                        ; preds = %if.end271
  %call278 = call zeroext i16 @ashift_hi_15(i16 zeroext -1)
  %conv279 = zext i16 %call278 to i32
  %cmp280 = icmp ne i32 %conv279, 32768
  br i1 %cmp280, label %if.then282, label %if.end283

if.then282:                                       ; preds = %if.end277
  call void @abort() noreturn
  unreachable

if.end283:                                        ; preds = %if.end277
  %call284 = call zeroext i16 @lshiftrt_hi_0(i16 zeroext -1)
  %conv285 = zext i16 %call284 to i32
  %cmp286 = icmp ne i32 %conv285, 65535
  br i1 %cmp286, label %if.then288, label %if.end289

if.then288:                                       ; preds = %if.end283
  call void @abort() noreturn
  unreachable

if.end289:                                        ; preds = %if.end283
  %call290 = call zeroext i16 @lshiftrt_hi_1(i16 zeroext -1)
  %conv291 = zext i16 %call290 to i32
  %cmp292 = icmp ne i32 %conv291, 32767
  br i1 %cmp292, label %if.then294, label %if.end295

if.then294:                                       ; preds = %if.end289
  call void @abort() noreturn
  unreachable

if.end295:                                        ; preds = %if.end289
  %call296 = call zeroext i16 @lshiftrt_hi_2(i16 zeroext -1)
  %conv297 = zext i16 %call296 to i32
  %cmp298 = icmp ne i32 %conv297, 16383
  br i1 %cmp298, label %if.then300, label %if.end301

if.then300:                                       ; preds = %if.end295
  call void @abort() noreturn
  unreachable

if.end301:                                        ; preds = %if.end295
  %call302 = call zeroext i16 @lshiftrt_hi_3(i16 zeroext -1)
  %conv303 = zext i16 %call302 to i32
  %cmp304 = icmp ne i32 %conv303, 8191
  br i1 %cmp304, label %if.then306, label %if.end307

if.then306:                                       ; preds = %if.end301
  call void @abort() noreturn
  unreachable

if.end307:                                        ; preds = %if.end301
  %call308 = call zeroext i16 @lshiftrt_hi_4(i16 zeroext -1)
  %conv309 = zext i16 %call308 to i32
  %cmp310 = icmp ne i32 %conv309, 4095
  br i1 %cmp310, label %if.then312, label %if.end313

if.then312:                                       ; preds = %if.end307
  call void @abort() noreturn
  unreachable

if.end313:                                        ; preds = %if.end307
  %call314 = call zeroext i16 @lshiftrt_hi_5(i16 zeroext -1)
  %conv315 = zext i16 %call314 to i32
  %cmp316 = icmp ne i32 %conv315, 2047
  br i1 %cmp316, label %if.then318, label %if.end319

if.then318:                                       ; preds = %if.end313
  call void @abort() noreturn
  unreachable

if.end319:                                        ; preds = %if.end313
  %call320 = call zeroext i16 @lshiftrt_hi_6(i16 zeroext -1)
  %conv321 = zext i16 %call320 to i32
  %cmp322 = icmp ne i32 %conv321, 1023
  br i1 %cmp322, label %if.then324, label %if.end325

if.then324:                                       ; preds = %if.end319
  call void @abort() noreturn
  unreachable

if.end325:                                        ; preds = %if.end319
  %call326 = call zeroext i16 @lshiftrt_hi_7(i16 zeroext -1)
  %conv327 = zext i16 %call326 to i32
  %cmp328 = icmp ne i32 %conv327, 511
  br i1 %cmp328, label %if.then330, label %if.end331

if.then330:                                       ; preds = %if.end325
  call void @abort() noreturn
  unreachable

if.end331:                                        ; preds = %if.end325
  %call332 = call zeroext i16 @lshiftrt_hi_8(i16 zeroext -1)
  %conv333 = zext i16 %call332 to i32
  %cmp334 = icmp ne i32 %conv333, 255
  br i1 %cmp334, label %if.then336, label %if.end337

if.then336:                                       ; preds = %if.end331
  call void @abort() noreturn
  unreachable

if.end337:                                        ; preds = %if.end331
  %call338 = call zeroext i16 @lshiftrt_hi_9(i16 zeroext -1)
  %conv339 = zext i16 %call338 to i32
  %cmp340 = icmp ne i32 %conv339, 127
  br i1 %cmp340, label %if.then342, label %if.end343

if.then342:                                       ; preds = %if.end337
  call void @abort() noreturn
  unreachable

if.end343:                                        ; preds = %if.end337
  %call344 = call zeroext i16 @lshiftrt_hi_10(i16 zeroext -1)
  %conv345 = zext i16 %call344 to i32
  %cmp346 = icmp ne i32 %conv345, 63
  br i1 %cmp346, label %if.then348, label %if.end349

if.then348:                                       ; preds = %if.end343
  call void @abort() noreturn
  unreachable

if.end349:                                        ; preds = %if.end343
  %call350 = call zeroext i16 @lshiftrt_hi_11(i16 zeroext -1)
  %conv351 = zext i16 %call350 to i32
  %cmp352 = icmp ne i32 %conv351, 31
  br i1 %cmp352, label %if.then354, label %if.end355

if.then354:                                       ; preds = %if.end349
  call void @abort() noreturn
  unreachable

if.end355:                                        ; preds = %if.end349
  %call356 = call zeroext i16 @lshiftrt_hi_12(i16 zeroext -1)
  %conv357 = zext i16 %call356 to i32
  %cmp358 = icmp ne i32 %conv357, 15
  br i1 %cmp358, label %if.then360, label %if.end361

if.then360:                                       ; preds = %if.end355
  call void @abort() noreturn
  unreachable

if.end361:                                        ; preds = %if.end355
  %call362 = call zeroext i16 @lshiftrt_hi_13(i16 zeroext -1)
  %conv363 = zext i16 %call362 to i32
  %cmp364 = icmp ne i32 %conv363, 7
  br i1 %cmp364, label %if.then366, label %if.end367

if.then366:                                       ; preds = %if.end361
  call void @abort() noreturn
  unreachable

if.end367:                                        ; preds = %if.end361
  %call368 = call zeroext i16 @lshiftrt_hi_14(i16 zeroext -1)
  %conv369 = zext i16 %call368 to i32
  %cmp370 = icmp ne i32 %conv369, 3
  br i1 %cmp370, label %if.then372, label %if.end373

if.then372:                                       ; preds = %if.end367
  call void @abort() noreturn
  unreachable

if.end373:                                        ; preds = %if.end367
  %call374 = call zeroext i16 @lshiftrt_hi_15(i16 zeroext -1)
  %conv375 = zext i16 %call374 to i32
  %cmp376 = icmp ne i32 %conv375, 1
  br i1 %cmp376, label %if.then378, label %if.end379

if.then378:                                       ; preds = %if.end373
  call void @abort() noreturn
  unreachable

if.end379:                                        ; preds = %if.end373
  %call380 = call signext i16 @ashiftrt_hi_0(i16 signext -1)
  %conv381 = sext i16 %call380 to i32
  %cmp382 = icmp ne i32 %conv381, -1
  br i1 %cmp382, label %if.then384, label %if.end385

if.then384:                                       ; preds = %if.end379
  call void @abort() noreturn
  unreachable

if.end385:                                        ; preds = %if.end379
  %call386 = call signext i16 @ashiftrt_hi_1(i16 signext -1)
  %conv387 = sext i16 %call386 to i32
  %cmp388 = icmp ne i32 %conv387, -1
  br i1 %cmp388, label %if.then390, label %if.end391

if.then390:                                       ; preds = %if.end385
  call void @abort() noreturn
  unreachable

if.end391:                                        ; preds = %if.end385
  %call392 = call signext i16 @ashiftrt_hi_2(i16 signext -1)
  %conv393 = sext i16 %call392 to i32
  %cmp394 = icmp ne i32 %conv393, -1
  br i1 %cmp394, label %if.then396, label %if.end397

if.then396:                                       ; preds = %if.end391
  call void @abort() noreturn
  unreachable

if.end397:                                        ; preds = %if.end391
  %call398 = call signext i16 @ashiftrt_hi_3(i16 signext -1)
  %conv399 = sext i16 %call398 to i32
  %cmp400 = icmp ne i32 %conv399, -1
  br i1 %cmp400, label %if.then402, label %if.end403

if.then402:                                       ; preds = %if.end397
  call void @abort() noreturn
  unreachable

if.end403:                                        ; preds = %if.end397
  %call404 = call signext i16 @ashiftrt_hi_4(i16 signext -1)
  %conv405 = sext i16 %call404 to i32
  %cmp406 = icmp ne i32 %conv405, -1
  br i1 %cmp406, label %if.then408, label %if.end409

if.then408:                                       ; preds = %if.end403
  call void @abort() noreturn
  unreachable

if.end409:                                        ; preds = %if.end403
  %call410 = call signext i16 @ashiftrt_hi_5(i16 signext -1)
  %conv411 = sext i16 %call410 to i32
  %cmp412 = icmp ne i32 %conv411, -1
  br i1 %cmp412, label %if.then414, label %if.end415

if.then414:                                       ; preds = %if.end409
  call void @abort() noreturn
  unreachable

if.end415:                                        ; preds = %if.end409
  %call416 = call signext i16 @ashiftrt_hi_6(i16 signext -1)
  %conv417 = sext i16 %call416 to i32
  %cmp418 = icmp ne i32 %conv417, -1
  br i1 %cmp418, label %if.then420, label %if.end421

if.then420:                                       ; preds = %if.end415
  call void @abort() noreturn
  unreachable

if.end421:                                        ; preds = %if.end415
  %call422 = call signext i16 @ashiftrt_hi_7(i16 signext -1)
  %conv423 = sext i16 %call422 to i32
  %cmp424 = icmp ne i32 %conv423, -1
  br i1 %cmp424, label %if.then426, label %if.end427

if.then426:                                       ; preds = %if.end421
  call void @abort() noreturn
  unreachable

if.end427:                                        ; preds = %if.end421
  %call428 = call signext i16 @ashiftrt_hi_8(i16 signext -1)
  %conv429 = sext i16 %call428 to i32
  %cmp430 = icmp ne i32 %conv429, -1
  br i1 %cmp430, label %if.then432, label %if.end433

if.then432:                                       ; preds = %if.end427
  call void @abort() noreturn
  unreachable

if.end433:                                        ; preds = %if.end427
  %call434 = call signext i16 @ashiftrt_hi_9(i16 signext -1)
  %conv435 = sext i16 %call434 to i32
  %cmp436 = icmp ne i32 %conv435, -1
  br i1 %cmp436, label %if.then438, label %if.end439

if.then438:                                       ; preds = %if.end433
  call void @abort() noreturn
  unreachable

if.end439:                                        ; preds = %if.end433
  %call440 = call signext i16 @ashiftrt_hi_10(i16 signext -1)
  %conv441 = sext i16 %call440 to i32
  %cmp442 = icmp ne i32 %conv441, -1
  br i1 %cmp442, label %if.then444, label %if.end445

if.then444:                                       ; preds = %if.end439
  call void @abort() noreturn
  unreachable

if.end445:                                        ; preds = %if.end439
  %call446 = call signext i16 @ashiftrt_hi_11(i16 signext -1)
  %conv447 = sext i16 %call446 to i32
  %cmp448 = icmp ne i32 %conv447, -1
  br i1 %cmp448, label %if.then450, label %if.end451

if.then450:                                       ; preds = %if.end445
  call void @abort() noreturn
  unreachable

if.end451:                                        ; preds = %if.end445
  %call452 = call signext i16 @ashiftrt_hi_12(i16 signext -1)
  %conv453 = sext i16 %call452 to i32
  %cmp454 = icmp ne i32 %conv453, -1
  br i1 %cmp454, label %if.then456, label %if.end457

if.then456:                                       ; preds = %if.end451
  call void @abort() noreturn
  unreachable

if.end457:                                        ; preds = %if.end451
  %call458 = call signext i16 @ashiftrt_hi_13(i16 signext -1)
  %conv459 = sext i16 %call458 to i32
  %cmp460 = icmp ne i32 %conv459, -1
  br i1 %cmp460, label %if.then462, label %if.end463

if.then462:                                       ; preds = %if.end457
  call void @abort() noreturn
  unreachable

if.end463:                                        ; preds = %if.end457
  %call464 = call signext i16 @ashiftrt_hi_14(i16 signext -1)
  %conv465 = sext i16 %call464 to i32
  %cmp466 = icmp ne i32 %conv465, -1
  br i1 %cmp466, label %if.then468, label %if.end469

if.then468:                                       ; preds = %if.end463
  call void @abort() noreturn
  unreachable

if.end469:                                        ; preds = %if.end463
  %call470 = call signext i16 @ashiftrt_hi_15(i16 signext -1)
  %conv471 = sext i16 %call470 to i32
  %cmp472 = icmp ne i32 %conv471, -1
  br i1 %cmp472, label %if.then474, label %if.end475

if.then474:                                       ; preds = %if.end469
  call void @abort() noreturn
  unreachable

if.end475:                                        ; preds = %if.end469
  %call476 = call signext i16 @ashiftrt_hi_0(i16 signext 0)
  %conv477 = sext i16 %call476 to i32
  %cmp478 = icmp ne i32 %conv477, 0
  br i1 %cmp478, label %if.then480, label %if.end481

if.then480:                                       ; preds = %if.end475
  call void @abort() noreturn
  unreachable

if.end481:                                        ; preds = %if.end475
  %call482 = call signext i16 @ashiftrt_hi_1(i16 signext 0)
  %conv483 = sext i16 %call482 to i32
  %cmp484 = icmp ne i32 %conv483, 0
  br i1 %cmp484, label %if.then486, label %if.end487

if.then486:                                       ; preds = %if.end481
  call void @abort() noreturn
  unreachable

if.end487:                                        ; preds = %if.end481
  %call488 = call signext i16 @ashiftrt_hi_2(i16 signext 0)
  %conv489 = sext i16 %call488 to i32
  %cmp490 = icmp ne i32 %conv489, 0
  br i1 %cmp490, label %if.then492, label %if.end493

if.then492:                                       ; preds = %if.end487
  call void @abort() noreturn
  unreachable

if.end493:                                        ; preds = %if.end487
  %call494 = call signext i16 @ashiftrt_hi_3(i16 signext 0)
  %conv495 = sext i16 %call494 to i32
  %cmp496 = icmp ne i32 %conv495, 0
  br i1 %cmp496, label %if.then498, label %if.end499

if.then498:                                       ; preds = %if.end493
  call void @abort() noreturn
  unreachable

if.end499:                                        ; preds = %if.end493
  %call500 = call signext i16 @ashiftrt_hi_4(i16 signext 0)
  %conv501 = sext i16 %call500 to i32
  %cmp502 = icmp ne i32 %conv501, 0
  br i1 %cmp502, label %if.then504, label %if.end505

if.then504:                                       ; preds = %if.end499
  call void @abort() noreturn
  unreachable

if.end505:                                        ; preds = %if.end499
  %call506 = call signext i16 @ashiftrt_hi_5(i16 signext 0)
  %conv507 = sext i16 %call506 to i32
  %cmp508 = icmp ne i32 %conv507, 0
  br i1 %cmp508, label %if.then510, label %if.end511

if.then510:                                       ; preds = %if.end505
  call void @abort() noreturn
  unreachable

if.end511:                                        ; preds = %if.end505
  %call512 = call signext i16 @ashiftrt_hi_6(i16 signext 0)
  %conv513 = sext i16 %call512 to i32
  %cmp514 = icmp ne i32 %conv513, 0
  br i1 %cmp514, label %if.then516, label %if.end517

if.then516:                                       ; preds = %if.end511
  call void @abort() noreturn
  unreachable

if.end517:                                        ; preds = %if.end511
  %call518 = call signext i16 @ashiftrt_hi_7(i16 signext 0)
  %conv519 = sext i16 %call518 to i32
  %cmp520 = icmp ne i32 %conv519, 0
  br i1 %cmp520, label %if.then522, label %if.end523

if.then522:                                       ; preds = %if.end517
  call void @abort() noreturn
  unreachable

if.end523:                                        ; preds = %if.end517
  %call524 = call signext i16 @ashiftrt_hi_8(i16 signext 0)
  %conv525 = sext i16 %call524 to i32
  %cmp526 = icmp ne i32 %conv525, 0
  br i1 %cmp526, label %if.then528, label %if.end529

if.then528:                                       ; preds = %if.end523
  call void @abort() noreturn
  unreachable

if.end529:                                        ; preds = %if.end523
  %call530 = call signext i16 @ashiftrt_hi_9(i16 signext 0)
  %conv531 = sext i16 %call530 to i32
  %cmp532 = icmp ne i32 %conv531, 0
  br i1 %cmp532, label %if.then534, label %if.end535

if.then534:                                       ; preds = %if.end529
  call void @abort() noreturn
  unreachable

if.end535:                                        ; preds = %if.end529
  %call536 = call signext i16 @ashiftrt_hi_10(i16 signext 0)
  %conv537 = sext i16 %call536 to i32
  %cmp538 = icmp ne i32 %conv537, 0
  br i1 %cmp538, label %if.then540, label %if.end541

if.then540:                                       ; preds = %if.end535
  call void @abort() noreturn
  unreachable

if.end541:                                        ; preds = %if.end535
  %call542 = call signext i16 @ashiftrt_hi_11(i16 signext 0)
  %conv543 = sext i16 %call542 to i32
  %cmp544 = icmp ne i32 %conv543, 0
  br i1 %cmp544, label %if.then546, label %if.end547

if.then546:                                       ; preds = %if.end541
  call void @abort() noreturn
  unreachable

if.end547:                                        ; preds = %if.end541
  %call548 = call signext i16 @ashiftrt_hi_12(i16 signext 0)
  %conv549 = sext i16 %call548 to i32
  %cmp550 = icmp ne i32 %conv549, 0
  br i1 %cmp550, label %if.then552, label %if.end553

if.then552:                                       ; preds = %if.end547
  call void @abort() noreturn
  unreachable

if.end553:                                        ; preds = %if.end547
  %call554 = call signext i16 @ashiftrt_hi_13(i16 signext 0)
  %conv555 = sext i16 %call554 to i32
  %cmp556 = icmp ne i32 %conv555, 0
  br i1 %cmp556, label %if.then558, label %if.end559

if.then558:                                       ; preds = %if.end553
  call void @abort() noreturn
  unreachable

if.end559:                                        ; preds = %if.end553
  %call560 = call signext i16 @ashiftrt_hi_14(i16 signext 0)
  %conv561 = sext i16 %call560 to i32
  %cmp562 = icmp ne i32 %conv561, 0
  br i1 %cmp562, label %if.then564, label %if.end565

if.then564:                                       ; preds = %if.end559
  call void @abort() noreturn
  unreachable

if.end565:                                        ; preds = %if.end559
  %call566 = call signext i16 @ashiftrt_hi_15(i16 signext 0)
  %conv567 = sext i16 %call566 to i32
  %cmp568 = icmp ne i32 %conv567, 0
  br i1 %cmp568, label %if.then570, label %if.end571

if.then570:                                       ; preds = %if.end565
  call void @abort() noreturn
  unreachable

if.end571:                                        ; preds = %if.end565
  %call572 = call i32 @ashift_si_0(i32 -1)
  %cmp573 = icmp ne i32 %call572, -1
  br i1 %cmp573, label %if.then575, label %if.end576

if.then575:                                       ; preds = %if.end571
  call void @abort() noreturn
  unreachable

if.end576:                                        ; preds = %if.end571
  %call577 = call i32 @ashift_si_1(i32 -1)
  %cmp578 = icmp ne i32 %call577, -2
  br i1 %cmp578, label %if.then580, label %if.end581

if.then580:                                       ; preds = %if.end576
  call void @abort() noreturn
  unreachable

if.end581:                                        ; preds = %if.end576
  %call582 = call i32 @ashift_si_2(i32 -1)
  %cmp583 = icmp ne i32 %call582, -4
  br i1 %cmp583, label %if.then585, label %if.end586

if.then585:                                       ; preds = %if.end581
  call void @abort() noreturn
  unreachable

if.end586:                                        ; preds = %if.end581
  %call587 = call i32 @ashift_si_3(i32 -1)
  %cmp588 = icmp ne i32 %call587, -8
  br i1 %cmp588, label %if.then590, label %if.end591

if.then590:                                       ; preds = %if.end586
  call void @abort() noreturn
  unreachable

if.end591:                                        ; preds = %if.end586
  %call592 = call i32 @ashift_si_4(i32 -1)
  %cmp593 = icmp ne i32 %call592, -16
  br i1 %cmp593, label %if.then595, label %if.end596

if.then595:                                       ; preds = %if.end591
  call void @abort() noreturn
  unreachable

if.end596:                                        ; preds = %if.end591
  %call597 = call i32 @ashift_si_5(i32 -1)
  %cmp598 = icmp ne i32 %call597, -32
  br i1 %cmp598, label %if.then600, label %if.end601

if.then600:                                       ; preds = %if.end596
  call void @abort() noreturn
  unreachable

if.end601:                                        ; preds = %if.end596
  %call602 = call i32 @ashift_si_6(i32 -1)
  %cmp603 = icmp ne i32 %call602, -64
  br i1 %cmp603, label %if.then605, label %if.end606

if.then605:                                       ; preds = %if.end601
  call void @abort() noreturn
  unreachable

if.end606:                                        ; preds = %if.end601
  %call607 = call i32 @ashift_si_7(i32 -1)
  %cmp608 = icmp ne i32 %call607, -128
  br i1 %cmp608, label %if.then610, label %if.end611

if.then610:                                       ; preds = %if.end606
  call void @abort() noreturn
  unreachable

if.end611:                                        ; preds = %if.end606
  %call612 = call i32 @ashift_si_8(i32 -1)
  %cmp613 = icmp ne i32 %call612, -256
  br i1 %cmp613, label %if.then615, label %if.end616

if.then615:                                       ; preds = %if.end611
  call void @abort() noreturn
  unreachable

if.end616:                                        ; preds = %if.end611
  %call617 = call i32 @ashift_si_9(i32 -1)
  %cmp618 = icmp ne i32 %call617, -512
  br i1 %cmp618, label %if.then620, label %if.end621

if.then620:                                       ; preds = %if.end616
  call void @abort() noreturn
  unreachable

if.end621:                                        ; preds = %if.end616
  %call622 = call i32 @ashift_si_10(i32 -1)
  %cmp623 = icmp ne i32 %call622, -1024
  br i1 %cmp623, label %if.then625, label %if.end626

if.then625:                                       ; preds = %if.end621
  call void @abort() noreturn
  unreachable

if.end626:                                        ; preds = %if.end621
  %call627 = call i32 @ashift_si_11(i32 -1)
  %cmp628 = icmp ne i32 %call627, -2048
  br i1 %cmp628, label %if.then630, label %if.end631

if.then630:                                       ; preds = %if.end626
  call void @abort() noreturn
  unreachable

if.end631:                                        ; preds = %if.end626
  %call632 = call i32 @ashift_si_12(i32 -1)
  %cmp633 = icmp ne i32 %call632, -4096
  br i1 %cmp633, label %if.then635, label %if.end636

if.then635:                                       ; preds = %if.end631
  call void @abort() noreturn
  unreachable

if.end636:                                        ; preds = %if.end631
  %call637 = call i32 @ashift_si_13(i32 -1)
  %cmp638 = icmp ne i32 %call637, -8192
  br i1 %cmp638, label %if.then640, label %if.end641

if.then640:                                       ; preds = %if.end636
  call void @abort() noreturn
  unreachable

if.end641:                                        ; preds = %if.end636
  %call642 = call i32 @ashift_si_14(i32 -1)
  %cmp643 = icmp ne i32 %call642, -16384
  br i1 %cmp643, label %if.then645, label %if.end646

if.then645:                                       ; preds = %if.end641
  call void @abort() noreturn
  unreachable

if.end646:                                        ; preds = %if.end641
  %call647 = call i32 @ashift_si_15(i32 -1)
  %cmp648 = icmp ne i32 %call647, -32768
  br i1 %cmp648, label %if.then650, label %if.end651

if.then650:                                       ; preds = %if.end646
  call void @abort() noreturn
  unreachable

if.end651:                                        ; preds = %if.end646
  %call652 = call i32 @ashift_si_16(i32 -1)
  %cmp653 = icmp ne i32 %call652, -65536
  br i1 %cmp653, label %if.then655, label %if.end656

if.then655:                                       ; preds = %if.end651
  call void @abort() noreturn
  unreachable

if.end656:                                        ; preds = %if.end651
  %call657 = call i32 @ashift_si_17(i32 -1)
  %cmp658 = icmp ne i32 %call657, -131072
  br i1 %cmp658, label %if.then660, label %if.end661

if.then660:                                       ; preds = %if.end656
  call void @abort() noreturn
  unreachable

if.end661:                                        ; preds = %if.end656
  %call662 = call i32 @ashift_si_18(i32 -1)
  %cmp663 = icmp ne i32 %call662, -262144
  br i1 %cmp663, label %if.then665, label %if.end666

if.then665:                                       ; preds = %if.end661
  call void @abort() noreturn
  unreachable

if.end666:                                        ; preds = %if.end661
  %call667 = call i32 @ashift_si_19(i32 -1)
  %cmp668 = icmp ne i32 %call667, -524288
  br i1 %cmp668, label %if.then670, label %if.end671

if.then670:                                       ; preds = %if.end666
  call void @abort() noreturn
  unreachable

if.end671:                                        ; preds = %if.end666
  %call672 = call i32 @ashift_si_20(i32 -1)
  %cmp673 = icmp ne i32 %call672, -1048576
  br i1 %cmp673, label %if.then675, label %if.end676

if.then675:                                       ; preds = %if.end671
  call void @abort() noreturn
  unreachable

if.end676:                                        ; preds = %if.end671
  %call677 = call i32 @ashift_si_21(i32 -1)
  %cmp678 = icmp ne i32 %call677, -2097152
  br i1 %cmp678, label %if.then680, label %if.end681

if.then680:                                       ; preds = %if.end676
  call void @abort() noreturn
  unreachable

if.end681:                                        ; preds = %if.end676
  %call682 = call i32 @ashift_si_22(i32 -1)
  %cmp683 = icmp ne i32 %call682, -4194304
  br i1 %cmp683, label %if.then685, label %if.end686

if.then685:                                       ; preds = %if.end681
  call void @abort() noreturn
  unreachable

if.end686:                                        ; preds = %if.end681
  %call687 = call i32 @ashift_si_23(i32 -1)
  %cmp688 = icmp ne i32 %call687, -8388608
  br i1 %cmp688, label %if.then690, label %if.end691

if.then690:                                       ; preds = %if.end686
  call void @abort() noreturn
  unreachable

if.end691:                                        ; preds = %if.end686
  %call692 = call i32 @ashift_si_24(i32 -1)
  %cmp693 = icmp ne i32 %call692, -16777216
  br i1 %cmp693, label %if.then695, label %if.end696

if.then695:                                       ; preds = %if.end691
  call void @abort() noreturn
  unreachable

if.end696:                                        ; preds = %if.end691
  %call697 = call i32 @ashift_si_25(i32 -1)
  %cmp698 = icmp ne i32 %call697, -33554432
  br i1 %cmp698, label %if.then700, label %if.end701

if.then700:                                       ; preds = %if.end696
  call void @abort() noreturn
  unreachable

if.end701:                                        ; preds = %if.end696
  %call702 = call i32 @ashift_si_26(i32 -1)
  %cmp703 = icmp ne i32 %call702, -67108864
  br i1 %cmp703, label %if.then705, label %if.end706

if.then705:                                       ; preds = %if.end701
  call void @abort() noreturn
  unreachable

if.end706:                                        ; preds = %if.end701
  %call707 = call i32 @ashift_si_27(i32 -1)
  %cmp708 = icmp ne i32 %call707, -134217728
  br i1 %cmp708, label %if.then710, label %if.end711

if.then710:                                       ; preds = %if.end706
  call void @abort() noreturn
  unreachable

if.end711:                                        ; preds = %if.end706
  %call712 = call i32 @ashift_si_28(i32 -1)
  %cmp713 = icmp ne i32 %call712, -268435456
  br i1 %cmp713, label %if.then715, label %if.end716

if.then715:                                       ; preds = %if.end711
  call void @abort() noreturn
  unreachable

if.end716:                                        ; preds = %if.end711
  %call717 = call i32 @ashift_si_29(i32 -1)
  %cmp718 = icmp ne i32 %call717, -536870912
  br i1 %cmp718, label %if.then720, label %if.end721

if.then720:                                       ; preds = %if.end716
  call void @abort() noreturn
  unreachable

if.end721:                                        ; preds = %if.end716
  %call722 = call i32 @ashift_si_30(i32 -1)
  %cmp723 = icmp ne i32 %call722, -1073741824
  br i1 %cmp723, label %if.then725, label %if.end726

if.then725:                                       ; preds = %if.end721
  call void @abort() noreturn
  unreachable

if.end726:                                        ; preds = %if.end721
  %call727 = call i32 @ashift_si_31(i32 -1)
  %cmp728 = icmp ne i32 %call727, -2147483648
  br i1 %cmp728, label %if.then730, label %if.end731

if.then730:                                       ; preds = %if.end726
  call void @abort() noreturn
  unreachable

if.end731:                                        ; preds = %if.end726
  %call732 = call i32 @lshiftrt_si_0(i32 -1)
  %cmp733 = icmp ne i32 %call732, -1
  br i1 %cmp733, label %if.then735, label %if.end736

if.then735:                                       ; preds = %if.end731
  call void @abort() noreturn
  unreachable

if.end736:                                        ; preds = %if.end731
  %call737 = call i32 @lshiftrt_si_1(i32 -1)
  %cmp738 = icmp ne i32 %call737, 2147483647
  br i1 %cmp738, label %if.then740, label %if.end741

if.then740:                                       ; preds = %if.end736
  call void @abort() noreturn
  unreachable

if.end741:                                        ; preds = %if.end736
  %call742 = call i32 @lshiftrt_si_2(i32 -1)
  %cmp743 = icmp ne i32 %call742, 1073741823
  br i1 %cmp743, label %if.then745, label %if.end746

if.then745:                                       ; preds = %if.end741
  call void @abort() noreturn
  unreachable

if.end746:                                        ; preds = %if.end741
  %call747 = call i32 @lshiftrt_si_3(i32 -1)
  %cmp748 = icmp ne i32 %call747, 536870911
  br i1 %cmp748, label %if.then750, label %if.end751

if.then750:                                       ; preds = %if.end746
  call void @abort() noreturn
  unreachable

if.end751:                                        ; preds = %if.end746
  %call752 = call i32 @lshiftrt_si_4(i32 -1)
  %cmp753 = icmp ne i32 %call752, 268435455
  br i1 %cmp753, label %if.then755, label %if.end756

if.then755:                                       ; preds = %if.end751
  call void @abort() noreturn
  unreachable

if.end756:                                        ; preds = %if.end751
  %call757 = call i32 @lshiftrt_si_5(i32 -1)
  %cmp758 = icmp ne i32 %call757, 134217727
  br i1 %cmp758, label %if.then760, label %if.end761

if.then760:                                       ; preds = %if.end756
  call void @abort() noreturn
  unreachable

if.end761:                                        ; preds = %if.end756
  %call762 = call i32 @lshiftrt_si_6(i32 -1)
  %cmp763 = icmp ne i32 %call762, 67108863
  br i1 %cmp763, label %if.then765, label %if.end766

if.then765:                                       ; preds = %if.end761
  call void @abort() noreturn
  unreachable

if.end766:                                        ; preds = %if.end761
  %call767 = call i32 @lshiftrt_si_7(i32 -1)
  %cmp768 = icmp ne i32 %call767, 33554431
  br i1 %cmp768, label %if.then770, label %if.end771

if.then770:                                       ; preds = %if.end766
  call void @abort() noreturn
  unreachable

if.end771:                                        ; preds = %if.end766
  %call772 = call i32 @lshiftrt_si_8(i32 -1)
  %cmp773 = icmp ne i32 %call772, 16777215
  br i1 %cmp773, label %if.then775, label %if.end776

if.then775:                                       ; preds = %if.end771
  call void @abort() noreturn
  unreachable

if.end776:                                        ; preds = %if.end771
  %call777 = call i32 @lshiftrt_si_9(i32 -1)
  %cmp778 = icmp ne i32 %call777, 8388607
  br i1 %cmp778, label %if.then780, label %if.end781

if.then780:                                       ; preds = %if.end776
  call void @abort() noreturn
  unreachable

if.end781:                                        ; preds = %if.end776
  %call782 = call i32 @lshiftrt_si_10(i32 -1)
  %cmp783 = icmp ne i32 %call782, 4194303
  br i1 %cmp783, label %if.then785, label %if.end786

if.then785:                                       ; preds = %if.end781
  call void @abort() noreturn
  unreachable

if.end786:                                        ; preds = %if.end781
  %call787 = call i32 @lshiftrt_si_11(i32 -1)
  %cmp788 = icmp ne i32 %call787, 2097151
  br i1 %cmp788, label %if.then790, label %if.end791

if.then790:                                       ; preds = %if.end786
  call void @abort() noreturn
  unreachable

if.end791:                                        ; preds = %if.end786
  %call792 = call i32 @lshiftrt_si_12(i32 -1)
  %cmp793 = icmp ne i32 %call792, 1048575
  br i1 %cmp793, label %if.then795, label %if.end796

if.then795:                                       ; preds = %if.end791
  call void @abort() noreturn
  unreachable

if.end796:                                        ; preds = %if.end791
  %call797 = call i32 @lshiftrt_si_13(i32 -1)
  %cmp798 = icmp ne i32 %call797, 524287
  br i1 %cmp798, label %if.then800, label %if.end801

if.then800:                                       ; preds = %if.end796
  call void @abort() noreturn
  unreachable

if.end801:                                        ; preds = %if.end796
  %call802 = call i32 @lshiftrt_si_14(i32 -1)
  %cmp803 = icmp ne i32 %call802, 262143
  br i1 %cmp803, label %if.then805, label %if.end806

if.then805:                                       ; preds = %if.end801
  call void @abort() noreturn
  unreachable

if.end806:                                        ; preds = %if.end801
  %call807 = call i32 @lshiftrt_si_15(i32 -1)
  %cmp808 = icmp ne i32 %call807, 131071
  br i1 %cmp808, label %if.then810, label %if.end811

if.then810:                                       ; preds = %if.end806
  call void @abort() noreturn
  unreachable

if.end811:                                        ; preds = %if.end806
  %call812 = call i32 @lshiftrt_si_16(i32 -1)
  %cmp813 = icmp ne i32 %call812, 65535
  br i1 %cmp813, label %if.then815, label %if.end816

if.then815:                                       ; preds = %if.end811
  call void @abort() noreturn
  unreachable

if.end816:                                        ; preds = %if.end811
  %call817 = call i32 @lshiftrt_si_17(i32 -1)
  %cmp818 = icmp ne i32 %call817, 32767
  br i1 %cmp818, label %if.then820, label %if.end821

if.then820:                                       ; preds = %if.end816
  call void @abort() noreturn
  unreachable

if.end821:                                        ; preds = %if.end816
  %call822 = call i32 @lshiftrt_si_18(i32 -1)
  %cmp823 = icmp ne i32 %call822, 16383
  br i1 %cmp823, label %if.then825, label %if.end826

if.then825:                                       ; preds = %if.end821
  call void @abort() noreturn
  unreachable

if.end826:                                        ; preds = %if.end821
  %call827 = call i32 @lshiftrt_si_19(i32 -1)
  %cmp828 = icmp ne i32 %call827, 8191
  br i1 %cmp828, label %if.then830, label %if.end831

if.then830:                                       ; preds = %if.end826
  call void @abort() noreturn
  unreachable

if.end831:                                        ; preds = %if.end826
  %call832 = call i32 @lshiftrt_si_20(i32 -1)
  %cmp833 = icmp ne i32 %call832, 4095
  br i1 %cmp833, label %if.then835, label %if.end836

if.then835:                                       ; preds = %if.end831
  call void @abort() noreturn
  unreachable

if.end836:                                        ; preds = %if.end831
  %call837 = call i32 @lshiftrt_si_21(i32 -1)
  %cmp838 = icmp ne i32 %call837, 2047
  br i1 %cmp838, label %if.then840, label %if.end841

if.then840:                                       ; preds = %if.end836
  call void @abort() noreturn
  unreachable

if.end841:                                        ; preds = %if.end836
  %call842 = call i32 @lshiftrt_si_22(i32 -1)
  %cmp843 = icmp ne i32 %call842, 1023
  br i1 %cmp843, label %if.then845, label %if.end846

if.then845:                                       ; preds = %if.end841
  call void @abort() noreturn
  unreachable

if.end846:                                        ; preds = %if.end841
  %call847 = call i32 @lshiftrt_si_23(i32 -1)
  %cmp848 = icmp ne i32 %call847, 511
  br i1 %cmp848, label %if.then850, label %if.end851

if.then850:                                       ; preds = %if.end846
  call void @abort() noreturn
  unreachable

if.end851:                                        ; preds = %if.end846
  %call852 = call i32 @lshiftrt_si_24(i32 -1)
  %cmp853 = icmp ne i32 %call852, 255
  br i1 %cmp853, label %if.then855, label %if.end856

if.then855:                                       ; preds = %if.end851
  call void @abort() noreturn
  unreachable

if.end856:                                        ; preds = %if.end851
  %call857 = call i32 @lshiftrt_si_25(i32 -1)
  %cmp858 = icmp ne i32 %call857, 127
  br i1 %cmp858, label %if.then860, label %if.end861

if.then860:                                       ; preds = %if.end856
  call void @abort() noreturn
  unreachable

if.end861:                                        ; preds = %if.end856
  %call862 = call i32 @lshiftrt_si_26(i32 -1)
  %cmp863 = icmp ne i32 %call862, 63
  br i1 %cmp863, label %if.then865, label %if.end866

if.then865:                                       ; preds = %if.end861
  call void @abort() noreturn
  unreachable

if.end866:                                        ; preds = %if.end861
  %call867 = call i32 @lshiftrt_si_27(i32 -1)
  %cmp868 = icmp ne i32 %call867, 31
  br i1 %cmp868, label %if.then870, label %if.end871

if.then870:                                       ; preds = %if.end866
  call void @abort() noreturn
  unreachable

if.end871:                                        ; preds = %if.end866
  %call872 = call i32 @lshiftrt_si_28(i32 -1)
  %cmp873 = icmp ne i32 %call872, 15
  br i1 %cmp873, label %if.then875, label %if.end876

if.then875:                                       ; preds = %if.end871
  call void @abort() noreturn
  unreachable

if.end876:                                        ; preds = %if.end871
  %call877 = call i32 @lshiftrt_si_29(i32 -1)
  %cmp878 = icmp ne i32 %call877, 7
  br i1 %cmp878, label %if.then880, label %if.end881

if.then880:                                       ; preds = %if.end876
  call void @abort() noreturn
  unreachable

if.end881:                                        ; preds = %if.end876
  %call882 = call i32 @lshiftrt_si_30(i32 -1)
  %cmp883 = icmp ne i32 %call882, 3
  br i1 %cmp883, label %if.then885, label %if.end886

if.then885:                                       ; preds = %if.end881
  call void @abort() noreturn
  unreachable

if.end886:                                        ; preds = %if.end881
  %call887 = call i32 @lshiftrt_si_31(i32 -1)
  %cmp888 = icmp ne i32 %call887, 1
  br i1 %cmp888, label %if.then890, label %if.end891

if.then890:                                       ; preds = %if.end886
  call void @abort() noreturn
  unreachable

if.end891:                                        ; preds = %if.end886
  %call892 = call i32 @ashiftrt_si_0(i32 -1)
  %cmp893 = icmp ne i32 %call892, -1
  br i1 %cmp893, label %if.then895, label %if.end896

if.then895:                                       ; preds = %if.end891
  call void @abort() noreturn
  unreachable

if.end896:                                        ; preds = %if.end891
  %call897 = call i32 @ashiftrt_si_1(i32 -1)
  %cmp898 = icmp ne i32 %call897, -1
  br i1 %cmp898, label %if.then900, label %if.end901

if.then900:                                       ; preds = %if.end896
  call void @abort() noreturn
  unreachable

if.end901:                                        ; preds = %if.end896
  %call902 = call i32 @ashiftrt_si_2(i32 -1)
  %cmp903 = icmp ne i32 %call902, -1
  br i1 %cmp903, label %if.then905, label %if.end906

if.then905:                                       ; preds = %if.end901
  call void @abort() noreturn
  unreachable

if.end906:                                        ; preds = %if.end901
  %call907 = call i32 @ashiftrt_si_3(i32 -1)
  %cmp908 = icmp ne i32 %call907, -1
  br i1 %cmp908, label %if.then910, label %if.end911

if.then910:                                       ; preds = %if.end906
  call void @abort() noreturn
  unreachable

if.end911:                                        ; preds = %if.end906
  %call912 = call i32 @ashiftrt_si_4(i32 -1)
  %cmp913 = icmp ne i32 %call912, -1
  br i1 %cmp913, label %if.then915, label %if.end916

if.then915:                                       ; preds = %if.end911
  call void @abort() noreturn
  unreachable

if.end916:                                        ; preds = %if.end911
  %call917 = call i32 @ashiftrt_si_5(i32 -1)
  %cmp918 = icmp ne i32 %call917, -1
  br i1 %cmp918, label %if.then920, label %if.end921

if.then920:                                       ; preds = %if.end916
  call void @abort() noreturn
  unreachable

if.end921:                                        ; preds = %if.end916
  %call922 = call i32 @ashiftrt_si_6(i32 -1)
  %cmp923 = icmp ne i32 %call922, -1
  br i1 %cmp923, label %if.then925, label %if.end926

if.then925:                                       ; preds = %if.end921
  call void @abort() noreturn
  unreachable

if.end926:                                        ; preds = %if.end921
  %call927 = call i32 @ashiftrt_si_7(i32 -1)
  %cmp928 = icmp ne i32 %call927, -1
  br i1 %cmp928, label %if.then930, label %if.end931

if.then930:                                       ; preds = %if.end926
  call void @abort() noreturn
  unreachable

if.end931:                                        ; preds = %if.end926
  %call932 = call i32 @ashiftrt_si_8(i32 -1)
  %cmp933 = icmp ne i32 %call932, -1
  br i1 %cmp933, label %if.then935, label %if.end936

if.then935:                                       ; preds = %if.end931
  call void @abort() noreturn
  unreachable

if.end936:                                        ; preds = %if.end931
  %call937 = call i32 @ashiftrt_si_9(i32 -1)
  %cmp938 = icmp ne i32 %call937, -1
  br i1 %cmp938, label %if.then940, label %if.end941

if.then940:                                       ; preds = %if.end936
  call void @abort() noreturn
  unreachable

if.end941:                                        ; preds = %if.end936
  %call942 = call i32 @ashiftrt_si_10(i32 -1)
  %cmp943 = icmp ne i32 %call942, -1
  br i1 %cmp943, label %if.then945, label %if.end946

if.then945:                                       ; preds = %if.end941
  call void @abort() noreturn
  unreachable

if.end946:                                        ; preds = %if.end941
  %call947 = call i32 @ashiftrt_si_11(i32 -1)
  %cmp948 = icmp ne i32 %call947, -1
  br i1 %cmp948, label %if.then950, label %if.end951

if.then950:                                       ; preds = %if.end946
  call void @abort() noreturn
  unreachable

if.end951:                                        ; preds = %if.end946
  %call952 = call i32 @ashiftrt_si_12(i32 -1)
  %cmp953 = icmp ne i32 %call952, -1
  br i1 %cmp953, label %if.then955, label %if.end956

if.then955:                                       ; preds = %if.end951
  call void @abort() noreturn
  unreachable

if.end956:                                        ; preds = %if.end951
  %call957 = call i32 @ashiftrt_si_13(i32 -1)
  %cmp958 = icmp ne i32 %call957, -1
  br i1 %cmp958, label %if.then960, label %if.end961

if.then960:                                       ; preds = %if.end956
  call void @abort() noreturn
  unreachable

if.end961:                                        ; preds = %if.end956
  %call962 = call i32 @ashiftrt_si_14(i32 -1)
  %cmp963 = icmp ne i32 %call962, -1
  br i1 %cmp963, label %if.then965, label %if.end966

if.then965:                                       ; preds = %if.end961
  call void @abort() noreturn
  unreachable

if.end966:                                        ; preds = %if.end961
  %call967 = call i32 @ashiftrt_si_15(i32 -1)
  %cmp968 = icmp ne i32 %call967, -1
  br i1 %cmp968, label %if.then970, label %if.end971

if.then970:                                       ; preds = %if.end966
  call void @abort() noreturn
  unreachable

if.end971:                                        ; preds = %if.end966
  %call972 = call i32 @ashiftrt_si_16(i32 -1)
  %cmp973 = icmp ne i32 %call972, -1
  br i1 %cmp973, label %if.then975, label %if.end976

if.then975:                                       ; preds = %if.end971
  call void @abort() noreturn
  unreachable

if.end976:                                        ; preds = %if.end971
  %call977 = call i32 @ashiftrt_si_17(i32 -1)
  %cmp978 = icmp ne i32 %call977, -1
  br i1 %cmp978, label %if.then980, label %if.end981

if.then980:                                       ; preds = %if.end976
  call void @abort() noreturn
  unreachable

if.end981:                                        ; preds = %if.end976
  %call982 = call i32 @ashiftrt_si_18(i32 -1)
  %cmp983 = icmp ne i32 %call982, -1
  br i1 %cmp983, label %if.then985, label %if.end986

if.then985:                                       ; preds = %if.end981
  call void @abort() noreturn
  unreachable

if.end986:                                        ; preds = %if.end981
  %call987 = call i32 @ashiftrt_si_19(i32 -1)
  %cmp988 = icmp ne i32 %call987, -1
  br i1 %cmp988, label %if.then990, label %if.end991

if.then990:                                       ; preds = %if.end986
  call void @abort() noreturn
  unreachable

if.end991:                                        ; preds = %if.end986
  %call992 = call i32 @ashiftrt_si_20(i32 -1)
  %cmp993 = icmp ne i32 %call992, -1
  br i1 %cmp993, label %if.then995, label %if.end996

if.then995:                                       ; preds = %if.end991
  call void @abort() noreturn
  unreachable

if.end996:                                        ; preds = %if.end991
  %call997 = call i32 @ashiftrt_si_21(i32 -1)
  %cmp998 = icmp ne i32 %call997, -1
  br i1 %cmp998, label %if.then1000, label %if.end1001

if.then1000:                                      ; preds = %if.end996
  call void @abort() noreturn
  unreachable

if.end1001:                                       ; preds = %if.end996
  %call1002 = call i32 @ashiftrt_si_22(i32 -1)
  %cmp1003 = icmp ne i32 %call1002, -1
  br i1 %cmp1003, label %if.then1005, label %if.end1006

if.then1005:                                      ; preds = %if.end1001
  call void @abort() noreturn
  unreachable

if.end1006:                                       ; preds = %if.end1001
  %call1007 = call i32 @ashiftrt_si_23(i32 -1)
  %cmp1008 = icmp ne i32 %call1007, -1
  br i1 %cmp1008, label %if.then1010, label %if.end1011

if.then1010:                                      ; preds = %if.end1006
  call void @abort() noreturn
  unreachable

if.end1011:                                       ; preds = %if.end1006
  %call1012 = call i32 @ashiftrt_si_24(i32 -1)
  %cmp1013 = icmp ne i32 %call1012, -1
  br i1 %cmp1013, label %if.then1015, label %if.end1016

if.then1015:                                      ; preds = %if.end1011
  call void @abort() noreturn
  unreachable

if.end1016:                                       ; preds = %if.end1011
  %call1017 = call i32 @ashiftrt_si_25(i32 -1)
  %cmp1018 = icmp ne i32 %call1017, -1
  br i1 %cmp1018, label %if.then1020, label %if.end1021

if.then1020:                                      ; preds = %if.end1016
  call void @abort() noreturn
  unreachable

if.end1021:                                       ; preds = %if.end1016
  %call1022 = call i32 @ashiftrt_si_26(i32 -1)
  %cmp1023 = icmp ne i32 %call1022, -1
  br i1 %cmp1023, label %if.then1025, label %if.end1026

if.then1025:                                      ; preds = %if.end1021
  call void @abort() noreturn
  unreachable

if.end1026:                                       ; preds = %if.end1021
  %call1027 = call i32 @ashiftrt_si_27(i32 -1)
  %cmp1028 = icmp ne i32 %call1027, -1
  br i1 %cmp1028, label %if.then1030, label %if.end1031

if.then1030:                                      ; preds = %if.end1026
  call void @abort() noreturn
  unreachable

if.end1031:                                       ; preds = %if.end1026
  %call1032 = call i32 @ashiftrt_si_28(i32 -1)
  %cmp1033 = icmp ne i32 %call1032, -1
  br i1 %cmp1033, label %if.then1035, label %if.end1036

if.then1035:                                      ; preds = %if.end1031
  call void @abort() noreturn
  unreachable

if.end1036:                                       ; preds = %if.end1031
  %call1037 = call i32 @ashiftrt_si_29(i32 -1)
  %cmp1038 = icmp ne i32 %call1037, -1
  br i1 %cmp1038, label %if.then1040, label %if.end1041

if.then1040:                                      ; preds = %if.end1036
  call void @abort() noreturn
  unreachable

if.end1041:                                       ; preds = %if.end1036
  %call1042 = call i32 @ashiftrt_si_30(i32 -1)
  %cmp1043 = icmp ne i32 %call1042, -1
  br i1 %cmp1043, label %if.then1045, label %if.end1046

if.then1045:                                      ; preds = %if.end1041
  call void @abort() noreturn
  unreachable

if.end1046:                                       ; preds = %if.end1041
  %call1047 = call i32 @ashiftrt_si_31(i32 -1)
  %cmp1048 = icmp ne i32 %call1047, -1
  br i1 %cmp1048, label %if.then1050, label %if.end1051

if.then1050:                                      ; preds = %if.end1046
  call void @abort() noreturn
  unreachable

if.end1051:                                       ; preds = %if.end1046
  %call1052 = call i32 @ashiftrt_si_0(i32 0)
  %cmp1053 = icmp ne i32 %call1052, 0
  br i1 %cmp1053, label %if.then1055, label %if.end1056

if.then1055:                                      ; preds = %if.end1051
  call void @abort() noreturn
  unreachable

if.end1056:                                       ; preds = %if.end1051
  %call1057 = call i32 @ashiftrt_si_1(i32 0)
  %cmp1058 = icmp ne i32 %call1057, 0
  br i1 %cmp1058, label %if.then1060, label %if.end1061

if.then1060:                                      ; preds = %if.end1056
  call void @abort() noreturn
  unreachable

if.end1061:                                       ; preds = %if.end1056
  %call1062 = call i32 @ashiftrt_si_2(i32 0)
  %cmp1063 = icmp ne i32 %call1062, 0
  br i1 %cmp1063, label %if.then1065, label %if.end1066

if.then1065:                                      ; preds = %if.end1061
  call void @abort() noreturn
  unreachable

if.end1066:                                       ; preds = %if.end1061
  %call1067 = call i32 @ashiftrt_si_3(i32 0)
  %cmp1068 = icmp ne i32 %call1067, 0
  br i1 %cmp1068, label %if.then1070, label %if.end1071

if.then1070:                                      ; preds = %if.end1066
  call void @abort() noreturn
  unreachable

if.end1071:                                       ; preds = %if.end1066
  %call1072 = call i32 @ashiftrt_si_4(i32 0)
  %cmp1073 = icmp ne i32 %call1072, 0
  br i1 %cmp1073, label %if.then1075, label %if.end1076

if.then1075:                                      ; preds = %if.end1071
  call void @abort() noreturn
  unreachable

if.end1076:                                       ; preds = %if.end1071
  %call1077 = call i32 @ashiftrt_si_5(i32 0)
  %cmp1078 = icmp ne i32 %call1077, 0
  br i1 %cmp1078, label %if.then1080, label %if.end1081

if.then1080:                                      ; preds = %if.end1076
  call void @abort() noreturn
  unreachable

if.end1081:                                       ; preds = %if.end1076
  %call1082 = call i32 @ashiftrt_si_6(i32 0)
  %cmp1083 = icmp ne i32 %call1082, 0
  br i1 %cmp1083, label %if.then1085, label %if.end1086

if.then1085:                                      ; preds = %if.end1081
  call void @abort() noreturn
  unreachable

if.end1086:                                       ; preds = %if.end1081
  %call1087 = call i32 @ashiftrt_si_7(i32 0)
  %cmp1088 = icmp ne i32 %call1087, 0
  br i1 %cmp1088, label %if.then1090, label %if.end1091

if.then1090:                                      ; preds = %if.end1086
  call void @abort() noreturn
  unreachable

if.end1091:                                       ; preds = %if.end1086
  %call1092 = call i32 @ashiftrt_si_8(i32 0)
  %cmp1093 = icmp ne i32 %call1092, 0
  br i1 %cmp1093, label %if.then1095, label %if.end1096

if.then1095:                                      ; preds = %if.end1091
  call void @abort() noreturn
  unreachable

if.end1096:                                       ; preds = %if.end1091
  %call1097 = call i32 @ashiftrt_si_9(i32 0)
  %cmp1098 = icmp ne i32 %call1097, 0
  br i1 %cmp1098, label %if.then1100, label %if.end1101

if.then1100:                                      ; preds = %if.end1096
  call void @abort() noreturn
  unreachable

if.end1101:                                       ; preds = %if.end1096
  %call1102 = call i32 @ashiftrt_si_10(i32 0)
  %cmp1103 = icmp ne i32 %call1102, 0
  br i1 %cmp1103, label %if.then1105, label %if.end1106

if.then1105:                                      ; preds = %if.end1101
  call void @abort() noreturn
  unreachable

if.end1106:                                       ; preds = %if.end1101
  %call1107 = call i32 @ashiftrt_si_11(i32 0)
  %cmp1108 = icmp ne i32 %call1107, 0
  br i1 %cmp1108, label %if.then1110, label %if.end1111

if.then1110:                                      ; preds = %if.end1106
  call void @abort() noreturn
  unreachable

if.end1111:                                       ; preds = %if.end1106
  %call1112 = call i32 @ashiftrt_si_12(i32 0)
  %cmp1113 = icmp ne i32 %call1112, 0
  br i1 %cmp1113, label %if.then1115, label %if.end1116

if.then1115:                                      ; preds = %if.end1111
  call void @abort() noreturn
  unreachable

if.end1116:                                       ; preds = %if.end1111
  %call1117 = call i32 @ashiftrt_si_13(i32 0)
  %cmp1118 = icmp ne i32 %call1117, 0
  br i1 %cmp1118, label %if.then1120, label %if.end1121

if.then1120:                                      ; preds = %if.end1116
  call void @abort() noreturn
  unreachable

if.end1121:                                       ; preds = %if.end1116
  %call1122 = call i32 @ashiftrt_si_14(i32 0)
  %cmp1123 = icmp ne i32 %call1122, 0
  br i1 %cmp1123, label %if.then1125, label %if.end1126

if.then1125:                                      ; preds = %if.end1121
  call void @abort() noreturn
  unreachable

if.end1126:                                       ; preds = %if.end1121
  %call1127 = call i32 @ashiftrt_si_15(i32 0)
  %cmp1128 = icmp ne i32 %call1127, 0
  br i1 %cmp1128, label %if.then1130, label %if.end1131

if.then1130:                                      ; preds = %if.end1126
  call void @abort() noreturn
  unreachable

if.end1131:                                       ; preds = %if.end1126
  %call1132 = call i32 @ashiftrt_si_16(i32 0)
  %cmp1133 = icmp ne i32 %call1132, 0
  br i1 %cmp1133, label %if.then1135, label %if.end1136

if.then1135:                                      ; preds = %if.end1131
  call void @abort() noreturn
  unreachable

if.end1136:                                       ; preds = %if.end1131
  %call1137 = call i32 @ashiftrt_si_17(i32 0)
  %cmp1138 = icmp ne i32 %call1137, 0
  br i1 %cmp1138, label %if.then1140, label %if.end1141

if.then1140:                                      ; preds = %if.end1136
  call void @abort() noreturn
  unreachable

if.end1141:                                       ; preds = %if.end1136
  %call1142 = call i32 @ashiftrt_si_18(i32 0)
  %cmp1143 = icmp ne i32 %call1142, 0
  br i1 %cmp1143, label %if.then1145, label %if.end1146

if.then1145:                                      ; preds = %if.end1141
  call void @abort() noreturn
  unreachable

if.end1146:                                       ; preds = %if.end1141
  %call1147 = call i32 @ashiftrt_si_19(i32 0)
  %cmp1148 = icmp ne i32 %call1147, 0
  br i1 %cmp1148, label %if.then1150, label %if.end1151

if.then1150:                                      ; preds = %if.end1146
  call void @abort() noreturn
  unreachable

if.end1151:                                       ; preds = %if.end1146
  %call1152 = call i32 @ashiftrt_si_20(i32 0)
  %cmp1153 = icmp ne i32 %call1152, 0
  br i1 %cmp1153, label %if.then1155, label %if.end1156

if.then1155:                                      ; preds = %if.end1151
  call void @abort() noreturn
  unreachable

if.end1156:                                       ; preds = %if.end1151
  %call1157 = call i32 @ashiftrt_si_21(i32 0)
  %cmp1158 = icmp ne i32 %call1157, 0
  br i1 %cmp1158, label %if.then1160, label %if.end1161

if.then1160:                                      ; preds = %if.end1156
  call void @abort() noreturn
  unreachable

if.end1161:                                       ; preds = %if.end1156
  %call1162 = call i32 @ashiftrt_si_22(i32 0)
  %cmp1163 = icmp ne i32 %call1162, 0
  br i1 %cmp1163, label %if.then1165, label %if.end1166

if.then1165:                                      ; preds = %if.end1161
  call void @abort() noreturn
  unreachable

if.end1166:                                       ; preds = %if.end1161
  %call1167 = call i32 @ashiftrt_si_23(i32 0)
  %cmp1168 = icmp ne i32 %call1167, 0
  br i1 %cmp1168, label %if.then1170, label %if.end1171

if.then1170:                                      ; preds = %if.end1166
  call void @abort() noreturn
  unreachable

if.end1171:                                       ; preds = %if.end1166
  %call1172 = call i32 @ashiftrt_si_24(i32 0)
  %cmp1173 = icmp ne i32 %call1172, 0
  br i1 %cmp1173, label %if.then1175, label %if.end1176

if.then1175:                                      ; preds = %if.end1171
  call void @abort() noreturn
  unreachable

if.end1176:                                       ; preds = %if.end1171
  %call1177 = call i32 @ashiftrt_si_25(i32 0)
  %cmp1178 = icmp ne i32 %call1177, 0
  br i1 %cmp1178, label %if.then1180, label %if.end1181

if.then1180:                                      ; preds = %if.end1176
  call void @abort() noreturn
  unreachable

if.end1181:                                       ; preds = %if.end1176
  %call1182 = call i32 @ashiftrt_si_26(i32 0)
  %cmp1183 = icmp ne i32 %call1182, 0
  br i1 %cmp1183, label %if.then1185, label %if.end1186

if.then1185:                                      ; preds = %if.end1181
  call void @abort() noreturn
  unreachable

if.end1186:                                       ; preds = %if.end1181
  %call1187 = call i32 @ashiftrt_si_27(i32 0)
  %cmp1188 = icmp ne i32 %call1187, 0
  br i1 %cmp1188, label %if.then1190, label %if.end1191

if.then1190:                                      ; preds = %if.end1186
  call void @abort() noreturn
  unreachable

if.end1191:                                       ; preds = %if.end1186
  %call1192 = call i32 @ashiftrt_si_28(i32 0)
  %cmp1193 = icmp ne i32 %call1192, 0
  br i1 %cmp1193, label %if.then1195, label %if.end1196

if.then1195:                                      ; preds = %if.end1191
  call void @abort() noreturn
  unreachable

if.end1196:                                       ; preds = %if.end1191
  %call1197 = call i32 @ashiftrt_si_29(i32 0)
  %cmp1198 = icmp ne i32 %call1197, 0
  br i1 %cmp1198, label %if.then1200, label %if.end1201

if.then1200:                                      ; preds = %if.end1196
  call void @abort() noreturn
  unreachable

if.end1201:                                       ; preds = %if.end1196
  %call1202 = call i32 @ashiftrt_si_30(i32 0)
  %cmp1203 = icmp ne i32 %call1202, 0
  br i1 %cmp1203, label %if.then1205, label %if.end1206

if.then1205:                                      ; preds = %if.end1201
  call void @abort() noreturn
  unreachable

if.end1206:                                       ; preds = %if.end1201
  %call1207 = call i32 @ashiftrt_si_31(i32 0)
  %cmp1208 = icmp ne i32 %call1207, 0
  br i1 %cmp1208, label %if.then1210, label %if.end1211

if.then1210:                                      ; preds = %if.end1206
  call void @abort() noreturn
  unreachable

if.end1211:                                       ; preds = %if.end1206
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
