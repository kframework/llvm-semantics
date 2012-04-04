; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001130-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mem = internal global [3 x i32] zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 0)
  ret i32 0
}

define internal i32 @foo(i32 %x) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32* %x.addr, align 4
  store i32 %1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %call = call i32 @bar()
  %call1 = call i32 @foo(i32 %call)
  %2 = load i32* %x.addr, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %x.addr, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [3 x i32]* @mem, i32 0, i64 %idxprom
  store i32 %call1, i32* %arrayidx, align 4
  %3 = load i32* %x.addr, align 4
  %cmp2 = icmp ne i32 %3, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end4, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

define internal i32 @bar() nounwind uwtable inlinehint {
entry:
  ret i32 1
}

declare void @abort() noreturn nounwind
