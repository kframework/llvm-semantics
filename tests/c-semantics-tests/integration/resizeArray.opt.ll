; ModuleID = '/home/david/src/c-semantics/tests/integration/resizeArray.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str2 = private unnamed_addr constant [13 x i8] c" a[%d] = %d\0A\00", align 1
@str = private unnamed_addr constant [21 x i8] c"Error: failed malloc\00"
@str5 = private unnamed_addr constant [22 x i8] c"-- array after malloc\00"
@str6 = private unnamed_addr constant [22 x i8] c"Error: failed realloc\00"
@str7 = private unnamed_addr constant [24 x i8] c"\0A-- array after realloc\00"

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 20) nounwind
  %cmp = icmp eq i8* %call, null
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %0 = bitcast i8* %call to i32*
  store i32 0, i32* %0, align 4, !tbaa !0
  %arrayidx.1 = getelementptr inbounds i8* %call, i64 4
  %1 = bitcast i8* %arrayidx.1 to i32*
  store i32 1, i32* %1, align 4, !tbaa !0
  %arrayidx.2 = getelementptr inbounds i8* %call, i64 8
  %2 = bitcast i8* %arrayidx.2 to i32*
  store i32 2, i32* %2, align 4, !tbaa !0
  %arrayidx.3 = getelementptr inbounds i8* %call, i64 12
  %3 = bitcast i8* %arrayidx.3 to i32*
  store i32 3, i32* %3, align 4, !tbaa !0
  %arrayidx.4 = getelementptr inbounds i8* %call, i64 16
  %4 = bitcast i8* %arrayidx.4 to i32*
  store i32 4, i32* %4, align 4, !tbaa !0
  %puts42 = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str5, i64 0, i64 0))
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 0, i32 0) nounwind
  %call12.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 1, i32 1) nounwind
  %call12.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 2, i32 2) nounwind
  %call12.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 3, i32 3) nounwind
  %call12.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 4, i32 4) nounwind
  %call16 = tail call i8* @realloc(i8* %call, i64 40) nounwind
  %cmp17 = icmp eq i8* %call16, null
  br i1 %cmp17, label %if.then19, label %for.cond22.preheader

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str, i64 0, i64 0))
  br label %return

for.cond22.preheader:                             ; preds = %for.cond.preheader
  %puts44 = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8]* @str7, i64 0, i64 0))
  %call38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 0, i32 0) nounwind
  %call38.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 1, i32 1) nounwind
  %call38.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 2, i32 2) nounwind
  %call38.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 3, i32 3) nounwind
  %call38.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 4, i32 4) nounwind
  %call38.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 5, i32 5) nounwind
  %call38.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 6, i32 6) nounwind
  %call38.7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 7, i32 7) nounwind
  %call38.8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 8, i32 8) nounwind
  %call38.9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str2, i64 0, i64 0), i32 9, i32 9) nounwind
  tail call void @free(i8* %call16) nounwind
  br label %return

if.then19:                                        ; preds = %for.cond.preheader
  %puts43 = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str6, i64 0, i64 0))
  br label %return

return:                                           ; preds = %for.cond22.preheader, %if.then19, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 1, %if.then19 ], [ 0, %for.cond22.preheader ]
  ret i32 %retval.0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare noalias i8* @realloc(i8* nocapture, i64) nounwind

declare void @free(i8* nocapture) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
