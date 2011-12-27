; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testForScope.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %x2 = alloca i32, align 4
  %i7 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %x, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %x2, align 4
  %tmp3 = load i32* %x2, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %x2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp4 = load i32* %i, align 4
  %inc5 = add nsw i32 %tmp4, 1
  store i32 %inc5, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 15, i32* %i7, align 4
  %tmp8 = load i32* %i7, align 4
  %tmp9 = load i32* %x, align 4
  %add = add nsw i32 %tmp8, %tmp9
  ret i32 %add
}
