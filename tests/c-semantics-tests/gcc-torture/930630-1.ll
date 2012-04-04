; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930630-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [3 x i8], i8 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %bf = alloca %struct.anon, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.anon* %bf to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -16646145
  %3 = or i32 %2, 917504
  store i32 %3, i32* %0, align 4
  %4 = bitcast %struct.anon* %bf to i32*
  %5 = load i32* %4, align 4
  %6 = lshr i32 %5, 17
  %bf.clear = and i32 %6, 127
  %7 = shl i32 %bf.clear, 25
  %bf.val.sext = ashr i32 %7, 25
  call void (...)* bitcast (void (i32)* @f to void (...)*)(i32 %bf.val.sext)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @exit(i32) noreturn nounwind

define void @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %0, 7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind
