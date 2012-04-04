; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931017-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@v = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind

define i32 @h1() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @h2(i32* %e) nounwind uwtable {
entry:
  %e.addr = alloca i32*, align 8
  store i32* %e, i32** %e.addr, align 8
  %0 = load i32** %e.addr, align 8
  %cmp = icmp ne i32* %0, @v
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @g(i8* %c) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %c, i8** %c.addr, align 8
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %call = call i32 @h1()
  store i32 %call, i32* %i, align 4
  %0 = load i32* %i, align 4
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  store i32 0, i32* %retval
  br label %return

if.else:                                          ; preds = %do.body
  %1 = load i32* %i, align 4
  %cmp1 = icmp eq i32 %1, 1
  br i1 %cmp1, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.else
  %call3 = call i32 @h1()
  br label %if.end

if.end:                                           ; preds = %if.then2, %if.else
  br label %if.end4

if.end4:                                          ; preds = %if.end
  br label %do.cond

do.cond:                                          ; preds = %if.end4
  %2 = load i32* %i, align 4
  %cmp5 = icmp eq i32 %2, 1
  br i1 %cmp5, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %do.body6

do.body6:                                         ; preds = %do.cond8, %do.end
  %call7 = call i32 (...)* bitcast (i32 (i32*)* @h2 to i32 (...)*)(i32* @v)
  store i32 %call7, i32* %b, align 4
  br label %do.cond8

do.cond8:                                         ; preds = %do.body6
  %3 = load i32* %i, align 4
  %cmp9 = icmp eq i32 %3, 5
  br i1 %cmp9, label %do.body6, label %do.end10

do.end10:                                         ; preds = %do.cond8
  %4 = load i32* %i, align 4
  %cmp11 = icmp ne i32 %4, 2
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %do.end10
  %5 = load i32* %b, align 4
  store i32 %5, i32* %retval
  br label %return

if.end13:                                         ; preds = %do.end10
  %6 = load i8** %c.addr, align 8
  store i8 97, i8* %6, align 1
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end13, %if.then12, %if.then
  %7 = load i32* %retval
  ret i32 %7
}

define void @f() nounwind uwtable {
entry:
  %c = alloca i8, align 1
  %call = call i32 (...)* bitcast (i32 (i8*)* @g to i32 (...)*)(i8* %c)
  ret void
}
