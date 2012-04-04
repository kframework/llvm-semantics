; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980505-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f.values = internal global [1 x i16] [i16 -27904], align 2

define i32 @f() nounwind uwtable {
entry:
  %token = alloca i16, align 2
  %count = alloca i32, align 4
  %0 = load i16* getelementptr inbounds ([1 x i16]* @f.values, i32 0, i64 0), align 2
  store i16 %0, i16* %token, align 2
  %1 = load i16* %token, align 2
  %conv = zext i16 %1 to i32
  %shr = ashr i32 %conv, 8
  store i32 %shr, i32* %count, align 4
  %2 = load i32* %count, align 4
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %cmp = icmp ne i32 %call, 147
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
