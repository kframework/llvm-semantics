; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/gofast.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@fail_count = global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [17 x i8] c"Test failed: %s\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"fp_add 1+1\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"fp_sub 3-2\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"fp_mul 2*3\00", align 1
@.str4 = private unnamed_addr constant [11 x i8] c"fp_div 3/2\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"fp_neg 1\00", align 1
@.str6 = private unnamed_addr constant [11 x i8] c"dp_add 1+1\00", align 1
@.str7 = private unnamed_addr constant [11 x i8] c"dp_sub 3-2\00", align 1
@.str8 = private unnamed_addr constant [11 x i8] c"dp_mul 2*3\00", align 1
@.str9 = private unnamed_addr constant [11 x i8] c"dp_div 3/2\00", align 1
@.str10 = private unnamed_addr constant [9 x i8] c"dp_neg 1\00", align 1
@.str11 = private unnamed_addr constant [13 x i8] c"fp_to_dp 1.5\00", align 1
@.str12 = private unnamed_addr constant [13 x i8] c"dp_to_fp 1.5\00", align 1
@.str13 = private unnamed_addr constant [12 x i8] c"floatsisf 1\00", align 1
@.str14 = private unnamed_addr constant [12 x i8] c"floatsidf 1\00", align 1
@.str15 = private unnamed_addr constant [13 x i8] c"fixsfsi 1.42\00", align 1
@.str16 = private unnamed_addr constant [16 x i8] c"fixunssfsi 1.42\00", align 1
@.str17 = private unnamed_addr constant [13 x i8] c"fixdfsi 1.42\00", align 1
@.str18 = private unnamed_addr constant [16 x i8] c"fixunsdfsi 1.42\00", align 1
@.str19 = private unnamed_addr constant [11 x i8] c"eqsf2 1==1\00", align 1
@.str20 = private unnamed_addr constant [11 x i8] c"eqsf2 1==2\00", align 1
@.str21 = private unnamed_addr constant [11 x i8] c"nesf2 1!=1\00", align 1
@.str22 = private unnamed_addr constant [10 x i8] c"gtsf2 2>1\00", align 1
@.str23 = private unnamed_addr constant [10 x i8] c"gtsf2 1>1\00", align 1
@.str24 = private unnamed_addr constant [10 x i8] c"gtsf2 0>1\00", align 1
@.str25 = private unnamed_addr constant [11 x i8] c"gesf2 2>=1\00", align 1
@.str26 = private unnamed_addr constant [11 x i8] c"gesf2 1>=1\00", align 1
@.str27 = private unnamed_addr constant [11 x i8] c"gesf2 0>=1\00", align 1
@.str28 = private unnamed_addr constant [10 x i8] c"ltsf2 1<2\00", align 1
@.str29 = private unnamed_addr constant [10 x i8] c"ltsf2 1<1\00", align 1
@.str30 = private unnamed_addr constant [10 x i8] c"ltsf2 1<0\00", align 1
@.str31 = private unnamed_addr constant [11 x i8] c"lesf2 1<=2\00", align 1
@.str32 = private unnamed_addr constant [11 x i8] c"lesf2 1<=1\00", align 1
@.str33 = private unnamed_addr constant [11 x i8] c"lesf2 1<=0\00", align 1

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

define float @fp_add(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %add = fadd float %tmp, %tmp1
  ret float %add
}

define float @fp_sub(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %sub = fsub float %tmp, %tmp1
  ret float %sub
}

define float @fp_mul(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %mul = fmul float %tmp, %tmp1
  ret float %mul
}

define float @fp_div(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %div = fdiv float %tmp, %tmp1
  ret float %div
}

define float @fp_neg(float %a) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  %tmp = load float* %a.addr, align 4
  %sub = fsub float -0.000000e+00, %tmp
  ret float %sub
}

define double @dp_add(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %add = fadd double %tmp, %tmp1
  ret double %add
}

define double @dp_sub(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %sub = fsub double %tmp, %tmp1
  ret double %sub
}

define double @dp_mul(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %mul = fmul double %tmp, %tmp1
  ret double %mul
}

define double @dp_div(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %div = fdiv double %tmp, %tmp1
  ret double %div
}

define double @dp_neg(double %a) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  %tmp = load double* %a.addr, align 8
  %sub = fsub double -0.000000e+00, %tmp
  ret double %sub
}

define double @fp_to_dp(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fpext float %tmp to double
  ret double %conv
}

define float @dp_to_fp(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptrunc double %tmp to float
  ret float %conv
}

define i32 @eqsf2(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %cmp = fcmp oeq float %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @nesf2(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %cmp = fcmp une float %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gtsf2(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %cmp = fcmp ogt float %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gesf2(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %cmp = fcmp oge float %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ltsf2(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %cmp = fcmp olt float %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @lesf2(float %a, float %b) nounwind uwtable {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  %tmp = load float* %a.addr, align 4
  %tmp1 = load float* %b.addr, align 4
  %cmp = fcmp ole float %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @eqdf2(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %cmp = fcmp oeq double %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @nedf2(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %cmp = fcmp une double %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gtdf2(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %cmp = fcmp ogt double %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gedf2(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %cmp = fcmp oge double %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ltdf2(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %cmp = fcmp olt double %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ledf2(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  %tmp = load double* %a.addr, align 8
  %tmp1 = load double* %b.addr, align 8
  %cmp = fcmp ole double %tmp, %tmp1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define float @floatsisf(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %conv = sitofp i32 %tmp to float
  ret float %conv
}

define double @floatsidf(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %conv = sitofp i32 %tmp to double
  ret double %conv
}

define i32 @fixsfsi(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fptosi float %tmp to i32
  ret i32 %conv
}

define i32 @fixdfsi(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptosi double %tmp to i32
  ret i32 %conv
}

define i32 @fixunssfsi(float %f) nounwind uwtable {
entry:
  %f.addr = alloca float, align 4
  store float %f, float* %f.addr, align 4
  %tmp = load float* %f.addr, align 4
  %conv = fptoui float %tmp to i32
  ret i32 %conv
}

define i32 @fixunsdfsi(double %d) nounwind uwtable {
entry:
  %d.addr = alloca double, align 8
  store double %d, double* %d.addr, align 8
  %tmp = load double* %d.addr, align 8
  %conv = fptoui double %tmp to i32
  ret i32 %conv
}

define i32 @fail(i8* %msg) nounwind uwtable {
entry:
  %msg.addr = alloca i8*, align 8
  store i8* %msg, i8** %msg.addr, align 8
  %tmp = load i32* @fail_count, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @fail_count, align 4
  %tmp1 = load %struct._IO_FILE** @stderr, align 8
  %tmp2 = load i8** %msg.addr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %tmp1, i8* getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i8* %tmp2)
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call float @fp_add(float 1.000000e+00, float 1.000000e+00)
  %cmp = fcmp une float %call, 2.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call2 = call float @fp_sub(float 3.000000e+00, float 2.000000e+00)
  %cmp3 = fcmp une float %call2, 1.000000e+00
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %call5 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %call7 = call float @fp_mul(float 2.000000e+00, float 3.000000e+00)
  %cmp8 = fcmp une float %call7, 6.000000e+00
  br i1 %cmp8, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end6
  %call10 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end6
  %call12 = call float @fp_div(float 3.000000e+00, float 2.000000e+00)
  %conv = fpext float %call12 to double
  %cmp13 = fcmp une double %conv, 1.500000e+00
  br i1 %cmp13, label %if.then15, label %if.end17

if.then15:                                        ; preds = %if.end11
  %call16 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str4, i32 0, i32 0))
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end11
  %call18 = call float @fp_neg(float 1.000000e+00)
  %cmp19 = fcmp une float %call18, -1.000000e+00
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %if.end17
  %call22 = call i32 @fail(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0))
  br label %if.end23

if.end23:                                         ; preds = %if.then21, %if.end17
  %call24 = call double @dp_add(double 1.000000e+00, double 1.000000e+00)
  %cmp25 = fcmp une double %call24, 2.000000e+00
  br i1 %cmp25, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.end23
  %call28 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0))
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.end23
  %call30 = call double @dp_sub(double 3.000000e+00, double 2.000000e+00)
  %cmp31 = fcmp une double %call30, 1.000000e+00
  br i1 %cmp31, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.end29
  %call34 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0))
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.end29
  %call36 = call double @dp_mul(double 2.000000e+00, double 3.000000e+00)
  %cmp37 = fcmp une double %call36, 6.000000e+00
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %if.end35
  %call40 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0))
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %if.end35
  %call42 = call double @dp_div(double 3.000000e+00, double 2.000000e+00)
  %cmp43 = fcmp une double %call42, 1.500000e+00
  br i1 %cmp43, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end41
  %call46 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0))
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end41
  %call48 = call double @dp_neg(double 1.000000e+00)
  %cmp49 = fcmp une double %call48, -1.000000e+00
  br i1 %cmp49, label %if.then51, label %if.end53

if.then51:                                        ; preds = %if.end47
  %call52 = call i32 @fail(i8* getelementptr inbounds ([9 x i8]* @.str10, i32 0, i32 0))
  br label %if.end53

if.end53:                                         ; preds = %if.then51, %if.end47
  %call54 = call double @fp_to_dp(float 1.500000e+00)
  %cmp55 = fcmp une double %call54, 1.500000e+00
  br i1 %cmp55, label %if.then57, label %if.end59

if.then57:                                        ; preds = %if.end53
  %call58 = call i32 @fail(i8* getelementptr inbounds ([13 x i8]* @.str11, i32 0, i32 0))
  br label %if.end59

if.end59:                                         ; preds = %if.then57, %if.end53
  %call60 = call float @dp_to_fp(double 1.500000e+00)
  %conv61 = fpext float %call60 to double
  %cmp62 = fcmp une double %conv61, 1.500000e+00
  br i1 %cmp62, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.end59
  %call65 = call i32 @fail(i8* getelementptr inbounds ([13 x i8]* @.str12, i32 0, i32 0))
  br label %if.end66

if.end66:                                         ; preds = %if.then64, %if.end59
  %call67 = call float @floatsisf(i32 1)
  %cmp68 = fcmp une float %call67, 1.000000e+00
  br i1 %cmp68, label %if.then70, label %if.end72

if.then70:                                        ; preds = %if.end66
  %call71 = call i32 @fail(i8* getelementptr inbounds ([12 x i8]* @.str13, i32 0, i32 0))
  br label %if.end72

if.end72:                                         ; preds = %if.then70, %if.end66
  %call73 = call double @floatsidf(i32 1)
  %cmp74 = fcmp une double %call73, 1.000000e+00
  br i1 %cmp74, label %if.then76, label %if.end78

if.then76:                                        ; preds = %if.end72
  %call77 = call i32 @fail(i8* getelementptr inbounds ([12 x i8]* @.str14, i32 0, i32 0))
  br label %if.end78

if.end78:                                         ; preds = %if.then76, %if.end72
  %call79 = call i32 @fixsfsi(float 0x3FF6B851E0000000)
  %cmp80 = icmp ne i32 %call79, 1
  br i1 %cmp80, label %if.then82, label %if.end84

if.then82:                                        ; preds = %if.end78
  %call83 = call i32 @fail(i8* getelementptr inbounds ([13 x i8]* @.str15, i32 0, i32 0))
  br label %if.end84

if.end84:                                         ; preds = %if.then82, %if.end78
  %call85 = call i32 @fixunssfsi(float 0x3FF6B851E0000000)
  %cmp86 = icmp ne i32 %call85, 1
  br i1 %cmp86, label %if.then88, label %if.end90

if.then88:                                        ; preds = %if.end84
  %call89 = call i32 @fail(i8* getelementptr inbounds ([16 x i8]* @.str16, i32 0, i32 0))
  br label %if.end90

if.end90:                                         ; preds = %if.then88, %if.end84
  %call91 = call i32 @fixdfsi(double 1.420000e+00)
  %cmp92 = icmp ne i32 %call91, 1
  br i1 %cmp92, label %if.then94, label %if.end96

if.then94:                                        ; preds = %if.end90
  %call95 = call i32 @fail(i8* getelementptr inbounds ([13 x i8]* @.str17, i32 0, i32 0))
  br label %if.end96

if.end96:                                         ; preds = %if.then94, %if.end90
  %call97 = call i32 @fixunsdfsi(double 1.420000e+00)
  %cmp98 = icmp ne i32 %call97, 1
  br i1 %cmp98, label %if.then100, label %if.end102

if.then100:                                       ; preds = %if.end96
  %call101 = call i32 @fail(i8* getelementptr inbounds ([16 x i8]* @.str18, i32 0, i32 0))
  br label %if.end102

if.end102:                                        ; preds = %if.then100, %if.end96
  %call103 = call i32 @eqsf2(float 1.000000e+00, float 1.000000e+00)
  %cmp104 = icmp eq i32 %call103, 0
  br i1 %cmp104, label %if.then106, label %if.end108

if.then106:                                       ; preds = %if.end102
  %call107 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str19, i32 0, i32 0))
  br label %if.end108

if.end108:                                        ; preds = %if.then106, %if.end102
  %call109 = call i32 @eqsf2(float 1.000000e+00, float 2.000000e+00)
  %cmp110 = icmp ne i32 %call109, 0
  br i1 %cmp110, label %if.then112, label %if.end114

if.then112:                                       ; preds = %if.end108
  %call113 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str20, i32 0, i32 0))
  br label %if.end114

if.end114:                                        ; preds = %if.then112, %if.end108
  %call115 = call i32 @nesf2(float 1.000000e+00, float 2.000000e+00)
  %cmp116 = icmp eq i32 %call115, 0
  br i1 %cmp116, label %if.then118, label %if.end120

if.then118:                                       ; preds = %if.end114
  %call119 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str21, i32 0, i32 0))
  br label %if.end120

if.end120:                                        ; preds = %if.then118, %if.end114
  %call121 = call i32 @nesf2(float 1.000000e+00, float 1.000000e+00)
  %cmp122 = icmp ne i32 %call121, 0
  br i1 %cmp122, label %if.then124, label %if.end126

if.then124:                                       ; preds = %if.end120
  %call125 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str21, i32 0, i32 0))
  br label %if.end126

if.end126:                                        ; preds = %if.then124, %if.end120
  %call127 = call i32 @gtsf2(float 2.000000e+00, float 1.000000e+00)
  %cmp128 = icmp eq i32 %call127, 0
  br i1 %cmp128, label %if.then130, label %if.end132

if.then130:                                       ; preds = %if.end126
  %call131 = call i32 @fail(i8* getelementptr inbounds ([10 x i8]* @.str22, i32 0, i32 0))
  br label %if.end132

if.end132:                                        ; preds = %if.then130, %if.end126
  %call133 = call i32 @gtsf2(float 1.000000e+00, float 1.000000e+00)
  %cmp134 = icmp ne i32 %call133, 0
  br i1 %cmp134, label %if.then136, label %if.end138

if.then136:                                       ; preds = %if.end132
  %call137 = call i32 @fail(i8* getelementptr inbounds ([10 x i8]* @.str23, i32 0, i32 0))
  br label %if.end138

if.end138:                                        ; preds = %if.then136, %if.end132
  %call139 = call i32 @gtsf2(float 0.000000e+00, float 1.000000e+00)
  %cmp140 = icmp ne i32 %call139, 0
  br i1 %cmp140, label %if.then142, label %if.end144

if.then142:                                       ; preds = %if.end138
  %call143 = call i32 @fail(i8* getelementptr inbounds ([10 x i8]* @.str24, i32 0, i32 0))
  br label %if.end144

if.end144:                                        ; preds = %if.then142, %if.end138
  %call145 = call i32 @gesf2(float 2.000000e+00, float 1.000000e+00)
  %cmp146 = icmp eq i32 %call145, 0
  br i1 %cmp146, label %if.then148, label %if.end150

if.then148:                                       ; preds = %if.end144
  %call149 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str25, i32 0, i32 0))
  br label %if.end150

if.end150:                                        ; preds = %if.then148, %if.end144
  %call151 = call i32 @gesf2(float 1.000000e+00, float 1.000000e+00)
  %cmp152 = icmp eq i32 %call151, 0
  br i1 %cmp152, label %if.then154, label %if.end156

if.then154:                                       ; preds = %if.end150
  %call155 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str26, i32 0, i32 0))
  br label %if.end156

if.end156:                                        ; preds = %if.then154, %if.end150
  %call157 = call i32 @gesf2(float 0.000000e+00, float 1.000000e+00)
  %cmp158 = icmp ne i32 %call157, 0
  br i1 %cmp158, label %if.then160, label %if.end162

if.then160:                                       ; preds = %if.end156
  %call161 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str27, i32 0, i32 0))
  br label %if.end162

if.end162:                                        ; preds = %if.then160, %if.end156
  %call163 = call i32 @ltsf2(float 1.000000e+00, float 2.000000e+00)
  %cmp164 = icmp eq i32 %call163, 0
  br i1 %cmp164, label %if.then166, label %if.end168

if.then166:                                       ; preds = %if.end162
  %call167 = call i32 @fail(i8* getelementptr inbounds ([10 x i8]* @.str28, i32 0, i32 0))
  br label %if.end168

if.end168:                                        ; preds = %if.then166, %if.end162
  %call169 = call i32 @ltsf2(float 1.000000e+00, float 1.000000e+00)
  %cmp170 = icmp ne i32 %call169, 0
  br i1 %cmp170, label %if.then172, label %if.end174

if.then172:                                       ; preds = %if.end168
  %call173 = call i32 @fail(i8* getelementptr inbounds ([10 x i8]* @.str29, i32 0, i32 0))
  br label %if.end174

if.end174:                                        ; preds = %if.then172, %if.end168
  %call175 = call i32 @ltsf2(float 1.000000e+00, float 0.000000e+00)
  %cmp176 = icmp ne i32 %call175, 0
  br i1 %cmp176, label %if.then178, label %if.end180

if.then178:                                       ; preds = %if.end174
  %call179 = call i32 @fail(i8* getelementptr inbounds ([10 x i8]* @.str30, i32 0, i32 0))
  br label %if.end180

if.end180:                                        ; preds = %if.then178, %if.end174
  %call181 = call i32 @lesf2(float 1.000000e+00, float 2.000000e+00)
  %cmp182 = icmp eq i32 %call181, 0
  br i1 %cmp182, label %if.then184, label %if.end186

if.then184:                                       ; preds = %if.end180
  %call185 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str31, i32 0, i32 0))
  br label %if.end186

if.end186:                                        ; preds = %if.then184, %if.end180
  %call187 = call i32 @lesf2(float 1.000000e+00, float 1.000000e+00)
  %cmp188 = icmp eq i32 %call187, 0
  br i1 %cmp188, label %if.then190, label %if.end192

if.then190:                                       ; preds = %if.end186
  %call191 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0))
  br label %if.end192

if.end192:                                        ; preds = %if.then190, %if.end186
  %call193 = call i32 @lesf2(float 1.000000e+00, float 0.000000e+00)
  %cmp194 = icmp ne i32 %call193, 0
  br i1 %cmp194, label %if.then196, label %if.end198

if.then196:                                       ; preds = %if.end192
  %call197 = call i32 @fail(i8* getelementptr inbounds ([11 x i8]* @.str33, i32 0, i32 0))
  br label %if.end198

if.end198:                                        ; preds = %if.then196, %if.end192
  %tmp = load i32* @fail_count, align 4
  %cmp199 = icmp ne i32 %tmp, 0
  br i1 %cmp199, label %if.then201, label %if.end202

if.then201:                                       ; preds = %if.end198
  call void @abort() noreturn nounwind
  unreachable

if.end202:                                        ; preds = %if.end198
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
