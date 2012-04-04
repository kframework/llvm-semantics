; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr28651.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %u) nounwind uwtable noinline {
entry:
  %u.addr = alloca i32, align 4
  store i32 %u, i32* %u.addr, align 4
  %0 = load i32* %u.addr, align 4
  %add = add i32 %0, 4
  %1 = load i32* %u.addr, align 4
  %cmp = icmp slt i32 %add, %1
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %u = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2147483647, i32* %u, align 4
  %0 = load i32* %u, align 4
  %call = call i32 @foo(i32 %0)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
