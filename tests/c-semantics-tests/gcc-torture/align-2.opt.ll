; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/align-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_short = type { i8, i16 }
%struct.a_int = type { i8, i32 }
%struct.b_int = type { i16, i32 }
%struct.a_float = type { i8, float }
%struct.b_float = type { i16, float }
%struct.a_double = type { i8, double }
%struct.b_double = type { i16, double }
%struct.c_double = type { i32, double }
%struct.d_double = type { float, double }
%struct.a_ldouble = type { i8, x86_fp80 }
%struct.b_ldouble = type { i16, x86_fp80 }
%struct.c_ldouble = type { i32, x86_fp80 }
%struct.d_ldouble = type { float, x86_fp80 }
%struct.e_ldouble = type { double, x86_fp80 }

@s_c_s = global %struct.a_short { i8 97, i16 13 }, align 2
@s_c_i = global %struct.a_int { i8 98, i32 14 }, align 4
@s_s_i = global %struct.b_int { i16 15, i32 16 }, align 4
@s_c_f = global %struct.a_float { i8 99, float 1.700000e+01 }, align 4
@s_s_f = global %struct.b_float { i16 18, float 1.900000e+01 }, align 4
@s_c_d = global %struct.a_double { i8 100, double 2.000000e+01 }, align 8
@s_s_d = global %struct.b_double { i16 21, double 2.200000e+01 }, align 8
@s_i_d = global %struct.c_double { i32 23, double 2.400000e+01 }, align 8
@s_f_d = global %struct.d_double { float 2.500000e+01, double 2.600000e+01 }, align 8
@s_c_ld = global %struct.a_ldouble { i8 101, x86_fp80 0xK4003D800000000000000 }, align 16
@s_s_ld = global %struct.b_ldouble { i16 28, x86_fp80 0xK4003E800000000000000 }, align 16
@s_i_ld = global %struct.c_ldouble { i32 30, x86_fp80 0xK4003F800000000000000 }, align 16
@s_f_ld = global %struct.d_ldouble { float 3.200000e+01, x86_fp80 0xK40048400000000000000 }, align 16
@s_d_ld = global %struct.e_ldouble { double 3.400000e+01, x86_fp80 0xK40048C00000000000000 }, align 16

define i32 @main() nounwind uwtable {
entry:
  %0 = load i8* getelementptr inbounds (%struct.a_short* @s_c_s, i64 0, i32 0), align 2, !tbaa !0
  %cmp = icmp eq i8 %0, 97
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i16* getelementptr inbounds (%struct.a_short* @s_c_s, i64 0, i32 1), align 2, !tbaa !2
  %cmp3 = icmp eq i16 %1, 13
  br i1 %cmp3, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = load i8* getelementptr inbounds (%struct.a_int* @s_c_i, i64 0, i32 0), align 4, !tbaa !0
  %cmp8 = icmp eq i8 %2, 98
  br i1 %cmp8, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end6
  %3 = load i32* getelementptr inbounds (%struct.a_int* @s_c_i, i64 0, i32 1), align 4, !tbaa !3
  %cmp12 = icmp eq i32 %3, 14
  br i1 %cmp12, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end11
  tail call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end11
  %4 = load i16* getelementptr inbounds (%struct.b_int* @s_s_i, i64 0, i32 0), align 4, !tbaa !2
  %cmp17 = icmp eq i16 %4, 15
  br i1 %cmp17, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end15
  tail call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end15
  %5 = load i32* getelementptr inbounds (%struct.b_int* @s_s_i, i64 0, i32 1), align 4, !tbaa !3
  %cmp21 = icmp eq i32 %5, 16
  br i1 %cmp21, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  tail call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %6 = load i8* getelementptr inbounds (%struct.a_float* @s_c_f, i64 0, i32 0), align 4, !tbaa !0
  %cmp26 = icmp eq i8 %6, 99
  br i1 %cmp26, label %if.end29, label %if.then28

if.then28:                                        ; preds = %if.end24
  tail call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.end24
  %7 = load float* getelementptr inbounds (%struct.a_float* @s_c_f, i64 0, i32 1), align 4, !tbaa !4
  %cmp31 = fcmp une float %7, 1.700000e+01
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end29
  tail call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end29
  %8 = load i16* getelementptr inbounds (%struct.b_float* @s_s_f, i64 0, i32 0), align 4, !tbaa !2
  %cmp36 = icmp eq i16 %8, 18
  br i1 %cmp36, label %if.end39, label %if.then38

if.then38:                                        ; preds = %if.end34
  tail call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.end34
  %9 = load float* getelementptr inbounds (%struct.b_float* @s_s_f, i64 0, i32 1), align 4, !tbaa !4
  %cmp41 = fcmp une float %9, 1.900000e+01
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end39
  tail call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end39
  %10 = load i8* getelementptr inbounds (%struct.a_double* @s_c_d, i64 0, i32 0), align 8, !tbaa !0
  %cmp46 = icmp eq i8 %10, 100
  br i1 %cmp46, label %if.end49, label %if.then48

if.then48:                                        ; preds = %if.end44
  tail call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end44
  %11 = load double* getelementptr inbounds (%struct.a_double* @s_c_d, i64 0, i32 1), align 8, !tbaa !5
  %cmp50 = fcmp une double %11, 2.000000e+01
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end49
  tail call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end49
  %12 = load i16* getelementptr inbounds (%struct.b_double* @s_s_d, i64 0, i32 0), align 8, !tbaa !2
  %cmp55 = icmp eq i16 %12, 21
  br i1 %cmp55, label %if.end58, label %if.then57

if.then57:                                        ; preds = %if.end53
  tail call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end53
  %13 = load double* getelementptr inbounds (%struct.b_double* @s_s_d, i64 0, i32 1), align 8, !tbaa !5
  %cmp59 = fcmp une double %13, 2.200000e+01
  br i1 %cmp59, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end58
  tail call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %if.end58
  %14 = load i32* getelementptr inbounds (%struct.c_double* @s_i_d, i64 0, i32 0), align 8, !tbaa !3
  %cmp63 = icmp eq i32 %14, 23
  br i1 %cmp63, label %if.end66, label %if.then65

if.then65:                                        ; preds = %if.end62
  tail call void @abort() noreturn nounwind
  unreachable

if.end66:                                         ; preds = %if.end62
  %15 = load double* getelementptr inbounds (%struct.c_double* @s_i_d, i64 0, i32 1), align 8, !tbaa !5
  %cmp67 = fcmp une double %15, 2.400000e+01
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end66
  tail call void @abort() noreturn nounwind
  unreachable

if.end70:                                         ; preds = %if.end66
  %16 = load float* getelementptr inbounds (%struct.d_double* @s_f_d, i64 0, i32 0), align 8, !tbaa !4
  %cmp72 = fcmp une float %16, 2.500000e+01
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end70
  tail call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %if.end70
  %17 = load double* getelementptr inbounds (%struct.d_double* @s_f_d, i64 0, i32 1), align 8, !tbaa !5
  %cmp76 = fcmp une double %17, 2.600000e+01
  br i1 %cmp76, label %if.then78, label %if.end79

if.then78:                                        ; preds = %if.end75
  tail call void @abort() noreturn nounwind
  unreachable

if.end79:                                         ; preds = %if.end75
  %18 = load i8* getelementptr inbounds (%struct.a_ldouble* @s_c_ld, i64 0, i32 0), align 16, !tbaa !0
  %cmp81 = icmp eq i8 %18, 101
  br i1 %cmp81, label %if.end84, label %if.then83

if.then83:                                        ; preds = %if.end79
  tail call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end79
  %19 = load x86_fp80* getelementptr inbounds (%struct.a_ldouble* @s_c_ld, i64 0, i32 1), align 16, !tbaa !6
  %cmp85 = fcmp une x86_fp80 %19, 0xK4003D800000000000000
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  tail call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %20 = load i16* getelementptr inbounds (%struct.b_ldouble* @s_s_ld, i64 0, i32 0), align 16, !tbaa !2
  %cmp90 = icmp eq i16 %20, 28
  br i1 %cmp90, label %if.end93, label %if.then92

if.then92:                                        ; preds = %if.end88
  tail call void @abort() noreturn nounwind
  unreachable

if.end93:                                         ; preds = %if.end88
  %21 = load x86_fp80* getelementptr inbounds (%struct.b_ldouble* @s_s_ld, i64 0, i32 1), align 16, !tbaa !6
  %cmp94 = fcmp une x86_fp80 %21, 0xK4003E800000000000000
  br i1 %cmp94, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.end93
  tail call void @abort() noreturn nounwind
  unreachable

if.end97:                                         ; preds = %if.end93
  %22 = load i32* getelementptr inbounds (%struct.c_ldouble* @s_i_ld, i64 0, i32 0), align 16, !tbaa !3
  %cmp98 = icmp eq i32 %22, 30
  br i1 %cmp98, label %if.end101, label %if.then100

if.then100:                                       ; preds = %if.end97
  tail call void @abort() noreturn nounwind
  unreachable

if.end101:                                        ; preds = %if.end97
  %23 = load x86_fp80* getelementptr inbounds (%struct.c_ldouble* @s_i_ld, i64 0, i32 1), align 16, !tbaa !6
  %cmp102 = fcmp une x86_fp80 %23, 0xK4003F800000000000000
  br i1 %cmp102, label %if.then104, label %if.end105

if.then104:                                       ; preds = %if.end101
  tail call void @abort() noreturn nounwind
  unreachable

if.end105:                                        ; preds = %if.end101
  %24 = load float* getelementptr inbounds (%struct.d_ldouble* @s_f_ld, i64 0, i32 0), align 16, !tbaa !4
  %cmp107 = fcmp une float %24, 3.200000e+01
  br i1 %cmp107, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.end105
  tail call void @abort() noreturn nounwind
  unreachable

if.end110:                                        ; preds = %if.end105
  %25 = load x86_fp80* getelementptr inbounds (%struct.d_ldouble* @s_f_ld, i64 0, i32 1), align 16, !tbaa !6
  %cmp111 = fcmp une x86_fp80 %25, 0xK40048400000000000000
  br i1 %cmp111, label %if.then113, label %if.end114

if.then113:                                       ; preds = %if.end110
  tail call void @abort() noreturn nounwind
  unreachable

if.end114:                                        ; preds = %if.end110
  %26 = load double* getelementptr inbounds (%struct.e_ldouble* @s_d_ld, i64 0, i32 0), align 16, !tbaa !5
  %cmp115 = fcmp une double %26, 3.400000e+01
  br i1 %cmp115, label %if.then117, label %if.end118

if.then117:                                       ; preds = %if.end114
  tail call void @abort() noreturn nounwind
  unreachable

if.end118:                                        ; preds = %if.end114
  %27 = load x86_fp80* getelementptr inbounds (%struct.e_ldouble* @s_d_ld, i64 0, i32 1), align 16, !tbaa !6
  %cmp119 = fcmp une x86_fp80 %27, 0xK40048C00000000000000
  br i1 %cmp119, label %if.then121, label %if.end122

if.then121:                                       ; preds = %if.end118
  tail call void @abort() noreturn nounwind
  unreachable

if.end122:                                        ; preds = %if.end118
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"short", metadata !0}
!3 = metadata !{metadata !"int", metadata !0}
!4 = metadata !{metadata !"float", metadata !0}
!5 = metadata !{metadata !"double", metadata !0}
!6 = metadata !{metadata !"long double", metadata !0}
