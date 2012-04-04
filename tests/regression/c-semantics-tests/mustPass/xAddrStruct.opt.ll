; ModuleID = '/home/david/src/c-semantics/tests/mustPass/xAddrStruct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, i32 }

@s = common global %struct.node zeroinitializer, align 8

define { %struct.node*, i32 } @f() nounwind uwtable readonly {
entry:
  %srcval = load i128* bitcast (%struct.node* @s to i128*), align 8
  %0 = trunc i128 %srcval to i64
  %1 = inttoptr i64 %0 to %struct.node*
  %2 = insertvalue { %struct.node*, i32 } undef, %struct.node* %1, 0
  %3 = lshr i128 %srcval, 64
  %4 = trunc i128 %3 to i32
  %5 = insertvalue { %struct.node*, i32 } %2, i32 %4, 1
  ret { %struct.node*, i32 } %5
}

define i32 @main() nounwind uwtable {
entry:
  store %struct.node* @s, %struct.node** getelementptr inbounds (%struct.node* @s, i64 0, i32 0), align 8, !tbaa !0
  store i32 5, i32* getelementptr inbounds (%struct.node* @s, i64 0, i32 1), align 8, !tbaa !3
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
