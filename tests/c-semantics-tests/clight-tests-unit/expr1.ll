; ModuleID = '/home/david/src/c-semantics/tests/clight-tests-unit/expr1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.list = type { i32, %struct.list* }

@.str = private unnamed_addr constant [21 x i8] c"VOLATILE Result: %p\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"BUG\0A\00", align 1

define %struct.list* @f(%struct.list** %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.list**, align 8
  store %struct.list** %p, %struct.list*** %p.addr, align 8
  %0 = load %struct.list*** %p.addr, align 8
  %1 = load %struct.list** %0, align 8
  %tl = getelementptr inbounds %struct.list* %1, i32 0, i32 1
  store %struct.list* null, %struct.list** %tl, align 8
  ret %struct.list* null
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %l = alloca %struct.list, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %tl = getelementptr inbounds %struct.list* %l, i32 0, i32 1
  store %struct.list* %l, %struct.list** %tl, align 8
  %tl1 = getelementptr inbounds %struct.list* %l, i32 0, i32 1
  %call = call %struct.list* @f(%struct.list** %tl1)
  %tl2 = getelementptr inbounds %struct.list* %l, i32 0, i32 1
  %0 = load %struct.list** %tl2, align 8
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), %struct.list* %0)
  %tl4 = getelementptr inbounds %struct.list* %l, i32 0, i32 1
  %1 = load %struct.list** %tl4, align 8
  %cmp = icmp ne %struct.list* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 0
}

declare i32 @printf(i8*, ...)
