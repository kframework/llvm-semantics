; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/moreStructs.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.B = type { i32, i32 }

@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"b.x = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"b.y = %d\0A\00", align 1
@str = internal constant [8 x i8] c"in f():\00"
@str1 = internal constant [11 x i8] c"in main():\00"

define i32 @main() nounwind uwtable {
entry:
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str, i64 0, i64 0)) nounwind
  %call6.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str3, i64 0, i64 0), i32 0) nounwind
  %call8.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str4, i64 0, i64 0), i32 1) nounwind
  %call21.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call23.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 0) nounwind
  %call25.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 1) nounwind
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @str1, i64 0, i64 0))
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 2) nounwind
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 0) nounwind
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind
