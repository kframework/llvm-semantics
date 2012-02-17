; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/star.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"sizeof(a)=%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i32 8) nounwind
  ret i32 2
}

define i32 @f(i32* %a) nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i32 8) nounwind
  %arrayidx = getelementptr inbounds i32* %a, i64 1
  %tmp1 = load i32* %arrayidx, align 4
  ret i32 %tmp1
}

declare i32 @printf(i8* nocapture, ...) nounwind
