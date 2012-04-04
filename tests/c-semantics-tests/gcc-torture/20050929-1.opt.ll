; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050929-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }
%struct.B = type { %struct.A*, %struct.A* }
%struct.C = type { %struct.B*, %struct.A* }

@.compoundliteral = internal global %struct.A { i32 1, i32 2 }
@.compoundliteral1 = internal global %struct.A { i32 3, i32 4 }
@.compoundliteral2 = internal global %struct.B { %struct.A* @.compoundliteral, %struct.A* @.compoundliteral1 }
@.compoundliteral3 = internal global %struct.A { i32 5, i32 6 }
@e = global %struct.C { %struct.B* @.compoundliteral2, %struct.A* @.compoundliteral3 }, align 8

define i32 @main() nounwind uwtable {
entry:
  %0 = load %struct.B** getelementptr inbounds (%struct.C* @e, i64 0, i32 0), align 8, !tbaa !0
  %a = getelementptr inbounds %struct.B* %0, i64 0, i32 0
  %1 = load %struct.A** %a, align 8, !tbaa !0
  %i = getelementptr inbounds %struct.A* %1, i64 0, i32 0
  %2 = load i32* %i, align 4, !tbaa !3
  %cmp = icmp eq i32 %2, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %j = getelementptr inbounds %struct.A* %1, i64 0, i32 1
  %3 = load i32* %j, align 4, !tbaa !3
  %cmp2 = icmp eq i32 %3, 2
  br i1 %cmp2, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %b = getelementptr inbounds %struct.B* %0, i64 0, i32 1
  %4 = load %struct.A** %b, align 8, !tbaa !0
  %i3 = getelementptr inbounds %struct.A* %4, i64 0, i32 0
  %5 = load i32* %i3, align 4, !tbaa !3
  %cmp4 = icmp eq i32 %5, 3
  br i1 %cmp4, label %lor.lhs.false5, label %if.then9

lor.lhs.false5:                                   ; preds = %if.end
  %j7 = getelementptr inbounds %struct.A* %4, i64 0, i32 1
  %6 = load i32* %j7, align 4, !tbaa !3
  %cmp8 = icmp eq i32 %6, 4
  br i1 %cmp8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %lor.lhs.false5, %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %lor.lhs.false5
  %7 = load %struct.A** getelementptr inbounds (%struct.C* @e, i64 0, i32 1), align 8, !tbaa !0
  %i11 = getelementptr inbounds %struct.A* %7, i64 0, i32 0
  %8 = load i32* %i11, align 4, !tbaa !3
  %cmp12 = icmp eq i32 %8, 5
  br i1 %cmp12, label %lor.lhs.false13, label %if.then16

lor.lhs.false13:                                  ; preds = %if.end10
  %j14 = getelementptr inbounds %struct.A* %7, i64 0, i32 1
  %9 = load i32* %j14, align 4, !tbaa !3
  %cmp15 = icmp eq i32 %9, 6
  br i1 %cmp15, label %if.end17, label %if.then16

if.then16:                                        ; preds = %lor.lhs.false13, %if.end10
  tail call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %lor.lhs.false13
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
