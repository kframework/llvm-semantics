; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010518-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @add(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k, i32 %l, i32 %m) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %l.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  store i32 %l, i32* %l.addr, align 4
  store i32 %m, i32* %m.addr, align 4
  %0 = load i32* %a.addr, align 4
  %1 = load i32* %b.addr, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32* %c.addr, align 4
  %add1 = add nsw i32 %add, %2
  %3 = load i32* %d.addr, align 4
  %add2 = add nsw i32 %add1, %3
  %4 = load i32* %e.addr, align 4
  %add3 = add nsw i32 %add2, %4
  %5 = load i32* %f.addr, align 4
  %add4 = add nsw i32 %add3, %5
  %6 = load i32* %g.addr, align 4
  %add5 = add nsw i32 %add4, %6
  %7 = load i32* %h.addr, align 4
  %add6 = add nsw i32 %add5, %7
  %8 = load i32* %i.addr, align 4
  %add7 = add nsw i32 %add6, %8
  %9 = load i32* %j.addr, align 4
  %add8 = add nsw i32 %add7, %9
  %10 = load i32* %k.addr, align 4
  %add9 = add nsw i32 %add8, %10
  %11 = load i32* %l.addr, align 4
  %add10 = add nsw i32 %add9, %11
  %12 = load i32* %m.addr, align 4
  %add11 = add nsw i32 %add10, %12
  ret i32 %add11
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @add(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13)
  %cmp = icmp ne i32 %call, 91
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
