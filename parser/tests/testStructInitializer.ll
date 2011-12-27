; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testStructInitializer.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8, [2 x i8] }
%1 = type { i8, %0 }
%struct.anon = type { i8, i8* }
%struct.sa3 = type { i8, [0 x i8] }
%struct.sa3b = type { %struct.sa3, [3 x i8] }

@basicInit = global i32 5, align 4
@basicInit2 = global i8 10, align 1
@basicArr = global [2 x i32] [i32 15, i32 20], align 4
@.str = private unnamed_addr constant [3 x i8] c"62\00", align 1
@a1 = global %struct.anon { i8 52, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0) }, align 8
@a2 = global %0 { i8 118, [2 x i8] c"cq" }, align 1
@a3 = global %struct.sa3b { %struct.sa3 { i8 111, [0 x i8] zeroinitializer }, [3 x i8] c"wx\00" }, align 1
@a4 = global %0 { i8 57, [2 x i8] c"eb" }, align 1
@a5 = global %1 { i8 57, %0 { i8 55, [2 x i8] c"zd" } }, align 1
@.str1 = private unnamed_addr constant [5 x i8] c"FAIL\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load i32* @basicInit, align 4
  %cmp = icmp ne i32 %tmp, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp1 = load i8* @basicInit2, align 1
  %conv = sext i8 %tmp1 to i32
  %cmp2 = icmp ne i32 %conv, 10
  br i1 %cmp2, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %tmp7 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i32 0, i64 0), align 4
  %cmp8 = icmp ne i32 %tmp7, 15
  br i1 %cmp8, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end6
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end6
  %tmp13 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i32 0, i64 1), align 4
  %cmp14 = icmp ne i32 %tmp13, 20
  br i1 %cmp14, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end12
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end12
  %tmp19 = load i8* getelementptr inbounds (%struct.anon* @a1, i32 0, i32 0), align 1
  %conv20 = sext i8 %tmp19 to i32
  %cmp21 = icmp ne i32 %conv20, 52
  br i1 %cmp21, label %if.then23, label %if.end25

if.then23:                                        ; preds = %if.end18
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end25

if.end25:                                         ; preds = %if.then23, %if.end18
  %tmp26 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %arrayidx = getelementptr inbounds i8* %tmp26, i64 0
  %tmp27 = load i8* %arrayidx
  %conv28 = sext i8 %tmp27 to i32
  %cmp29 = icmp ne i32 %conv28, 54
  br i1 %cmp29, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.end25
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %if.end25
  %tmp34 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %arrayidx35 = getelementptr inbounds i8* %tmp34, i64 1
  %tmp36 = load i8* %arrayidx35
  %conv37 = sext i8 %tmp36 to i32
  %cmp38 = icmp ne i32 %conv37, 50
  br i1 %cmp38, label %if.then40, label %if.end42

if.then40:                                        ; preds = %if.end33
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end33
  %tmp43 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %arrayidx44 = getelementptr inbounds i8* %tmp43, i64 2
  %tmp45 = load i8* %arrayidx44
  %conv46 = sext i8 %tmp45 to i32
  %cmp47 = icmp ne i32 %conv46, 0
  br i1 %cmp47, label %if.then49, label %if.end51

if.then49:                                        ; preds = %if.end42
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end51

if.end51:                                         ; preds = %if.then49, %if.end42
  %tmp52 = load i8* getelementptr inbounds (%0* @a2, i32 0, i32 0), align 1
  %conv53 = sext i8 %tmp52 to i32
  %cmp54 = icmp ne i32 %conv53, 118
  br i1 %cmp54, label %if.then56, label %if.end58

if.then56:                                        ; preds = %if.end51
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end58

if.end58:                                         ; preds = %if.then56, %if.end51
  %tmp59 = load i8* getelementptr inbounds (%0* @a2, i32 0, i32 1, i64 0), align 1
  %conv60 = sext i8 %tmp59 to i32
  %cmp61 = icmp ne i32 %conv60, 99
  br i1 %cmp61, label %if.then63, label %if.end65

if.then63:                                        ; preds = %if.end58
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end65

if.end65:                                         ; preds = %if.then63, %if.end58
  %tmp66 = load i8* getelementptr inbounds (%0* @a2, i32 0, i32 1, i64 1), align 1
  %conv67 = sext i8 %tmp66 to i32
  %cmp68 = icmp ne i32 %conv67, 113
  br i1 %cmp68, label %if.then70, label %if.end72

if.then70:                                        ; preds = %if.end65
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end72

if.end72:                                         ; preds = %if.then70, %if.end65
  %tmp73 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 0, i32 0), align 1
  %conv74 = sext i8 %tmp73 to i32
  %cmp75 = icmp ne i32 %conv74, 111
  br i1 %cmp75, label %if.then77, label %if.end79

if.then77:                                        ; preds = %if.end72
  %call78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end79

if.end79:                                         ; preds = %if.then77, %if.end72
  %tmp80 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 1, i64 0), align 1
  %conv81 = sext i8 %tmp80 to i32
  %cmp82 = icmp ne i32 %conv81, 119
  br i1 %cmp82, label %if.then84, label %if.end86

if.then84:                                        ; preds = %if.end79
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end86

if.end86:                                         ; preds = %if.then84, %if.end79
  %tmp87 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 1, i64 1), align 1
  %conv88 = sext i8 %tmp87 to i32
  %cmp89 = icmp ne i32 %conv88, 120
  br i1 %cmp89, label %if.then91, label %if.end93

if.then91:                                        ; preds = %if.end86
  %call92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end93

if.end93:                                         ; preds = %if.then91, %if.end86
  %tmp94 = load i8* getelementptr inbounds (%0* @a4, i32 0, i32 0), align 1
  %conv95 = sext i8 %tmp94 to i32
  %cmp96 = icmp ne i32 %conv95, 57
  br i1 %cmp96, label %if.then98, label %if.end100

if.then98:                                        ; preds = %if.end93
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end100

if.end100:                                        ; preds = %if.then98, %if.end93
  %tmp101 = load i8* getelementptr inbounds (%0* @a4, i32 0, i32 1, i64 0), align 1
  %conv102 = sext i8 %tmp101 to i32
  %cmp103 = icmp ne i32 %conv102, 101
  br i1 %cmp103, label %if.then105, label %if.end107

if.then105:                                       ; preds = %if.end100
  %call106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end107

if.end107:                                        ; preds = %if.then105, %if.end100
  %tmp108 = load i8* getelementptr inbounds (%0* @a4, i32 0, i32 1, i64 1), align 1
  %conv109 = sext i8 %tmp108 to i32
  %cmp110 = icmp ne i32 %conv109, 98
  br i1 %cmp110, label %if.then112, label %if.end114

if.then112:                                       ; preds = %if.end107
  %call113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end114

if.end114:                                        ; preds = %if.then112, %if.end107
  ret i32 0
}

declare i32 @printf(i8*, ...)
