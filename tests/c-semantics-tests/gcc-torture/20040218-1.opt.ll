; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.y = private unnamed_addr constant [2 x i64] [i64 -1, i64 16000], align 16

define i64 @xb(i64* nocapture %y) nounwind uwtable readonly noinline {
entry:
  %0 = load i64* %y, align 8, !tbaa !0
  %and = and i64 %0, 255
  %arrayidx = getelementptr inbounds i64* %y, i64 1
  %1 = load i64* %arrayidx, align 8, !tbaa !0
  %add = add nsw i64 %and, %1
  ret i64 %add
}

define i64 @xw(i64* nocapture %y) nounwind uwtable readonly noinline {
entry:
  %0 = load i64* %y, align 8, !tbaa !0
  %and = and i64 %0, 65535
  %arrayidx = getelementptr inbounds i64* %y, i64 1
  %1 = load i64* %arrayidx, align 8, !tbaa !0
  %add = add nsw i64 %and, %1
  ret i64 %add
}

define signext i16 @yb(i16* nocapture %y) nounwind uwtable readonly noinline {
entry:
  %0 = load i16* %y, align 2, !tbaa !3
  %and = and i16 %0, 255
  %arrayidx = getelementptr inbounds i16* %y, i64 1
  %1 = load i16* %arrayidx, align 2, !tbaa !3
  %add = add i16 %and, %1
  ret i16 %add
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %yw = alloca i32, align 4
  store i32 1048641535, i32* %yw, align 4
  %call = call i64 @xb(i64* getelementptr inbounds ([2 x i64]* @main.y, i64 0, i64 0))
  %cmp = icmp eq i64 %call, 16255
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %call2 = call i64 @xw(i64* getelementptr inbounds ([2 x i64]* @main.y, i64 0, i64 0))
  %cmp3 = icmp eq i64 %call2, 81535
  br i1 %cmp3, label %lor.lhs.false4, label %if.then

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %arraydecay5 = bitcast i32* %yw to i16*
  %call6 = call signext i16 @yb(i16* %arraydecay5)
  %cmp7 = icmp eq i16 %call6, 16255
  br i1 %cmp7, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"short", metadata !1}
