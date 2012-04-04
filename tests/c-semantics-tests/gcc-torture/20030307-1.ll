; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030307-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @vfswrap_lock(i8* %fsp, i32 %fd, i32 %op, i64 %offset, i64 %count, i32 %type) nounwind uwtable {
entry:
  %fsp.addr = alloca i8*, align 8
  %fd.addr = alloca i32, align 4
  %op.addr = alloca i32, align 4
  %offset.addr = alloca i64, align 8
  %count.addr = alloca i64, align 8
  %type.addr = alloca i32, align 4
  store i8* %fsp, i8** %fsp.addr, align 8
  store i32 %fd, i32* %fd.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  store i64 %offset, i64* %offset.addr, align 8
  store i64 %count, i64* %count.addr, align 8
  store i32 %type, i32* %type.addr, align 4
  %0 = load i32* %fd.addr, align 4
  %1 = load i32* %op.addr, align 4
  %2 = load i64* %offset.addr, align 8
  %3 = load i64* %count.addr, align 8
  %4 = load i32* %type.addr, align 4
  %call = call i32 @fcntl_lock(i32 %0, i32 %1, i64 %2, i64 %3, i32 %4)
  ret i32 %call
}

define i32 @fcntl_lock(i32 %fd, i32 %op, i64 %offset, i64 %count, i32 %type) nounwind uwtable {
entry:
  %fd.addr = alloca i32, align 4
  %op.addr = alloca i32, align 4
  %offset.addr = alloca i64, align 8
  %count.addr = alloca i64, align 8
  %type.addr = alloca i32, align 4
  store i32 %fd, i32* %fd.addr, align 4
  store i32 %op, i32* %op.addr, align 4
  store i64 %offset, i64* %offset.addr, align 8
  store i64 %count, i64* %count.addr, align 8
  store i32 %type, i32* %type.addr, align 4
  %0 = load i32* %type.addr, align 4
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @vfswrap_lock(i8* null, i32 1, i32 2, i64 3, i64 4, i32 5)
  %cmp = icmp ne i32 %call, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
