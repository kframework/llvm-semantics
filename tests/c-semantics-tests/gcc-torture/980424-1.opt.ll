; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980424-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@a = common global [99 x i32] zeroinitializer, align 16

define void @f(i32 %one) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %one, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @g() nounwind uwtable {
entry:
  %0 = load i32* @i, align 4, !tbaa !0
  %and = and i32 %0, 63
  %idxprom1 = zext i32 %and to i64
  %arrayidx = getelementptr inbounds [99 x i32]* @a, i64 0, i64 %idxprom1
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %cmp.i = icmp eq i32 %1, 1
  br i1 %cmp.i, label %f.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f.exit:                                           ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
g.exit:
  store i32 1, i32* getelementptr inbounds ([99 x i32]* @a, i64 0, i64 0), align 16, !tbaa !0
  store i32 64, i32* @i, align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
