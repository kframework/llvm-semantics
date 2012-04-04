; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29797-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @bar() nounwind uwtable {
entry:
  ret i32 32768
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %nStyle = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @bar()
  store i32 %call, i32* %nStyle, align 4
  %0 = load i32* %nStyle, align 4
  %and = and i32 %0, 32768
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32* %nStyle, align 4
  %or = or i32 %1, 65536
  store i32 %or, i32* %nStyle, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32* %nStyle, align 4
  %cmp = icmp ne i32 %2, 98304
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end2:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
