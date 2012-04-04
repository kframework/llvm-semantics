; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passArrayToVariadic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@code = common global [5 x [3 x i8]] zeroinitializer, align 1
@.str = private unnamed_addr constant [10 x i8] c"%d%s%d%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 97, i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i32 0, i64 2, i64 0), align 1
  store i8 98, i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i32 0, i64 2, i64 1), align 1
  store i8 0, i8* getelementptr inbounds ([5 x [3 x i8]]* @code, i32 0, i64 2, i64 2), align 1
  store i32 2, i32* %i, align 4
  %0 = load i32* %i, align 4
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [5 x [3 x i8]]* @code, i32 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [3 x i8]* %arrayidx, i32 0, i32 0
  %2 = load i32* %i, align 4
  %3 = load i32* %i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [5 x [3 x i8]]* @code, i32 0, i64 %idxprom1
  %arraydecay3 = getelementptr inbounds [3 x i8]* %arrayidx2, i32 0, i32 0
  %call = call i64 @strlen(i8* %arraydecay3) nounwind readonly
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %0, i8* %arraydecay, i32 %2, i64 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...)

declare i64 @strlen(i8*) nounwind readonly
