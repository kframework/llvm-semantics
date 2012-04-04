; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010409-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.B = type { %struct.A**, i32 }
%struct.A = type { i32, i32 }

@b = global i32 1, align 4
@c = common global i32 0, align 4
@d = common global [1 x %struct.B] zeroinitializer, align 16
@a = common global %struct.A* null, align 8

define void @foo(%struct.A* nocapture %x, i8* nocapture %y, i32 %z) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i8* %y, i64 4
  %0 = load i8* %arrayidx, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  %mul = mul nsw i32 %z, 25
  %add = add nsw i32 %conv, %mul
  store i32 %add, i32* @c, align 4, !tbaa !2
  ret void
}

define noalias %struct.A* @bar(i8* nocapture %v, i32 %w, i32 %x, i8* nocapture %y, i32 %z) noreturn nounwind uwtable {
entry:
  %tobool = icmp eq i32 %w, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define void @test(i8* nocapture %x, i32* nocapture %y) nounwind uwtable {
entry:
  store i32 5000, i32* @c, align 4, !tbaa !2
  %0 = load i32* @b, align 4, !tbaa !2
  %tobool = icmp ne i32 %0, 0
  %cond = select i1 %tobool, i32 0, i32 65536
  %call1 = tail call %struct.A* @bar(i8* undef, i32 %cond, i32 undef, i8* undef, i32 undef)
  unreachable
}

define i32 @main() nounwind uwtable {
entry:
  store i32 0, i32* getelementptr inbounds ([1 x %struct.B]* @d, i64 0, i64 0, i32 1), align 8, !tbaa !2
  store %struct.A** @a, %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i64 0, i64 0, i32 0), align 16, !tbaa !3
  store i32 5000, i32* @c, align 4, !tbaa !2
  %0 = load i32* @b, align 4, !tbaa !2
  %tobool.i = icmp ne i32 %0, 0
  %cond.i = select i1 %tobool.i, i32 0, i32 65536
  %call1.i = tail call %struct.A* @bar(i8* undef, i32 %cond.i, i32 undef, i8* undef, i32 undef) nounwind
  unreachable
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"any pointer", metadata !0}
