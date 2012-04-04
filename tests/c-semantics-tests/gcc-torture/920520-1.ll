; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920520-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* %bar) nounwind uwtable {
entry:
  %bar.addr = alloca i32*, align 8
  store i32* %bar, i32** %bar.addr, align 8
  %0 = load i32** %bar.addr, align 8
  store i32 8, i32* %0, align 4
  ret void
}

define i32 @bugger() nounwind uwtable {
entry:
  %oldDepth = alloca i32, align 4
  %newDepth = alloca i32, align 4
  call void @foo(i32* %oldDepth)
  %0 = load i32* %oldDepth, align 4
  switch i32 %0, label %sw.default [
    i32 8, label %sw.bb
    i32 500, label %sw.bb
    i32 5000, label %sw.bb1
  ]

sw.bb:                                            ; preds = %entry, %entry
  store i32 8, i32* %newDepth, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  store i32 500, i32* %newDepth, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  store i32 17, i32* %newDepth, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  %1 = load i32* %newDepth, align 4
  %2 = load i32* %oldDepth, align 4
  %sub = sub nsw i32 %1, %2
  ret i32 %sub
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @bugger()
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
