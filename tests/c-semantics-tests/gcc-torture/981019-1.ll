; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/981019-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f3.x = internal global i32 0, align 4

define void @ff(i32 %fname, i32 %part, i32 %nparts) nounwind uwtable {
entry:
  %fname.addr = alloca i32, align 4
  %part.addr = alloca i32, align 4
  %nparts.addr = alloca i32, align 4
  store i32 %fname, i32* %fname.addr, align 4
  store i32 %part, i32* %part.addr, align 4
  store i32 %nparts, i32* %nparts.addr, align 4
  %0 = load i32* %fname.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %nparts.addr, align 4
  %tobool1 = icmp ne i32 %1, 0
  br i1 %tobool1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @f1()
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.then
  br label %if.end3

if.else:                                          ; preds = %entry
  store i32 2, i32* %fname.addr, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end13, %if.end3
  %call = call i32 @f3()
  %tobool4 = icmp ne i32 %call, 0
  br i1 %tobool4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32* %nparts.addr, align 4
  %tobool5 = icmp ne i32 %2, 0
  br i1 %tobool5, label %land.lhs.true, label %if.end13

land.lhs.true:                                    ; preds = %while.body
  %call6 = call i32 @f2()
  %tobool7 = icmp ne i32 %call6, 0
  br i1 %tobool7, label %if.then8, label %if.end13

if.then8:                                         ; preds = %land.lhs.true
  call void @f1()
  %3 = load i32* %part.addr, align 4
  store i32 %3, i32* %nparts.addr, align 4
  %call9 = call i32 @f3()
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.then8
  call void @f1()
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.then8
  call void @f1()
  br label %while.end

if.end13:                                         ; preds = %land.lhs.true, %while.body
  br label %while.cond

while.end:                                        ; preds = %if.end12, %while.cond
  %4 = load i32* %nparts.addr, align 4
  %tobool14 = icmp ne i32 %4, 0
  br i1 %tobool14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %while.end
  call void @f1()
  br label %if.end16

if.end16:                                         ; preds = %if.then15, %while.end
  ret void
}

define void @f1() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define i32 @f3() nounwind uwtable {
entry:
  %0 = load i32* @f3.x, align 4
  %tobool = icmp ne i32 %0, 0
  %lnot = xor i1 %tobool, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* @f3.x, align 4
  %1 = load i32* @f3.x, align 4
  ret i32 %1
}

define i32 @f2() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @ff(i32 0, i32 1, i32 0)
  ret i32 0
}

declare void @abort() noreturn nounwind
