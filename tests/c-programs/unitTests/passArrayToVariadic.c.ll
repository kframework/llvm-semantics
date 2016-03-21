; ModuleID = './passArrayToVariadic.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@code = common global [5 x [3 x i8]] zeroinitializer, align 1
@.str = private unnamed_addr constant [10 x i8] c"%d%s%d%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i8 97, i8* getelementptr inbounds ([5 x [3 x i8]], [5 x [3 x i8]]* @code, i32 0, i64 2, i64 0), align 1
  store i8 98, i8* getelementptr inbounds ([5 x [3 x i8]], [5 x [3 x i8]]* @code, i32 0, i64 2, i64 1), align 1
  store i8 0, i8* getelementptr inbounds ([5 x [3 x i8]], [5 x [3 x i8]]* @code, i32 0, i64 2, i64 2), align 1
  store i32 2, i32* %i, align 4
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %i, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [5 x [3 x i8]], [5 x [3 x i8]]* @code, i32 0, i64 %4
  %6 = getelementptr inbounds [3 x i8], [3 x i8]* %5, i32 0, i32 0
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [5 x [3 x i8]], [5 x [3 x i8]]* @code, i32 0, i64 %9
  %11 = getelementptr inbounds [3 x i8], [3 x i8]* %10, i32 0, i32 0
  %12 = call i64 @strlen(i8* %11) #3
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 %2, i8* %6, i32 %7, i64 %12)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
