; ModuleID = '/home/david/src/c-semantics/tests/unitTests/nonascii.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [2 x i32] [i32 937, i32 0], align 4
@y = global i32 937, align 4
@.str = private unnamed_addr constant [59 x i8] c"size of 2 element string is %d, and size of element is %d\0A\00", align 1
@str = private unnamed_addr constant [22 x i8] c"first element is same\00"
@str7 = private unnamed_addr constant [27 x i8] c"first element is different\00"
@str8 = private unnamed_addr constant [27 x i8] c"terminator element is same\00"
@str9 = private unnamed_addr constant [32 x i8] c"terminator element is different\00"
@str10 = private unnamed_addr constant [15 x i8] c"chars are same\00"
@str11 = private unnamed_addr constant [20 x i8] c"chars are different\00"

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str, i64 0, i64 0), i32 8, i32 4) nounwind
  %0 = load i32* getelementptr inbounds ([2 x i32]* @x, i64 0, i64 0), align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 937
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %puts15 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str7, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32* getelementptr inbounds ([2 x i32]* @x, i64 0, i64 1), align 4, !tbaa !0
  %cmp3 = icmp eq i32 %1, 0
  br i1 %cmp3, label %if.then4, label %if.else6

if.then4:                                         ; preds = %if.end
  %puts16 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str8, i64 0, i64 0))
  br label %if.end8

if.else6:                                         ; preds = %if.end
  %puts17 = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str9, i64 0, i64 0))
  br label %if.end8

if.end8:                                          ; preds = %if.else6, %if.then4
  %2 = load i32* @y, align 4, !tbaa !0
  %cmp9 = icmp eq i32 %2, 937
  br i1 %cmp9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.end8
  %puts18 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str10, i64 0, i64 0))
  br label %if.end14

if.else12:                                        ; preds = %if.end8
  %puts19 = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str11, i64 0, i64 0))
  br label %if.end14

if.end14:                                         ; preds = %if.else12, %if.then10
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
