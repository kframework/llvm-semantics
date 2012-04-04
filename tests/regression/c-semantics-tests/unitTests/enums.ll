; ModuleID = '/home/david/src/c-semantics/tests/unitTests/enums.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.globalStruct = type { i32 }

@.str = private unnamed_addr constant [9 x i8] c"*cp==%d\0A\00", align 1
@var = common global i32 0, align 4
@.str1 = private unnamed_addr constant [9 x i8] c"var==%d\0A\00", align 1
@aGlobalStruct = common global %struct.globalStruct zeroinitializer, align 4
@.str2 = private unnamed_addr constant [21 x i8] c"aGlobalStruct.a==%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %col = alloca i32, align 4
  %cp = alloca i32*, align 8
  %eint = alloca i32, align 4
  %echar = alloca i8, align 1
  %elli = alloca i64, align 8
  %foo = alloca i32, align 4
  %bar = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 20, i32* %col, align 4
  store i32* %col, i32** %cp, align 8
  %0 = load i32** %cp, align 8
  %1 = load i32* %0, align 4
  %cmp = icmp ne i32 %1, 20
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32** %cp, align 8
  %3 = load i32* %2, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32* %col, align 4
  store i32 %4, i32* %eint, align 4
  %5 = load i32* %col, align 4
  %conv = trunc i32 %5 to i8
  store i8 %conv, i8* %echar, align 1
  %6 = load i32* %col, align 4
  %conv1 = zext i32 %6 to i64
  store i64 %conv1, i64* %elli, align 8
  store i32 20, i32* %col, align 4
  store i32 20, i32* %col, align 4
  store i32 20, i32* %col, align 4
  store i32 20, i32* %foo, align 4
  store i32 20, i32* %bar, align 4
  store i32 21, i32* @var, align 4
  %7 = load i32* @var, align 4
  %cmp2 = icmp ne i32 %7, 21
  br i1 %cmp2, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %8 = load i32* @var, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %8)
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  store i32 0, i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %9 = load i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %cmp7 = icmp ne i32 %9, 0
  br i1 %cmp7, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end6
  %10 = load i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0), i32 %10)
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end6
  ret i32 0
}

declare i32 @printf(i8*, ...)
