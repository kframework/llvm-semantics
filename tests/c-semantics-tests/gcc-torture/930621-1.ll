; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930621-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [3 x i8], i8 }

define i32 @f() nounwind uwtable {
entry:
  %foo = alloca %struct.anon, align 4
  %0 = bitcast %struct.anon* %foo to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -262144
  %3 = or i32 %2, 10
  store i32 %3, i32* %0, align 4
  %4 = bitcast %struct.anon* %foo to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, 262143
  %7 = or i32 %6, 5242880
  store i32 %7, i32* %4, align 4
  %8 = bitcast %struct.anon* %foo to i32*
  %9 = load i32* %8, align 4
  %10 = lshr i32 %9, 18
  %bf.clear = and i32 %10, 16383
  %11 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %11, 18
  ret i32 %bf.val.sext
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %cmp = icmp ne i32 %call, 20
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
