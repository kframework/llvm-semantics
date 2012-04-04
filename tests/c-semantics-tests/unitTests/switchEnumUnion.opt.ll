; ModuleID = '/home/david/src/c-semantics/tests/unitTests/switchEnumUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.tree_node = type { %struct.tree_common }
%struct.tree_common = type { %union.tree_node*, %union.tree_node*, i8, i8, i8, i8 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @blah() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @convert_like_real(%union.tree_node* nocapture %convs) nounwind uwtable {
entry:
  %0 = getelementptr %union.tree_node* %convs, i64 0, i32 0, i32 2
  %1 = bitcast i8* %0 to i32*
  %2 = load i32* %1, align 8
  %3 = shl i32 %2, 24
  %bf.val.sext = ashr exact i32 %3, 24
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.val.sext) nounwind
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 222) nounwind
  ret i32 1
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 -34) nounwind
  %call1.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 222) nounwind
  ret i32 1
}
