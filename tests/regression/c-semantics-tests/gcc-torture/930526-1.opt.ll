; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930526-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
entry:
  %p.i = alloca [25 x i32*], align 16
  %m.i = alloca [175 x i32], align 16
  %0 = bitcast [25 x i32*]* %p.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = bitcast [175 x i32]* %m.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1)
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.body.i ]
  %sext = mul i64 %indvars.iv.i, 30064771072
  %idx.ext.i = ashr exact i64 %sext, 32
  %add.ptr.i = getelementptr inbounds [175 x i32]* %m.i, i64 0, i64 %idx.ext.i
  %arrayidx.i = getelementptr inbounds [25 x i32*]* %p.i, i64 0, i64 %indvars.iv.i
  store i32* %add.ptr.i, i32** %arrayidx.i, align 8, !tbaa !0
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 25
  br i1 %exitcond, label %f.exit, label %for.body.i

f.exit:                                           ; preds = %for.body.i
  %arrayidx1.i = getelementptr inbounds [25 x i32*]* %p.i, i64 0, i64 1
  %2 = load i32** %arrayidx1.i, align 8, !tbaa !0
  store i32 0, i32* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %1)
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
