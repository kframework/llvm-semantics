; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/cvt.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%d %d %d %d %u %u %u %u\0A\00", align 1
@c = common global i8 0, align 1
@s = common global i16 0, align 2
@i = common global i32 0, align 4
@l = common global i64 0, align 8
@C = common global i8 0, align 1
@S = common global i16 0, align 2
@I = common global i32 0, align 4
@L = common global i64 0, align 8
@f = common global float 0.000000e+00, align 4
@d = common global double 0.000000e+00, align 8
@D = common global x86_fp80 0xK00000000000000000000, align 16
@p = common global i8* null, align 8
@P = common global void ()* null, align 8

define void @print() nounwind uwtable {
entry:
  %0 = load i8* @c, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  %1 = load i16* @s, align 2, !tbaa !2
  %conv1 = sext i16 %1 to i32
  %2 = load i32* @i, align 4, !tbaa !3
  %3 = load i64* @l, align 8, !tbaa !4
  %4 = load i8* @C, align 1, !tbaa !0
  %conv2 = zext i8 %4 to i32
  %5 = load i16* @S, align 2, !tbaa !2
  %conv3 = zext i16 %5 to i32
  %6 = load i32* @I, align 4, !tbaa !3
  %7 = load i64* @L, align 8, !tbaa !4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv1, i32 %2, i64 %3, i32 %conv2, i32 %conv3, i32 %6, i64 %7) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i8 1, i8* @c, align 1, !tbaa !0
  store i16 1, i16* @s, align 2, !tbaa !2
  store i32 1, i32* @i, align 4, !tbaa !3
  store i64 1, i64* @l, align 8, !tbaa !4
  store i8 1, i8* @C, align 1, !tbaa !0
  store i16 1, i16* @S, align 2, !tbaa !2
  store i32 1, i32* @I, align 4, !tbaa !3
  store i64 1, i64* @L, align 8, !tbaa !4
  store float 1.000000e+00, float* @f, align 4, !tbaa !5
  store double 1.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK3FFF8000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 1, i32 1, i32 1, i64 1, i32 1, i32 1, i32 1, i64 1) nounwind
  store i16 2, i16* @s, align 2, !tbaa !2
  store i8 2, i8* @c, align 1, !tbaa !0
  store i32 2, i32* @i, align 4, !tbaa !3
  store i64 2, i64* @l, align 8, !tbaa !4
  store i8 2, i8* @C, align 1, !tbaa !0
  store i16 2, i16* @S, align 2, !tbaa !2
  store i32 2, i32* @I, align 4, !tbaa !3
  store i64 2, i64* @L, align 8, !tbaa !4
  store float 2.000000e+00, float* @f, align 4, !tbaa !5
  store double 2.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK40008000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i106 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 2, i32 2, i32 2, i64 2, i32 2, i32 2, i32 2, i64 2) nounwind
  store i32 3, i32* @i, align 4, !tbaa !3
  store i8 3, i8* @c, align 1, !tbaa !0
  store i16 3, i16* @s, align 2, !tbaa !2
  store i64 3, i64* @l, align 8, !tbaa !4
  store i8 3, i8* @C, align 1, !tbaa !0
  store i16 3, i16* @S, align 2, !tbaa !2
  store i32 3, i32* @I, align 4, !tbaa !3
  store i64 3, i64* @L, align 8, !tbaa !4
  store float 3.000000e+00, float* @f, align 4, !tbaa !5
  store double 3.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK4000C000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i111 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 3, i32 3, i32 3, i64 3, i32 3, i32 3, i32 3, i64 3) nounwind
  store i64 4, i64* @l, align 8, !tbaa !4
  store i8 4, i8* @c, align 1, !tbaa !0
  store i16 4, i16* @s, align 2, !tbaa !2
  store i32 4, i32* @i, align 4, !tbaa !3
  store i8 4, i8* @C, align 1, !tbaa !0
  store i16 4, i16* @S, align 2, !tbaa !2
  store i32 4, i32* @I, align 4, !tbaa !3
  store i64 4, i64* @L, align 8, !tbaa !4
  store float 4.000000e+00, float* @f, align 4, !tbaa !5
  store double 4.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK40018000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i116 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 4, i32 4, i32 4, i64 4, i32 4, i32 4, i32 4, i64 4) nounwind
  store i8 5, i8* @C, align 1, !tbaa !0
  store i8 5, i8* @c, align 1, !tbaa !0
  store i16 5, i16* @s, align 2, !tbaa !2
  store i32 5, i32* @i, align 4, !tbaa !3
  store i64 5, i64* @l, align 8, !tbaa !4
  store i16 5, i16* @S, align 2, !tbaa !2
  store i32 5, i32* @I, align 4, !tbaa !3
  store i64 5, i64* @L, align 8, !tbaa !4
  store float 5.000000e+00, float* @f, align 4, !tbaa !5
  store double 5.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK4001A000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i121 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 5, i32 5, i32 5, i64 5, i32 5, i32 5, i32 5, i64 5) nounwind
  store i16 6, i16* @S, align 2, !tbaa !2
  store i8 6, i8* @c, align 1, !tbaa !0
  store i16 6, i16* @s, align 2, !tbaa !2
  store i32 6, i32* @i, align 4, !tbaa !3
  store i64 6, i64* @l, align 8, !tbaa !4
  store i8 6, i8* @C, align 1, !tbaa !0
  store i32 6, i32* @I, align 4, !tbaa !3
  store i64 6, i64* @L, align 8, !tbaa !4
  store float 6.000000e+00, float* @f, align 4, !tbaa !5
  store double 6.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK4001C000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i126 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 6, i32 6, i32 6, i64 6, i32 6, i32 6, i32 6, i64 6) nounwind
  store i32 7, i32* @I, align 4, !tbaa !3
  store i8 7, i8* @c, align 1, !tbaa !0
  store i16 7, i16* @s, align 2, !tbaa !2
  store i32 7, i32* @i, align 4, !tbaa !3
  store i64 7, i64* @l, align 8, !tbaa !4
  store i8 7, i8* @C, align 1, !tbaa !0
  store i16 7, i16* @S, align 2, !tbaa !2
  store i64 7, i64* @L, align 8, !tbaa !4
  store float 7.000000e+00, float* @f, align 4, !tbaa !5
  store double 7.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK4001E000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i131 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 7, i32 7, i32 7, i64 7, i32 7, i32 7, i32 7, i64 7) nounwind
  store i64 8, i64* @L, align 8, !tbaa !4
  store i8 8, i8* @c, align 1, !tbaa !0
  store i16 8, i16* @s, align 2, !tbaa !2
  store i32 8, i32* @i, align 4, !tbaa !3
  store i64 8, i64* @l, align 8, !tbaa !4
  store i8 8, i8* @C, align 1, !tbaa !0
  store i16 8, i16* @S, align 2, !tbaa !2
  store i32 8, i32* @I, align 4, !tbaa !3
  store float 8.000000e+00, float* @f, align 4, !tbaa !5
  store double 8.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK40028000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i136 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 8, i32 8, i32 8, i64 8, i32 8, i32 8, i32 8, i64 8) nounwind
  store float 9.000000e+00, float* @f, align 4, !tbaa !5
  store i8 9, i8* @c, align 1, !tbaa !0
  store i16 9, i16* @s, align 2, !tbaa !2
  store i32 9, i32* @i, align 4, !tbaa !3
  store i64 9, i64* @l, align 8, !tbaa !4
  store i8 9, i8* @C, align 1, !tbaa !0
  store i16 9, i16* @S, align 2, !tbaa !2
  store i32 9, i32* @I, align 4, !tbaa !3
  store i64 9, i64* @L, align 8, !tbaa !4
  store double 9.000000e+00, double* @d, align 8, !tbaa !6
  store x86_fp80 0xK40029000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i141 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 9, i32 9, i32 9, i64 9, i32 9, i32 9, i32 9, i64 9) nounwind
  store double 1.000000e+01, double* @d, align 8, !tbaa !6
  store i8 10, i8* @c, align 1, !tbaa !0
  store i16 10, i16* @s, align 2, !tbaa !2
  store i32 10, i32* @i, align 4, !tbaa !3
  store i64 10, i64* @l, align 8, !tbaa !4
  store i8 10, i8* @C, align 1, !tbaa !0
  store i16 10, i16* @S, align 2, !tbaa !2
  store i32 10, i32* @I, align 4, !tbaa !3
  store i64 10, i64* @L, align 8, !tbaa !4
  store float 1.000000e+01, float* @f, align 4, !tbaa !5
  store x86_fp80 0xK4002A000000000000000, x86_fp80* @D, align 16, !tbaa !7
  %call.i146 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 10, i32 10, i32 10, i64 10, i32 10, i32 10, i32 10, i64 10) nounwind
  store x86_fp80 0xK4002B000000000000000, x86_fp80* @D, align 16, !tbaa !7
  store i8 11, i8* @c, align 1, !tbaa !0
  store i16 11, i16* @s, align 2, !tbaa !2
  store i32 11, i32* @i, align 4, !tbaa !3
  store i64 11, i64* @l, align 8, !tbaa !4
  store i8 11, i8* @C, align 1, !tbaa !0
  store i16 11, i16* @S, align 2, !tbaa !2
  store i32 11, i32* @I, align 4, !tbaa !3
  store i64 11, i64* @L, align 8, !tbaa !4
  store float 1.100000e+01, float* @f, align 4, !tbaa !5
  store double 1.100000e+01, double* @d, align 8, !tbaa !6
  %call.i151 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 11, i32 11, i32 11, i64 11, i32 11, i32 11, i32 11, i64 11) nounwind
  %0 = load void ()** @P, align 8, !tbaa !8
  %1 = bitcast void ()* %0 to i8*
  store i8* %1, i8** @p, align 8, !tbaa !8
  ret i32 0
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"short", metadata !0}
!3 = metadata !{metadata !"int", metadata !0}
!4 = metadata !{metadata !"long", metadata !0}
!5 = metadata !{metadata !"float", metadata !0}
!6 = metadata !{metadata !"double", metadata !0}
!7 = metadata !{metadata !"long double", metadata !0}
!8 = metadata !{metadata !"any pointer", metadata !0}
