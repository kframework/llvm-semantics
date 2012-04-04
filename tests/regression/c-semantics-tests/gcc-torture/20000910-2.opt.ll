; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000910-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@list = global [2 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)], align 16

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %entry ]
  %i.0.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv.i to i32
  %cmp.i = icmp ult i32 %0, 2
  br i1 %cmp.i, label %for.body.i, label %foo.exit

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds [2 x i8*]* @list, i64 0, i64 %indvars.iv.i
  %1 = load i8** %arrayidx.i, align 8, !tbaa !0
  %call.i.i = tail call i8* @strchr(i8* %1, i32 42) nounwind
  %cmp.i.i = icmp eq i8* %call.i.i, null
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %inc.i = add nsw i32 %i.0.i, 1
  br i1 %cmp.i.i, label %if.end.i, label %for.cond.i

if.end.i:                                         ; preds = %for.body.i
  %cmp2.i = icmp eq i32 %i.0.i, 0
  br i1 %cmp2.i, label %if.then4.i, label %if.else.i

if.then4.i:                                       ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

if.else.i:                                        ; preds = %if.end.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %for.cond.i
  ret i32 0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare i8* @strchr(i8*, i32) nounwind readonly

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
