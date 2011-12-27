; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/enums.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32** %cp, align 8
  %tmp1 = load i32* %tmp
  %cmp = icmp ne i32 %tmp1, 20
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp2 = load i32** %cp, align 8
  %tmp3 = load i32* %tmp2
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %tmp3)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp5 = load i32* %col, align 4
  store i32 %tmp5, i32* %eint, align 4
  %tmp7 = load i32* %col, align 4
  %conv = trunc i32 %tmp7 to i8
  store i8 %conv, i8* %echar, align 1
  %tmp9 = load i32* %col, align 4
  %conv10 = zext i32 %tmp9 to i64
  store i64 %conv10, i64* %elli, align 8
  store i32 20, i32* %col, align 4
  store i32 20, i32* %col, align 4
  store i32 20, i32* %col, align 4
  store i32 20, i32* %foo, align 4
  store i32 20, i32* %bar, align 4
  store i32 21, i32* @var, align 4
  %tmp13 = load i32* @var, align 4
  %cmp14 = icmp ne i32 %tmp13, 21
  br i1 %cmp14, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end
  %tmp17 = load i32* @var, align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %tmp17)
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %if.end
  store i32 0, i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %tmp20 = load i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %cmp21 = icmp ne i32 %tmp20, 0
  br i1 %cmp21, label %if.then23, label %if.end26

if.then23:                                        ; preds = %if.end19
  %tmp24 = load i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0), i32 %tmp24)
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %if.end19
  ret i32 0
}

declare i32 @printf(i8*, ...)
