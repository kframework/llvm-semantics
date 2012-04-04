; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr33142.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @lisp_atan2(i64 %dy, i64 %dx) nounwind uwtable noinline {
entry:
  %retval = alloca i32, align 4
  %dy.addr = alloca i64, align 8
  %dx.addr = alloca i64, align 8
  store i64 %dy, i64* %dy.addr, align 8
  store i64 %dx, i64* %dx.addr, align 8
  %0 = load i64* %dx.addr, align 8
  %cmp = icmp sle i64 %0, 0
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %1 = load i64* %dy.addr, align 8
  %cmp1 = icmp sgt i64 %1, 0
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  %2 = load i64* %dx.addr, align 8
  %conv = trunc i64 %2 to i32
  %call = call i32 @abs(i32 %conv) nounwind readnone
  %3 = load i64* %dy.addr, align 8
  %conv3 = trunc i64 %3 to i32
  %call4 = call i32 @abs(i32 %conv3) nounwind readnone
  %cmp5 = icmp sle i32 %call, %call4
  %conv6 = zext i1 %cmp5 to i32
  store i32 %conv6, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end, %entry
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end7, %if.then2
  %4 = load i32* %retval
  ret i32 %4
}

declare i32 @abs(i32) nounwind readnone

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %dy = alloca i64, align 8
  %dx = alloca i64, align 8
  store i32 0, i32* %retval
  store volatile i64 63, i64* %dy, align 8
  store volatile i64 -77, i64* %dx, align 8
  %0 = load volatile i64* %dy, align 8
  %1 = load volatile i64* %dx, align 8
  %call = call i32 @lisp_atan2(i64 %0, i64 %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
