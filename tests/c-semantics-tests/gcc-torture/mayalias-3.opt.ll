; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/mayalias-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.test = type { i16 }

@p = common global %struct.test* null, align 8

define i32 @g(i32* %a) nounwind uwtable {
entry:
  %0 = bitcast i32* %a to %struct.test*
  store %struct.test* %0, %struct.test** @p, align 8, !tbaa !0
  ret i32 0
}

define i32 @f() nounwind uwtable {
entry:
  %a = alloca i32, align 4
  %0 = bitcast i32* %a to %struct.test*
  store %struct.test* %0, %struct.test** @p, align 8, !tbaa !0
  store i32 10, i32* %a, align 4, !tbaa !3
  %1 = bitcast i32* %a to i16*
  store i16 1, i16* %1, align 4
  %2 = load i32* %a, align 4, !tbaa !3
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %a.i = alloca i32, align 4
  %0 = bitcast i32* %a.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = bitcast i32* %a.i to %struct.test*
  store %struct.test* %1, %struct.test** @p, align 8, !tbaa !0
  store i32 10, i32* %a.i, align 4, !tbaa !3
  %2 = bitcast i32* %a.i to i16*
  store i16 1, i16* %2, align 4
  %3 = load i32* %a.i, align 4, !tbaa !3
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %cmp = icmp eq i32 %3, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
