; ModuleID = '/home/david/src/c-semantics/tests/integration/reverse.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define %struct.list_el* @listAppend(%struct.list_el* %p, i32 %n) nounwind uwtable {
entry:
  %p.addr = alloca %struct.list_el*, align 8
  %n.addr = alloca i32, align 4
  %x = alloca %struct.list_el*, align 8
  %next4 = alloca %struct.list_el*, align 8
  store %struct.list_el* %p, %struct.list_el** %p.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = load %struct.list_el** %p.addr, align 8
  %cmp = icmp eq %struct.list_el* %0, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 16) nounwind
  %1 = bitcast i8* %call to %struct.list_el*
  store %struct.list_el* %1, %struct.list_el** %p.addr, align 8
  %2 = load i32* %n.addr, align 4
  %3 = load %struct.list_el** %p.addr, align 8
  %val = getelementptr inbounds %struct.list_el* %3, i32 0, i32 0
  store i32 %2, i32* %val, align 4
  %4 = load %struct.list_el** %p.addr, align 8
  %next = getelementptr inbounds %struct.list_el* %4, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %next, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %5 = load %struct.list_el** %p.addr, align 8
  store %struct.list_el* %5, %struct.list_el** %x, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else
  %6 = load %struct.list_el** %x, align 8
  %next1 = getelementptr inbounds %struct.list_el* %6, i32 0, i32 1
  %7 = load %struct.list_el** %next1, align 8
  %cmp2 = icmp ne %struct.list_el* %7, null
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load %struct.list_el** %x, align 8
  %next3 = getelementptr inbounds %struct.list_el* %8, i32 0, i32 1
  %9 = load %struct.list_el** %next3, align 8
  store %struct.list_el* %9, %struct.list_el** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call5 = call noalias i8* @malloc(i64 16) nounwind
  %10 = bitcast i8* %call5 to %struct.list_el*
  store %struct.list_el* %10, %struct.list_el** %next4, align 8
  %11 = load %struct.list_el** %next4, align 8
  %12 = load %struct.list_el** %x, align 8
  %next6 = getelementptr inbounds %struct.list_el* %12, i32 0, i32 1
  store %struct.list_el* %11, %struct.list_el** %next6, align 8
  %13 = load i32* %n.addr, align 4
  %14 = load %struct.list_el** %next4, align 8
  %val7 = getelementptr inbounds %struct.list_el* %14, i32 0, i32 0
  store i32 %13, i32* %val7, align 4
  %15 = load %struct.list_el** %next4, align 8
  %next8 = getelementptr inbounds %struct.list_el* %15, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %next8, align 8
  br label %if.end

if.end:                                           ; preds = %while.end, %if.then
  %16 = load %struct.list_el** %p.addr, align 8
  ret %struct.list_el* %16
}

declare noalias i8* @malloc(i64) nounwind

define %struct.list_el* @listReverse(%struct.list_el* %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.list_el*, align 8
  %x = alloca %struct.list_el*, align 8
  %tmp = alloca %struct.list_el*, align 8
  store %struct.list_el* %p, %struct.list_el** %p.addr, align 8
  %0 = load %struct.list_el** %p.addr, align 8
  %cmp = icmp ne %struct.list_el* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct.list_el** %p.addr, align 8
  %next = getelementptr inbounds %struct.list_el* %1, i32 0, i32 1
  %2 = load %struct.list_el** %next, align 8
  store %struct.list_el* %2, %struct.list_el** %x, align 8
  %3 = load %struct.list_el** %p.addr, align 8
  %next1 = getelementptr inbounds %struct.list_el* %3, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %next1, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %4 = load %struct.list_el** %x, align 8
  %cmp2 = icmp ne %struct.list_el* %4, null
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load %struct.list_el** %x, align 8
  %next3 = getelementptr inbounds %struct.list_el* %5, i32 0, i32 1
  %6 = load %struct.list_el** %next3, align 8
  store %struct.list_el* %6, %struct.list_el** %tmp, align 8
  %7 = load %struct.list_el** %p.addr, align 8
  %8 = load %struct.list_el** %x, align 8
  %next4 = getelementptr inbounds %struct.list_el* %8, i32 0, i32 1
  store %struct.list_el* %7, %struct.list_el** %next4, align 8
  %9 = load %struct.list_el** %x, align 8
  store %struct.list_el* %9, %struct.list_el** %p.addr, align 8
  %10 = load %struct.list_el** %tmp, align 8
  store %struct.list_el* %10, %struct.list_el** %x, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %if.end

if.end:                                           ; preds = %while.end, %entry
  %11 = load %struct.list_el** %p.addr, align 8
  ret %struct.list_el* %11
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %head = alloca %struct.list_el*, align 8
  %curr = alloca %struct.list_el*, align 8
  %first = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call %struct.list_el* @listAppend(%struct.list_el* null, i32 20)
  store %struct.list_el* %call, %struct.list_el** %head, align 8
  %0 = load %struct.list_el** %head, align 8
  %call1 = call %struct.list_el* @listAppend(%struct.list_el* %0, i32 25)
  %1 = load %struct.list_el** %head, align 8
  %call2 = call %struct.list_el* @listAppend(%struct.list_el* %1, i32 15)
  %2 = load %struct.list_el** %head, align 8
  %call3 = call %struct.list_el* @listAppend(%struct.list_el* %2, i32 30)
  %3 = load %struct.list_el** %head, align 8
  %call4 = call %struct.list_el* @listAppend(%struct.list_el* %3, i32 10)
  %4 = load %struct.list_el** %head, align 8
  %call5 = call %struct.list_el* @listAppend(%struct.list_el* %4, i32 35)
  %5 = load %struct.list_el** %head, align 8
  store %struct.list_el* %5, %struct.list_el** %curr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %6 = load %struct.list_el** %curr, align 8
  %cmp = icmp ne %struct.list_el* %6, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load %struct.list_el** %curr, align 8
  %val = getelementptr inbounds %struct.list_el* %7, i32 0, i32 0
  %8 = load i32* %val, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %8)
  %9 = load %struct.list_el** %curr, align 8
  %next = getelementptr inbounds %struct.list_el* %9, i32 0, i32 1
  %10 = load %struct.list_el** %next, align 8
  store %struct.list_el* %10, %struct.list_el** %curr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %11 = load %struct.list_el** %head, align 8
  %val8 = getelementptr inbounds %struct.list_el* %11, i32 0, i32 0
  %12 = load i32* %val8, align 4
  store i32 %12, i32* %first, align 4
  %13 = load %struct.list_el** %head, align 8
  %call9 = call %struct.list_el* @listReverse(%struct.list_el* %13)
  store %struct.list_el* %call9, %struct.list_el** %head, align 8
  %14 = load %struct.list_el** %head, align 8
  store %struct.list_el* %14, %struct.list_el** %curr, align 8
  br label %while.cond10

while.cond10:                                     ; preds = %while.body12, %while.end
  %15 = load %struct.list_el** %curr, align 8
  %cmp11 = icmp ne %struct.list_el* %15, null
  br i1 %cmp11, label %while.body12, label %while.end16

while.body12:                                     ; preds = %while.cond10
  %16 = load %struct.list_el** %curr, align 8
  %val13 = getelementptr inbounds %struct.list_el* %16, i32 0, i32 0
  %17 = load i32* %val13, align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %17)
  %18 = load %struct.list_el** %curr, align 8
  %next15 = getelementptr inbounds %struct.list_el* %18, i32 0, i32 1
  %19 = load %struct.list_el** %next15, align 8
  store %struct.list_el* %19, %struct.list_el** %curr, align 8
  br label %while.cond10

while.end16:                                      ; preds = %while.cond10
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...)
