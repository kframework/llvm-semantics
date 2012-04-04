; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pta-field-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Foo = type { i32*, i32* }

define void @bar(i32** nocapture %x) nounwind uwtable noinline {
entry:
  %0 = getelementptr inbounds i32** %x, i64 1
  %1 = load i32** %0, align 8, !tbaa !0
  store i32 0, i32* %1, align 4, !tbaa !3
  ret void
}

define i32 @foo() nounwind uwtable {
entry:
  %f = alloca %struct.Foo, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %i, align 4, !tbaa !3
  store i32 2, i32* %j, align 4, !tbaa !3
  %p = getelementptr inbounds %struct.Foo* %f, i64 0, i32 0
  store i32* %i, i32** %p, align 8, !tbaa !0
  %q = getelementptr inbounds %struct.Foo* %f, i64 0, i32 1
  store i32* %j, i32** %q, align 8, !tbaa !0
  call void @bar(i32** %p)
  %0 = load i32* %j, align 4, !tbaa !3
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %f.i = alloca %struct.Foo, align 8
  %i.i = alloca i32, align 4
  %j.i = alloca i32, align 4
  %0 = bitcast %struct.Foo* %f.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %2 = bitcast i32* %j.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2) nounwind
  store i32 1, i32* %i.i, align 4, !tbaa !3
  store i32 2, i32* %j.i, align 4, !tbaa !3
  %p.i = getelementptr inbounds %struct.Foo* %f.i, i64 0, i32 0
  store i32* %i.i, i32** %p.i, align 8, !tbaa !0
  %q.i = getelementptr inbounds %struct.Foo* %f.i, i64 0, i32 1
  store i32* %j.i, i32** %q.i, align 8, !tbaa !0
  call void @bar(i32** %p.i) nounwind
  %3 = load i32* %j.i, align 4, !tbaa !3
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %2) nounwind
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.end, label %if.then

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
