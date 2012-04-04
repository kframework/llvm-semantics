; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021024-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cp = common global i64* null, align 8
@m = common global i64 0, align 8
@main.r = internal global [64 x i64] zeroinitializer, align 16

define void @foo() nounwind uwtable readnone {
entry:
  ret void
}

define void @bar(i32 %rop, i64* nocapture %r) nounwind uwtable {
entry:
  %shr = lshr i32 %rop, 23
  %shr1 = lshr i32 %rop, 9
  %and2 = and i32 %shr1, 511
  %and3 = and i32 %rop, 511
  %0 = load i64** @cp, align 8, !tbaa !0
  %idxprom = zext i32 %and2 to i64
  %arrayidx = getelementptr inbounds i64* %r, i64 %idxprom
  %idxprom4 = zext i32 %shr to i64
  %arrayidx5 = getelementptr inbounds i64* %r, i64 %idxprom4
  %tobool = icmp eq i32 %and3, 0
  br i1 %tobool, label %top.us, label %if.end

top.us:                                           ; preds = %top.us, %entry
  store i64 1, i64* %0, align 8, !tbaa !3
  %1 = load i64* %arrayidx, align 8, !tbaa !3
  %2 = load i64* %arrayidx5, align 8, !tbaa !3
  %add.us = add i64 %2, %1
  store i64 %add.us, i64* @m, align 8, !tbaa !3
  store i64 2, i64* %0, align 8, !tbaa !3
  br label %top.us

if.end:                                           ; preds = %entry
  store i64 1, i64* %0, align 8, !tbaa !3
  %3 = load i64* %arrayidx, align 8, !tbaa !3
  %4 = load i64* %arrayidx5, align 8, !tbaa !3
  %add = add i64 %4, %3
  store i64 %add, i64* @m, align 8, !tbaa !3
  store i64 2, i64* %0, align 8, !tbaa !3
  %idxprom6 = zext i32 %and3 to i64
  %arrayidx7 = getelementptr inbounds i64* %r, i64 %idxprom6
  store i64 1, i64* %arrayidx7, align 8, !tbaa !3
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  %cr = alloca i64, align 8
  store i64* %cr, i64** @cp, align 8, !tbaa !0
  store i64 47, i64* getelementptr inbounds ([64 x i64]* @main.r, i64 0, i64 4), align 16, !tbaa !3
  store i64 11, i64* getelementptr inbounds ([64 x i64]* @main.r, i64 0, i64 8), align 16, !tbaa !3
  store i64 58, i64* @m, align 8, !tbaa !3
  store i64 2, i64* %cr, align 8, !tbaa !3
  store i64 1, i64* getelementptr inbounds ([64 x i64]* @main.r, i64 0, i64 15), align 8, !tbaa !3
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long long", metadata !1}
