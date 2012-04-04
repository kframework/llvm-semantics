; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920721-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i16 signext %a, i16 signext %b) nounwind uwtable {
entry:
  %a.addr = alloca i16, align 2
  %b.addr = alloca i16, align 2
  store i16 %a, i16* %a.addr, align 2
  store i16 %b, i16* %b.addr, align 2
  %0 = load i16* %a.addr, align 2
  %conv = sext i16 %0 to i64
  %1 = load i16* %b.addr, align 2
  %conv1 = sext i16 %1 to i64
  %div = sdiv i64 %conv, %conv1
  ret i64 %div
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @f(i16 signext -32768, i16 signext -1)
  %cmp = icmp ne i64 %call, 32768
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
