; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@q = common global i8* null, align 8
@n = common global i32 0, align 4

define void @foo() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %0 = load i8** @q, align 8, !tbaa !0
  %arrayidx = getelementptr inbounds i8* %0, i64 2
  %1 = load i8* %arrayidx, align 1, !tbaa !1
  %conv = sext i8 %1 to i32
  store volatile i32 %conv, i32* @n, align 4, !tbaa !3
  %2 = load i8* %arrayidx, align 1, !tbaa !1
  %conv2 = sext i8 %2 to i32
  store volatile i32 %conv2, i32* @n, align 4, !tbaa !3
  %3 = load i8** @q, align 8, !tbaa !0
  %arrayidx3 = getelementptr inbounds i8* %3, i64 2
  %4 = load i8* %arrayidx3, align 1, !tbaa !1
  %conv4 = sext i8 %4 to i32
  store volatile i32 %conv4, i32* @n, align 4, !tbaa !3
  %5 = load i8* %arrayidx3, align 1, !tbaa !1
  %conv6 = sext i8 %5 to i32
  store volatile i32 %conv6, i32* @n, align 4, !tbaa !3
  %6 = load i8** @q, align 8, !tbaa !0
  %arrayidx7 = getelementptr inbounds i8* %6, i64 2
  %7 = load i8* %arrayidx7, align 1, !tbaa !1
  %conv8 = sext i8 %7 to i32
  store volatile i32 %conv8, i32* @n, align 4, !tbaa !3
  %8 = load i8* %arrayidx7, align 1, !tbaa !1
  %conv10 = sext i8 %8 to i32
  store volatile i32 %conv10, i32* @n, align 4, !tbaa !3
  %9 = load i8** @q, align 8, !tbaa !0
  %arrayidx11 = getelementptr inbounds i8* %9, i64 2
  %10 = load i8* %arrayidx11, align 1, !tbaa !1
  %conv12 = sext i8 %10 to i32
  store volatile i32 %conv12, i32* @n, align 4, !tbaa !3
  %11 = load i8* %arrayidx11, align 1, !tbaa !1
  %conv14 = sext i8 %11 to i32
  store volatile i32 %conv14, i32* @n, align 4, !tbaa !3
  %12 = load i8** @q, align 8, !tbaa !0
  %arrayidx15 = getelementptr inbounds i8* %12, i64 2
  %13 = load i8* %arrayidx15, align 1, !tbaa !1
  %conv16 = sext i8 %13 to i32
  store volatile i32 %conv16, i32* @n, align 4, !tbaa !3
  %14 = load i8* %arrayidx15, align 1, !tbaa !1
  %conv18 = sext i8 %14 to i32
  store volatile i32 %conv18, i32* @n, align 4, !tbaa !3
  %15 = load i8** @q, align 8, !tbaa !0
  %arrayidx19 = getelementptr inbounds i8* %15, i64 2
  %16 = load i8* %arrayidx19, align 1, !tbaa !1
  %conv20 = sext i8 %16 to i32
  store volatile i32 %conv20, i32* @n, align 4, !tbaa !3
  br label %for.cond
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
