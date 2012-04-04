; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920922-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64* @f(i64* %p) nounwind uwtable {
entry:
  %p.addr = alloca i64*, align 8
  %a = alloca i64, align 8
  store i64* %p, i64** %p.addr, align 8
  %0 = load i64** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i64* %0, i32 1
  store i64* %incdec.ptr, i64** %p.addr, align 8
  %1 = load i64* %0, align 8
  %shr = lshr i64 %1, 24
  store i64 %shr, i64* %a, align 8
  %2 = load i64** %p.addr, align 8
  %3 = load i64* %a, align 8
  %add.ptr = getelementptr inbounds i64* %2, i64 %3
  ret i64* %add.ptr
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 2147483648, i64* %x, align 8
  %call = call i64* (...)* bitcast (i64* (i64*)* @f to i64* (...)*)(i64* %x)
  %add.ptr = getelementptr inbounds i64* %x, i64 129
  %cmp = icmp ne i64* %call, %add.ptr
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
