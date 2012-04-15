; ModuleID = '2004-03-15-IndirectGoto.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [2 x i8] c"A\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str1 = private constant [2 x i8] c"B\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str2 = private constant [2 x i8] c"C\00", align 1 ; <[2 x i8]*> [#uses=1]
@.str3 = private constant [2 x i8] c"D\00", align 1 ; <[2 x i8]*> [#uses=1]
@L.1730 = internal constant [5 x i8*] [i8* inttoptr (i32 1 to i8*), i8* inttoptr (i32 2 to i8*), i8* inttoptr (i32 3 to i8*), i8* inttoptr (i32 4 to i8*), i8* null] ; <[5 x i8*]*> [#uses=1]
@.str4 = private constant [2 x i8] c"E\00", align 1 ; <[2 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %L1

L1.loopexit:                                      ; preds = %L3
  %tmp5 = add i32 %indvar, %tmp                   ; <i32> [#uses=1]
  br label %L1

L1:                                               ; preds = %L1.loopexit, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %tmp5, %L1.loopexit ] ; <i32> [#uses=1]
  %1 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  br label %L2

L2.loopexit:                                      ; preds = %L3
  %tmp5.le = add i32 %indvar, %tmp                ; <i32> [#uses=1]
  br label %L2

L2:                                               ; preds = %L2.loopexit, %L1
  %i.1 = phi i32 [ %i.0, %L1 ], [ %tmp5.le, %L2.loopexit ] ; <i32> [#uses=2]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp = add i32 %i.1, 1                          ; <i32> [#uses=2]
  br label %L3

L3:                                               ; preds = %L3, %L2
  %indvar = phi i32 [ 0, %L2 ], [ %indvar.next, %L3 ] ; <i32> [#uses=4]
  %tmp6 = add i32 %indvar, %i.1                   ; <i32> [#uses=1]
  %scevgep = getelementptr [5 x i8*]* @L.1730, i32 0, i32 %tmp6 ; <i8**> [#uses=1]
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %4 = load i8** %scevgep, align 4                ; <i8*> [#uses=1]
  %5 = ptrtoint i8* %4 to i32                     ; <i32> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  switch i32 %5, label %L1.loopexit [
    i32 2, label %L2.loopexit
    i32 3, label %L3
    i32 4, label %L4
  ]

L4:                                               ; preds = %L3
  %6 = tail call i32 @puts(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
