; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ipa-sra-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.big = type { [1000000 x i32] }
%union.both = type { %struct.big }

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i8* @calloc(i64 1, i64 40) nounwind
  %0 = bitcast i8* %call to %union.both*
  %cmp = icmp sgt i32 %argc, 2000
  %conv = zext i1 %cmp to i32
  %call2 = tail call fastcc i32 @foo(i32 %conv, %union.both* %0)
  tail call void @free(i8* %call)
  ret i32 %call2
}

declare noalias i8* @calloc(i64, i64) nounwind

define internal fastcc i32 @foo(i32 %fail, %union.both* %agg) nounwind uwtable readonly noinline {
entry:
  %tobool = icmp eq i32 %fail, 0
  %arrayidx5 = getelementptr inbounds %union.both* %agg, i64 0, i32 0, i32 0, i64 0
  %arrayidx = getelementptr inbounds %union.both* %agg, i64 0, i32 0, i32 0, i64 999999
  %storemerge.in = select i1 %tobool, i32* %arrayidx5, i32* %arrayidx
  %storemerge = load i32* %storemerge.in, align 4
  ret i32 %storemerge
}

declare void @free(i8* nocapture) nounwind
