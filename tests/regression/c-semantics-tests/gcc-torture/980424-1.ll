; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980424-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@a = common global [99 x i32] zeroinitializer, align 16

define void @f(i32 %one) nounwind uwtable {
entry:
  %one.addr = alloca i32, align 4
  store i32 %one, i32* %one.addr, align 4
  %0 = load i32* %one.addr, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @g() nounwind uwtable {
entry:
  %0 = load i32* @i, align 4
  %and = and i32 %0, 63
  %idxprom = sext i32 %and to i64
  %arrayidx = getelementptr inbounds [99 x i32]* @a, i32 0, i64 %idxprom
  %1 = load i32* %arrayidx, align 4
  call void @f(i32 %1)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* getelementptr inbounds ([99 x i32]* @a, i32 0, i64 0), align 4
  store i32 64, i32* @i, align 4
  call void @g()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
