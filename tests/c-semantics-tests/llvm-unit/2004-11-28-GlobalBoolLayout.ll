; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2004-11-28-GlobalBoolLayout.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i8, [100 x i8] }

@G = global %struct.S { i8 1, i8 1, [100 x i8] c"fooo\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1
@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %X = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @strlen(i8* getelementptr inbounds (%struct.S* @G, i32 0, i32 2, i32 0)) nounwind readonly
  %conv = trunc i64 %call to i32
  store i32 %conv, i32* %X, align 4
  %0 = load i32* %X, align 4
  %cmp = icmp eq i32 %0, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds (%struct.S* @G, i32 0, i32 0), i8* getelementptr inbounds (%struct.S* @G, i32 0, i32 1))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i8* getelementptr inbounds (%struct.S* @G, i32 0, i32 0), align 1
  %tobool = trunc i8 %1 to i1
  %conv3 = zext i1 %tobool to i32
  %2 = load i8* getelementptr inbounds (%struct.S* @G, i32 0, i32 1), align 1
  %tobool4 = trunc i8 %2 to i1
  %conv5 = zext i1 %tobool4 to i32
  %3 = load i32* %X, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0), i32 %conv3, i32 %conv5, i32 %3)
  %4 = load i32* %X, align 4
  %sub = sub nsw i32 %4, 4
  ret i32 %sub
}

declare i64 @strlen(i8*) nounwind readonly

declare i32 @__isoc99_scanf(i8*, ...)

declare i32 @printf(i8*, ...)
