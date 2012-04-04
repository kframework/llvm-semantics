; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020904-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i8 @fun(i8 zeroext %y) nounwind uwtable {
entry:
  %y.addr = alloca i8, align 1
  %x = alloca i8, align 1
  store i8 %y, i8* %y.addr, align 1
  %0 = load i8* %y.addr, align 1
  %conv = zext i8 %0 to i32
  %div = sdiv i32 255, %conv
  %conv1 = trunc i32 %div to i8
  store i8 %conv1, i8* %x, align 1
  %1 = load i8* %x, align 1
  ret i8 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call zeroext i8 @fun(i8 zeroext 2)
  %conv = zext i8 %call to i32
  %cmp = icmp ne i32 %conv, 127
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
