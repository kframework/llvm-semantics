; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = internal unnamed_addr global [4 x i32] zeroinitializer, align 16
@testit.ir = private unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 2, i32 3], align 16
@t = internal unnamed_addr global i32 0, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %ap.exit.i, %entry
  %n.0.i = phi i32 [ 1, %entry ], [ %m.0.i, %ap.exit.i ]
  %ix.0.i = phi i32 [ 1, %entry ], [ %inc.i, %ap.exit.i ]
  %cmp.i = icmp slt i32 %ix.0.i, 5
  br i1 %cmp.i, label %for.body.i, label %testit.exit

for.body.i:                                       ; preds = %for.cond.i
  %sub.i = add nsw i32 %n.0.i, -1
  %0 = load i32* @t, align 4, !tbaa !0
  %cmp.i.i = icmp sgt i32 %0, 3
  br i1 %cmp.i.i, label %if.then.i.i, label %ap.exit.i

if.then.i.i:                                      ; preds = %for.body.i
  tail call void @abort() noreturn nounwind
  unreachable

ap.exit.i:                                        ; preds = %for.body.i
  %idxprom.i = sext i32 %sub.i to i64
  %arrayidx.i = getelementptr inbounds [4 x i32]* @testit.ir, i64 0, i64 %idxprom.i
  %cmp1.i = icmp eq i32 %n.0.i, 1
  %1 = load i32* %arrayidx.i, align 4, !tbaa !0
  %m.0.i = select i1 %cmp1.i, i32 4, i32 %sub.i
  %inc.i.i = add nsw i32 %0, 1
  store i32 %inc.i.i, i32* @t, align 4, !tbaa !0
  %idxprom.i.i = sext i32 %0 to i64
  %arrayidx.i.i = getelementptr inbounds [4 x i32]* @a, i64 0, i64 %idxprom.i.i
  store i32 %1, i32* %arrayidx.i.i, align 4, !tbaa !0
  %inc.i = add nsw i32 %ix.0.i, 1
  br label %for.cond.i

testit.exit:                                      ; preds = %for.cond.i
  %2 = load i64* bitcast ([4 x i32]* @a to i64*), align 16
  %3 = trunc i64 %2 to i32
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %testit.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %testit.exit
  %.mask = and i64 %2, -4294967296
  %cmp1 = icmp eq i64 %.mask, 12884901888
  br i1 %cmp1, label %if.end3, label %if.then2

if.then2:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %4 = load i64* bitcast (i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 2) to i64*), align 8
  %5 = trunc i64 %4 to i32
  %cmp4 = icmp eq i32 %5, 2
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end3
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  %.mask10 = and i64 %4, -4294967296
  %cmp7 = icmp eq i64 %.mask10, 4294967296
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end6
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end6
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
