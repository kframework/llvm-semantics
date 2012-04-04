; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031216-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @DisplayNumber(i64 %v) nounwind uwtable {
entry:
  %v.addr = alloca i64, align 8
  store i64 %v, i64* %v.addr, align 8
  %0 = load i64* %v.addr, align 8
  %cmp = icmp ne i64 %0, 154
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i64 @ReadNumber() nounwind uwtable {
entry:
  ret i64 10092544
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tmp = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call i64 @ReadNumber()
  %and = and i64 %call, 16711680
  %shr = lshr i64 %and, 16
  store i64 %shr, i64* %tmp, align 8
  %0 = load i64* %tmp, align 8
  call void @DisplayNumber(i64 %0)
  ret i32 0
}
