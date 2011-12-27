; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/compare2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"equal\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"neq\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [2 x i32], align 4
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [2 x i32]* %a, i32 0, i64 0
  %arrayidx1 = getelementptr inbounds [2 x i32]* %a, i32 0, i64 2
  %cmp = icmp eq i32* %arrayidx, %arrayidx1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
