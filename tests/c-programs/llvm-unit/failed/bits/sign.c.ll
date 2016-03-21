; ModuleID = './sign.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"x = %d, ux = %u, y=%d, uy = %u\0A\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"z=%d, uz=%u\0A\00", align 1

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
  %6 = sub nsw i32 %5, 1804289384
  store i32 %6, i32* %r, align 4
  %7 = load i32, i32* %r, align 4
  store i32 %7, i32* %y, align 4
  %8 = load i32, i32* %r, align 4
  store i32 %8, i32* %uy, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp sgt i32 %9, 1
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %0
  %12 = load i8**, i8*** %3, align 8
  %13 = getelementptr inbounds i8*, i8** %12, i64 1
  %14 = load i8*, i8** %13, align 8
  %15 = call i32 (i8*, ...) bitcast (i32 (...)* @atoi to i32 (i8*, ...)*)(i8* %14)
  store i32 %15, i32* %num, align 4
  br label %16

; <label>:16                                      ; preds = %11, %0
  %17 = load i32, i32* %num, align 4
  %18 = sub nsw i32 %17, 14638709
  store i32 %18, i32* %num, align 4
  %19 = load i32, i32* %num, align 4
  store i32 %19, i32* %x, align 4
  %20 = load i32, i32* %num, align 4
  store i32 %20, i32* %ux, align 4
  %21 = load i32, i32* %x, align 4
  %22 = load i32, i32* %ux, align 4
  %23 = load i32, i32* %y, align 4
  %24 = load i32, i32* %uy, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0), i32 %21, i32 %22, i32 %23, i32 %24)
  %26 = load i32, i32* %x, align 4
  %27 = load i32, i32* %y, align 4
  %28 = mul nsw i32 %26, %27
  store i32 %28, i32* %z, align 4
  %29 = load i32, i32* %ux, align 4
  %30 = load i32, i32* %uy, align 4
  %31 = mul i32 %29, %30
  store i32 %31, i32* %uz, align 4
  %32 = load i32, i32* %z, align 4
  %33 = load i32, i32* %uz, align 4
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 %32, i32 %33)
  %35 = load i32, i32* %x, align 4
  %36 = srem i32 %35, 314
  store i32 %36, i32* %z, align 4
  %37 = load i32, i32* %ux, align 4
  %38 = urem i32 %37, 314
  store i32 %38, i32* %uz, align 4
  %39 = load i32, i32* %z, align 4
  %40 = load i32, i32* %uz, align 4
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 %39, i32 %40)
  %42 = load i32, i32* %x, align 4
  %43 = sdiv i32 %42, 314
  store i32 %43, i32* %z, align 4
  %44 = load i32, i32* %ux, align 4
  %45 = udiv i32 %44, 314
  store i32 %45, i32* %uz, align 4
  %46 = load i32, i32* %z, align 4
  %47 = load i32, i32* %uz, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 %46, i32 %47)
  %49 = load i32, i32* %x, align 4
  %50 = add nsw i32 %49, 3880
  %51 = sdiv i32 %50, 314
  store i32 %51, i32* %z, align 4
  %52 = load i32, i32* %ux, align 4
  %53 = add i32 %52, 3880
  %54 = udiv i32 %53, 314
  store i32 %54, i32* %uz, align 4
  %55 = load i32, i32* %z, align 4
  %56 = load i32, i32* %uz, align 4
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 %55, i32 %56)
  %58 = load i32, i32* %x, align 4
  %59 = sub nsw i32 %58, 580
  %60 = sdiv i32 %59, 314
  store i32 %60, i32* %z, align 4
  %61 = load i32, i32* %ux, align 4
  %62 = sub i32 %61, 580
  %63 = udiv i32 %62, 314
  store i32 %63, i32* %uz, align 4
  %64 = load i32, i32* %z, align 4
  %65 = load i32, i32* %uz, align 4
  %66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i32 0, i32 0), i32 %64, i32 %65)
  ret i32 0
}

declare i32 @rand(...) #1

declare i32 @atoi(...) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
