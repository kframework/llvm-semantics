; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921013-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [4 x float] [float 5.000000e+00, float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], align 16
@main.b = private unnamed_addr constant [4 x float] [float 2.000000e+00, float 4.000000e+00, float 3.000000e+00, float 0.000000e+00], align 16

define void @f(i32* nocapture %d, float* nocapture %x, float* nocapture %y, i32 %n) nounwind uwtable {
entry:
  %tobool3 = icmp eq i32 %n, 0
  br i1 %tobool3, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %d.addr.07 = phi i32* [ %incdec.ptr2, %while.body ], [ %d, %entry ]
  %x.addr.06 = phi float* [ %incdec.ptr, %while.body ], [ %x, %entry ]
  %y.addr.05 = phi float* [ %incdec.ptr1, %while.body ], [ %y, %entry ]
  %n.addr.04 = phi i32 [ %dec, %while.body ], [ %n, %entry ]
  %dec = add nsw i32 %n.addr.04, -1
  %incdec.ptr = getelementptr inbounds float* %x.addr.06, i64 1
  %0 = load float* %x.addr.06, align 4, !tbaa !0
  %incdec.ptr1 = getelementptr inbounds float* %y.addr.05, i64 1
  %1 = load float* %y.addr.05, align 4, !tbaa !0
  %cmp = fcmp oeq float %0, %1
  %conv = zext i1 %cmp to i32
  %incdec.ptr2 = getelementptr inbounds i32* %d.addr.07, i64 1
  store i32 %conv, i32* %d.addr.07, align 4, !tbaa !3
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %r = alloca [4 x i32], align 16
  %a = alloca [4 x float], align 16
  %b = alloca [4 x float], align 16
  %0 = bitcast [4 x float]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x float]* @main.a to i8*), i64 16, i32 16, i1 false)
  %1 = bitcast [4 x float]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x float]* @main.b to i8*), i64 16, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [4 x i32]* %r, i64 0, i64 0
  %incdec.ptr2.i = getelementptr inbounds [4 x i32]* %r, i64 0, i64 1
  store i32 0, i32* %arraydecay, align 16, !tbaa !3
  %incdec.ptr2.i.1 = getelementptr inbounds [4 x i32]* %r, i64 0, i64 2
  store i32 0, i32* %incdec.ptr2.i, align 4, !tbaa !3
  %incdec.ptr2.i.2 = getelementptr inbounds [4 x i32]* %r, i64 0, i64 3
  store i32 1, i32* %incdec.ptr2.i.1, align 8, !tbaa !3
  store i32 0, i32* %incdec.ptr2.i.2, align 4, !tbaa !3
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %2 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %2, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [4 x float]* %a, i64 0, i64 %indvars.iv
  %3 = load float* %arrayidx, align 4, !tbaa !0
  %arrayidx4 = getelementptr inbounds [4 x float]* %b, i64 0, i64 %indvars.iv
  %4 = load float* %arrayidx4, align 4, !tbaa !0
  %cmp5 = fcmp oeq float %3, %4
  %conv = zext i1 %cmp5 to i32
  %arrayidx7 = getelementptr inbounds [4 x i32]* %r, i64 0, i64 %indvars.iv
  %5 = load i32* %arrayidx7, align 4, !tbaa !3
  %cmp8 = icmp eq i32 %conv, %5
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp8, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
