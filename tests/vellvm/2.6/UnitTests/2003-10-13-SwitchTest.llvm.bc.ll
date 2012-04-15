; ModuleID = '2003-10-13-SwitchTest.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [5 x i8] c"GOOD\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str1 = private constant [4 x i8] c"BAD\00", align 1 ; <[4 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  switch i32 %argc, label %bb [
    i32 100, label %bb1
    i32 101, label %bb1
    i32 1023, label %bb1
  ]

bb:                                               ; preds = %entry
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 0

bb1:                                              ; preds = %entry, %entry, %entry
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 1
}

declare i32 @puts(i8* nocapture) nounwind
