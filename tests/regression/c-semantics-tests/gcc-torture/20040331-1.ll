; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040331-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { [4 x i8] }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.anon, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.anon* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 4, i32 4, i1 false)
  br label %while.cond

while.cond:                                       ; preds = %entry
  %1 = bitcast %struct.anon* %s to i32*
  %2 = load i32* %1, align 4
  %bf.clear = and i32 %2, 2147483647
  %3 = shl i32 %bf.clear, 1
  %bf.val.sext = ashr i32 %3, 1
  %dec = add nsw i32 %bf.val.sext, -1
  %bf.value = and i32 %dec, 2147483647
  %4 = shl i32 %bf.value, 1
  %bf.reload.sext = ashr i32 %4, 1
  %5 = bitcast %struct.anon* %s to i32*
  %6 = and i32 %bf.value, 2147483647
  %7 = load i32* %5, align 4
  %8 = and i32 %7, -2147483648
  %9 = or i32 %8, %6
  store i32 %9, i32* %5, align 4
  %tobool = icmp ne i32 %bf.val.sext, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  call void @abort() noreturn
  unreachable

while.end:                                        ; preds = %while.cond
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn

declare void @exit(i32) noreturn
