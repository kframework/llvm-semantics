; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030913-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@glob = common global i32 0, align 4

define void @fn2(i32** %q) nounwind uwtable {
entry:
  %q.addr = alloca i32**, align 8
  store i32** %q, i32*** %q.addr, align 8
  %0 = load i32*** %q.addr, align 8
  store i32* @glob, i32** %0, align 8
  ret void
}

define void @test() nounwind uwtable {
entry:
  %p = alloca i32*, align 8
  call void @fn2(i32** %p)
  %0 = load i32** %p, align 8
  store i32 42, i32* %0, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test()
  %0 = load i32* @glob, align 4
  %cmp = icmp ne i32 %0, 42
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
