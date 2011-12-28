; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/921208-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @g(double %a, double %b) nounwind uwtable {
entry:
  %a.addr = alloca double, align 8
  %b.addr = alloca double, align 8
  store double %a, double* %a.addr, align 8
  store double %b, double* %b.addr, align 8
  ret void
}

define void @f() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %a = alloca [100000 x float], align 16
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %conv = sitofp i32 %tmp1 to double
  %div = fdiv double %conv, 2.000000e+00
  %mul = fmul double %div, 3.000000e+00
  %add = fadd double 1.000000e+00, %mul
  call void @g(double 1.000000e+00, double %add)
  %tmp2 = load i32* %i, align 4
  %conv3 = sitofp i32 %tmp2 to double
  %div4 = fdiv double %conv3, 2.000000e+00
  %mul5 = fmul double %div4, 3.000000e+00
  %add6 = fadd double 1.000000e+00, %mul5
  call void @g(double 2.000000e+00, double %add6)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f()
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
