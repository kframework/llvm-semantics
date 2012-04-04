; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001124-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.super_block = type { i32, i8, i32 }
%struct.inode = type { i64, %struct.super_block* }
%struct.file = type { i64 }

@s = common global %struct.super_block zeroinitializer, align 4
@i = common global %struct.inode zeroinitializer, align 8
@f = common global %struct.file zeroinitializer, align 8

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
if.end.i.i:
  store i32 512, i32* getelementptr inbounds (%struct.super_block* @s, i64 0, i32 0), align 4, !tbaa !0
  store i8 9, i8* getelementptr inbounds (%struct.super_block* @s, i64 0, i32 1), align 4, !tbaa !1
  store i64 2048, i64* getelementptr inbounds (%struct.inode* @i, i64 0, i32 0), align 8, !tbaa !3
  store %struct.super_block* @s, %struct.super_block** getelementptr inbounds (%struct.inode* @i, i64 0, i32 1), align 8, !tbaa !4
  store i64 0, i64* getelementptr inbounds (%struct.file* @f, i64 0, i32 0), align 8, !tbaa !3
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"long long", metadata !1}
!4 = metadata !{metadata !"any pointer", metadata !1}
