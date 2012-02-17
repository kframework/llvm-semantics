; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/align-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_double = type { i8, double }
%struct.a_float = type { i8, float }
%struct.a_int = type { i8, i32 }
%struct.a_ldouble = type { i8, x86_fp80 }
%struct.a_short = type { i8, i16 }
%struct.b_double = type { i16, double }
%struct.b_float = type { i16, float }
%struct.b_int = type { i16, i32 }
%struct.b_ldouble = type { i16, x86_fp80 }
%struct.c_double = type { i32, double }
%struct.c_ldouble = type { i32, x86_fp80 }
%struct.d_double = type { float, double }
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

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load i8* getelementptr inbounds (%struct.a_short* @s_c_s, i32 0, i32 0), align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp ne i32 %conv, 97
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i16* getelementptr inbounds (%struct.a_short* @s_c_s, i32 0, i32 1), align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp ne i32 %conv3, 13
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  %tmp8 = load i8* getelementptr inbounds (%struct.a_int* @s_c_i, i32 0, i32 0), align 1
  %conv9 = sext i8 %tmp8 to i32
  %cmp10 = icmp ne i32 %conv9, 98
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end7
  %tmp14 = load i32* getelementptr inbounds (%struct.a_int* @s_c_i, i32 0, i32 1), align 4
  %cmp15 = icmp ne i32 %tmp14, 14
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end13
  %tmp19 = load i16* getelementptr inbounds (%struct.b_int* @s_s_i, i32 0, i32 0), align 2
  %conv20 = sext i16 %tmp19 to i32
  %cmp21 = icmp ne i32 %conv20, 15
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end18
  %tmp25 = load i32* getelementptr inbounds (%struct.b_int* @s_s_i, i32 0, i32 1), align 4
  %cmp26 = icmp ne i32 %tmp25, 16
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.end24
  %tmp30 = load i8* getelementptr inbounds (%struct.a_float* @s_c_f, i32 0, i32 0), align 1
  %conv31 = sext i8 %tmp30 to i32
  %cmp32 = icmp ne i32 %conv31, 99
  br i1 %cmp32, label %if.then34, label %if.end35

if.then34:                                        ; preds = %if.end29
  call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %if.end29
  %tmp36 = load float* getelementptr inbounds (%struct.a_float* @s_c_f, i32 0, i32 1), align 4
  %conv37 = fpext float %tmp36 to double
  %cmp38 = fcmp une double %conv37, 1.700000e+01
  br i1 %cmp38, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end35
  call void @abort() noreturn nounwind
  unreachable

if.end41:                                         ; preds = %if.end35
  %tmp42 = load i16* getelementptr inbounds (%struct.b_float* @s_s_f, i32 0, i32 0), align 2
  %conv43 = sext i16 %tmp42 to i32
  %cmp44 = icmp ne i32 %conv43, 18
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end41
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end41
  %tmp48 = load float* getelementptr inbounds (%struct.b_float* @s_s_f, i32 0, i32 1), align 4
  %conv49 = fpext float %tmp48 to double
  %cmp50 = fcmp une double %conv49, 1.900000e+01
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end47
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end47
  %tmp54 = load i8* getelementptr inbounds (%struct.a_double* @s_c_d, i32 0, i32 0), align 1
  %conv55 = sext i8 %tmp54 to i32
  %cmp56 = icmp ne i32 %conv55, 100
  br i1 %cmp56, label %if.then58, label %if.end59

if.then58:                                        ; preds = %if.end53
  call void @abort() noreturn nounwind
  unreachable

if.end59:                                         ; preds = %if.end53
  %tmp60 = load double* getelementptr inbounds (%struct.a_double* @s_c_d, i32 0, i32 1), align 8
  %cmp61 = fcmp une double %tmp60, 2.000000e+01
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end59
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end59
  %tmp65 = load i16* getelementptr inbounds (%struct.b_double* @s_s_d, i32 0, i32 0), align 2
  %conv66 = sext i16 %tmp65 to i32
  %cmp67 = icmp ne i32 %conv66, 21
  br i1 %cmp67, label %if.then69, label %if.end70

if.then69:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end70:                                         ; preds = %if.end64
  %tmp71 = load double* getelementptr inbounds (%struct.b_double* @s_s_d, i32 0, i32 1), align 8
  %cmp72 = fcmp une double %tmp71, 2.200000e+01
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end70
  call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %if.end70
  %tmp76 = load i32* getelementptr inbounds (%struct.c_double* @s_i_d, i32 0, i32 0), align 4
  %cmp77 = icmp ne i32 %tmp76, 23
  br i1 %cmp77, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end75
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end75
  %tmp81 = load double* getelementptr inbounds (%struct.c_double* @s_i_d, i32 0, i32 1), align 8
  %cmp82 = fcmp une double %tmp81, 2.400000e+01
  br i1 %cmp82, label %if.then84, label %if.end85

if.then84:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end85:                                         ; preds = %if.end80
  %tmp86 = load float* getelementptr inbounds (%struct.d_double* @s_f_d, i32 0, i32 0), align 4
  %conv87 = fpext float %tmp86 to double
  %cmp88 = fcmp une double %conv87, 2.500000e+01
  br i1 %cmp88, label %if.then90, label %if.end91

if.then90:                                        ; preds = %if.end85
  call void @abort() noreturn nounwind
  unreachable

if.end91:                                         ; preds = %if.end85
  %tmp92 = load double* getelementptr inbounds (%struct.d_double* @s_f_d, i32 0, i32 1), align 8
  %cmp93 = fcmp une double %tmp92, 2.600000e+01
  br i1 %cmp93, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end91
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %if.end91
  %tmp97 = load i8* getelementptr inbounds (%struct.a_ldouble* @s_c_ld, i32 0, i32 0), align 1
  %conv98 = sext i8 %tmp97 to i32
  %cmp99 = icmp ne i32 %conv98, 101
  br i1 %cmp99, label %if.then101, label %if.end102

if.then101:                                       ; preds = %if.end96
  call void @abort() noreturn nounwind
  unreachable

if.end102:                                        ; preds = %if.end96
  %tmp103 = load x86_fp80* getelementptr inbounds (%struct.a_ldouble* @s_c_ld, i32 0, i32 1), align 16
  %cmp104 = fcmp une x86_fp80 %tmp103, 0xK4003D800000000000000
  br i1 %cmp104, label %if.then106, label %if.end107

if.then106:                                       ; preds = %if.end102
  call void @abort() noreturn nounwind
  unreachable

if.end107:                                        ; preds = %if.end102
  %tmp108 = load i16* getelementptr inbounds (%struct.b_ldouble* @s_s_ld, i32 0, i32 0), align 2
  %conv109 = sext i16 %tmp108 to i32
  %cmp110 = icmp ne i32 %conv109, 28
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.end107
  call void @abort() noreturn nounwind
  unreachable

if.end113:                                        ; preds = %if.end107
  %tmp114 = load x86_fp80* getelementptr inbounds (%struct.b_ldouble* @s_s_ld, i32 0, i32 1), align 16
  %cmp115 = fcmp une x86_fp80 %tmp114, 0xK4003E800000000000000
  br i1 %cmp115, label %if.then117, label %if.end118

if.then117:                                       ; preds = %if.end113
  call void @abort() noreturn nounwind
  unreachable

if.end118:                                        ; preds = %if.end113
  %tmp119 = load i32* getelementptr inbounds (%struct.c_ldouble* @s_i_ld, i32 0, i32 0), align 4
  %cmp120 = icmp ne i32 %tmp119, 30
  br i1 %cmp120, label %if.then122, label %if.end123

if.then122:                                       ; preds = %if.end118
  call void @abort() noreturn nounwind
  unreachable

if.end123:                                        ; preds = %if.end118
  %tmp124 = load x86_fp80* getelementptr inbounds (%struct.c_ldouble* @s_i_ld, i32 0, i32 1), align 16
  %cmp125 = fcmp une x86_fp80 %tmp124, 0xK4003F800000000000000
  br i1 %cmp125, label %if.then127, label %if.end128

if.then127:                                       ; preds = %if.end123
  call void @abort() noreturn nounwind
  unreachable

if.end128:                                        ; preds = %if.end123
  %tmp129 = load float* getelementptr inbounds (%struct.d_ldouble* @s_f_ld, i32 0, i32 0), align 4
  %conv130 = fpext float %tmp129 to double
  %cmp131 = fcmp une double %conv130, 3.200000e+01
  br i1 %cmp131, label %if.then133, label %if.end134

if.then133:                                       ; preds = %if.end128
  call void @abort() noreturn nounwind
  unreachable

if.end134:                                        ; preds = %if.end128
  %tmp135 = load x86_fp80* getelementptr inbounds (%struct.d_ldouble* @s_f_ld, i32 0, i32 1), align 16
  %cmp136 = fcmp une x86_fp80 %tmp135, 0xK40048400000000000000
  br i1 %cmp136, label %if.then138, label %if.end139

if.then138:                                       ; preds = %if.end134
  call void @abort() noreturn nounwind
  unreachable

if.end139:                                        ; preds = %if.end134
  %tmp140 = load double* getelementptr inbounds (%struct.e_ldouble* @s_d_ld, i32 0, i32 0), align 8
  %cmp141 = fcmp une double %tmp140, 3.400000e+01
  br i1 %cmp141, label %if.then143, label %if.end144

if.then143:                                       ; preds = %if.end139
  call void @abort() noreturn nounwind
  unreachable

if.end144:                                        ; preds = %if.end139
  %tmp145 = load x86_fp80* getelementptr inbounds (%struct.e_ldouble* @s_d_ld, i32 0, i32 1), align 16
  %cmp146 = fcmp une x86_fp80 %tmp145, 0xK40048C00000000000000
  br i1 %cmp146, label %if.then148, label %if.end149

if.then148:                                       ; preds = %if.end144
  call void @abort() noreturn nounwind
  unreachable

if.end149:                                        ; preds = %if.end144
  ret i32 0
}

declare void @abort() noreturn nounwind
