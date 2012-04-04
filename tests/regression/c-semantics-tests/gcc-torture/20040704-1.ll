; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040704-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  br label %for.cond

for.cond:                                         ; preds = %entry
  br i1 false, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @abort() noreturn nounwind
  unreachable

label:                                            ; preds = %for.end
  ret i32 0

for.end:                                          ; preds = %for.cond
  br label %label
}

declare void @abort() noreturn nounwind
