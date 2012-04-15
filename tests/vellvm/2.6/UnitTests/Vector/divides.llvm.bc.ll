; ModuleID = 'divides.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [22 x i8] c"U3.V = <%u %u %u %u>\0A\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str1 = private constant [22 x i8] c"S3.V = <%u %u %u %u>\0A\00", align 1 ; <[22 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 1, i32 1, i32 1, i32 1) nounwind ; <i32> [#uses=0]
  %1 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 1, i32 1, i32 1, i32 1) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
