; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990106-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @calc_mp(i32 %mod) nounwind uwtable {
entry:
  %mod.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %mod, i32* %mod.addr, align 4
  store i32 -1, i32* %c, align 4
  %0 = load i32* %c, align 4
  %1 = load i32* %mod.addr, align 4
  %div = udiv i32 %0, %1
  store i32 %div, i32* %a, align 4
  %2 = load i32* %a, align 4
  %3 = load i32* %mod.addr, align 4
  %mul = mul i32 %2, %3
  %sub = sub i32 0, %mul
  store i32 %sub, i32* %b, align 4
  %4 = load i32* %b, align 4
  %5 = load i32* %mod.addr, align 4
  %cmp = icmp ugt i32 %4, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i32* %a, align 4
  %add = add i32 %6, 1
  store i32 %add, i32* %a, align 4
  %7 = load i32* %mod.addr, align 4
  %8 = load i32* %b, align 4
  %sub1 = sub i32 %8, %7
  store i32 %sub1, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32* %b, align 4
  ret i32 %9
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 1234, i32* %x, align 4
  %0 = load i32* %x, align 4
  %call = call i32 @calc_mp(i32 %0)
  store i32 %call, i32* %y, align 4
  %1 = load i32* %y, align 4
  %cmp = icmp ne i32 %1, 680
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
