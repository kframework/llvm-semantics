; ModuleID = '/home/david/src/c-semantics/tests/unitTests/initArraysAndStructs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [40 x i8] c"[4].a=%d, [4].b=%d, [5].a=%d, [5].b=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c"sizeof(s)/sizeof(s[0]) = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i64 0, i64 0), i32 5, i32 6, i32 6, i32 8) nounwind
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i64 6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
