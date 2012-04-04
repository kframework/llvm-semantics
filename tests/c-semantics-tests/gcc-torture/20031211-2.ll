; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031211-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a = type { i8, [3 x i8] }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.a, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.a* %a to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -8
  %3 = or i32 %2, 3
  store i32 %3, i32* %0, align 4
  %4 = bitcast %struct.a* %a to i32*
  %5 = load i32* %4, align 4
  %bf.clear = and i32 %5, 7
  call void (...)* bitcast (void (i32)* @foo to void (...)*)(i32 %bf.clear)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind

define void @foo(i32 %z) nounwind uwtable {
entry:
  %z.addr = alloca i32, align 4
  store i32 %z, i32* %z.addr, align 4
  %0 = load i32* %z.addr, align 4
  %cmp = icmp ne i32 %0, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind
