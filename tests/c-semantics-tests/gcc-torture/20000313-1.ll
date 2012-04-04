; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000313-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @buggy(i32* %param) nounwind uwtable {
entry:
  %param.addr = alloca i32*, align 8
  %accu = alloca i32, align 4
  %zero = alloca i32, align 4
  %borrow = alloca i32, align 4
  store i32* %param, i32** %param.addr, align 8
  store i32 0, i32* %zero, align 4
  %0 = load i32** %param.addr, align 8
  %1 = load i32* %0, align 4
  %sub = sub i32 0, %1
  store i32 %sub, i32* %accu, align 4
  %2 = load i32* %accu, align 4
  %3 = load i32* %zero, align 4
  %cmp = icmp ugt i32 %2, %3
  %conv = zext i1 %cmp to i32
  %sub1 = sub nsw i32 0, %conv
  store i32 %sub1, i32* %borrow, align 4
  %4 = load i32* %accu, align 4
  %5 = load i32** %param.addr, align 8
  %6 = load i32* %5, align 4
  %add = add i32 %6, %4
  store i32 %add, i32* %5, align 4
  %7 = load i32* %borrow, align 4
  ret i32 %7
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %param = alloca i32, align 4
  %borrow = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %param, align 4
  %call = call i32 @buggy(i32* %param)
  store i32 %call, i32* %borrow, align 4
  %0 = load i32* %param, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32* %borrow, align 4
  %add = add i32 %1, 1
  %cmp1 = icmp ne i32 %add, 0
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
