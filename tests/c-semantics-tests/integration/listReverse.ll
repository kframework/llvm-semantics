; ModuleID = '/home/david/src/c-semantics/tests/integration/listReverse.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %head = alloca i32*, align 8
  %curr = alloca i32*, align 8
  %sum1 = alloca i32, align 4
  %first = alloca i32, align 4
  %last = alloca i32, align 4
  %sum2 = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %head, align 8
  %1 = load i32** %head, align 8
  store i32 20, i32* %1, align 4
  %2 = load i32** %head, align 8
  %add.ptr = getelementptr inbounds i32* %2, i64 1
  %3 = bitcast i32* %add.ptr to i32**
  store i32* null, i32** %3, align 8
  %4 = load i32** %head, align 8
  %call1 = call i32* @listAppend(i32* %4, i32 25)
  %5 = load i32** %head, align 8
  %call2 = call i32* @listAppend(i32* %5, i32 15)
  %6 = load i32** %head, align 8
  %call3 = call i32* @listAppend(i32* %6, i32 30)
  %7 = load i32** %head, align 8
  %call4 = call i32* @listAppend(i32* %7, i32 10)
  %8 = load i32** %head, align 8
  %call5 = call i32* @listAppend(i32* %8, i32 35)
  %9 = load i32** %head, align 8
  store i32* %9, i32** %curr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %10 = load i32** %curr, align 8
  %cmp = icmp ne i32* %10, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %11 = load i32** %curr, align 8
  %12 = load i32* %11, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %12)
  %13 = load i32** %curr, align 8
  %add.ptr7 = getelementptr inbounds i32* %13, i64 1
  %14 = bitcast i32* %add.ptr7 to i32**
  %15 = load i32** %14, align 8
  store i32* %15, i32** %curr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %16 = load i32** %head, align 8
  %call9 = call i32 @listSum(i32* %16)
  store i32 %call9, i32* %sum1, align 4
  %17 = load i32** %head, align 8
  %18 = load i32* %17, align 4
  store i32 %18, i32* %first, align 4
  %19 = load i32** %head, align 8
  %call10 = call i32* @listReverse(i32* %19)
  store i32* %call10, i32** %head, align 8
  %20 = load i32** %head, align 8
  store i32* %20, i32** %curr, align 8
  br label %while.cond11

while.cond11:                                     ; preds = %while.body13, %while.end
  %21 = load i32** %curr, align 8
  %cmp12 = icmp ne i32* %21, null
  br i1 %cmp12, label %while.body13, label %while.end16

while.body13:                                     ; preds = %while.cond11
  %22 = load i32** %curr, align 8
  %23 = load i32* %22, align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %23)
  %24 = load i32** %curr, align 8
  %add.ptr15 = getelementptr inbounds i32* %24, i64 1
  %25 = bitcast i32* %add.ptr15 to i32**
  %26 = load i32** %25, align 8
  store i32* %26, i32** %curr, align 8
  br label %while.cond11

while.end16:                                      ; preds = %while.cond11
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %27 = load i32** %head, align 8
  %28 = load i32* %27, align 4
  store i32 %28, i32* %last, align 4
  %29 = load i32** %head, align 8
  %call18 = call i32 @listSum(i32* %29)
  store i32 %call18, i32* %sum2, align 4
  %30 = load i32* %sum1, align 4
  %31 = load i32* %sum2, align 4
  %sub = sub nsw i32 %30, %31
  %32 = load i32* %last, align 4
  %33 = load i32* %first, align 4
  %sub19 = sub nsw i32 %32, %33
  %add = add nsw i32 %sub, %sub19
  ret i32 %add
}

declare noalias i8* @malloc(i64) nounwind

define i32* @listAppend(i32* %p, i32 %n) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %x = alloca i32*, align 8
  %next = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32** %p.addr, align 8
  %cmp = icmp ne i32* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32** %p.addr, align 8
  store i32* %1, i32** %x, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %2 = load i32** %x, align 8
  %add.ptr = getelementptr inbounds i32* %2, i64 1
  %3 = bitcast i32* %add.ptr to i32**
  %4 = load i32** %3, align 8
  %cmp1 = icmp ne i32* %4, null
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load i32** %x, align 8
  %add.ptr2 = getelementptr inbounds i32* %5, i64 1
  %6 = bitcast i32* %add.ptr2 to i32**
  %7 = load i32** %6, align 8
  store i32* %7, i32** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call = call noalias i8* @malloc(i64 12) nounwind
  %8 = bitcast i8* %call to i32*
  store i32* %8, i32** %next, align 8
  %9 = load i32** %next, align 8
  %10 = load i32** %x, align 8
  %add.ptr3 = getelementptr inbounds i32* %10, i64 1
  %11 = bitcast i32* %add.ptr3 to i32**
  store i32* %9, i32** %11, align 8
  %12 = load i32* %n.addr, align 4
  %13 = load i32** %next, align 8
  store i32 %12, i32* %13, align 4
  %14 = load i32** %next, align 8
  %add.ptr4 = getelementptr inbounds i32* %14, i64 1
  %15 = bitcast i32* %add.ptr4 to i32**
  store i32* null, i32** %15, align 8
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %16 = load i32** %p.addr, align 8
  ret i32* %16
}

declare i32 @printf(i8*, ...)

define i32 @listSum(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %sum = alloca i32, align 4
  %x = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32 0, i32* %sum, align 4
  %0 = load i32** %p.addr, align 8
  %cmp = icmp ne i32* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32** %p.addr, align 8
  store i32* %1, i32** %x, align 8
  %2 = load i32** %x, align 8
  %3 = load i32* %2, align 4
  %4 = load i32* %sum, align 4
  %add = add nsw i32 %4, %3
  store i32 %add, i32* %sum, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %5 = load i32** %x, align 8
  %add.ptr = getelementptr inbounds i32* %5, i64 1
  %6 = bitcast i32* %add.ptr to i32**
  %7 = load i32** %6, align 8
  %cmp1 = icmp ne i32* %7, null
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i32** %x, align 8
  %add.ptr2 = getelementptr inbounds i32* %8, i64 1
  %9 = bitcast i32* %add.ptr2 to i32**
  %10 = load i32** %9, align 8
  store i32* %10, i32** %x, align 8
  %11 = load i32** %x, align 8
  %12 = load i32* %11, align 4
  %13 = load i32* %sum, align 4
  %add3 = add nsw i32 %13, %12
  store i32 %add3, i32* %sum, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %14 = load i32* %sum, align 4
  ret i32 %14
}

define i32* @listReverse(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %x = alloca i32*, align 8
  %tmp = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  %cmp = icmp ne i32* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32** %p.addr, align 8
  %add.ptr = getelementptr inbounds i32* %1, i64 1
  %2 = bitcast i32* %add.ptr to i32**
  %3 = load i32** %2, align 8
  store i32* %3, i32** %x, align 8
  %4 = load i32** %p.addr, align 8
  %add.ptr1 = getelementptr inbounds i32* %4, i64 1
  %5 = bitcast i32* %add.ptr1 to i32**
  store i32* null, i32** %5, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %6 = load i32** %x, align 8
  %cmp2 = icmp ne i32* %6, null
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i32** %x, align 8
  %add.ptr3 = getelementptr inbounds i32* %7, i64 1
  %8 = bitcast i32* %add.ptr3 to i32**
  %9 = load i32** %8, align 8
  store i32* %9, i32** %tmp, align 8
  %10 = load i32** %p.addr, align 8
  %11 = load i32** %x, align 8
  %add.ptr4 = getelementptr inbounds i32* %11, i64 1
  %12 = bitcast i32* %add.ptr4 to i32**
  store i32* %10, i32** %12, align 8
  %13 = load i32** %x, align 8
  store i32* %13, i32** %p.addr, align 8
  %14 = load i32** %tmp, align 8
  store i32* %14, i32** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %15 = load i32** %p.addr, align 8
  ret i32* %15
}
