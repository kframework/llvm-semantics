; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20071219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { [25 x i8] }

@p = common global %struct.S* null, align 8

define void @foo(%struct.S* %x, i32 %set) nounwind uwtable noinline {
entry:
  %tobool = icmp eq i32 %set, 0
  %conv6 = trunc i32 %set to i8
  br i1 %tobool, label %for.cond.us, label %for.cond

for.cond.us:                                      ; preds = %entry, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp.us = icmp ult i32 %0, 25
  br i1 %cmp.us, label %for.body.us, label %for.end

for.inc.us:                                       ; preds = %for.body.us
  %indvars.iv.next = add i64 %indvars.iv, 1
  br label %for.cond.us

for.body.us:                                      ; preds = %for.cond.us
  %arrayidx.us = getelementptr inbounds %struct.S* %x, i64 0, i32 0, i64 %indvars.iv
  %1 = load i8* %arrayidx.us, align 1, !tbaa !0
  %cmp3.us = icmp eq i8 %1, 0
  br i1 %cmp3.us, label %for.inc.us, label %if.then

for.cond:                                         ; preds = %entry, %for.inc
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc ], [ 0, %entry ]
  %2 = trunc i64 %indvars.iv11 to i32
  %cmp = icmp ult i32 %2, 25
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds %struct.S* %x, i64 0, i32 0, i64 %indvars.iv11
  %3 = load i8* %arrayidx, align 1, !tbaa !0
  %cmp3 = icmp eq i8 %3, 0
  br i1 %cmp3, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body, %for.body.us
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %for.body
  store i8 %conv6, i8* %arrayidx, align 1, !tbaa !0
  %indvars.iv.next12 = add i64 %indvars.iv11, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond, %for.cond.us
  store %struct.S* %x, %struct.S** @p, align 8, !tbaa !2
  ret void
}

declare void @abort() noreturn nounwind

define void @test1() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %0 = getelementptr inbounds %struct.S* %a, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %1 = getelementptr inbounds %struct.S* %b, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define void @test2() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %0 = getelementptr inbounds %struct.S* %a, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %1 = getelementptr inbounds %struct.S* %b, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %0, i64 25, i32 1, i1 false)
  %2 = load %struct.S** @p, align 8, !tbaa !2
  %3 = getelementptr inbounds %struct.S* %2, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %3, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

define void @test3() nounwind uwtable noinline {
entry:
  %a = alloca %struct.S, align 1
  %b = alloca %struct.S, align 1
  %0 = getelementptr inbounds %struct.S* %a, i64 0, i32 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %a, i32 0)
  %1 = getelementptr inbounds %struct.S* %b, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %0, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 1)
  %2 = load %struct.S** @p, align 8, !tbaa !2
  %3 = getelementptr inbounds %struct.S* %2, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %0, i64 25, i32 1, i1 false)
  %4 = load %struct.S** @p, align 8, !tbaa !2
  %5 = getelementptr inbounds %struct.S* %4, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %1, i64 25, i32 1, i1 false)
  call void @foo(%struct.S* %b, i32 0)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @test1()
  tail call void @test2()
  tail call void @test3()
  ret i32 0
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"any pointer", metadata !0}
