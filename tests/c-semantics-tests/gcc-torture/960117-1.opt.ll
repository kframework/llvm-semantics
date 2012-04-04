; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.T_VALS = type <{ i8* }>

@curval = global { i16, %union.T_VALS } zeroinitializer, align 2
@id_space = internal global [2 x [33 x i8]] zeroinitializer, align 16

define zeroext i16 @get_id(i8 signext %c) nounwind uwtable {
entry:
  %0 = load i8** getelementptr inbounds ({ i16, %union.T_VALS }* @curval, i64 0, i32 1, i32 0), align 2, !tbaa !0
  store i8 %c, i8* %0, align 1, !tbaa !1
  ret i16 0
}

define zeroext i16 @get_tok() nounwind uwtable {
entry:
  store i8* getelementptr inbounds ([2 x [33 x i8]]* @id_space, i64 0, i64 0, i64 0), i8** getelementptr inbounds ({ i16, %union.T_VALS }* @curval, i64 0, i32 1, i32 0), align 2, !tbaa !0
  store i16 0, i16* getelementptr inbounds ({ i16, %union.T_VALS }* @curval, i64 0, i32 0), align 2, !tbaa !3
  store i8 99, i8* getelementptr inbounds ([2 x [33 x i8]]* @id_space, i64 0, i64 0, i64 0), align 16, !tbaa !1
  ret i16 0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i8* getelementptr inbounds ([2 x [33 x i8]]* @id_space, i64 0, i64 0, i64 0), i8** getelementptr inbounds ({ i16, %union.T_VALS }* @curval, i64 0, i32 1, i32 0), align 2, !tbaa !0
  store i16 0, i16* getelementptr inbounds ({ i16, %union.T_VALS }* @curval, i64 0, i32 0), align 2, !tbaa !3
  store i8 99, i8* getelementptr inbounds ([2 x [33 x i8]]* @id_space, i64 0, i64 0, i64 0), align 16, !tbaa !1
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"short", metadata !1}
