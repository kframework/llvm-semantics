; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr35163.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  store i32 0, i32* %retval
  store i8 -30, i8* %a, align 1
  store i8 -31, i8* %b, align 1
  %0 = load i8* %a, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %b, align 1
  %conv1 = sext i8 %1 to i16
  %conv2 = zext i16 %conv1 to i32
  %cmp = icmp sgt i32 %conv, %conv2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
