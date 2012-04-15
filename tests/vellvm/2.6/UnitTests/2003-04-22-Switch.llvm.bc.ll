; ModuleID = '2003-04-22-Switch.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [2 x i8] c"C\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str1 = private constant [2 x i8] c"A\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str2 = private constant [2 x i8] c"B\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str3 = private constant [2 x i8] c"D\00", align 1 ; <[2 x i8]*> [#uses=1]

declare i32 @puts(i8* nocapture) nounwind

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %func.exit, %entry
  %0 = phi i32 [ 0, %entry ], [ %5, %func.exit ]  ; <i32> [#uses=2]
  switch i32 %0, label %bb4.i [
    i32 0, label %bb1.i
    i32 1, label %bb3.i
    i32 2, label %bb1.i
    i32 3, label %bb1.i
    i32 7, label %bb3.i
    i32 8, label %bb.i
    i32 9, label %bb3.i
  ]

bb.i:                                             ; preds = %bb
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %bb1.i

bb1.i:                                            ; preds = %bb.i, %bb, %bb, %bb
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %func.exit

bb3.i:                                            ; preds = %bb, %bb, %bb
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %func.exit

bb4.i:                                            ; preds = %bb
  %4 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %func.exit

func.exit:                                        ; preds = %bb4.i, %bb3.i, %bb1.i
  %5 = add i32 %0, 1                              ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %5, 10                  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb

bb2:                                              ; preds = %func.exit
  ret i32 0
}
