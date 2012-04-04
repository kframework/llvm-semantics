; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr44202-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @add512(i32 %a, i32* nocapture %b) nounwind uwtable noinline {
entry:
  %add = add nsw i32 %a, 512
  %cmp = icmp eq i32 %add, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i32 %a, i32* %b, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret i32 %add
}

define i32 @add513(i32 %a, i32* nocapture %b) nounwind uwtable noinline {
entry:
  %add = add nsw i32 %a, 513
  %cmp = icmp eq i32 %add, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 %a, i32* %b, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 %add
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %b0 = alloca i32, align 4
  %b1 = alloca i32, align 4
  store i32 -1, i32* %b0, align 4, !tbaa !0
  store i32 -1, i32* %b1, align 4, !tbaa !0
  %call = call i32 @add512(i32 -512, i32* %b0)
  %cmp = icmp ne i32 %call, 0
  %0 = load i32* %b0, align 4, !tbaa !0
  %cmp1 = icmp ne i32 %0, -1
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %entry
  %call3 = call i32 @add513(i32 -513, i32* %b1)
  %cmp4 = icmp ne i32 %call3, 0
  %1 = load i32* %b1, align 4, !tbaa !0
  %cmp6 = icmp ne i32 %1, -513
  %or.cond7 = or i1 %cmp4, %cmp6
  br i1 %or.cond7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
