; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr32500.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4
@main.numbers = private unnamed_addr constant [4 x i32] [i32 57005, i32 48879, i32 4919, i32 16962], align 16

define void @foo(i32 %i) nounwind uwtable noinline {
entry:
  store i32 %i, i32* @x, align 4, !tbaa !0
  ret void
}

define void @bar() noreturn nounwind uwtable noinline {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 1, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 13
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %cmp1 = icmp slt i32 %0, 5
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %1 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds [4 x i32]* @main.numbers, i64 0, i64 %1
  %2 = load i32* %arrayidx, align 4, !tbaa !0
  tail call void @foo(i32 %2)
  br label %for.inc

if.else:                                          ; preds = %for.body
  %3 = add i64 %indvars.iv, 4294967289
  %4 = trunc i64 %3 to i32
  %5 = icmp ult i32 %4, 3
  br i1 %5, label %if.then4, label %for.inc

if.then4:                                         ; preds = %if.else
  tail call void @bar()
  unreachable

for.inc:                                          ; preds = %if.then, %if.else
  %indvars.iv.next = add i64 %indvars.iv, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
