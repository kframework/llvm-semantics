; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/breakEnvironment.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %x1 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  br label %while.body

while.body:                                       ; preds = %entry
  store i32 7, i32* %x1, align 4
  br label %while.end

while.end:                                        ; preds = %while.body
  br label %while.body2

while.body2:                                      ; preds = %while.end
  br label %while.end3

while.end3:                                       ; preds = %while.body2
  %tmp = load i32* %x, align 4
  ret i32 %tmp
}
