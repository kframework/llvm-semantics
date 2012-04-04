; ModuleID = '/home/david/src/c-semantics/tests/clight-tests-unit/expr5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @foo() nounwind uwtable {
entry:
  ret i32 2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %g_46 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  %tobool = icmp ne i32 %call, 0
  %lor.ext = zext i1 %tobool to i32
  store i32 %lor.ext, i32* %g_46, align 4
  %0 = load i32* %g_46, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %0)
  ret i32 0
}

declare i32 @printf(i8*, ...)
