; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j033b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %s = alloca i8*, align 8
  store i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8** %s, align 8
  %0 = load i8** %s, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 0
  %1 = load i8* %arrayidx, align 1
  ret i32 0
}
