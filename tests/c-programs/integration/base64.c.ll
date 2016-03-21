; ModuleID = './base64.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b64 = global [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 16
@nbytes = global [4 x i32] [i32 3, i32 1, i32 1, i32 2], align 16
@.str = private unnamed_addr constant [25 x i8] c"TGl0ZXJhdGVQcm9ncmFtcw==\00", align 1

; Function Attrs: nounwind uwtable
define void @xlate(i8* %in, i32 %phase) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %out = alloca [3 x i8], align 1
  %i = alloca i32, align 4
  store i8* %in, i8** %1, align 8
  store i32 %phase, i32* %2, align 4
  %3 = load i8*, i8** %1, align 8
  %4 = getelementptr inbounds i8, i8* %3, i64 0
  %5 = load i8, i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = shl i32 %6, 2
  %8 = load i8*, i8** %1, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 1
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = ashr i32 %11, 4
  %13 = or i32 %7, %12
  %14 = trunc i32 %13 to i8
  %15 = getelementptr inbounds [3 x i8], [3 x i8]* %out, i32 0, i64 0
  store i8 %14, i8* %15, align 1
  %16 = load i8*, i8** %1, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 1
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = shl i32 %19, 4
  %21 = load i8*, i8** %1, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 2
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = ashr i32 %24, 2
  %26 = or i32 %20, %25
  %27 = trunc i32 %26 to i8
  %28 = getelementptr inbounds [3 x i8], [3 x i8]* %out, i32 0, i64 1
  store i8 %27, i8* %28, align 1
  %29 = load i8*, i8** %1, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 2
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = shl i32 %32, 6
  %34 = load i8*, i8** %1, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 3
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = ashr i32 %37, 0
  %39 = or i32 %33, %38
  %40 = trunc i32 %39 to i8
  %41 = getelementptr inbounds [3 x i8], [3 x i8]* %out, i32 0, i64 2
  store i8 %40, i8* %41, align 1
  store i32 0, i32* %i, align 4
  br label %42

; <label>:42                                      ; preds = %56, %0
  %43 = load i32, i32* %i, align 4
  %44 = load i32, i32* %2, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [4 x i32], [4 x i32]* @nbytes, i32 0, i64 %45
  %47 = load i32, i32* %46, align 4
  %48 = icmp slt i32 %43, %47
  br i1 %48, label %49, label %59

; <label>:49                                      ; preds = %42
  %50 = load i32, i32* %i, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [3 x i8], [3 x i8]* %out, i32 0, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = call i32 @putchar(i32 %54)
  br label %56

; <label>:56                                      ; preds = %49
  %57 = load i32, i32* %i, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %i, align 4
  br label %42

; <label>:59                                      ; preds = %42
  ret void
}

declare i32 @putchar(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca i32, align 4
  %phase = alloca i32, align 4
  %in = alloca [4 x i8], align 1
  %p = alloca i8*, align 8
  %input = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 0, i32* %phase, align 4
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0), i8** %input, align 8
  br label %2

; <label>:2                                       ; preds = %40, %0
  %3 = load i8*, i8** %input, align 8
  %4 = getelementptr inbounds i8, i8* %3, i32 1
  store i8* %4, i8** %input, align 8
  %5 = load i8, i8* %3, align 1
  %6 = sext i8 %5 to i32
  store i32 %6, i32* %c, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %41

; <label>:8                                       ; preds = %2
  %9 = load i32, i32* %c, align 4
  %10 = icmp eq i32 %9, 61
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %8
  %12 = getelementptr inbounds [4 x i8], [4 x i8]* %in, i32 0, i32 0
  %13 = load i32, i32* %phase, align 4
  call void @xlate(i8* %12, i32 %13)
  br label %41

; <label>:14                                      ; preds = %8
  %15 = load i32, i32* %c, align 4
  %16 = call i8* @strchr(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @b64, i32 0, i32 0), i32 %15) #3
  store i8* %16, i8** %p, align 8
  %17 = load i8*, i8** %p, align 8
  %18 = icmp ne i8* %17, null
  br i1 %18, label %19, label %40

; <label>:19                                      ; preds = %14
  %20 = load i8*, i8** %p, align 8
  %21 = ptrtoint i8* %20 to i64
  %22 = sub i64 %21, ptrtoint ([65 x i8]* @b64 to i64)
  %23 = trunc i64 %22 to i8
  %24 = load i32, i32* %phase, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [4 x i8], [4 x i8]* %in, i32 0, i64 %25
  store i8 %23, i8* %26, align 1
  %27 = load i32, i32* %phase, align 4
  %28 = add nsw i32 %27, 1
  %29 = srem i32 %28, 4
  store i32 %29, i32* %phase, align 4
  %30 = load i32, i32* %phase, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %39

; <label>:32                                      ; preds = %19
  %33 = getelementptr inbounds [4 x i8], [4 x i8]* %in, i32 0, i32 0
  %34 = load i32, i32* %phase, align 4
  call void @xlate(i8* %33, i32 %34)
  %35 = getelementptr inbounds [4 x i8], [4 x i8]* %in, i32 0, i64 3
  store i8 0, i8* %35, align 1
  %36 = getelementptr inbounds [4 x i8], [4 x i8]* %in, i32 0, i64 2
  store i8 0, i8* %36, align 1
  %37 = getelementptr inbounds [4 x i8], [4 x i8]* %in, i32 0, i64 1
  store i8 0, i8* %37, align 1
  %38 = getelementptr inbounds [4 x i8], [4 x i8]* %in, i32 0, i64 0
  store i8 0, i8* %38, align 1
  br label %39

; <label>:39                                      ; preds = %32, %19
  br label %40

; <label>:40                                      ; preds = %39, %14
  br label %2

; <label>:41                                      ; preds = %11, %2
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
