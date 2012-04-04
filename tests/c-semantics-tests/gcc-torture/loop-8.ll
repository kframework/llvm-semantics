; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-8.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [3 x double] [double 0.000000e+00, double 1.000000e+00, double 2.000000e+00], align 16

define void @bar(i32 %x, double* %y) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca double*, align 8
  store i32 %x, i32* %x.addr, align 4
  store double* %y, double** %y.addr, align 8
  %0 = load i32* %x.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load double** %y.addr, align 8
  %2 = load double* %1, align 8
  %cmp = fcmp une double %2, 1.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca double, align 8
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %d, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %d, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %d, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [3 x double]* @a, i32 0, i64 %idxprom
  %2 = load double* %arrayidx, align 8
  store double %2, double* %c, align 8
  %3 = load double* %c, align 8
  %cmp1 = fcmp ogt double %3, 0.000000e+00
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %e

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %d, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %d, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @bar(i32 1, double* %c)
  call void @exit(i32 1) noreturn nounwind
  unreachable

e:                                                ; preds = %if.then
  call void @bar(i32 0, double* %c)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @exit(i32) noreturn nounwind
