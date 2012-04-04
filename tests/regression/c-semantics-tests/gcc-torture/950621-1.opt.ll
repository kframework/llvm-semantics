; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950621-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32, i32, %struct.s* }

define i32 @f(%struct.s* %sp) nounwind uwtable readonly {
entry:
  %tobool = icmp eq %struct.s* %sp, null
  br i1 %tobool, label %land.end, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %a = getelementptr inbounds %struct.s* %sp, i64 0, i32 0
  %0 = load i32* %a, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %b = getelementptr inbounds %struct.s* %sp, i64 0, i32 1
  %1 = load i32* %b, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %1, -1
  br label %land.end

land.end:                                         ; preds = %entry, %land.rhs, %land.lhs.true
  %2 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

define i32 @main() noreturn nounwind uwtable {
f.exit:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
