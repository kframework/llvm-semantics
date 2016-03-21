; ModuleID = './sign2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"rand() = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"ux = %u, x = %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"uz = %u, z = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"uy = %u, y = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %num = alloca i32, align 4
  %r = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %ux = alloca i32, align 4
  %uy = alloca i32, align 4
  %uz = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 (...) @rand()
  store i32 %4, i32* %r, align 4
  %5 = load i32, i32* %r, align 4
  store i32 %5, i32* %ux, align 4
  %6 = load i32, i32* %r, align 4
  store i32 %6, i32* %x, align 4
  %7 = load i32, i32* %r, align 4
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %7)
  %9 = load i32, i32* %ux, align 4
  %10 = load i32, i32* %x, align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0), i32 %9, i32 %10)
  %12 = load i32, i32* %x, align 4
  %13 = sdiv i32 %12, 4321
  store i32 %13, i32* %z, align 4
  %14 = load i32, i32* %ux, align 4
  %15 = udiv i32 %14, 4321
  store i32 %15, i32* %uz, align 4
  %16 = load i32, i32* %uz, align 4
  %17 = load i32, i32* %z, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i32 0, i32 0), i32 %16, i32 %17)
  %19 = load i32, i32* %x, align 4
  %20 = add nsw i32 %19, 8388608
  store i32 %20, i32* %y, align 4
  %21 = load i32, i32* %x, align 4
  %22 = add i32 %21, 8388608
  store i32 %22, i32* %uy, align 4
  %23 = load i32, i32* %uy, align 4
  %24 = load i32, i32* %y, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0), i32 %23, i32 %24)
  %26 = load i32, i32* %y, align 4
  %27 = load i32, i32* %x, align 4
  %28 = sdiv i32 %26, %27
  store i32 %28, i32* %z, align 4
  %29 = load i32, i32* %uy, align 4
  %30 = load i32, i32* %ux, align 4
  %31 = udiv i32 %29, %30
  store i32 %31, i32* %uz, align 4
  %32 = load i32, i32* %uz, align 4
  %33 = load i32, i32* %z, align 4
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0), i32 %32, i32 %33)
  %35 = load i32, i32* %x, align 4
  %36 = load i32, i32* %y, align 4
  %37 = sdiv i32 %35, %36
  store i32 %37, i32* %z, align 4
  %38 = load i32, i32* %ux, align 4
  %39 = load i32, i32* %uy, align 4
  %40 = udiv i32 %38, %39
  store i32 %40, i32* %uz, align 4
  %41 = load i32, i32* %uz, align 4
  %42 = load i32, i32* %z, align 4
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0), i32 %41, i32 %42)
  ret i32 0
}

declare i32 @rand(...) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
