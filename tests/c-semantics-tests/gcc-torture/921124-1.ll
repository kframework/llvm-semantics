; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921124-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define i32 @f(i32 %x, double %d1, double %d2, double %d3) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %d1.addr = alloca double, align 8
  %d2.addr = alloca double, align 8
  %d3.addr = alloca double, align 8
  store i32 %x, i32* %x.addr, align 4
  store double %d1, double* %d1.addr, align 8
  store double %d2, double* %d2.addr, align 8
  store double %d3, double* %d3.addr, align 8
  %0 = load i32* %x.addr, align 4
  ret i32 %0
}

define void @g(i8* %b, i8* %s, double %x, double %y, i32 %i, i32 %j) nounwind uwtable {
entry:
  %b.addr = alloca i8*, align 8
  %s.addr = alloca i8*, align 8
  %x.addr = alloca double, align 8
  %y.addr = alloca double, align 8
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  store i8* %b, i8** %b.addr, align 8
  store i8* %s, i8** %s.addr, align 8
  store double %x, double* %x.addr, align 8
  store double %y, double* %y.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  %0 = load double* %x.addr, align 8
  %cmp = fcmp une double %0, 1.000000e+00
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load double* %y.addr, align 8
  %cmp1 = fcmp une double %1, 2.000000e+00
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* %i.addr, align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* %j.addr, align 4
  %cmp5 = icmp ne i32 %3, 4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  ret void
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32, double, double, double)* @f to i32 (...)*)(i32 3, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  %call1 = call i32 (...)* bitcast (i32 (i32, double, double, double)* @f to i32 (...)*)(i32 4, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void (...)* bitcast (void (i8*, i8*, double, double, i32, i32)* @g to void (...)*)(i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 %call, i32 %call1)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
