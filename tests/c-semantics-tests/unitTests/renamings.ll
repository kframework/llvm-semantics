; ModuleID = '/home/david/src/c-semantics/tests/unitTests/renamings.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %0 = load i32* %global_param_1.addr, align 4
  ret i32 %0
}

define i32 @f2(i32 %global_param_2) nounwind uwtable {
entry:
  %global_param_2.addr = alloca i32, align 4
  store i32 %global_param_2, i32* %global_param_2.addr, align 4
  %0 = load i32* %global_param_2.addr, align 4
  ret i32 %0
}

define i32 @g1() nounwind uwtable {
entry:
  %global_local_1 = alloca i32, align 4
  store i32 7, i32* %global_local_1, align 4
  %0 = load i32* %global_local_1, align 4
  ret i32 %0
}

define i32 @g2() nounwind uwtable {
entry:
  %global_local_2 = alloca i32, align 4
  store i32 7, i32* %global_local_2, align 4
  %0 = load i32* %global_local_2, align 4
  ret i32 %0
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
  %0 = load i32* %err, align 4
  %add = add nsw i32 %0, 1
  store i32 %add, i32* %err, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call2 = call i32 @f2(i32 7)
  %cmp3 = icmp ne i32 %call2, 7
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0))
  %1 = load i32* %err, align 4
  %add6 = add nsw i32 %1, 1
  store i32 %add6, i32* %err, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  %call8 = call i32 @g1()
  %cmp9 = icmp ne i32 %call8, 7
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end7
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0))
  %2 = load i32* %err, align 4
  %add12 = add nsw i32 %2, 1
  store i32 %add12, i32* %err, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.end7
  %call14 = call i32 @g2()
  %cmp15 = icmp ne i32 %call14, 7
  br i1 %cmp15, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end13
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  %3 = load i32* %err, align 4
  %add18 = add nsw i32 %3, 1
  store i32 %add18, i32* %err, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %if.end13
  %4 = load i32* %err, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.end22, label %if.then20

if.then20:                                        ; preds = %if.end19
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end19
  ret i32 0
}

declare i32 @printf(i8*, ...)
