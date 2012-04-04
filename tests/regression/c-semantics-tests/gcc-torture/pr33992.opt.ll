; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr33992.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @bar(i64 %i) nounwind uwtable noinline {
entry:
  %tobool = icmp eq i64 %i, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @foo(i64* nocapture %r) nounwind uwtable alwaysinline {
entry:
  %0 = load i64* %r, align 8, !tbaa !0
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond ], [ 0, %entry ]
  %i.0 = phi i32 [ %inc, %for.cond ], [ 0, %entry ]
  %sub = sub i64 63, %indvars.iv
  %sh_prom = and i64 %sub, 4294967295
  %shl = shl i64 1, %sh_prom
  %and = and i64 %shl, %0
  %tobool = icmp eq i64 %and, 0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %inc = add nsw i32 %i.0, 1
  br i1 %tobool, label %for.cond, label %for.end

for.end:                                          ; preds = %for.cond
  %conv = sext i32 %i.0 to i64
  tail call void @bar(i64 %conv)
  ret void
}

define void @do_test(i64* nocapture %r) nounwind uwtable noinline {
entry:
  %0 = load i64* %r, align 8, !tbaa !0
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.cond.i, %entry
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.cond.i ], [ 0, %entry ]
  %i.0.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %entry ]
  %sub.i = sub i64 63, %indvars.iv.i
  %sh_prom.i = and i64 %sub.i, 4294967295
  %shl.i = shl i64 1, %sh_prom.i
  %and.i = and i64 %shl.i, %0
  %tobool.i = icmp eq i64 %and.i, 0
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  %inc.i = add nsw i32 %i.0.i, 1
  br i1 %tobool.i, label %for.cond.i, label %foo.exit

foo.exit:                                         ; preds = %for.cond.i
  %conv.i = sext i32 %i.0.i to i64
  tail call void @bar(i64 %conv.i) nounwind
  %1 = load i64* %r, align 8, !tbaa !0
  br label %for.cond.i.1

for.cond.i.1:                                     ; preds = %for.cond.i.1, %foo.exit
  %indvars.iv.i.1 = phi i64 [ %indvars.iv.next.i.1, %for.cond.i.1 ], [ 0, %foo.exit ]
  %i.0.i.1 = phi i32 [ %inc.i.1, %for.cond.i.1 ], [ 0, %foo.exit ]
  %sub.i.1 = sub i64 63, %indvars.iv.i.1
  %sh_prom.i.1 = and i64 %sub.i.1, 4294967295
  %shl.i.1 = shl i64 1, %sh_prom.i.1
  %and.i.1 = and i64 %shl.i.1, %1
  %tobool.i.1 = icmp eq i64 %and.i.1, 0
  %indvars.iv.next.i.1 = add i64 %indvars.iv.i.1, 1
  %inc.i.1 = add nsw i32 %i.0.i.1, 1
  br i1 %tobool.i.1, label %for.cond.i.1, label %foo.exit.1

foo.exit.1:                                       ; preds = %for.cond.i.1
  %conv.i.1 = sext i32 %i.0.i.1 to i64
  tail call void @bar(i64 %conv.i.1) nounwind
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %r = alloca i64, align 8
  store i64 -9223372036854775807, i64* %r, align 8, !tbaa !0
  call void @do_test(i64* %r)
  ret i32 0
}

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
