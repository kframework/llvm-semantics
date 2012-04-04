; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29797-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @bar() nounwind uwtable {
entry:
  ret i64 32768
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %nStyle = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call i64 @bar()
  store i64 %call, i64* %nStyle, align 8
  %0 = load i64* %nStyle, align 8
  %and = and i64 %0, 32768
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i64* %nStyle, align 8
  %or = or i64 %1, 65536
  store i64 %or, i64* %nStyle, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i64* %nStyle, align 8
  %cmp = icmp ne i64 %2, 98304
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end2:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
