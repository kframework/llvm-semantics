; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040805-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [2 x i32] [i32 2, i32 3], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 100)
  %cmp = icmp ne i32 %call, 102
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

define internal i32 @foo(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  %buf = alloca [65536 x i8], align 16
  %y = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  store i32 %0, i32* %y, align 4
  %1 = load i32* %y, align 4
  store i32 %1, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  %2 = load i32* %x.addr, align 4
  %arraydecay = getelementptr inbounds [65536 x i8]* %buf, i32 0, i32 0
  %call = call i32 @bar(i32 %2, i8* %arraydecay)
  store i32 %call, i32* %x.addr, align 4
  %3 = load i32* %y, align 4
  %arraydecay1 = getelementptr inbounds [65536 x i8]* %buf, i32 0, i32 0
  %call2 = call i32 @bar(i32 %3, i8* %arraydecay1)
  store i32 %call2, i32* %y, align 4
  %4 = load i32* %x.addr, align 4
  %5 = load i32* %y, align 4
  %add = add nsw i32 %4, %5
  ret i32 %add
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define internal i32 @bar(i32 %x, i8* %b) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  %b.addr = alloca i8*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i8* %b, i8** %b.addr, align 8
  %0 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %1 = load i32* %x.addr, align 4
  ret i32 %1
}
