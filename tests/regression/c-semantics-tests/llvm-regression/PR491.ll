; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/PR491.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i64 }

define i32 @test(i32 %r) nounwind uwtable {
entry:
  %r.addr = alloca i32, align 4
  %u = alloca %union.anon, align 8
  store i32 %r, i32* %r.addr, align 4
  %0 = load i32* %r.addr, align 4
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test(i32 1)
  %cmp = icmp ne i32 %call, 1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}
