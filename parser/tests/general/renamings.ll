; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/renamings.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@global_param_1 = global i32 5, align 4
@global_local_1 = global i32 5, align 4
@global_local_2 = global i32 5, align 4
@.str = private unnamed_addr constant [23 x i8] c"failed global_param_1\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"failed global_param_2\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"failed global_local_1\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"failed global_local_2\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"SUCCESS\0A\00", align 1

define i32 @f1(i32 %global_param_1) nounwind uwtable {
entry:
  %global_param_1.addr = alloca i32, align 4
  store i32 %global_param_1, i32* %global_param_1.addr, align 4
  %tmp = load i32* %global_param_1.addr, align 4
  ret i32 %tmp
}

define i32 @f2(i32 %global_param_2) nounwind uwtable {
entry:
  %global_param_2.addr = alloca i32, align 4
  store i32 %global_param_2, i32* %global_param_2.addr, align 4
  %tmp = load i32* %global_param_2.addr, align 4
  ret i32 %tmp
}

define i32 @g1() nounwind uwtable {
entry:
  %global_local_1 = alloca i32, align 4
  store i32 7, i32* %global_local_1, align 4
  %tmp = load i32* %global_local_1, align 4
  ret i32 %tmp
}

define i32 @g2() nounwind uwtable {
entry:
  %global_local_2 = alloca i32, align 4
  store i32 7, i32* %global_local_2, align 4
  %tmp = load i32* %global_local_2, align 4
  ret i32 %tmp
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %err = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %err, align 4
  %call = call i32 @f1(i32 7)
  %cmp = icmp ne i32 %call, 7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0))
  %tmp = load i32* %err, align 4
  %add = add nsw i32 %tmp, 1
  store i32 %add, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @f2(i32 7)
  %cmp3 = icmp ne i32 %call2, 7
  br i1 %cmp3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0))
  %tmp6 = load i32* %err, align 4
  %add7 = add nsw i32 %tmp6, 1
  store i32 %add7, i32* %err, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then4, %if.end
  %call9 = call i32 @g1()
  %cmp10 = icmp ne i32 %call9, 7
  br i1 %cmp10, label %if.then11, label %if.end15

if.then11:                                        ; preds = %if.end8
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0))
  %tmp13 = load i32* %err, align 4
  %add14 = add nsw i32 %tmp13, 1
  store i32 %add14, i32* %err, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then11, %if.end8
  %call16 = call i32 @g2()
  %cmp17 = icmp ne i32 %call16, 7
  br i1 %cmp17, label %if.then18, label %if.end22

if.then18:                                        ; preds = %if.end15
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  %tmp20 = load i32* %err, align 4
  %add21 = add nsw i32 %tmp20, 1
  store i32 %add21, i32* %err, align 4
  br label %if.end22

if.end22:                                         ; preds = %if.then18, %if.end15
  %tmp23 = load i32* %err, align 4
  %tobool = icmp ne i32 %tmp23, 0
  br i1 %tobool, label %if.end26, label %if.then24

if.then24:                                        ; preds = %if.end22
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0))
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.end22
  ret i32 0
}

declare i32 @printf(i8*, ...)
