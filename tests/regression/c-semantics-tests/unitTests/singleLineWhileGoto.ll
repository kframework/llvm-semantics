; ModuleID = '/home/david/src/c-semantics/tests/unitTests/singleLineWhileGoto.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  br label %crazy
                                                  ; No predecessors!
  br label %while.cond

while.cond:                                       ; preds = %crazy, %0
  br i1 false, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %crazy

crazy:                                            ; preds = %while.body, %entry
  %1 = load i32* %x, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %x, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %crazier
                                                  ; No predecessors!
  br label %while.cond1

while.cond1:                                      ; preds = %2
  br i1 false, label %while.body2, label %while.end3

while.body2:                                      ; preds = %while.cond1
  br label %crazier

crazier:                                          ; preds = %while.body2, %while.end
  br label %while.end3

while.end3:                                       ; preds = %crazier, %while.cond1
  %3 = load i32* %x, align 4
  ret i32 %3
}
