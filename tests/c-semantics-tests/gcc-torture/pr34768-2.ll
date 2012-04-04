; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr34768-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4

define i32 @foo() nounwind uwtable noinline {
entry:
  %0 = load i32* @x, align 4
  %sub = sub nsw i32 0, %0
  store i32 %sub, i32* @x, align 4
  ret i32 0
}

define i32 @bar() nounwind uwtable readnone noinline {
entry:
  ret i32 0
}

define i32 @test(i32 %c) nounwind uwtable noinline {
entry:
  %c.addr = alloca i32, align 4
  %tmp = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32* @x, align 4
  store i32 %0, i32* %tmp, align 4
  %1 = load i32* %c.addr, align 4
  %tobool = icmp ne i32 %1, 0
  %cond = select i1 %tobool, i32 ()* @foo, i32 ()* @bar
  %call = call i32 %cond()
  store i32 %call, i32* %res, align 4
  %2 = load i32* %tmp, align 4
  %3 = load i32* @x, align 4
  %add = add nsw i32 %2, %3
  %4 = load i32* %res, align 4
  %add2 = add nsw i32 %add, %4
  ret i32 %add2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* @x, align 4
  %call = call i32 @test(i32 1)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
