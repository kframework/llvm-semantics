; ModuleID = '/home/david/src/c-semantics/tests/unitTests/refOfDeref.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"1\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"2\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"3\0A\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"4\0A\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"5\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  %0 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 20, i32 16, i1 false)
  %1 = load i32** %p, align 8
  %2 = load i32** %p, align 8
  %cmp = icmp eq i32* %1, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  %3 = load i32* %retval
  ret i32 %3
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
