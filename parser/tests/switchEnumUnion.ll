; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/switchEnumUnion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.tree_common = type { %union.tree_node*, %union.tree_node*, i8, i8, i8, i8 }
%union.tree_node = type { %struct.tree_common }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @blah() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @convert_like_real(%union.tree_node* %convs) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %convs.addr = alloca %union.tree_node*, align 8
  store %union.tree_node* %convs, %union.tree_node** %convs.addr, align 8
  %tmp = load %union.tree_node** %convs.addr, align 8
  %common = bitcast %union.tree_node* %tmp to %struct.tree_common*
  %0 = bitcast %struct.tree_common* %common to i8*
  %bf.field.offs = getelementptr i8* %0, i32 16
  %1 = bitcast i8* %bf.field.offs to i32*
  %2 = load i32* %1, align 8
  %bf.clear = and i32 %2, 255
  %3 = shl i32 %bf.clear, 24
  %bf.val.sext = ashr i32 %3, 24
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %bf.val.sext)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 222)
  %tmp2 = load %union.tree_node** %convs.addr, align 8
  %common3 = bitcast %union.tree_node* %tmp2 to %struct.tree_common*
  %4 = bitcast %struct.tree_common* %common3 to i8*
  %bf.field.offs4 = getelementptr i8* %4, i32 16
  %5 = bitcast i8* %bf.field.offs4 to i32*
  %6 = load i32* %5, align 8
  %bf.clear5 = and i32 %6, 255
  %7 = shl i32 %bf.clear5, 24
  %bf.val.sext6 = ashr i32 %7, 24
  switch i32 %bf.val.sext6, label %sw.default [
    i32 222, label %sw.bb
  ]

sw.bb:                                            ; preds = %entry
  %call7 = call i32 @blah()
  store i32 %call7, i32* %retval
  br label %return

sw.default:                                       ; preds = %entry
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %sw.epilog, %sw.bb
  %8 = load i32* %retval
  ret i32 %8
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
  %tmp = load %union.tree_node** %convs, align 8
  %common = bitcast %union.tree_node* %tmp to %struct.tree_common*
  %1 = bitcast %struct.tree_common* %common to i8*
  %bf.field.offs = getelementptr i8* %1, i32 16
  %2 = bitcast i8* %bf.field.offs to i32*
  %3 = load i32* %2, align 8
  %4 = and i32 %3, -256
  %5 = or i32 %4, 222
  store i32 %5, i32* %2, align 8
  %tmp1 = load %union.tree_node** %convs, align 8
  %call2 = call i32 @convert_like_real(%union.tree_node* %tmp1)
  ret i32 %call2
}

declare noalias i8* @malloc(i64) nounwind
