; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000706-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@c = common global i32* null, align 8

define void @bar(i32 %b) nounwind uwtable {
entry:
  %0 = load i32** @c, align 8, !tbaa !0
  %1 = load i32* %0, align 4, !tbaa !3
  %cmp = icmp eq i32 %1, 1
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define void @foo(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4, !tbaa !3
  store i32* %a.addr, i32** @c, align 8, !tbaa !0
  %cmp.i = icmp eq i32 %a, 1
  %cmp1.i = icmp eq i32 %b, 2
  %or.cond.i = and i1 %cmp.i, %cmp1.i
  br i1 %or.cond.i, label %bar.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

bar.exit:                                         ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %a.addr.i = alloca i32, align 4
  %0 = bitcast i32* %a.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  store i32 1, i32* %a.addr.i, align 4, !tbaa !3
  store i32* %a.addr.i, i32** @c, align 8, !tbaa !0
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
