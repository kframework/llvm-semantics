; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070724-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@value = internal global i8 -99, align 1
@magic = internal global [2 x i8] c"\9D\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i8* @value, align 1
  %conv = zext i8 %0 to i32
  %1 = load i8* getelementptr inbounds ([2 x i8]* @magic, i32 0, i64 0), align 1
  %conv1 = zext i8 %1 to i32
  %cmp = icmp ne i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
