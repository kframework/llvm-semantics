; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr24716.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@Link = global [1 x i32] [i32 -1], align 4
@W = global [1 x i32] [i32 2], align 4

define i32 @f(i32 %k, i32 %p) nounwind uwtable {
entry:
  %k.addr = alloca i32, align 4
  %p.addr = alloca i32, align 4
  %pdest = alloca i32, align 4
  %j = alloca i32, align 4
  %D1361 = alloca i32, align 4
  store i32 %k, i32* %k.addr, align 4
  store i32 %p, i32* %p.addr, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %pdest, align 4
  br label %for.cond

for.cond:                                         ; preds = %do.end37, %entry
  %0 = load i32* %pdest, align 4
  %cmp = icmp sgt i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %for.cond
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %1 = load i32* %j, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %j, align 4
  %2 = load i32* %pdest, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %pdest, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i32* %j, align 4
  %cmp1 = icmp sgt i32 %3, 2
  br i1 %cmp1, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end

if.end:                                           ; preds = %do.end, %for.cond
  %4 = load i32* %j, align 4
  %cmp2 = icmp eq i32 %4, 1
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  br label %for.end

if.end4:                                          ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %if.end9, %if.end4
  %5 = load i32* %pdest, align 4
  %6 = load i32* %p.addr, align 4
  %cmp5 = icmp sgt i32 %5, %6
  br i1 %cmp5, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i32* %j, align 4
  %8 = load i32* %p.addr, align 4
  %cmp6 = icmp eq i32 %7, %8
  br i1 %cmp6, label %if.then7, label %if.end9

if.then7:                                         ; preds = %while.body
  %9 = load i32* %pdest, align 4
  %inc8 = add nsw i32 %9, 1
  store i32 %inc8, i32* %pdest, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %do.body10

do.body10:                                        ; preds = %do.cond20, %while.end
  %10 = load i32* %k.addr, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @W, i32 0, i64 %idxprom
  %11 = load i32* %arrayidx, align 4
  store i32 %11, i32* %D1361, align 4
  br label %do.body11

do.body11:                                        ; preds = %do.cond17, %do.body10
  %12 = load i32* %D1361, align 4
  %cmp12 = icmp ne i32 %12, 0
  br i1 %cmp12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %do.body11
  store i32 1, i32* %pdest, align 4
  store i32 0, i32* %D1361, align 4
  %13 = load i32* %k.addr, align 4
  %idxprom14 = sext i32 %13 to i64
  %arrayidx15 = getelementptr inbounds [1 x i32]* @W, i32 0, i64 %idxprom14
  store i32 0, i32* %arrayidx15, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %do.body11
  br label %do.cond17

do.cond17:                                        ; preds = %if.end16
  %14 = load i32* %p.addr, align 4
  %cmp18 = icmp slt i32 %14, 1
  br i1 %cmp18, label %do.body11, label %do.end19

do.end19:                                         ; preds = %do.cond17
  br label %do.cond20

do.cond20:                                        ; preds = %do.end19
  %15 = load i32* %k.addr, align 4
  %cmp21 = icmp sgt i32 %15, 0
  br i1 %cmp21, label %do.body10, label %do.end22

do.end22:                                         ; preds = %do.cond20
  br label %do.body23

do.body23:                                        ; preds = %do.cond35, %do.end22
  store i32 0, i32* %p.addr, align 4
  %16 = load i32* %k.addr, align 4
  %idxprom24 = sext i32 %16 to i64
  %arrayidx25 = getelementptr inbounds [1 x i32]* @Link, i32 0, i64 %idxprom24
  %17 = load i32* %arrayidx25, align 4
  store i32 %17, i32* %k.addr, align 4
  br label %while.cond26

while.cond26:                                     ; preds = %if.end33, %do.body23
  %18 = load i32* %p.addr, align 4
  %19 = load i32* %j, align 4
  %cmp27 = icmp slt i32 %18, %19
  br i1 %cmp27, label %while.body28, label %while.end34

while.body28:                                     ; preds = %while.cond26
  %20 = load i32* %k.addr, align 4
  %cmp29 = icmp ne i32 %20, -1
  br i1 %cmp29, label %if.then30, label %if.end33

if.then30:                                        ; preds = %while.body28
  %21 = load i32* %pdest, align 4
  %inc31 = add nsw i32 %21, 1
  store i32 %inc31, i32* %pdest, align 4
  %22 = load i32* %p.addr, align 4
  %inc32 = add nsw i32 %22, 1
  store i32 %inc32, i32* %p.addr, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.then30, %while.body28
  br label %while.cond26

while.end34:                                      ; preds = %while.cond26
  br label %do.cond35

do.cond35:                                        ; preds = %while.end34
  %23 = load i32* %k.addr, align 4
  %cmp36 = icmp ne i32 %23, -1
  br i1 %cmp36, label %do.body23, label %do.end37

do.end37:                                         ; preds = %do.cond35
  store i32 1, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then3
  %24 = load i32* %pdest, align 4
  ret i32 %24
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i32 0, i32 2)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
