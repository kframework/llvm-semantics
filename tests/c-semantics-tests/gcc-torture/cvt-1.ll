; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/cvt-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @g2(double %f) nounwind uwtable {
entry:
  %f.addr = alloca double, align 8
  store double %f, double* %f.addr, align 8
  %0 = load double* %f.addr, align 8
  %conv = fptosi double %0 to i64
  ret i64 %conv
}

define double @f(i64 %i) nounwind uwtable {
entry:
  %i.addr = alloca i64, align 8
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64* %i.addr, align 8
  %conv = sitofp i64 %0 to double
  %call = call i64 @g1(double %conv)
  %1 = load i64* %i.addr, align 8
  %conv1 = sitofp i64 %1 to double
  %call2 = call i64 @g2(double %conv1)
  %cmp = icmp ne i64 %call, %call2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i64* %i.addr, align 8
  %conv4 = sitofp i64 %2 to double
  %call5 = call i64 @g2(double %conv4)
  %conv6 = sitofp i64 %call5 to double
  ret double %conv6
}

define internal i64 @g1(double %x) nounwind uwtable inlinehint {
entry:
  %x.addr = alloca double, align 8
  store double %x, double* %x.addr, align 8
  %0 = load double* %x.addr, align 8
  %conv = fptosi double %0 to i64
  %conv1 = sitofp i64 %conv to double
  %conv2 = fptosi double %conv1 to i64
  ret i64 %conv2
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call double @f(i64 123456789)
  %cmp = fcmp une double %call, 0x419D6F3454000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call double @f(i64 123456789)
  %call2 = call i64 @g2(double 0x419D6F3454000000)
  %conv = sitofp i64 %call2 to double
  %cmp3 = fcmp une double %call1, %conv
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
