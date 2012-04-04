; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921016-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [2 x i8], [2 x i8] }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %j = alloca i32, align 4
  %l = alloca %struct.anon, align 4
  store i32 0, i32* %retval
  store i32 1081, i32* %j, align 4
  %0 = load i32* %j, align 4
  %bf.value = and i32 %0, 2047
  %1 = shl i32 %bf.value, 21
  %bf.reload.sext = ashr i32 %1, 21
  %2 = bitcast %struct.anon* %l to i32*
  %3 = and i32 %bf.value, 2047
  %4 = load i32* %2, align 4
  %5 = and i32 %4, -2048
  %6 = or i32 %5, %3
  store i32 %6, i32* %2, align 4
  %7 = load i32* %j, align 4
  %cmp = icmp eq i32 %bf.reload.sext, %7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
