; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030916-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i32* nocapture %x) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i32* %x, i64 248
  %0 = bitcast i32* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 32, i32 4, i1 false)
  %1 = bitcast i32* %arrayidx to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 32, i32 4, i1 false)
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %x = alloca [256 x i32], align 16
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.body ]
  %arrayidx = getelementptr inbounds [256 x i32]* %x, i64 0, i64 %indvars.iv14
  store i32 1, i32* %arrayidx, align 4, !tbaa !0
  %indvars.iv.next15 = add i64 %indvars.iv14, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next15 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 256
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %arrayidx.i = getelementptr inbounds [256 x i32]* %x, i64 0, i64 248
  %0 = bitcast [256 x i32]* %x to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 32, i32 16, i1 false) nounwind
  %1 = bitcast i32* %arrayidx.i to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 32, i32 16, i1 false) nounwind
  br label %for.cond1

for.cond1:                                        ; preds = %for.body3, %for.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ 0, %for.end ]
  %2 = trunc i64 %indvars.iv to i32
  %cmp2 = icmp slt i32 %2, 256
  br i1 %cmp2, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds [256 x i32]* %x, i64 0, i64 %indvars.iv
  %3 = load i32* %arrayidx5, align 4, !tbaa !0
  %4 = add i64 %indvars.iv, 4294967288
  %5 = trunc i64 %4 to i32
  %6 = icmp ult i32 %5, 240
  %land.ext = zext i1 %6 to i32
  %cmp8 = icmp eq i32 %3, %land.ext
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp8, label %for.cond1, label %if.then

if.then:                                          ; preds = %for.body3
  call void @abort() noreturn nounwind
  unreachable

for.end11:                                        ; preds = %for.cond1
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
