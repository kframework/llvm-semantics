; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/forInDo.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %n = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %x, align 4
  store i32 0, i32* %y, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  store i32 0, i32* %result, align 4
  store i32 0, i32* %n, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %do.body
  %tmp = load i32* %n, align 4
  %tmp1 = load i32* %x, align 4
  %cmp = icmp slt i32 %tmp, %tmp1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %result, align 4
  %add = add nsw i32 %tmp2, 5
  store i32 %add, i32* %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp3 = load i32* %n, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %n, align 4
  %tmp4 = load i32* %y, align 4
  %inc5 = add nsw i32 %tmp4, 1
  store i32 %inc5, i32* %y, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp6 = load i32* %x, align 4
  %add7 = add nsw i32 %tmp6, 1
  store i32 %add7, i32* %x, align 4
  br label %do.cond

do.cond:                                          ; preds = %for.end
  %tmp8 = load i32* %x, align 4
  %cmp9 = icmp slt i32 %tmp8, 5
  br i1 %cmp9, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  ret i32 0
}
