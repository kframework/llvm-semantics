; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/sprintf.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"%d, %x, %X\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%d: %s\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [300 x i8], align 16
  %retval1 = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call = call i32 (i8*, i8*, ...)* @sprintf(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call, i32* %retval1, align 4
  %tmp = load i32* %retval1, align 4
  %arraydecay2 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp, i8* %arraydecay2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @sprintf(i8*, i8*, ...) nounwind

declare i32 @printf(i8*, ...)
