; ModuleID = '/home/david/src/c-semantics/tests/integration/merge-sort.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %head = alloca i32*, align 8
  %curr = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32* null, i32** %head, align 8
  %0 = load i32** %head, align 8
  %call = call i32* @listCons(i32* %0, i32 20)
  store i32* %call, i32** %head, align 8
  %1 = load i32** %head, align 8
  %call1 = call i32* @listCons(i32* %1, i32 25)
  store i32* %call1, i32** %head, align 8
  %2 = load i32** %head, align 8
  %call2 = call i32* @listCons(i32* %2, i32 15)
  store i32* %call2, i32** %head, align 8
  %3 = load i32** %head, align 8
  %call3 = call i32* @listCons(i32* %3, i32 30)
  store i32* %call3, i32** %head, align 8
  %4 = load i32** %head, align 8
  %call4 = call i32* @listCons(i32* %4, i32 10)
  store i32* %call4, i32** %head, align 8
  %5 = load i32** %head, align 8
  %call5 = call i32* @listCons(i32* %5, i32 35)
  store i32* %call5, i32** %head, align 8
  %6 = load i32** %head, align 8
  %call6 = call i32* @fsl_mergesort(i32* %6)
  store i32* %call6, i32** %head, align 8
  %7 = load i32** %head, align 8
  store i32* %7, i32** %curr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %8 = load i32** %curr, align 8
  %cmp = icmp ne i32* %8, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i32** %curr, align 8
  %10 = load i32* %9, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %10)
  %11 = load i32** %curr, align 8
  %add.ptr = getelementptr inbounds i32* %11, i64 1
  %12 = bitcast i32* %add.ptr to i32**
  %13 = load i32** %12, align 8
  store i32* %13, i32** %curr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

define i32* @listCons(i32* %p, i32 %n) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %next = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %call = call noalias i8* @malloc(i64 12) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %next, align 8
  %1 = load i32* %n.addr, align 4
  %2 = load i32** %next, align 8
  store i32 %1, i32* %2, align 4
  %3 = load i32** %p.addr, align 8
  %4 = load i32** %next, align 8
  %add.ptr = getelementptr inbounds i32* %4, i64 1
  %5 = bitcast i32* %add.ptr to i32**
  store i32* %3, i32** %5, align 8
  %6 = load i32** %next, align 8
  ret i32* %6
}

define i32* @fsl_mergesort(i32* %l) nounwind uwtable {
entry:
  %l.addr = alloca i32*, align 8
  %a = alloca i32*, align 8
  %b = alloca i32*, align 8
  %e = alloca i32*, align 8
  %t = alloca i32*, align 8
  %h = alloca i32*, align 8
  store i32* %l, i32** %l.addr, align 8
  %0 = load i32** %l.addr, align 8
  %cmp = icmp ne i32* %0, null
  br i1 %cmp, label %land.lhs.true, label %if.end32

land.lhs.true:                                    ; preds = %entry
  %1 = load i32** %l.addr, align 8
  %add.ptr = getelementptr inbounds i32* %1, i64 1
  %2 = bitcast i32* %add.ptr to i32**
  %3 = load i32** %2, align 8
  %tobool = icmp ne i32* %3, null
  br i1 %tobool, label %if.then, label %if.end32

if.then:                                          ; preds = %land.lhs.true
  store i32* null, i32** %a, align 8
  store i32* null, i32** %b, align 8
  %4 = load i32** %l.addr, align 8
  %add.ptr1 = getelementptr inbounds i32* %4, i64 1
  %5 = bitcast i32* %add.ptr1 to i32**
  %6 = load i32** %5, align 8
  %7 = load i32* %6, align 4
  %8 = load i32** %l.addr, align 8
  %add.ptr2 = getelementptr inbounds i32* %8, i64 1
  %9 = bitcast i32* %add.ptr2 to i32**
  %10 = load i32** %9, align 8
  store i32 %7, i32* %10, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then
  %11 = load i32** %l.addr, align 8
  %cmp3 = icmp ne i32* %11, null
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %12 = load i32** %l.addr, align 8
  store i32* %12, i32** %e, align 8
  %13 = load i32** %e, align 8
  %add.ptr4 = getelementptr inbounds i32* %13, i64 1
  %14 = bitcast i32* %add.ptr4 to i32**
  %15 = load i32** %14, align 8
  store i32* %15, i32** %l.addr, align 8
  %16 = load i32** %a, align 8
  %17 = load i32** %e, align 8
  %add.ptr5 = getelementptr inbounds i32* %17, i64 1
  %18 = bitcast i32* %add.ptr5 to i32**
  store i32* %16, i32** %18, align 8
  %19 = load i32** %e, align 8
  store i32* %19, i32** %a, align 8
  %20 = load i32** %l.addr, align 8
  %cmp6 = icmp ne i32* %20, null
  br i1 %cmp6, label %if.then7, label %if.end

if.then7:                                         ; preds = %while.body
  %21 = load i32** %l.addr, align 8
  store i32* %21, i32** %e, align 8
  %22 = load i32** %e, align 8
  %add.ptr8 = getelementptr inbounds i32* %22, i64 1
  %23 = bitcast i32* %add.ptr8 to i32**
  %24 = load i32** %23, align 8
  store i32* %24, i32** %l.addr, align 8
  %25 = load i32** %b, align 8
  %26 = load i32** %e, align 8
  %add.ptr9 = getelementptr inbounds i32* %26, i64 1
  %27 = bitcast i32* %add.ptr9 to i32**
  store i32* %25, i32** %27, align 8
  %28 = load i32** %e, align 8
  store i32* %28, i32** %b, align 8
  br label %if.end

if.end:                                           ; preds = %if.then7, %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %29 = load i32** %a, align 8
  %call = call i32* @fsl_mergesort(i32* %29)
  store i32* %call, i32** %a, align 8
  %30 = load i32** %b, align 8
  %call10 = call i32* @fsl_mergesort(i32* %30)
  store i32* %call10, i32** %b, align 8
  store i32* null, i32** %h, align 8
  store i32* null, i32** %t, align 8
  br label %while.cond11

while.cond11:                                     ; preds = %if.end24, %while.end
  %31 = load i32** %a, align 8
  %cmp12 = icmp ne i32* %31, null
  br i1 %cmp12, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond11
  %32 = load i32** %b, align 8
  %cmp13 = icmp ne i32* %32, null
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond11
  %33 = phi i1 [ false, %while.cond11 ], [ %cmp13, %land.rhs ]
  br i1 %33, label %while.body14, label %while.end25

while.body14:                                     ; preds = %land.end
  %34 = load i32** %b, align 8
  %35 = load i32* %34, align 4
  %36 = load i32** %a, align 8
  %37 = load i32* %36, align 4
  %cmp15 = icmp sgt i32 %35, %37
  br i1 %cmp15, label %if.then16, label %if.else

if.then16:                                        ; preds = %while.body14
  %38 = load i32** %a, align 8
  store i32* %38, i32** %e, align 8
  %39 = load i32** %a, align 8
  %add.ptr17 = getelementptr inbounds i32* %39, i64 1
  %40 = bitcast i32* %add.ptr17 to i32**
  %41 = load i32** %40, align 8
  store i32* %41, i32** %a, align 8
  br label %if.end19

if.else:                                          ; preds = %while.body14
  %42 = load i32** %b, align 8
  store i32* %42, i32** %e, align 8
  %43 = load i32** %b, align 8
  %add.ptr18 = getelementptr inbounds i32* %43, i64 1
  %44 = bitcast i32* %add.ptr18 to i32**
  %45 = load i32** %44, align 8
  store i32* %45, i32** %b, align 8
  br label %if.end19

if.end19:                                         ; preds = %if.else, %if.then16
  %46 = load i32** %h, align 8
  %cmp20 = icmp ne i32* %46, null
  br i1 %cmp20, label %if.then21, label %if.else23

if.then21:                                        ; preds = %if.end19
  %47 = load i32** %e, align 8
  %48 = load i32** %t, align 8
  %add.ptr22 = getelementptr inbounds i32* %48, i64 1
  %49 = bitcast i32* %add.ptr22 to i32**
  store i32* %47, i32** %49, align 8
  br label %if.end24

if.else23:                                        ; preds = %if.end19
  %50 = load i32** %e, align 8
  store i32* %50, i32** %h, align 8
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then21
  %51 = load i32** %e, align 8
  store i32* %51, i32** %t, align 8
  br label %while.cond11

while.end25:                                      ; preds = %land.end
  %52 = load i32** %a, align 8
  %cmp26 = icmp ne i32* %52, null
  br i1 %cmp26, label %if.then27, label %if.else29

if.then27:                                        ; preds = %while.end25
  %53 = load i32** %a, align 8
  %54 = load i32** %t, align 8
  %add.ptr28 = getelementptr inbounds i32* %54, i64 1
  %55 = bitcast i32* %add.ptr28 to i32**
  store i32* %53, i32** %55, align 8
  br label %if.end31

if.else29:                                        ; preds = %while.end25
  %56 = load i32** %b, align 8
  %57 = load i32** %t, align 8
  %add.ptr30 = getelementptr inbounds i32* %57, i64 1
  %58 = bitcast i32* %add.ptr30 to i32**
  store i32* %56, i32** %58, align 8
  br label %if.end31

if.end31:                                         ; preds = %if.else29, %if.then27
  %59 = load i32** %h, align 8
  store i32* %59, i32** %l.addr, align 8
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %land.lhs.true, %entry
  %60 = load i32** %l.addr, align 8
  ret i32* %60
}

declare i32 @printf(i8*, ...)

declare noalias i8* @malloc(i64) nounwind
