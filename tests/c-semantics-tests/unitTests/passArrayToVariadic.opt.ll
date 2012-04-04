; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passArrayToVariadic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@code = common global [5 x [3 x i8]] zeroinitializer, align 1
@.str = private unnamed_addr constant [10 x i8] c"%d%s%d%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  store i8 97, i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i64 0, i64 2, i64 0), align 1, !tbaa !0
  store i8 98, i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i64 0, i64 2, i64 1), align 1, !tbaa !0
  store i8 0, i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i64 0, i64 2, i64 2), align 1, !tbaa !0
  %call = tail call i64 @strlen(i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i64 0, i64 2, i64 0)) nounwind readonly
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 2, i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i64 0, i64 2, i64 0), i32 2, i64 %call) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i64 @strlen(i8* nocapture) nounwind readonly

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
