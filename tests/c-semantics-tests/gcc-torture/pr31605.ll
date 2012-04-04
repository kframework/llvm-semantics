; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr31605.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @put_field(i32 %start, i32 %len) nounwind uwtable {
entry:
  %start.addr = alloca i32, align 4
  %len.addr = alloca i32, align 4
  %cur_bitshift = alloca i32, align 4
  store i32 %start, i32* %start.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i32* %start.addr, align 4
  %1 = load i32* %len.addr, align 4
  %add = add i32 %0, %1
  %rem = urem i32 %add, 8
  %sub = sub i32 %rem, 8
  store i32 %sub, i32* %cur_bitshift, align 4
  %2 = load i32* %cur_bitshift, align 4
  %cmp = icmp sgt i32 %2, -8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @exit(i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @put_field(i32 0, i32 1)
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind
