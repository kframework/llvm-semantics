; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930929-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sub1(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %1 = load i32* %i.addr, align 4
  %sub = sub nsw i32 5, %1
  %sub1 = sub nsw i32 %0, %sub
  ret i32 %sub1
}

define i32 @sub2(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %1 = load i32* %i.addr, align 4
  %add = add nsw i32 5, %1
  %add1 = add nsw i32 %0, %add
  ret i32 %add1
}

define i32 @sub3(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %1 = load i32* %i.addr, align 4
  %add = add nsw i32 5, %1
  %sub = sub nsw i32 %0, %add
  ret i32 %sub
}

define i32 @sub4(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %0 = load i32* %i.addr, align 4
  %1 = load i32* %i.addr, align 4
  %sub = sub nsw i32 5, %1
  %add = add nsw i32 %0, %sub
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32)* @sub1 to i32 (...)*)(i32 20)
  %cmp = icmp ne i32 %call, 35
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 (...)* bitcast (i32 (i32)* @sub2 to i32 (...)*)(i32 20)
  %cmp2 = icmp ne i32 %call1, 45
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 (...)* bitcast (i32 (i32)* @sub3 to i32 (...)*)(i32 20)
  %cmp6 = icmp ne i32 %call5, -5
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 (...)* bitcast (i32 (i32)* @sub4 to i32 (...)*)(i32 20)
  %cmp10 = icmp ne i32 %call9, 5
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
