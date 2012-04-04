; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020108-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i8 @ashift_qi_0(i8 zeroext %n) nounwind uwtable readnone {
entry:
  ret i8 %n
}

define zeroext i8 @ashift_qi_1(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i8 %n, 1
  ret i8 %shl
}

define zeroext i8 @ashift_qi_2(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i8 %n, 2
  ret i8 %shl
}

define zeroext i8 @ashift_qi_3(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i8 %n, 3
  ret i8 %shl
}

define zeroext i8 @ashift_qi_4(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i8 %n, 4
  ret i8 %shl
}

define zeroext i8 @ashift_qi_5(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i8 %n, 5
  ret i8 %shl
}

define zeroext i8 @ashift_qi_6(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i8 %n, 6
  ret i8 %shl
}

define zeroext i8 @ashift_qi_7(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i8 %n, 7
  ret i8 %shl
}

define zeroext i8 @lshiftrt_qi_0(i8 zeroext %n) nounwind uwtable readnone {
entry:
  ret i8 %n
}

define zeroext i8 @lshiftrt_qi_1(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i8 %n, 1
  ret i8 %shr2
}

define zeroext i8 @lshiftrt_qi_2(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i8 %n, 2
  ret i8 %shr2
}

define zeroext i8 @lshiftrt_qi_3(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i8 %n, 3
  ret i8 %shr2
}

define zeroext i8 @lshiftrt_qi_4(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i8 %n, 4
  ret i8 %shr2
}

define zeroext i8 @lshiftrt_qi_5(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i8 %n, 5
  ret i8 %shr2
}

define zeroext i8 @lshiftrt_qi_6(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i8 %n, 6
  ret i8 %shr2
}

define zeroext i8 @lshiftrt_qi_7(i8 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i8 %n, 7
  ret i8 %shr2
}

define signext i8 @ashiftrt_qi_0(i8 signext %n) nounwind uwtable readnone {
entry:
  ret i8 %n
}

define signext i8 @ashiftrt_qi_1(i8 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i8 %n to i32
  %shr2 = lshr i32 %conv, 1
  %conv1 = trunc i32 %shr2 to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_2(i8 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i8 %n to i32
  %shr2 = lshr i32 %conv, 2
  %conv1 = trunc i32 %shr2 to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_3(i8 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i8 %n to i32
  %shr2 = lshr i32 %conv, 3
  %conv1 = trunc i32 %shr2 to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_4(i8 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i8 %n to i32
  %shr2 = lshr i32 %conv, 4
  %conv1 = trunc i32 %shr2 to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_5(i8 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i8 %n to i32
  %shr2 = lshr i32 %conv, 5
  %conv1 = trunc i32 %shr2 to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_6(i8 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i8 %n to i32
  %shr2 = lshr i32 %conv, 6
  %conv1 = trunc i32 %shr2 to i8
  ret i8 %conv1
}

define signext i8 @ashiftrt_qi_7(i8 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i8 %n to i32
  %shr2 = lshr i32 %conv, 7
  %conv1 = trunc i32 %shr2 to i8
  ret i8 %conv1
}

define zeroext i16 @ashift_hi_0(i16 zeroext %n) nounwind uwtable readnone {
entry:
  ret i16 %n
}

define zeroext i16 @ashift_hi_1(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 1
  ret i16 %shl
}

define zeroext i16 @ashift_hi_2(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 2
  ret i16 %shl
}

define zeroext i16 @ashift_hi_3(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 3
  ret i16 %shl
}

define zeroext i16 @ashift_hi_4(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 4
  ret i16 %shl
}

define zeroext i16 @ashift_hi_5(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 5
  ret i16 %shl
}

define zeroext i16 @ashift_hi_6(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 6
  ret i16 %shl
}

define zeroext i16 @ashift_hi_7(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 7
  ret i16 %shl
}

define zeroext i16 @ashift_hi_8(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 8
  ret i16 %shl
}

define zeroext i16 @ashift_hi_9(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 9
  ret i16 %shl
}

define zeroext i16 @ashift_hi_10(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 10
  ret i16 %shl
}

define zeroext i16 @ashift_hi_11(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 11
  ret i16 %shl
}

define zeroext i16 @ashift_hi_12(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 12
  ret i16 %shl
}

define zeroext i16 @ashift_hi_13(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 13
  ret i16 %shl
}

define zeroext i16 @ashift_hi_14(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 14
  ret i16 %shl
}

define zeroext i16 @ashift_hi_15(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shl = shl i16 %n, 15
  ret i16 %shl
}

define zeroext i16 @lshiftrt_hi_0(i16 zeroext %n) nounwind uwtable readnone {
entry:
  ret i16 %n
}

define zeroext i16 @lshiftrt_hi_1(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 1
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_2(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 2
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_3(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 3
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_4(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 4
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_5(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 5
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_6(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 6
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_7(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 7
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_8(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 8
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_9(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 9
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_10(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 10
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_11(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 11
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_12(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 12
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_13(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 13
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_14(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 14
  ret i16 %shr2
}

define zeroext i16 @lshiftrt_hi_15(i16 zeroext %n) nounwind uwtable readnone {
entry:
  %shr2 = lshr i16 %n, 15
  ret i16 %shr2
}

define signext i16 @ashiftrt_hi_0(i16 signext %n) nounwind uwtable readnone {
entry:
  ret i16 %n
}

define signext i16 @ashiftrt_hi_1(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 1
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_2(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 2
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_3(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 3
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_4(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 4
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_5(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 5
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_6(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 6
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_7(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 7
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_8(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 8
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_9(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 9
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_10(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 10
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_11(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 11
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_12(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 12
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_13(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 13
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_14(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 14
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define signext i16 @ashiftrt_hi_15(i16 signext %n) nounwind uwtable readnone {
entry:
  %conv = sext i16 %n to i32
  %shr2 = lshr i32 %conv, 15
  %conv1 = trunc i32 %shr2 to i16
  ret i16 %conv1
}

define i32 @ashift_si_0(i32 %n) nounwind uwtable readnone {
entry:
  ret i32 %n
}

define i32 @ashift_si_1(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 1
  ret i32 %shl
}

define i32 @ashift_si_2(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 2
  ret i32 %shl
}

define i32 @ashift_si_3(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 3
  ret i32 %shl
}

define i32 @ashift_si_4(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 4
  ret i32 %shl
}

define i32 @ashift_si_5(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 5
  ret i32 %shl
}

define i32 @ashift_si_6(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 6
  ret i32 %shl
}

define i32 @ashift_si_7(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 7
  ret i32 %shl
}

define i32 @ashift_si_8(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 8
  ret i32 %shl
}

define i32 @ashift_si_9(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 9
  ret i32 %shl
}

define i32 @ashift_si_10(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 10
  ret i32 %shl
}

define i32 @ashift_si_11(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 11
  ret i32 %shl
}

define i32 @ashift_si_12(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 12
  ret i32 %shl
}

define i32 @ashift_si_13(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 13
  ret i32 %shl
}

define i32 @ashift_si_14(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 14
  ret i32 %shl
}

define i32 @ashift_si_15(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 15
  ret i32 %shl
}

define i32 @ashift_si_16(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 16
  ret i32 %shl
}

define i32 @ashift_si_17(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 17
  ret i32 %shl
}

define i32 @ashift_si_18(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 18
  ret i32 %shl
}

define i32 @ashift_si_19(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 19
  ret i32 %shl
}

define i32 @ashift_si_20(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 20
  ret i32 %shl
}

define i32 @ashift_si_21(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 21
  ret i32 %shl
}

define i32 @ashift_si_22(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 22
  ret i32 %shl
}

define i32 @ashift_si_23(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 23
  ret i32 %shl
}

define i32 @ashift_si_24(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 24
  ret i32 %shl
}

define i32 @ashift_si_25(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 25
  ret i32 %shl
}

define i32 @ashift_si_26(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 26
  ret i32 %shl
}

define i32 @ashift_si_27(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 27
  ret i32 %shl
}

define i32 @ashift_si_28(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 28
  ret i32 %shl
}

define i32 @ashift_si_29(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 29
  ret i32 %shl
}

define i32 @ashift_si_30(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 30
  ret i32 %shl
}

define i32 @ashift_si_31(i32 %n) nounwind uwtable readnone {
entry:
  %shl = shl i32 %n, 31
  ret i32 %shl
}

define i32 @lshiftrt_si_0(i32 %n) nounwind uwtable readnone {
entry:
  ret i32 %n
}

define i32 @lshiftrt_si_1(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 1
  ret i32 %shr
}

define i32 @lshiftrt_si_2(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 2
  ret i32 %shr
}

define i32 @lshiftrt_si_3(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 3
  ret i32 %shr
}

define i32 @lshiftrt_si_4(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 4
  ret i32 %shr
}

define i32 @lshiftrt_si_5(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 5
  ret i32 %shr
}

define i32 @lshiftrt_si_6(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 6
  ret i32 %shr
}

define i32 @lshiftrt_si_7(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 7
  ret i32 %shr
}

define i32 @lshiftrt_si_8(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 8
  ret i32 %shr
}

define i32 @lshiftrt_si_9(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 9
  ret i32 %shr
}

define i32 @lshiftrt_si_10(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 10
  ret i32 %shr
}

define i32 @lshiftrt_si_11(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 11
  ret i32 %shr
}

define i32 @lshiftrt_si_12(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 12
  ret i32 %shr
}

define i32 @lshiftrt_si_13(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 13
  ret i32 %shr
}

define i32 @lshiftrt_si_14(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 14
  ret i32 %shr
}

define i32 @lshiftrt_si_15(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 15
  ret i32 %shr
}

define i32 @lshiftrt_si_16(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 16
  ret i32 %shr
}

define i32 @lshiftrt_si_17(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 17
  ret i32 %shr
}

define i32 @lshiftrt_si_18(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 18
  ret i32 %shr
}

define i32 @lshiftrt_si_19(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 19
  ret i32 %shr
}

define i32 @lshiftrt_si_20(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 20
  ret i32 %shr
}

define i32 @lshiftrt_si_21(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 21
  ret i32 %shr
}

define i32 @lshiftrt_si_22(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 22
  ret i32 %shr
}

define i32 @lshiftrt_si_23(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 23
  ret i32 %shr
}

define i32 @lshiftrt_si_24(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 24
  ret i32 %shr
}

define i32 @lshiftrt_si_25(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 25
  ret i32 %shr
}

define i32 @lshiftrt_si_26(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 26
  ret i32 %shr
}

define i32 @lshiftrt_si_27(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 27
  ret i32 %shr
}

define i32 @lshiftrt_si_28(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 28
  ret i32 %shr
}

define i32 @lshiftrt_si_29(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 29
  ret i32 %shr
}

define i32 @lshiftrt_si_30(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 30
  ret i32 %shr
}

define i32 @lshiftrt_si_31(i32 %n) nounwind uwtable readnone {
entry:
  %shr = lshr i32 %n, 31
  ret i32 %shr
}

define i32 @ashiftrt_si_0(i32 %n) nounwind uwtable readnone {
entry:
  ret i32 %n
}

define i32 @ashiftrt_si_1(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 1
  ret i32 %shr
}

define i32 @ashiftrt_si_2(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 2
  ret i32 %shr
}

define i32 @ashiftrt_si_3(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 3
  ret i32 %shr
}

define i32 @ashiftrt_si_4(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 4
  ret i32 %shr
}

define i32 @ashiftrt_si_5(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 5
  ret i32 %shr
}

define i32 @ashiftrt_si_6(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 6
  ret i32 %shr
}

define i32 @ashiftrt_si_7(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 7
  ret i32 %shr
}

define i32 @ashiftrt_si_8(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 8
  ret i32 %shr
}

define i32 @ashiftrt_si_9(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 9
  ret i32 %shr
}

define i32 @ashiftrt_si_10(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 10
  ret i32 %shr
}

define i32 @ashiftrt_si_11(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 11
  ret i32 %shr
}

define i32 @ashiftrt_si_12(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 12
  ret i32 %shr
}

define i32 @ashiftrt_si_13(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 13
  ret i32 %shr
}

define i32 @ashiftrt_si_14(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 14
  ret i32 %shr
}

define i32 @ashiftrt_si_15(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 15
  ret i32 %shr
}

define i32 @ashiftrt_si_16(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 16
  ret i32 %shr
}

define i32 @ashiftrt_si_17(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 17
  ret i32 %shr
}

define i32 @ashiftrt_si_18(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 18
  ret i32 %shr
}

define i32 @ashiftrt_si_19(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 19
  ret i32 %shr
}

define i32 @ashiftrt_si_20(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 20
  ret i32 %shr
}

define i32 @ashiftrt_si_21(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 21
  ret i32 %shr
}

define i32 @ashiftrt_si_22(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 22
  ret i32 %shr
}

define i32 @ashiftrt_si_23(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 23
  ret i32 %shr
}

define i32 @ashiftrt_si_24(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 24
  ret i32 %shr
}

define i32 @ashiftrt_si_25(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 25
  ret i32 %shr
}

define i32 @ashiftrt_si_26(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 26
  ret i32 %shr
}

define i32 @ashiftrt_si_27(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 27
  ret i32 %shr
}

define i32 @ashiftrt_si_28(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 28
  ret i32 %shr
}

define i32 @ashiftrt_si_29(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 29
  ret i32 %shr
}

define i32 @ashiftrt_si_30(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 30
  ret i32 %shr
}

define i32 @ashiftrt_si_31(i32 %n) nounwind uwtable readnone {
entry:
  %shr = ashr i32 %n, 31
  ret i32 %shr
}

define i32 @main() noreturn nounwind uwtable {
if.end1211:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
