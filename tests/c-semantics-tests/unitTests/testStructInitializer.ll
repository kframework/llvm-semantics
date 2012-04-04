; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testStructInitializer.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i8* }
%struct.anon.0 = type { i8, [2 x i8] }
%struct.sa3b = type { %struct.sa3, [3 x i8] }
%struct.sa3 = type { i8, [0 x i8] }
%struct.anon.1 = type { i8, [2 x i8] }
%struct.anon.2 = type { i8, %struct.inner_Struct }
%struct.inner_Struct = type { i8, [2 x i8] }

@basicInit = global i32 5, align 4
@basicInit2 = global i8 10, align 1
@basicArr = global [2 x i32] [i32 15, i32 20], align 4
@.str = private unnamed_addr constant [3 x i8] c"62\00", align 1
@a1 = global %struct.anon { i8 52, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0) }, align 8
@a2 = global %struct.anon.0 { i8 118, [2 x i8] c"cq" }, align 1
@a3 = global %struct.sa3b { %struct.sa3 { i8 111, [0 x i8] zeroinitializer }, [3 x i8] c"wx\00" }, align 1
@a4 = global %struct.anon.1 { i8 57, [2 x i8] c"eb" }, align 1
@a5 = global %struct.anon.2 { i8 57, %struct.inner_Struct { i8 55, [2 x i8] c"zd" } }, align 1
@.str1 = private unnamed_addr constant [5 x i8] c"FAIL\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* @basicInit, align 4
  %cmp = icmp ne i32 %0, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8* @basicInit2, align 1
  %conv = sext i8 %1 to i32
  %cmp1 = icmp ne i32 %conv, 10
  br i1 %cmp1, label %if.then3, label %if.end5

if.then3:                                         ; preds = %if.end
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end5

if.end5:                                          ; preds = %if.then3, %if.end
  %2 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i32 0, i64 0), align 4
  %cmp6 = icmp ne i32 %2, 15
  br i1 %cmp6, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end5
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end5
  %3 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i32 0, i64 1), align 4
  %cmp11 = icmp ne i32 %3, 20
  br i1 %cmp11, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end10
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end10
  %4 = load i8* getelementptr inbounds (%struct.anon* @a1, i32 0, i32 0), align 1
  %conv16 = sext i8 %4 to i32
  %cmp17 = icmp ne i32 %conv16, 52
  br i1 %cmp17, label %if.then19, label %if.end21

if.then19:                                        ; preds = %if.end15
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %if.end15
  %5 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %arrayidx = getelementptr inbounds i8* %5, i64 0
  %6 = load i8* %arrayidx, align 1
  %conv22 = sext i8 %6 to i32
  %cmp23 = icmp ne i32 %conv22, 54
  br i1 %cmp23, label %if.then25, label %if.end27

if.then25:                                        ; preds = %if.end21
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end27

if.end27:                                         ; preds = %if.then25, %if.end21
  %7 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %arrayidx28 = getelementptr inbounds i8* %7, i64 1
  %8 = load i8* %arrayidx28, align 1
  %conv29 = sext i8 %8 to i32
  %cmp30 = icmp ne i32 %conv29, 50
  br i1 %cmp30, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.end27
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.end27
  %9 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %arrayidx35 = getelementptr inbounds i8* %9, i64 2
  %10 = load i8* %arrayidx35, align 1
  %conv36 = sext i8 %10 to i32
  %cmp37 = icmp ne i32 %conv36, 0
  br i1 %cmp37, label %if.then39, label %if.end41

if.then39:                                        ; preds = %if.end34
  %call40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end41

if.end41:                                         ; preds = %if.then39, %if.end34
  %11 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i32 0, i32 0), align 1
  %conv42 = sext i8 %11 to i32
  %cmp43 = icmp ne i32 %conv42, 118
  br i1 %cmp43, label %if.then45, label %if.end47

if.then45:                                        ; preds = %if.end41
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end47

if.end47:                                         ; preds = %if.then45, %if.end41
  %12 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i32 0, i32 1, i64 0), align 1
  %conv48 = sext i8 %12 to i32
  %cmp49 = icmp ne i32 %conv48, 99
  br i1 %cmp49, label %if.then51, label %if.end53

if.then51:                                        ; preds = %if.end47
  %call52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end53

if.end53:                                         ; preds = %if.then51, %if.end47
  %13 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i32 0, i32 1, i64 1), align 1
  %conv54 = sext i8 %13 to i32
  %cmp55 = icmp ne i32 %conv54, 113
  br i1 %cmp55, label %if.then57, label %if.end59

if.then57:                                        ; preds = %if.end53
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end59

if.end59:                                         ; preds = %if.then57, %if.end53
  %14 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 0, i32 0), align 1
  %conv60 = sext i8 %14 to i32
  %cmp61 = icmp ne i32 %conv60, 111
  br i1 %cmp61, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.end59
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end65

if.end65:                                         ; preds = %if.then63, %if.end59
  %15 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 1, i64 0), align 1
  %conv66 = sext i8 %15 to i32
  %cmp67 = icmp ne i32 %conv66, 119
  br i1 %cmp67, label %if.then69, label %if.end71

if.then69:                                        ; preds = %if.end65
  %call70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end71

if.end71:                                         ; preds = %if.then69, %if.end65
  %16 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 1, i64 1), align 1
  %conv72 = sext i8 %16 to i32
  %cmp73 = icmp ne i32 %conv72, 120
  br i1 %cmp73, label %if.then75, label %if.end77

if.then75:                                        ; preds = %if.end71
  %call76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end77

if.end77:                                         ; preds = %if.then75, %if.end71
  %17 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i32 0, i32 0), align 1
  %conv78 = sext i8 %17 to i32
  %cmp79 = icmp ne i32 %conv78, 57
  br i1 %cmp79, label %if.then81, label %if.end83

if.then81:                                        ; preds = %if.end77
  %call82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end83

if.end83:                                         ; preds = %if.then81, %if.end77
  %18 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i32 0, i32 1, i64 0), align 1
  %conv84 = sext i8 %18 to i32
  %cmp85 = icmp ne i32 %conv84, 101
  br i1 %cmp85, label %if.then87, label %if.end89

if.then87:                                        ; preds = %if.end83
  %call88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end89

if.end89:                                         ; preds = %if.then87, %if.end83
  %19 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i32 0, i32 1, i64 1), align 1
  %conv90 = sext i8 %19 to i32
  %cmp91 = icmp ne i32 %conv90, 98
  br i1 %cmp91, label %if.then93, label %if.end95

if.then93:                                        ; preds = %if.end89
  %call94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end95

if.end95:                                         ; preds = %if.then93, %if.end89
  ret i32 0
}

declare i32 @printf(i8*, ...)
