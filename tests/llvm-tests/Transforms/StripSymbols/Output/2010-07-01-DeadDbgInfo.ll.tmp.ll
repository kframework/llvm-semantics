; ModuleID = '<stdin>'

@xyz = global i32 2

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @fn() nounwind readnone ssp {
entry:
  ret i32 0, !dbg !11
}

define i32 @foo(i32 %i) nounwind readonly ssp {
entry:
  tail call void @llvm.dbg.value(metadata !{i32 %i}, i64 0, metadata !0), !dbg !13
  %.0 = load i32* @xyz, align 4
  ret i32 %.0, !dbg !14
}

!llvm.dbg.lv.foo = !{!0}
!llvm.dbg.gv = !{!7}
!llvm.dbg.sp = !{!8, !1}

!0 = metadata !{i32 524545, metadata !1, metadata !"i", metadata !2, i32 7, metadata !6}
!1 = metadata !{i32 524334, i32 0, metadata !2, metadata !"foo", metadata !"foo", metadata !"foo", metadata !2, i32 7, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 (i32)* @foo}
!2 = metadata !{i32 524329, metadata !"g.c", metadata !"/tmp/", metadata !3}
!3 = metadata !{i32 524305, i32 0, i32 1, metadata !"g.c", metadata !"/tmp/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0}
!4 = metadata !{i32 524309, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null}
!5 = metadata !{metadata !6, metadata !6}
!6 = metadata !{i32 524324, metadata !2, metadata !"int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5}
!7 = metadata !{i32 524340, i32 0, metadata !2, metadata !"xyz", metadata !"xyz", metadata !"", metadata !2, i32 3, metadata !6, i1 false, i1 true, i32* @xyz}
!8 = metadata !{i32 524334, i32 0, metadata !2, metadata !"fn", metadata !"fn", metadata !"fn", metadata !2, i32 6, metadata !9, i1 false, i1 true, i32 0, i32 0, null, i1 false, i1 true, i32 ()* @fn}
!9 = metadata !{i32 524309, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !10, i32 0, null}
!10 = metadata !{metadata !6}
!11 = metadata !{i32 6, i32 0, metadata !12, null}
!12 = metadata !{i32 524299, metadata !8, i32 6, i32 0}
!13 = metadata !{i32 7, i32 0, metadata !1, null}
!14 = metadata !{i32 10, i32 0, metadata !15, null}
!15 = metadata !{i32 524299, metadata !1, i32 7, i32 0}
