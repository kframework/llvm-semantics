; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20466-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32** nocapture %ipp, i32* nocapture %i1p, i32* %i2p, i32** nocapture %i3, i32** nocapture %i4) nounwind uwtable noinline {
entry:
  %0 = load i32* %i1p, align 4, !tbaa !0
  %1 = load i32** %ipp, align 8, !tbaa !3
  store i32 %0, i32* %1, align 4, !tbaa !0
  store i32* %i2p, i32** %ipp, align 8, !tbaa !3
  %2 = load i32** %i4, align 8, !tbaa !3
  store i32* %2, i32** %i3, align 8, !tbaa !3
  %3 = load i32** %ipp, align 8, !tbaa !3
  store i32 99, i32* %3, align 4, !tbaa !0
  ret i32 3
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i4 = alloca i32, align 4
  %ip = alloca i32*, align 8
  %i3p = alloca i32*, align 8
  %i4p = alloca i32*, align 8
  store i32 42, i32* %i, align 4, !tbaa !0
  store i32 66, i32* %i1, align 4, !tbaa !0
  store i32 1, i32* %i2, align 4, !tbaa !0
  store i32 -1, i32* %i3, align 4, !tbaa !0
  store i32 55, i32* %i4, align 4, !tbaa !0
  store i32* %i, i32** %ip, align 8, !tbaa !3
  store i32* %i3, i32** %i3p, align 8, !tbaa !3
  store i32* %i4, i32** %i4p, align 8, !tbaa !3
  %call = call i32 @f(i32** %ip, i32* %i1, i32* %i2, i32** %i3p, i32** %i4p)
  %0 = load i32* %i, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 66
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32** %ip, align 8, !tbaa !3
  %cmp1 = icmp ne i32* %1, %i2
  %2 = load i32* %i2, align 4, !tbaa !0
  %cmp3 = icmp ne i32 %2, 99
  %or.cond = or i1 %cmp1, %cmp3
  br i1 %or.cond, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %3 = load i32* %i3, align 4, !tbaa !0
  %cmp5 = icmp eq i32 %3, -1
  br i1 %cmp5, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %4 = load i32** %i3p, align 8, !tbaa !3
  %5 = load i32** %i4p, align 8, !tbaa !3
  %cmp7 = icmp eq i32* %4, %5
  br i1 %cmp7, label %lor.lhs.false8, label %if.then

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %6 = load i32* %i4, align 4, !tbaa !0
  %cmp9 = icmp eq i32 %6, 55
  br i1 %cmp9, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %entry, %lor.lhs.false
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false8
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
