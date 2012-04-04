; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-05-02-DependentPHI.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.List = type { %struct.List*, i32 }

@Node0 = global { %struct.List*, i32, [4 x i8] } { %struct.List* null, i32 5, [4 x i8] undef }, align 8
@Node1 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node0 to %struct.List*), i32 4, [4 x i8] undef }, align 8
@Node2 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node1 to %struct.List*), i32 3, [4 x i8] undef }, align 8
@Node3 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node2 to %struct.List*), i32 2, [4 x i8] undef }, align 8
@Node4 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node3 to %struct.List*), i32 1, [4 x i8] undef }, align 8
@Node5 = global { %struct.List*, i32, [4 x i8] } { %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node4 to %struct.List*), i32 0, [4 x i8] undef }, align 8
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %PrevL = alloca %struct.List*, align 8
  %CurL = alloca %struct.List*, align 8
  store i32 0, i32* %retval
  store %struct.List* null, %struct.List** %PrevL, align 8
  store %struct.List* bitcast ({ %struct.List*, i32, [4 x i8] }* @Node5 to %struct.List*), %struct.List** %CurL, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.List** %CurL, align 8
  %tobool = icmp ne %struct.List* %0, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.List** %CurL, align 8
  %Data = getelementptr inbounds %struct.List* %1, i32 0, i32 1
  %2 = load i32* %Data, align 4
  %3 = load %struct.List** %PrevL, align 8
  %tobool1 = icmp ne %struct.List* %3, null
  br i1 %tobool1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %4 = load %struct.List** %PrevL, align 8
  %Data2 = getelementptr inbounds %struct.List* %4, i32 0, i32 1
  %5 = load i32* %Data2, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %5, %cond.true ], [ -1, %cond.false ]
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %cond)
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %6 = load %struct.List** %CurL, align 8
  store %struct.List* %6, %struct.List** %PrevL, align 8
  %7 = load %struct.List** %CurL, align 8
  %Next = getelementptr inbounds %struct.List* %7, i32 0, i32 0
  %8 = load %struct.List** %Next, align 8
  store %struct.List* %8, %struct.List** %CurL, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare i32 @printf(i8*, ...)
