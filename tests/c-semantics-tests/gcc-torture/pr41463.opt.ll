; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41463.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.tree_node = type { %struct.other_tree }
%struct.other_tree = type { %struct.tree_common, [14 x i32] }
%struct.tree_common = type { i32, i64, i64, i8*, i32 }

@global = common global %union.tree_node zeroinitializer, align 8

define %union.tree_node* @foo(%union.tree_node* nocapture %p, i32 %i) nounwind uwtable noinline {
entry:
  %idxprom = sext i32 %i to i64
  %a = getelementptr inbounds %union.tree_node* %p, i64 0, i32 0, i32 1, i64 2
  %0 = bitcast i32* %a to [1 x %union.tree_node*]*
  %arrayidx = getelementptr inbounds [1 x %union.tree_node*]* %0, i64 0, i64 %idxprom
  store %union.tree_node* null, %union.tree_node** %arrayidx, align 8, !tbaa !0
  %arrayidx3 = getelementptr inbounds %union.tree_node* %p, i64 0, i32 0, i32 1, i64 4
  %1 = bitcast i32* %arrayidx3 to %union.tree_node**
  store %union.tree_node* @global, %union.tree_node** %1, align 8, !tbaa !0
  %2 = load %union.tree_node** %arrayidx, align 8, !tbaa !0
  ret %union.tree_node* %2
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 96) nounwind
  %0 = bitcast i8* %call to %union.tree_node*
  %call1 = tail call %union.tree_node* @foo(%union.tree_node* %0, i32 1)
  %cmp = icmp eq %union.tree_node* %call1, @global
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
