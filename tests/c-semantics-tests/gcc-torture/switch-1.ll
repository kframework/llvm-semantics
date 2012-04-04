; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/switch-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  switch i32 %0, label %sw.epilog [
    i32 4, label %sw.bb
    i32 6, label %sw.bb
    i32 9, label %sw.bb
    i32 11, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry, %entry, %entry, %entry
  store i32 30, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %entry
  store i32 31, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb
  %1 = load i32* %retval
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 66
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %call = call i32 @foo(i32 %1)
  store i32 %call, i32* %r, align 4
  %2 = load i32* %i, align 4
  %cmp1 = icmp eq i32 %2, 4
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %3 = load i32* %r, align 4
  %cmp2 = icmp ne i32 %3, 30
  br i1 %cmp2, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end28

if.else:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %cmp4 = icmp eq i32 %4, 6
  br i1 %cmp4, label %if.then5, label %if.else9

if.then5:                                         ; preds = %if.else
  %5 = load i32* %r, align 4
  %cmp6 = icmp ne i32 %5, 30
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.then5
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.then5
  br label %if.end27

if.else9:                                         ; preds = %if.else
  %6 = load i32* %i, align 4
  %cmp10 = icmp eq i32 %6, 9
  br i1 %cmp10, label %if.then11, label %if.else15

if.then11:                                        ; preds = %if.else9
  %7 = load i32* %r, align 4
  %cmp12 = icmp ne i32 %7, 30
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.then11
  br label %if.end26

if.else15:                                        ; preds = %if.else9
  %8 = load i32* %i, align 4
  %cmp16 = icmp eq i32 %8, 11
  br i1 %cmp16, label %if.then17, label %if.else21

if.then17:                                        ; preds = %if.else15
  %9 = load i32* %r, align 4
  %cmp18 = icmp ne i32 %9, 30
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.then17
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.then17
  br label %if.end25

if.else21:                                        ; preds = %if.else15
  %10 = load i32* %r, align 4
  %cmp22 = icmp ne i32 %10, 31
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.else21
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.else21
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.end20
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.end14
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end8
  br label %if.end28

if.end28:                                         ; preds = %if.end27, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end28
  %11 = load i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
