; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr40579.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  store i32 -2147483644, i32* %x, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %x, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %x, align 4
  %2 = load i32* %x, align 4
  %call = call i8* @itos(i32 %2)
  store i8* %call, i8** %p, align 8
  %3 = load i32* %i, align 4
  %4 = load i8** %p, align 8
  call void @foo(i32 %3, i8* %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

define internal i8* @itos(i32 %num) nounwind uwtable noinline {
entry:
  %num.addr = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  ret i8* null
}

define internal void @foo(i32 %i, i8* %x) nounwind uwtable noinline {
entry:
  %i.addr = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  store i32 %i, i32* %i.addr, align 4
  store i8* %x, i8** %x.addr, align 8
  %0 = load i32* %i.addr, align 4
  %cmp = icmp sge i32 %0, 4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind
