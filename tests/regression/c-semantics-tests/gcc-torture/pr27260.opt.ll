; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27260.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buf = common global [65 x i8] zeroinitializer, align 16

define void @foo(i32 %x) nounwind uwtable {
entry:
  %cmp = icmp ne i32 %x, 2
  %0 = zext i1 %cmp to i8
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 0), i8 %0, i64 64, i32 16, i1 false)
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i8 2, i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 64), align 16, !tbaa !0
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv38 to i32
  %cmp = icmp slt i32 %0, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [65 x i8]* @buf, i64 0, i64 %indvars.iv38
  %1 = load i8* %arrayidx, align 1, !tbaa !0
  %cmp1 = icmp eq i8 %1, 0
  %indvars.iv.next39 = add i64 %indvars.iv38, 1
  br i1 %cmp1, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 0), i8 1, i64 64, i32 16, i1 false) nounwind
  br label %for.cond3

for.cond3:                                        ; preds = %for.body6, %for.end
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.body6 ], [ 0, %for.end ]
  %2 = trunc i64 %indvars.iv36 to i32
  %cmp4 = icmp slt i32 %2, 64
  br i1 %cmp4, label %for.body6, label %for.end16

for.body6:                                        ; preds = %for.cond3
  %arrayidx8 = getelementptr inbounds [65 x i8]* @buf, i64 0, i64 %indvars.iv36
  %3 = load i8* %arrayidx8, align 1, !tbaa !0
  %cmp10 = icmp eq i8 %3, 1
  %indvars.iv.next37 = add i64 %indvars.iv36, 1
  br i1 %cmp10, label %for.cond3, label %if.then12

if.then12:                                        ; preds = %for.body6
  tail call void @abort() noreturn nounwind
  unreachable

for.end16:                                        ; preds = %for.cond3
  tail call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i64 0, i64 0), i8 0, i64 64, i32 16, i1 false) nounwind
  br label %for.cond17

for.cond17:                                       ; preds = %for.body20, %for.end16
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body20 ], [ 0, %for.end16 ]
  %4 = trunc i64 %indvars.iv to i32
  %cmp18 = icmp slt i32 %4, 64
  br i1 %cmp18, label %for.body20, label %if.end35

for.body20:                                       ; preds = %for.cond17
  %arrayidx22 = getelementptr inbounds [65 x i8]* @buf, i64 0, i64 %indvars.iv
  %5 = load i8* %arrayidx22, align 1, !tbaa !0
  %cmp24 = icmp eq i8 %5, 0
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp24, label %for.cond17, label %if.then26

if.then26:                                        ; preds = %for.body20
  tail call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %for.cond17
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
