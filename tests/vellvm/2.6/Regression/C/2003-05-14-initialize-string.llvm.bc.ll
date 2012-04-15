; ModuleID = '2003-05-14-initialize-string.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [15 x i8] c"foo and stuff\0A\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str1 = private constant [3 x i8] c"%s\00", align 1 ; <[3 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %title = alloca [15 x i8], align 1              ; <[15 x i8]*> [#uses=2]
  %title1 = getelementptr inbounds [15 x i8]* %title, i32 0, i32 0 ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %title1, i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 15, i32 1)
  %0 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), [15 x i8]* %title) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
