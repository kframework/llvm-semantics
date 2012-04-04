; ModuleID = '/home/david/src/c-semantics/tests/integration/structLinkedList.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %curr = alloca %struct.list_el*, align 8
  %head = alloca %struct.list_el*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store %struct.list_el* null, %struct.list_el** %head, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sle i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call noalias i8* @malloc(i64 16) nounwind
  %1 = bitcast i8* %call to %struct.list_el*
  store %struct.list_el* %1, %struct.list_el** %curr, align 8
  %2 = load i32* %i, align 4
  %3 = load %struct.list_el** %curr, align 8
  %val = getelementptr inbounds %struct.list_el* %3, i32 0, i32 0
  store i32 %2, i32* %val, align 4
  %4 = load %struct.list_el** %head, align 8
  %5 = load %struct.list_el** %curr, align 8
  %next = getelementptr inbounds %struct.list_el* %5, i32 0, i32 1
  store %struct.list_el* %4, %struct.list_el** %next, align 8
  %6 = load %struct.list_el** %curr, align 8
  store %struct.list_el* %6, %struct.list_el** %head, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load %struct.list_el** %head, align 8
  store %struct.list_el* %8, %struct.list_el** %curr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.end
  %9 = load %struct.list_el** %curr, align 8
  %tobool = icmp ne %struct.list_el* %9, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %10 = load %struct.list_el** %curr, align 8
  %val1 = getelementptr inbounds %struct.list_el* %10, i32 0, i32 0
  %11 = load i32* %val1, align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11)
  %12 = load %struct.list_el** %curr, align 8
  %next3 = getelementptr inbounds %struct.list_el* %12, i32 0, i32 1
  %13 = load %struct.list_el** %next3, align 8
  store %struct.list_el* %13, %struct.list_el** %curr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8*, ...)
