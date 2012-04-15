; ModuleID = '2007-04-25-weak.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

define i32 @main() nounwind {
entry:
  br i1 icmp ne (i32 (...)* @test_weak, i32 (...)* null), label %bb, label %bb2

bb:                                               ; preds = %entry
  %0 = tail call i32 (...)* @test_weak() nounwind ; <i32> [#uses=0]
  ret i32 1

bb2:                                              ; preds = %entry
  ret i32 0
}

declare extern_weak i32 @test_weak(...)
