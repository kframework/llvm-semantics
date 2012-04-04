; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020413-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test(x86_fp80 %val, i32* %eval) nounwind uwtable {
entry:
  %val.addr = alloca x86_fp80, align 16
  %eval.addr = alloca i32*, align 8
  %tmp = alloca x86_fp80, align 16
  %i = alloca i32, align 4
  store x86_fp80 %val, x86_fp80* %val.addr, align 16
  store i32* %eval, i32** %eval.addr, align 8
  store x86_fp80 0xK3FFF8000000000000000, x86_fp80* %tmp, align 16
  store i32 0, i32* %i, align 4
  %0 = load x86_fp80* %val.addr, align 16
  %cmp = fcmp olt x86_fp80 %0, 0xK00000000000000000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load x86_fp80* %val.addr, align 16
  %sub = fsub x86_fp80 0xK80000000000000000000, %1
  store x86_fp80 %sub, x86_fp80* %val.addr, align 16
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load x86_fp80* %val.addr, align 16
  %3 = load x86_fp80* %tmp, align 16
  %cmp2 = fcmp oge x86_fp80 %2, %3
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end7, %if.then3
  %4 = load x86_fp80* %tmp, align 16
  %5 = load x86_fp80* %val.addr, align 16
  %cmp4 = fcmp olt x86_fp80 %4, %5
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %6 = load x86_fp80* %tmp, align 16
  %mul = fmul x86_fp80 %6, 0xK40008000000000000000
  store x86_fp80 %mul, x86_fp80* %tmp, align 16
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  %cmp5 = icmp sge i32 %7, 10
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %while.body
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end19

if.else:                                          ; preds = %if.end
  %8 = load x86_fp80* %val.addr, align 16
  %cmp8 = fcmp une x86_fp80 %8, 0xK00000000000000000000
  br i1 %cmp8, label %if.then9, label %if.end18

if.then9:                                         ; preds = %if.else
  br label %while.cond10

while.cond10:                                     ; preds = %if.end16, %if.then9
  %9 = load x86_fp80* %val.addr, align 16
  %10 = load x86_fp80* %tmp, align 16
  %cmp11 = fcmp olt x86_fp80 %9, %10
  br i1 %cmp11, label %while.body12, label %while.end17

while.body12:                                     ; preds = %while.cond10
  %11 = load x86_fp80* %tmp, align 16
  %div = fdiv x86_fp80 %11, 0xK40008000000000000000
  store x86_fp80 %div, x86_fp80* %tmp, align 16
  %12 = load i32* %i, align 4
  %inc13 = add nsw i32 %12, 1
  store i32 %inc13, i32* %i, align 4
  %cmp14 = icmp sge i32 %12, 10
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.body12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %while.body12
  br label %while.cond10

while.end17:                                      ; preds = %while.cond10
  br label %if.end18

if.end18:                                         ; preds = %while.end17, %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %while.end
  %13 = load i32* %i, align 4
  %14 = load i32** %eval.addr, align 8
  store i32 %13, i32* %14, align 4
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %eval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test(x86_fp80 0xK4000C000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4000E000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK40018000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4001A000000000000000, i32* %eval)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
