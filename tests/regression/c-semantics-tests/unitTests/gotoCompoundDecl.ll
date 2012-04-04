; ModuleID = '/home/david/src/c-semantics/tests/unitTests/gotoCompoundDecl.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 2, i32* %x, align 4
  store i32 3, i32* %y, align 4
  br label %label

label:                                            ; preds = %entry
  %0 = load i32* %x, align 4
  %1 = load i32* %y, align 4
  %add = add nsw i32 %0, %1
  ret i32 %add
}
