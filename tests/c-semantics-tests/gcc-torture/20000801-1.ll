; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000801-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i8* %bp, i32 %n) nounwind uwtable {
entry:
  %bp.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %c = alloca i8, align 1
  %ep = alloca i8*, align 8
  %sp = alloca i8*, align 8
  store i8* %bp, i8** %bp.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = load i8** %bp.addr, align 8
  %1 = load i32* %n.addr, align 4
  %idx.ext = zext i32 %1 to i64
  %add.ptr = getelementptr inbounds i8* %0, i64 %idx.ext
  store i8* %add.ptr, i8** %ep, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i8** %bp.addr, align 8
  %3 = load i8** %ep, align 8
  %cmp = icmp ult i8* %2, %3
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i8** %bp.addr, align 8
  %add.ptr1 = getelementptr inbounds i8* %4, i64 3
  store i8* %add.ptr1, i8** %sp, align 8
  %5 = load i8** %sp, align 8
  %6 = load i8* %5, align 1
  store i8 %6, i8* %c, align 1
  %7 = load i8** %bp.addr, align 8
  %8 = load i8* %7, align 1
  %9 = load i8** %sp, align 8
  store i8 %8, i8* %9, align 1
  %10 = load i8* %c, align 1
  %11 = load i8** %bp.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %11, i32 1
  store i8* %incdec.ptr, i8** %bp.addr, align 8
  store i8 %10, i8* %11, align 1
  %12 = load i8** %bp.addr, align 8
  %add.ptr2 = getelementptr inbounds i8* %12, i64 1
  store i8* %add.ptr2, i8** %sp, align 8
  %13 = load i8** %sp, align 8
  %14 = load i8* %13, align 1
  store i8 %14, i8* %c, align 1
  %15 = load i8** %bp.addr, align 8
  %16 = load i8* %15, align 1
  %17 = load i8** %sp, align 8
  store i8 %16, i8* %17, align 1
  %18 = load i8* %c, align 1
  %19 = load i8** %bp.addr, align 8
  %incdec.ptr3 = getelementptr inbounds i8* %19, i32 1
  store i8* %incdec.ptr3, i8** %bp.addr, align 8
  store i8 %18, i8* %19, align 1
  %20 = load i8** %bp.addr, align 8
  %add.ptr4 = getelementptr inbounds i8* %20, i64 2
  store i8* %add.ptr4, i8** %bp.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %one = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %one, align 4
  %0 = bitcast i32* %one to i8*
  call void @foo(i8* %0, i32 4)
  %1 = bitcast i32* %one to i8*
  call void @foo(i8* %1, i32 4)
  %2 = load i32* %one, align 4
  %cmp = icmp ne i32 %2, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
