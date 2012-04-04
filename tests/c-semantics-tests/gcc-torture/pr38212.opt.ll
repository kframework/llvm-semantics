; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr38212.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32* noalias nocapture %p, i32 %i) nounwind uwtable noinline {
entry:
  %idx.ext = sext i32 %i to i64
  %add.ptr.sum = sub i64 1, %idx.ext
  %add.ptr1 = getelementptr inbounds i32* %p, i64 %add.ptr.sum
  %0 = load i32* %add.ptr1, align 4, !tbaa !0
  store i32 1, i32* %p, align 4, !tbaa !0
  %1 = load i32* %add.ptr1, align 4, !tbaa !0
  %add = add nsw i32 %1, %0
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4, !tbaa !0
  %call = call i32 @foo(i32* %i, i32 1)
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
