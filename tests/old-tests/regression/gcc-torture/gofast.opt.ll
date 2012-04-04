; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/gofast.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@fail_count = global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [17 x i8] c"Test failed: %s\0A\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define float @fp_add(float %a, float %b) nounwind uwtable readnone {
entry:
  %add = fadd float %a, %b
  ret float %add
}

define float @fp_sub(float %a, float %b) nounwind uwtable readnone {
entry:
  %sub = fsub float %a, %b
  ret float %sub
}

define float @fp_mul(float %a, float %b) nounwind uwtable readnone {
entry:
  %mul = fmul float %a, %b
  ret float %mul
}

define float @fp_div(float %a, float %b) nounwind uwtable readnone {
entry:
  %div = fdiv float %a, %b
  ret float %div
}

define float @fp_neg(float %a) nounwind uwtable readnone {
entry:
  %sub = fsub float -0.000000e+00, %a
  ret float %sub
}

define double @dp_add(double %a, double %b) nounwind uwtable readnone {
entry:
  %add = fadd double %a, %b
  ret double %add
}

define double @dp_sub(double %a, double %b) nounwind uwtable readnone {
entry:
  %sub = fsub double %a, %b
  ret double %sub
}

define double @dp_mul(double %a, double %b) nounwind uwtable readnone {
entry:
  %mul = fmul double %a, %b
  ret double %mul
}

define double @dp_div(double %a, double %b) nounwind uwtable readnone {
entry:
  %div = fdiv double %a, %b
  ret double %div
}

define double @dp_neg(double %a) nounwind uwtable readnone {
entry:
  %sub = fsub double -0.000000e+00, %a
  ret double %sub
}

define double @fp_to_dp(float %f) nounwind uwtable readnone {
entry:
  %conv = fpext float %f to double
  ret double %conv
}

define float @dp_to_fp(double %d) nounwind uwtable readnone {
entry:
  %conv = fptrunc double %d to float
  ret float %conv
}

define i32 @eqsf2(float %a, float %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp oeq float %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @nesf2(float %a, float %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp une float %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gtsf2(float %a, float %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp ogt float %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gesf2(float %a, float %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp oge float %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ltsf2(float %a, float %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp olt float %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @lesf2(float %a, float %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp ole float %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @eqdf2(double %a, double %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp oeq double %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @nedf2(double %a, double %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp une double %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gtdf2(double %a, double %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp ogt double %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @gedf2(double %a, double %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp oge double %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ltdf2(double %a, double %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp olt double %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ledf2(double %a, double %b) nounwind uwtable readnone {
entry:
  %cmp = fcmp ole double %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define float @floatsisf(i32 %i) nounwind uwtable readnone {
entry:
  %conv = sitofp i32 %i to float
  ret float %conv
}

define double @floatsidf(i32 %i) nounwind uwtable readnone {
entry:
  %conv = sitofp i32 %i to double
  ret double %conv
}

define i32 @fixsfsi(float %f) nounwind uwtable readnone {
entry:
  %conv = fptosi float %f to i32
  ret i32 %conv
}

define i32 @fixdfsi(double %d) nounwind uwtable readnone {
entry:
  %conv = fptosi double %d to i32
  ret i32 %conv
}

define i32 @fixunssfsi(float %f) nounwind uwtable readnone {
entry:
  %conv = fptoui float %f to i32
  ret i32 %conv
}

define i32 @fixunsdfsi(double %d) nounwind uwtable readnone {
entry:
  %conv = fptoui double %d to i32
  ret i32 %conv
}

define i32 @fail(i8* %msg) nounwind uwtable {
entry:
  %tmp = load i32* @fail_count, align 4
  %inc = add nsw i32 %tmp, 1
  store i32 %inc, i32* @fail_count, align 4
  %tmp1 = load %struct._IO_FILE** @stderr, align 8
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %tmp1, i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 0), i8* %msg) nounwind
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture, ...) nounwind

define i32 @main() noreturn nounwind uwtable {
if.end198:
  %tmp = load i32* @fail_count, align 4
  %cmp199 = icmp eq i32 %tmp, 0
  br i1 %cmp199, label %if.end202, label %if.then201

if.then201:                                       ; preds = %if.end198
  tail call void @abort() noreturn nounwind
  unreachable

if.end202:                                        ; preds = %if.end198
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
