; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020423-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %my_int = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 924, i32* %my_int, align 4
  %0 = load i32* %my_int, align 4
  %mul = mul nsw i32 %0, 2
  %add = add nsw i32 %mul, 4
  %sub = sub i32 %add, 8
  %div = udiv i32 %sub, 2
  store i32 %div, i32* %result, align 4
  %1 = load i32* %result, align 4
  %cmp = icmp ne i32 %1, 922
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32* %my_int, align 4
  %mul1 = mul nsw i32 %2, 2
  %sub2 = sub i32 %mul1, 4
  %add3 = add i32 %sub2, 2
  %div4 = udiv i32 %add3, 2
  store i32 %div4, i32* %result, align 4
  %3 = load i32* %result, align 4
  %cmp5 = icmp ne i32 %3, 923
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end7:                                          ; preds = %if.end
  %4 = load i32* %my_int, align 4
  %add8 = add nsw i32 %4, 2
  %mul9 = mul nsw i32 %add8, 2
  %sub10 = sub i32 %mul9, 8
  %sub11 = sub i32 %sub10, 4
  %div12 = udiv i32 %sub11, 2
  store i32 %div12, i32* %result, align 4
  %5 = load i32* %result, align 4
  %cmp13 = icmp ne i32 %5, 920
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end7
  call void @abort() noreturn
  unreachable

if.end15:                                         ; preds = %if.end7
  %6 = load i32* %my_int, align 4
  %add16 = add nsw i32 %6, 2
  %mul17 = mul nsw i32 %add16, 2
  %sub18 = sub i32 %mul17, 12
  %div19 = udiv i32 %sub18, 2
  store i32 %div19, i32* %result, align 4
  %7 = load i32* %result, align 4
  %cmp20 = icmp ne i32 %7, 920
  br i1 %cmp20, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  call void @abort() noreturn
  unreachable

if.end22:                                         ; preds = %if.end15
  %8 = load i32* %my_int, align 4
  %mul23 = mul nsw i32 %8, 4
  %add24 = add i32 %mul23, 2
  %sub25 = sub i32 %add24, 4
  %div26 = udiv i32 %sub25, 2
  store i32 %div26, i32* %result, align 4
  %9 = load i32* %result, align 4
  %cmp27 = icmp ne i32 %9, 1847
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end22
  call void @abort() noreturn
  unreachable

if.end29:                                         ; preds = %if.end22
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
