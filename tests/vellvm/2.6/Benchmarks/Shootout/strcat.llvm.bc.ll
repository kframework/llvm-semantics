; ModuleID = 'strcat.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [14 x i8] c"calloc strbuf\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str1 = private constant [15 x i8] c"realloc strbuf\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str2 = private constant [7 x i8] c"hello\0A\00", align 1 ; <[7 x i8]*> [#uses=1]
@.str3 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.24.0 = phi i32 [ %3, %bb ], [ 10000000, %entry ] ; <i32> [#uses=1]
  %4 = tail call noalias i8* @calloc(i32 1, i32 32) nounwind ; <i8*> [#uses=3]
  %5 = icmp eq i8* %4, null                       ; <i1> [#uses=1]
  br i1 %5, label %bb3, label %bb10

bb3:                                              ; preds = %bb2
  tail call void @perror(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0)) nounwind
  ret i32 1

bb5:                                              ; preds = %bb10
  %6 = getelementptr inbounds i8* %strbuf.1, i32 %buflen.1 ; <i8*> [#uses=1]
  %7 = ptrtoint i8* %6 to i32                     ; <i32> [#uses=1]
  %8 = ptrtoint i8* %strend.1 to i32              ; <i32> [#uses=1]
  %9 = sub i32 %7, %8                             ; <i32> [#uses=1]
  %10 = icmp slt i32 %9, 7                        ; <i1> [#uses=1]
  br i1 %10, label %bb6, label %bb9

bb6:                                              ; preds = %bb5
  %11 = shl i32 %buflen.1, 1                      ; <i32> [#uses=2]
  %12 = tail call i8* @realloc(i8* %strbuf.1, i32 %11) nounwind ; <i8*> [#uses=4]
  %13 = icmp eq i8* %12, null                     ; <i1> [#uses=1]
  br i1 %13, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  tail call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0)) nounwind
  ret i32 1

bb8:                                              ; preds = %bb6
  %14 = tail call i32 @strlen(i8* %12) nounwind readonly ; <i32> [#uses=1]
  %15 = getelementptr inbounds i8* %12, i32 %14   ; <i8*> [#uses=1]
  br label %bb9

bb9:                                              ; preds = %bb8, %bb5
  %strend.0 = phi i8* [ %15, %bb8 ], [ %strend.1, %bb5 ] ; <i8*> [#uses=3]
  %strbuf.0 = phi i8* [ %12, %bb8 ], [ %strbuf.1, %bb5 ] ; <i8*> [#uses=1]
  %buflen.0 = phi i32 [ %11, %bb8 ], [ %buflen.1, %bb5 ] ; <i32> [#uses=1]
  %strlen = tail call i32 @strlen(i8* %strend.0)  ; <i32> [#uses=1]
  %endptr = getelementptr i8* %strend.0, i32 %strlen ; <i8*> [#uses=1]
  tail call void @llvm.memcpy.i32(i8* %endptr, i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), i32 7, i32 1)
  %16 = getelementptr inbounds i8* %strend.0, i32 6 ; <i8*> [#uses=1]
  %17 = add i32 %18, 1                            ; <i32> [#uses=1]
  br label %bb10

bb10:                                             ; preds = %bb9, %bb2
  %strend.1 = phi i8* [ %16, %bb9 ], [ %4, %bb2 ] ; <i8*> [#uses=2]
  %strbuf.1 = phi i8* [ %strbuf.0, %bb9 ], [ %4, %bb2 ] ; <i8*> [#uses=5]
  %buflen.1 = phi i32 [ %buflen.0, %bb9 ], [ 32, %bb2 ] ; <i32> [#uses=3]
  %18 = phi i32 [ %17, %bb9 ], [ 0, %bb2 ]        ; <i32> [#uses=2]
  %19 = icmp slt i32 %18, %iftmp.24.0             ; <i1> [#uses=1]
  br i1 %19, label %bb5, label %bb11

bb11:                                             ; preds = %bb10
  %20 = tail call i32 @strlen(i8* %strbuf.1) nounwind readonly ; <i32> [#uses=1]
  %21 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %20) nounwind ; <i32> [#uses=0]
  free i8* %strbuf.1
  ret i32 0
}

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare noalias i8* @calloc(i32, i32) nounwind

declare void @perror(i8* nocapture) nounwind

declare noalias i8* @realloc(i8* nocapture, i32) nounwind

declare i32 @strlen(i8* nocapture) nounwind readonly

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind
