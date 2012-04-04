; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060905-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@s = common global [256 x [3 x i8]] zeroinitializer, align 16
@g = common global i8 0, align 1

define i32 @main() nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %entry
  %indvars.iv.i = phi i64 [ 0, %entry ], [ %indvars.iv.next.i, %for.inc.i ]
  %j.05.i = phi i32 [ 0, %entry ], [ %j.1.i, %for.inc.i ]
  %0 = add i64 %indvars.iv.i, -128
  %1 = trunc i64 %0 to i32
  %2 = icmp ult i32 %1, 128
  br i1 %2, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.i
  %arrayidx3.i = getelementptr inbounds [256 x [3 x i8]]* @s, i64 0, i64 %0, i64 0
  %3 = load volatile i8* %arrayidx3.i, align 1, !tbaa !0
  store i8 %3, i8* @g, align 1, !tbaa !0
  %inc.i = add nsw i32 %j.05.i, 1
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %j.1.i = phi i32 [ %inc.i, %if.then.i ], [ %j.05.i, %for.body.i ]
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next.i to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 256
  br i1 %exitcond, label %foo.exit, label %for.body.i

foo.exit:                                         ; preds = %for.inc.i
  %cmp = icmp eq i32 %j.1.i, 128
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %foo.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo.exit
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
