; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41463.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.tree_node = type { %struct.other_tree }
%struct.other_tree = type { %struct.tree_common, [14 x i32] }
%struct.tree_common = type { i32, i64, i64, i8*, i32 }
%struct.tree_vec = type { %struct.tree_common, i32, [1 x %union.tree_node*] }

@global = common global %union.tree_node zeroinitializer, align 8

define %union.tree_node* @foo(%union.tree_node* %p, i32 %i) nounwind uwtable noinline {
entry:
  %p.addr = alloca %union.tree_node*, align 8
  %i.addr = alloca i32, align 4
  %q = alloca %union.tree_node**, align 8
  store %union.tree_node* %p, %union.tree_node** %p.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %idxprom = sext i32 %0 to i64
  %1 = load %union.tree_node** %p.addr, align 8
  %vec = bitcast %union.tree_node* %1 to %struct.tree_vec*
  %a = getelementptr inbounds %struct.tree_vec* %vec, i32 0, i32 2
  %arrayidx = getelementptr inbounds [1 x %union.tree_node*]* %a, i32 0, i64 %idxprom
  store %union.tree_node* null, %union.tree_node** %arrayidx, align 8
  %2 = load %union.tree_node** %p.addr, align 8
  %vec1 = bitcast %union.tree_node* %2 to %struct.tree_vec*
  %a2 = getelementptr inbounds %struct.tree_vec* %vec1, i32 0, i32 2
  %arrayidx3 = getelementptr inbounds [1 x %union.tree_node*]* %a2, i32 0, i64 1
  store %union.tree_node** %arrayidx3, %union.tree_node*** %q, align 8
  %3 = load %union.tree_node*** %q, align 8
  store %union.tree_node* @global, %union.tree_node** %3, align 8
  %4 = load i32* %i.addr, align 4
  %idxprom4 = sext i32 %4 to i64
  %5 = load %union.tree_node** %p.addr, align 8
  %vec5 = bitcast %union.tree_node* %5 to %struct.tree_vec*
  %a6 = getelementptr inbounds %struct.tree_vec* %vec5, i32 0, i32 2
  %arrayidx7 = getelementptr inbounds [1 x %union.tree_node*]* %a6, i32 0, i64 %idxprom4
  %6 = load %union.tree_node** %arrayidx7, align 8
  ret %union.tree_node* %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %union.tree_node*, align 8
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 96) nounwind
  %0 = bitcast i8* %call to %union.tree_node*
  store %union.tree_node* %0, %union.tree_node** %p, align 8
  %1 = load %union.tree_node** %p, align 8
  %call1 = call %union.tree_node* @foo(%union.tree_node* %1, i32 1)
  %cmp = icmp ne %union.tree_node* %call1, @global
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @abort() noreturn nounwind
