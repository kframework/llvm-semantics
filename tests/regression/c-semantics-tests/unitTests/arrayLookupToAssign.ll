; ModuleID = '/home/david/src/c-semantics/tests/unitTests/arrayLookupToAssign.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  store i32 0, i32* %arrayidx, align 4
  %arrayidx1 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %0 = load i32* %arrayidx1, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx2 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 %idxprom
  store i32 3, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [5 x i32]* %a, i32 0, i64 0
  %1 = load i32* %arrayidx3, align 4
  ret i32 %1
}
