; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ipa-sra-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readonly {
entry:
  %cmp = icmp sgt i32 %argc, 2000
  %conv = zext i1 %cmp to i32
  %call = tail call fastcc i32 @ox(i32 %conv)
  ret i32 %call
}

define internal fastcc i32 @ox(i32 %fail) nounwind uwtable readonly noinline {
entry:
  %tobool = icmp eq i32 %fail, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @llvm.trap()
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @llvm.trap() nounwind
