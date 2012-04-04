; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j021c.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test1() nounwind uwtable {
entry:
  %x = alloca i32, align 4
  br label %test1a

test1a:                                           ; preds = %entry
  store i32 0, i32* %x, align 4
  %0 = load i32* %x, align 4
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test1()
  ret i32 0
}
