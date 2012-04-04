; ModuleID = '/home/david/src/c-semantics/tests/unitTests/switchEnumUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.tree_node = type { %struct.tree_common }
%struct.tree_common = type { %union.tree_node*, %union.tree_node*, i8, i8, i8, i8 }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @blah() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @convert_like_real(%union.tree_node* %convs) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %convs.addr = alloca %union.tree_node*, align 8
  store %union.tree_node* %convs, %union.tree_node** %convs.addr, align 8
  %0 = load %union.tree_node** %convs.addr, align 8
  %common = bitcast %union.tree_node* %0 to %struct.tree_common*
  %1 = bitcast %struct.tree_common* %common to i8*
  %bf.field.offs = getelementptr i8* %1, i32 16
  %2 = bitcast i8* %bf.field.offs to i32*
  %3 = load i32* %2, align 8
  %bf.clear = and i32 %3, 255
  %4 = shl i32 %bf.clear, 24
  %bf.val.sext = ashr i32 %4, 24
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 222)
  %5 = load %union.tree_node** %convs.addr, align 8
  %common2 = bitcast %union.tree_node* %5 to %struct.tree_common*
  %6 = bitcast %struct.tree_common* %common2 to i8*
  %bf.field.offs3 = getelementptr i8* %6, i32 16
  %7 = bitcast i8* %bf.field.offs3 to i32*
  %8 = load i32* %7, align 8
  %bf.clear4 = and i32 %8, 255
  %9 = shl i32 %bf.clear4, 24
  %bf.val.sext5 = ashr i32 %9, 24
  switch i32 %bf.val.sext5, label %sw.default [
    i32 222, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  %call6 = call i32 @blah()
  store i32 %call6, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb
  %10 = load i32* %retval
  ret i32 %10
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %convs = alloca %union.tree_node*, align 8
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 24) nounwind
  %0 = bitcast i8* %call to %union.tree_node*
  store %union.tree_node* %0, %union.tree_node** %convs, align 8
  %1 = load %union.tree_node** %convs, align 8
  %common = bitcast %union.tree_node* %1 to %struct.tree_common*
  %2 = bitcast %struct.tree_common* %common to i8*
  %bf.field.offs = getelementptr i8* %2, i32 16
  %3 = bitcast i8* %bf.field.offs to i32*
  %4 = load i32* %3, align 8
  %5 = and i32 %4, -256
  %6 = or i32 %5, 222
  store i32 %6, i32* %3, align 8
  %7 = load %union.tree_node** %convs, align 8
  %call1 = call i32 @convert_like_real(%union.tree_node* %7)
  ret i32 %call1
}

declare noalias i8* @malloc(i64) nounwind
