; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr35472.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [16 x i32] }

@p = common global %struct.S* null, align 8

define void @foo(%struct.S* nocapture %a, %struct.S* %b) nounwind uwtable noinline {
entry:
  %arrayidx = getelementptr inbounds %struct.S* %a, i64 0, i32 0, i64 0
  store i32 -1, i32* %arrayidx, align 4, !tbaa !0
  store %struct.S* %b, %struct.S** @p, align 8, !tbaa !3
  ret void
}

define void @test() nounwind uwtable {
entry:
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %0 = bitcast %struct.S* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 64, i32 4, i1 false)
  %arrayidx2 = getelementptr inbounds %struct.S* %b, i64 0, i32 0, i64 0
  %1 = bitcast %struct.S* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 64, i32 4, i1 false)
  call void @foo(%struct.S* %a, %struct.S* %b)
  %2 = load %struct.S** @p, align 8, !tbaa !3
  %3 = bitcast %struct.S* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %0, i64 64, i32 4, i1 false)
  %4 = load %struct.S** @p, align 8, !tbaa !3
  %5 = bitcast %struct.S* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %1, i64 64, i32 4, i1 false)
  %6 = load i32* %arrayidx2, align 4, !tbaa !0
  %cmp = icmp eq i32 %6, -1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %a.i = alloca %struct.S, align 4
  %b.i = alloca %struct.S, align 4
  %0 = bitcast %struct.S* %a.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast %struct.S* %b.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 64, i32 4, i1 false) nounwind
  %arrayidx2.i = getelementptr inbounds %struct.S* %b.i, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 64, i32 4, i1 false) nounwind
  call void @foo(%struct.S* %a.i, %struct.S* %b.i) nounwind
  %2 = load %struct.S** @p, align 8, !tbaa !3
  %3 = bitcast %struct.S* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %0, i64 64, i32 4, i1 false) nounwind
  %4 = load %struct.S** @p, align 8, !tbaa !3
  %5 = bitcast %struct.S* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %1, i64 64, i32 4, i1 false) nounwind
  %6 = load i32* %arrayidx2.i, align 4, !tbaa !0
  %cmp.i = icmp eq i32 %6, -1
  br i1 %cmp.i, label %test.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

test.exit:                                        ; preds = %entry
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
