; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000314-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bigconst = constant i64 17179869184, align 8
@a = global i32 1, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %f = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call i64 @getmask()
  store i64 %call, i64* %f, align 8
  %0 = load i64* %f, align 8
  %cmp = icmp ne i64 %0, 17179869184
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

define internal i64 @getmask() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %0 = load i32* @a, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i64 17179869184, i64* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i64 0, i64* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %1 = load i64* %retval
  ret i64 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
