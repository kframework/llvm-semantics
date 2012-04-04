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
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i8* getelementptr inbounds (%struct.a_short* @s_c_s, i32 0, i32 0), align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp ne i32 %conv, 97
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i16* getelementptr inbounds (%struct.a_short* @s_c_s, i32 0, i32 1), align 2
  %conv2 = sext i16 %1 to i32
  %cmp3 = icmp ne i32 %conv2, 13
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %2 = load i8* getelementptr inbounds (%struct.a_int* @s_c_i, i32 0, i32 0), align 1
  %conv7 = sext i8 %2 to i32
  %cmp8 = icmp ne i32 %conv7, 98
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end6
  %3 = load i32* getelementptr inbounds (%struct.a_int* @s_c_i, i32 0, i32 1), align 4
  %cmp12 = icmp ne i32 %3, 14
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end11
  %4 = load i16* getelementptr inbounds (%struct.b_int* @s_s_i, i32 0, i32 0), align 2
  %conv16 = sext i16 %4 to i32
  %cmp17 = icmp ne i32 %conv16, 15
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end15
  %5 = load i32* getelementptr inbounds (%struct.b_int* @s_s_i, i32 0, i32 1), align 4
  %cmp21 = icmp ne i32 %5, 16
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %6 = load i8* getelementptr inbounds (%struct.a_float* @s_c_f, i32 0, i32 0), align 1
  %conv25 = sext i8 %6 to i32
  %cmp26 = icmp ne i32 %conv25, 99
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.end24
  %7 = load float* getelementptr inbounds (%struct.a_float* @s_c_f, i32 0, i32 1), align 4
  %conv30 = fpext float %7 to double
  %cmp31 = fcmp une double %conv30, 1.700000e+01
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end29
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end29
  %8 = load i16* getelementptr inbounds (%struct.b_float* @s_s_f, i32 0, i32 0), align 2
  %conv35 = sext i16 %8 to i32
  %cmp36 = icmp ne i32 %conv35, 18
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end34
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %if.end34
  %9 = load float* getelementptr inbounds (%struct.b_float* @s_s_f, i32 0, i32 1), align 4
  %conv40 = fpext float %9 to double
  %cmp41 = fcmp une double %conv40, 1.900000e+01
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end39
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end39
  %10 = load i8* getelementptr inbounds (%struct.a_double* @s_c_d, i32 0, i32 0), align 1
  %conv45 = sext i8 %10 to i32
  %cmp46 = icmp ne i32 %conv45, 100
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end44
  %11 = load double* getelementptr inbounds (%struct.a_double* @s_c_d, i32 0, i32 1), align 8
  %cmp50 = fcmp une double %11, 2.000000e+01
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end49
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end49
  %12 = load i16* getelementptr inbounds (%struct.b_double* @s_s_d, i32 0, i32 0), align 2
  %conv54 = sext i16 %12 to i32
  %cmp55 = icmp ne i32 %conv54, 21
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end53
  call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end53
  %13 = load double* getelementptr inbounds (%struct.b_double* @s_s_d, i32 0, i32 1), align 8
  %cmp59 = fcmp une double %13, 2.200000e+01
  br i1 %cmp59, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end58
  call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %if.end58
  %14 = load i32* getelementptr inbounds (%struct.c_double* @s_i_d, i32 0, i32 0), align 4
  %cmp63 = icmp ne i32 %14, 23
  br i1 %cmp63, label %if.then65, label %if.end66

if.then65:                                        ; preds = %if.end62
  call void @abort() noreturn nounwind
  unreachable

if.end66:                                         ; preds = %if.end62
  %15 = load double* getelementptr inbounds (%struct.c_double* @s_i_d, i32 0, i32 1), align 8
  %cmp67 = fcmp une double %15, 2.400000e+01
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end66
  call void @abort() noreturn nounwind
  unreachable

if.end70:                                         ; preds = %if.end66
  %16 = load float* getelementptr inbounds (%struct.d_double* @s_f_d, i32 0, i32 0), align 4
  %conv71 = fpext float %16 to double
  %cmp72 = fcmp une double %conv71, 2.500000e+01
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end70
  call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %if.end70
  %17 = load double* getelementptr inbounds (%struct.d_double* @s_f_d, i32 0, i32 1), align 8
  %cmp76 = fcmp une double %17, 2.600000e+01
  br i1 %cmp76, label %if.then78, label %if.end79

if.then78:                                        ; preds = %if.end75
  call void @abort() noreturn nounwind
  unreachable

if.end79:                                         ; preds = %if.end75
  %18 = load i8* getelementptr inbounds (%struct.a_ldouble* @s_c_ld, i32 0, i32 0), align 1
  %conv80 = sext i8 %18 to i32
  %cmp81 = icmp ne i32 %conv80, 101
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end79
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end79
  %19 = load x86_fp80* getelementptr inbounds (%struct.a_ldouble* @s_c_ld, i32 0, i32 1), align 16
  %cmp85 = fcmp une x86_fp80 %19, 0xK4003D800000000000000
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %20 = load i16* getelementptr inbounds (%struct.b_ldouble* @s_s_ld, i32 0, i32 0), align 2
  %conv89 = sext i16 %20 to i32
  %cmp90 = icmp ne i32 %conv89, 28
  br i1 %cmp90, label %if.then92, label %if.end93

if.then92:                                        ; preds = %if.end88
  call void @abort() noreturn nounwind
  unreachable

if.end93:                                         ; preds = %if.end88
  %21 = load x86_fp80* getelementptr inbounds (%struct.b_ldouble* @s_s_ld, i32 0, i32 1), align 16
  %cmp94 = fcmp une x86_fp80 %21, 0xK4003E800000000000000
  br i1 %cmp94, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.end93
  call void @abort() noreturn nounwind
  unreachable

if.end97:                                         ; preds = %if.end93
  %22 = load i32* getelementptr inbounds (%struct.c_ldouble* @s_i_ld, i32 0, i32 0), align 4
  %cmp98 = icmp ne i32 %22, 30
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.end97
  call void @abort() noreturn nounwind
  unreachable

if.end101:                                        ; preds = %if.end97
  %23 = load x86_fp80* getelementptr inbounds (%struct.c_ldouble* @s_i_ld, i32 0, i32 1), align 16
  %cmp102 = fcmp une x86_fp80 %23, 0xK4003F800000000000000
  br i1 %cmp102, label %if.then104, label %if.end105

if.then104:                                       ; preds = %if.end101
  call void @abort() noreturn nounwind
  unreachable

if.end105:                                        ; preds = %if.end101
  %24 = load float* getelementptr inbounds (%struct.d_ldouble* @s_f_ld, i32 0, i32 0), align 4
  %conv106 = fpext float %24 to double
  %cmp107 = fcmp une double %conv106, 3.200000e+01
  br i1 %cmp107, label %if.then109, label %if.end110

if.then109:                                       ; preds = %if.end105
  call void @abort() noreturn nounwind
  unreachable

if.end110:                                        ; preds = %if.end105
  %25 = load x86_fp80* getelementptr inbounds (%struct.d_ldouble* @s_f_ld, i32 0, i32 1), align 16
  %cmp111 = fcmp une x86_fp80 %25, 0xK40048400000000000000
  br i1 %cmp111, label %if.then113, label %if.end114

if.then113:                                       ; preds = %if.end110
  call void @abort() noreturn nounwind
  unreachable

if.end114:                                        ; preds = %if.end110
  %26 = load double* getelementptr inbounds (%struct.e_ldouble* @s_d_ld, i32 0, i32 0), align 8
  %cmp115 = fcmp une double %26, 3.400000e+01
  br i1 %cmp115, label %if.then117, label %if.end118

if.then117:                                       ; preds = %if.end114
  call void @abort() noreturn nounwind
  unreachable

if.end118:                                        ; preds = %if.end114
  %27 = load x86_fp80* getelementptr inbounds (%struct.e_ldouble* @s_d_ld, i32 0, i32 1), align 16
  %cmp119 = fcmp une x86_fp80 %27, 0xK40048C00000000000000
  br i1 %cmp119, label %if.then121, label %if.end122

if.then121:                                       ; preds = %if.end118
  call void @abort() noreturn nounwind
  unreachable

if.end122:                                        ; preds = %if.end118
  ret i32 0
}

declare void @abort() noreturn nounwind
