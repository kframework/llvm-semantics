; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040831-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %d = alloca double, align 8
  %l = alloca i64, align 8
  store i32 0, i32* %retval
  store double -1.200000e+01, double* %d, align 8
  %tmp = load double* %d, align 8
  %cmp = fcmp ogt double %tmp, 1.000000e+04
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load double* %d, align 8
  %conv = fptoui double %tmp1 to i64
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load double* %d, align 8
  %conv3 = fptosi double %tmp2 to i64
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %conv, %cond.true ], [ %conv3, %cond.false ]
  store i64 %cond, i64* %l, align 8
  %tmp4 = load i64* %l, align 8
  %cmp5 = icmp ne i64 %tmp4, -12
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %cond.end
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
