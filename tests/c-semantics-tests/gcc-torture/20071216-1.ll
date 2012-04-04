; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071216-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = internal global i32 0, align 4

define i32 @bar() nounwind uwtable noinline {
entry:
  %0 = load i32* @x, align 4
  ret i32 %0
}

define i32 @foo() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i64, align 8
  %call = call i32 @bar()
  %conv = sext i32 %call to i64
  store i64 %conv, i64* %b, align 8
  %0 = load i64* %b, align 8
  %cmp = icmp ult i64 %0, -4095
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64* %b, align 8
  %conv2 = trunc i64 %1 to i32
  store i32 %conv2, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i64* %b, align 8
  %sub = sub nsw i64 0, %2
  %cmp3 = icmp ne i64 %sub, 38
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  store i64 -2, i64* %b, align 8
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %3 = load i64* %b, align 8
  %add = add nsw i64 %3, 1
  %conv7 = trunc i64 %add to i32
  store i32 %conv7, i32* %retval
  br label %return

return:                                           ; preds = %if.end6, %if.then
  %4 = load i32* %retval
  ret i32 %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 26, i32* @x, align 4
  %call = call i32 @foo()
  %cmp = icmp ne i32 %call, 26
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i32 -39, i32* @x, align 4
  %call1 = call i32 @foo()
  %cmp2 = icmp ne i32 %call1, -1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  store i32 -38, i32* @x, align 4
  %call5 = call i32 @foo()
  %cmp6 = icmp ne i32 %call5, -37
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  ret i32 0
}

declare void @abort() noreturn nounwind
