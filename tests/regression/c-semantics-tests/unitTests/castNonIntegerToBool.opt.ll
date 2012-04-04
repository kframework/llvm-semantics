; ModuleID = '/home/david/src/c-semantics/tests/unitTests/castNonIntegerToBool.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@str = private unnamed_addr constant [8 x i8] c"Good b1\00"
@str8 = private unnamed_addr constant [8 x i8] c"Good b2\00"
@str9 = private unnamed_addr constant [8 x i8] c"Good b3\00"
@str10 = private unnamed_addr constant [8 x i8] c"Good b4\00"

define i32 @main() nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str, i64 0, i64 0))
  %puts31 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str8, i64 0, i64 0))
  %puts32 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str9, i64 0, i64 0))
  %puts33 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str10, i64 0, i64 0))
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
