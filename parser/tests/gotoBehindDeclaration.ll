; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/gotoBehindDeclaration.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.z = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %count = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %count, align 4
  br label %label

label:                                            ; preds = %if.then, %entry
  store i32 1, i32* %y, align 4
  %tmp = load i32* %count, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %label
  %tmp1 = load i32* %count, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %count, align 4
  br label %label

if.end:                                           ; preds = %label
  ret i32 0
}
