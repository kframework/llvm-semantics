; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x, i32 %y, i32 %i, i32 %j) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %tmp1 = alloca double, align 8
  %tmp2 = alloca double, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  %0 = load i32* %x.addr, align 4
  %conv = sitofp i32 %0 to double
  %1 = load i32* %y.addr, align 4
  %conv1 = sitofp i32 %1 to double
  %div = fdiv double %conv, %conv1
  store double %div, double* %tmp1, align 8
  %2 = load i32* %i.addr, align 4
  %conv2 = sitofp i32 %2 to double
  %3 = load i32* %j.addr, align 4
  %conv3 = sitofp i32 %3 to double
  %div4 = fdiv double %conv2, %conv3
  store double %div4, double* %tmp2, align 8
  %4 = load double* %tmp1, align 8
  %5 = load double* %tmp2, align 8
  %cmp = fcmp olt double %4, %5
  %conv5 = zext i1 %cmp to i32
  ret i32 %conv5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 2, i32 24, i32 3, i32 4)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
