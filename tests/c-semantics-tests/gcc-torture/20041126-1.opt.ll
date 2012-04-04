; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041126-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [10 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10], align 16

define void @check(i32* nocapture %p) nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv16 to i32
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %for.body, label %for.cond1

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32* %p, i64 %indvars.iv16
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %tobool = icmp eq i32 %1, 0
  %indvars.iv.next17 = add i64 %indvars.iv16, 1
  br i1 %tobool, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.cond1:                                        ; preds = %for.cond, %for.body3
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.body3 ], [ %indvars.iv16, %for.cond ]
  %2 = trunc i64 %indvars.iv13 to i32
  %cmp2 = icmp slt i32 %2, 10
  br i1 %cmp2, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds i32* %p, i64 %indvars.iv13
  %3 = load i32* %arrayidx5, align 4, !tbaa !0
  %indvars.iv.next14 = add i64 %indvars.iv13, 1
  %4 = trunc i64 %indvars.iv.next14 to i32
  %cmp6 = icmp eq i32 %3, %4
  br i1 %cmp6, label %for.cond1, label %if.then7

if.then7:                                         ; preds = %for.body3
  tail call void @abort() noreturn nounwind
  unreachable

for.end11:                                        ; preds = %for.cond1
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %a = alloca [10 x i32], align 16
  %0 = bitcast [10 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([10 x i32]* @main.a to i8*), i64 40, i32 16, i1 false)
  %1 = bitcast [10 x i32]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 20, i32 16, i1 false)
  br label %for.cond.i

for.cond.i:                                       ; preds = %entry, %for.body.i
  %indvars.iv16.i = phi i64 [ %indvars.iv.next17.i, %for.body.i ], [ 0, %entry ]
  %2 = trunc i64 %indvars.iv16.i to i32
  %cmp.i = icmp slt i32 %2, 5
  br i1 %cmp.i, label %for.body.i, label %for.cond1.i

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds [10 x i32]* %a, i64 0, i64 %indvars.iv16.i
  %3 = load i32* %arrayidx.i, align 4, !tbaa !0
  %tobool.i = icmp eq i32 %3, 0
  %indvars.iv.next17.i = add i64 %indvars.iv16.i, 1
  br i1 %tobool.i, label %for.cond.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  call void @abort() noreturn nounwind
  unreachable

for.cond1.i:                                      ; preds = %for.cond.i, %for.body3.i
  %indvars.iv13.i = phi i64 [ %indvars.iv.next14.i, %for.body3.i ], [ %indvars.iv16.i, %for.cond.i ]
  %4 = trunc i64 %indvars.iv13.i to i32
  %cmp2.i = icmp slt i32 %4, 10
  br i1 %cmp2.i, label %for.body3.i, label %check.exit

for.body3.i:                                      ; preds = %for.cond1.i
  %arrayidx5.i = getelementptr inbounds [10 x i32]* %a, i64 0, i64 %indvars.iv13.i
  %5 = load i32* %arrayidx5.i, align 4, !tbaa !0
  %indvars.iv.next14.i = add i64 %indvars.iv13.i, 1
  %6 = trunc i64 %indvars.iv.next14.i to i32
  %cmp6.i = icmp eq i32 %5, %6
  br i1 %cmp6.i, label %for.cond1.i, label %if.then7.i

if.then7.i:                                       ; preds = %for.body3.i
  call void @abort() noreturn nounwind
  unreachable

check.exit:                                       ; preds = %for.cond1.i
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
