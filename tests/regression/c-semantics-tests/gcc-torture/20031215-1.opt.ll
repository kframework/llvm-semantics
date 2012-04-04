; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.pstr = type { i32, i32, [3 x i8] }

@ao = constant { i32, i32, [3 x i8], i8 } { i32 2, i32 2, [3 x i8] c"OK\00", i8 undef }, align 4
@a = constant %struct.pstr* bitcast ({ i32, i32, [3 x i8], i8 }* @ao to %struct.pstr*), align 8

define void @test1() nounwind uwtable readnone {
entry:
  ret void
}

define void @test2() nounwind uwtable readnone {
entry:
  ret void
}

define void @test3() nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
