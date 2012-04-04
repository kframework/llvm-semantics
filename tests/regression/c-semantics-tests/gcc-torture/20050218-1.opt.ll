; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"bc\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@a = global [16 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], align 16
@.str4 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1

define i32 @foo(i8* nocapture %x, i8* %y, i64 %n) nounwind uwtable readonly {
entry:
  %tobool = icmp eq i8* %y, null
  br i1 %tobool, label %for.cond.us, label %for.cond

for.cond.us:                                      ; preds = %entry, %for.inc.us
  %i.0.us = phi i64 [ %inc.us, %for.inc.us ], [ 0, %entry ]
  %j.0.us = phi i64 [ %add.us, %for.inc.us ], [ 0, %entry ]
  %cmp.us = icmp ult i64 %i.0.us, %n
  br i1 %cmp.us, label %for.body.us, label %return

for.inc.us:                                       ; preds = %for.body.us
  %add.us = add i64 %call.us, %j.0.us
  %inc.us = add i64 %i.0.us, 1
  br label %for.cond.us

for.body.us:                                      ; preds = %for.cond.us
  %add.ptr.us = getelementptr inbounds i8* %x, i64 %j.0.us
  %arrayidx.us = getelementptr inbounds [16 x i8*]* @a, i64 0, i64 %i.0.us
  %0 = load i8** %arrayidx.us, align 8, !tbaa !0
  %call.us = tail call i64 @strlen(i8* %0) nounwind
  %call2.us = tail call i32 @strncmp(i8* %add.ptr.us, i8* %0, i64 %call.us) nounwind
  %cmp3.us = icmp eq i32 %call2.us, 0
  br i1 %cmp3.us, label %for.inc.us, label %return

for.cond:                                         ; preds = %entry, %for.inc
  %i.0 = phi i64 [ %inc, %for.inc ], [ 0, %entry ]
  %j.0 = phi i64 [ %add8, %for.inc ], [ 0, %entry ]
  %cmp = icmp ult i64 %i.0, %n
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %add.ptr = getelementptr inbounds i8* %x, i64 %j.0
  %arrayidx = getelementptr inbounds [16 x i8*]* @a, i64 0, i64 %i.0
  %1 = load i8** %arrayidx, align 8, !tbaa !0
  %call = tail call i64 @strlen(i8* %1) nounwind
  %call2 = tail call i32 @strncmp(i8* %add.ptr, i8* %1, i64 %call) nounwind
  %cmp3 = icmp eq i32 %call2, 0
  br i1 %cmp3, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %add = add i64 %call, %j.0
  %call7 = tail call i64 @strlen(i8* %y) nounwind
  %add8 = add i64 %call7, %add
  %inc = add i64 %i.0, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body, %for.cond.us, %for.body.us
  %retval.0 = phi i32 [ 0, %for.cond.us ], [ 2, %for.body.us ], [ 0, %for.cond ], [ 2, %for.body ]
  ret i32 %retval.0
}

declare i32 @strncmp(i8* nocapture, i8* nocapture, i64) nounwind readonly

declare i64 @strlen(i8* nocapture) nounwind readonly

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond.us.i

for.cond.us.i:                                    ; preds = %for.inc.us.i, %entry
  %i.0.us.i = phi i64 [ %inc.us.i, %for.inc.us.i ], [ 0, %entry ]
  %j.0.us.i = phi i64 [ %add.us.i, %for.inc.us.i ], [ 0, %entry ]
  %cmp.us.i = icmp ult i64 %i.0.us.i, 3
  br i1 %cmp.us.i, label %for.body.us.i, label %if.end

for.inc.us.i:                                     ; preds = %for.body.us.i
  %add.us.i = add i64 %call.us.i, %j.0.us.i
  %inc.us.i = add i64 %i.0.us.i, 1
  br label %for.cond.us.i

for.body.us.i:                                    ; preds = %for.cond.us.i
  %add.ptr.us.i = getelementptr inbounds [6 x i8]* @.str4, i64 0, i64 %j.0.us.i
  %arrayidx.us.i = getelementptr inbounds [16 x i8*]* @a, i64 0, i64 %i.0.us.i
  %0 = load i8** %arrayidx.us.i, align 8, !tbaa !0
  %call.us.i = tail call i64 @strlen(i8* %0) nounwind
  %call2.us.i = tail call i32 @strncmp(i8* %add.ptr.us.i, i8* %0, i64 %call.us.i) nounwind
  %cmp3.us.i = icmp eq i32 %call2.us.i, 0
  br i1 %cmp3.us.i, label %for.inc.us.i, label %if.then

if.then:                                          ; preds = %for.body.us.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.cond.us.i
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
