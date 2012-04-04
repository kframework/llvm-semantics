; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20601-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8*, [4096 x i8], i8** }

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"-u\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@g = global [4 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)], align 16
@c = common global i8** null, align 8
@b = common global i32 0, align 4
@.str4 = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@t = common global %struct.T zeroinitializer, align 8
@a = common global [5 x i32] zeroinitializer, align 16
@d = common global i32 0, align 4
@e = common global i8** null, align 8
@f = common global [16 x i8*] zeroinitializer, align 16

define void @foo() noreturn nounwind uwtable readnone {
entry:
  br label %while.body

while.body:                                       ; preds = %entry, %while.body
  br label %while.body
}

define noalias i8* @bar(i8* nocapture %x, i32 %y) nounwind uwtable readnone noinline {
entry:
  ret i8* null
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i8** getelementptr inbounds ([4 x i8*]* @g, i64 0, i64 0), i8*** @c, align 8, !tbaa !0
  store i32 4, i32* @b, align 4, !tbaa !3
  store i8** getelementptr inbounds ([4 x i8*]* @g, i64 0, i64 1), i8*** @e, align 8, !tbaa !0
  store i32 3, i32* @d, align 4, !tbaa !3
  br label %while.cond.i

while.cond.i:                                     ; preds = %sw.epilog.i, %entry
  %0 = phi i8** [ %incdec.ptr31.i, %sw.epilog.i ], [ getelementptr inbounds ([4 x i8*]* @g, i64 0, i64 1), %entry ]
  %1 = phi i32 [ %dec30.i, %sw.epilog.i ], [ 3, %entry ]
  %j.0.i = phi i32 [ %j.2.i, %sw.epilog.i ], [ 1, %entry ]
  %cmp.i = icmp sgt i32 %1, 0
  br i1 %cmp.i, label %land.rhs.i, label %setup2.exit

land.rhs.i:                                       ; preds = %while.cond.i
  %2 = load i8** %0, align 8, !tbaa !0
  %3 = load i8* %2, align 1, !tbaa !1
  %cmp2.i = icmp eq i8 %3, 45
  br i1 %cmp2.i, label %while.body.i, label %land.lhs.true34.i

while.body.i:                                     ; preds = %land.rhs.i
  %arrayidx5.i = getelementptr inbounds i8* %2, i64 1
  %4 = load i8* %arrayidx5.i, align 1, !tbaa !1
  %cmp7.i = icmp eq i8 %4, 0
  br i1 %cmp7.i, label %if.end.i, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %while.body.i
  %arrayidx10.i = getelementptr inbounds i8* %2, i64 2
  %5 = load i8* %arrayidx10.i, align 1, !tbaa !1
  %cmp12.i = icmp eq i8 %5, 0
  br i1 %cmp12.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %land.lhs.true.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end.i:                                         ; preds = %land.lhs.true.i, %while.body.i
  %conv16.i = sext i8 %4 to i32
  switch i32 %conv16.i, label %sw.epilog.i [
    i32 117, label %sw.bb.i
    i32 80, label %sw.bb21.i
    i32 45, label %sw.bb22.i
  ]

sw.bb.i:                                          ; preds = %if.end.i
  %arrayidx17.i = getelementptr inbounds i8** %0, i64 1
  %6 = load i8** %arrayidx17.i, align 8, !tbaa !0
  %tobool.i = icmp eq i8* %6, null
  br i1 %tobool.i, label %if.then18.i, label %if.end19.i

if.then18.i:                                      ; preds = %sw.bb.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end19.i:                                       ; preds = %sw.bb.i
  store i8** %arrayidx17.i, i8*** getelementptr inbounds (%struct.T* @t, i64 0, i32 2), align 8, !tbaa !0
  %dec.i = add nsw i32 %1, -1
  store i32 %dec.i, i32* @d, align 4, !tbaa !3
  store i8** %arrayidx17.i, i8*** @e, align 8, !tbaa !0
  br label %sw.epilog.i

sw.bb21.i:                                        ; preds = %if.end.i
  %or.i = or i32 %j.0.i, 4096
  br label %sw.epilog.i

sw.bb22.i:                                        ; preds = %if.end.i
  %dec23.i = add nsw i32 %1, -1
  store i32 %dec23.i, i32* @d, align 4, !tbaa !3
  %incdec.ptr24.i = getelementptr inbounds i8** %0, i64 1
  store i8** %incdec.ptr24.i, i8*** @e, align 8, !tbaa !0
  %cmp25.i = icmp eq i32 %j.0.i, 1
  %or28.i = or i32 %j.0.i, 1536
  %or28.j.0.i = select i1 %cmp25.i, i32 %or28.i, i32 %j.0.i
  br label %setup2.exit

sw.epilog.i:                                      ; preds = %sw.bb21.i, %if.end19.i, %if.end.i
  %7 = phi i8** [ %0, %if.end.i ], [ %0, %sw.bb21.i ], [ %arrayidx17.i, %if.end19.i ]
  %8 = phi i32 [ %1, %if.end.i ], [ %1, %sw.bb21.i ], [ %dec.i, %if.end19.i ]
  %j.2.i = phi i32 [ %j.0.i, %if.end.i ], [ %or.i, %sw.bb21.i ], [ %j.0.i, %if.end19.i ]
  %dec30.i = add nsw i32 %8, -1
  store i32 %dec30.i, i32* @d, align 4, !tbaa !3
  %incdec.ptr31.i = getelementptr inbounds i8** %7, i64 1
  store i8** %incdec.ptr31.i, i8*** @e, align 8, !tbaa !0
  br label %while.cond.i

land.lhs.true34.i:                                ; preds = %land.rhs.i
  %and.i = and i32 %j.0.i, 1
  %tobool35.i = icmp eq i32 %and.i, 0
  br i1 %tobool35.i, label %if.then36.i, label %setup2.exit

if.then36.i:                                      ; preds = %land.lhs.true34.i
  tail call void @abort() noreturn nounwind
  unreachable

setup2.exit:                                      ; preds = %while.cond.i, %sw.bb22.i, %land.lhs.true34.i
  %9 = phi i32 [ %dec23.i, %sw.bb22.i ], [ %1, %land.lhs.true34.i ], [ %1, %while.cond.i ]
  %10 = phi i8** [ %incdec.ptr24.i, %sw.bb22.i ], [ %0, %land.lhs.true34.i ], [ %0, %while.cond.i ]
  %retval.0.i = phi i32 [ %or28.j.0.i, %sw.bb22.i ], [ %j.0.i, %land.lhs.true34.i ], [ %j.0.i, %while.cond.i ]
  store i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i8** getelementptr inbounds (%struct.T* @t, i64 0, i32 0), align 8, !tbaa !0
  %and.i3 = and i32 %retval.0.i, 512
  %tobool2.i = icmp eq i32 %and.i3, 0
  br i1 %tobool2.i, label %setup1.exit, label %if.then6.i

if.then6.i:                                       ; preds = %setup2.exit
  %inc.i = add nsw i32 %9, 1
  store i32 %inc.i, i32* @d, align 4, !tbaa !3
  store i8** getelementptr inbounds ([16 x i8*]* @f, i64 0, i64 0), i8*** @e, align 8, !tbaa !0
  store i8* getelementptr inbounds ([8 x i8]* @.str4, i64 0, i64 0), i8** getelementptr inbounds ([16 x i8*]* @f, i64 0, i64 0), align 16, !tbaa !0
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.i, %if.then6.i
  %.pn.i = phi i8** [ getelementptr inbounds ([16 x i8*]* @f, i64 0, i64 0), %if.then6.i ], [ %h.0.i, %for.cond.i ]
  %i.0.i = phi i8** [ %10, %if.then6.i ], [ %incdec.ptr.i, %for.cond.i ]
  %h.0.i = getelementptr inbounds i8** %.pn.i, i64 1
  %11 = load i8** %i.0.i, align 8, !tbaa !0
  store i8* %11, i8** %h.0.i, align 8, !tbaa !0
  %tobool8.i = icmp eq i8* %11, null
  %incdec.ptr.i = getelementptr inbounds i8** %i.0.i, i64 1
  br i1 %tobool8.i, label %setup1.exit, label %for.cond.i

setup1.exit:                                      ; preds = %for.cond.i, %setup2.exit
  %and = and i32 %retval.0.i, 1024
  %tobool = icmp eq i32 %and, 0
  %12 = load i32* getelementptr inbounds ([5 x i32]* @a, i64 0, i64 4), align 16, !tbaa !3
  %tobool2 = icmp ne i32 %12, 0
  %or.cond = or i1 %tobool, %tobool2
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %setup1.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %setup1.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
