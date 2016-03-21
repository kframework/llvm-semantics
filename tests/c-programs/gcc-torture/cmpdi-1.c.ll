; ModuleID = './cmpdi-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@args = global [8 x i64] [i64 0, i64 1, i64 -1, i64 9223372036854775807, i64 -9223372036854775808, i64 -9223372036854775807, i64 1891269347843992664, i64 -7816825554603336956], align 16
@correct_results = global [640 x i32] [i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13], align 16

; Function Attrs: nounwind uwtable
define i32 @feq(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp eq i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fne(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp ne i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @flt(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp slt i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fge(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp sge i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fgt(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp sgt i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fle(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp sle i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fltu(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp ult i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fgeu(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp uge i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fgtu(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp ugt i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @fleu(i64 %x, i64 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  store i64 %y, i64* %3, align 8
  %4 = load i64, i64* %2, align 8
  %5 = load i64, i64* %3, align 8
  %6 = icmp ule i64 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 13, i32* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i32 140, i32* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %res = alloca i32*, align 8
  %arg0 = alloca i64, align 8
  %arg1 = alloca i64, align 8
  store i32 0, i32* %1
  store i32* getelementptr inbounds ([640 x i32], [640 x i32]* @correct_results, i32 0, i32 0), i32** %res, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %112, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %115

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x i64], [8 x i64]* @args, i32 0, i64 %7
  %9 = load i64, i64* %8, align 8
  store i64 %9, i64* %arg0, align 8
  store i32 0, i32* %j, align 4
  br label %10

; <label>:10                                      ; preds = %108, %5
  %11 = load i32, i32* %j, align 4
  %12 = icmp slt i32 %11, 8
  br i1 %12, label %13, label %111

; <label>:13                                      ; preds = %10
  %14 = load i32, i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [8 x i64], [8 x i64]* @args, i32 0, i64 %15
  %17 = load i64, i64* %16, align 8
  store i64 %17, i64* %arg1, align 8
  %18 = load i64, i64* %arg0, align 8
  %19 = load i64, i64* %arg1, align 8
  %20 = call i32 @feq(i64 %18, i64 %19)
  %21 = load i32*, i32** %res, align 8
  %22 = getelementptr inbounds i32, i32* %21, i32 1
  store i32* %22, i32** %res, align 8
  %23 = load i32, i32* %21, align 4
  %24 = icmp ne i32 %20, %23
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %13
  %27 = load i64, i64* %arg0, align 8
  %28 = load i64, i64* %arg1, align 8
  %29 = call i32 @fne(i64 %27, i64 %28)
  %30 = load i32*, i32** %res, align 8
  %31 = getelementptr inbounds i32, i32* %30, i32 1
  store i32* %31, i32** %res, align 8
  %32 = load i32, i32* %30, align 4
  %33 = icmp ne i32 %29, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %26
  call void @abort() #2
  unreachable

; <label>:35                                      ; preds = %26
  %36 = load i64, i64* %arg0, align 8
  %37 = load i64, i64* %arg1, align 8
  %38 = call i32 @flt(i64 %36, i64 %37)
  %39 = load i32*, i32** %res, align 8
  %40 = getelementptr inbounds i32, i32* %39, i32 1
  store i32* %40, i32** %res, align 8
  %41 = load i32, i32* %39, align 4
  %42 = icmp ne i32 %38, %41
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %35
  call void @abort() #2
  unreachable

; <label>:44                                      ; preds = %35
  %45 = load i64, i64* %arg0, align 8
  %46 = load i64, i64* %arg1, align 8
  %47 = call i32 @fge(i64 %45, i64 %46)
  %48 = load i32*, i32** %res, align 8
  %49 = getelementptr inbounds i32, i32* %48, i32 1
  store i32* %49, i32** %res, align 8
  %50 = load i32, i32* %48, align 4
  %51 = icmp ne i32 %47, %50
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %44
  call void @abort() #2
  unreachable

; <label>:53                                      ; preds = %44
  %54 = load i64, i64* %arg0, align 8
  %55 = load i64, i64* %arg1, align 8
  %56 = call i32 @fgt(i64 %54, i64 %55)
  %57 = load i32*, i32** %res, align 8
  %58 = getelementptr inbounds i32, i32* %57, i32 1
  store i32* %58, i32** %res, align 8
  %59 = load i32, i32* %57, align 4
  %60 = icmp ne i32 %56, %59
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %53
  call void @abort() #2
  unreachable

; <label>:62                                      ; preds = %53
  %63 = load i64, i64* %arg0, align 8
  %64 = load i64, i64* %arg1, align 8
  %65 = call i32 @fle(i64 %63, i64 %64)
  %66 = load i32*, i32** %res, align 8
  %67 = getelementptr inbounds i32, i32* %66, i32 1
  store i32* %67, i32** %res, align 8
  %68 = load i32, i32* %66, align 4
  %69 = icmp ne i32 %65, %68
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %62
  call void @abort() #2
  unreachable

; <label>:71                                      ; preds = %62
  %72 = load i64, i64* %arg0, align 8
  %73 = load i64, i64* %arg1, align 8
  %74 = call i32 @fltu(i64 %72, i64 %73)
  %75 = load i32*, i32** %res, align 8
  %76 = getelementptr inbounds i32, i32* %75, i32 1
  store i32* %76, i32** %res, align 8
  %77 = load i32, i32* %75, align 4
  %78 = icmp ne i32 %74, %77
  br i1 %78, label %79, label %80

; <label>:79                                      ; preds = %71
  call void @abort() #2
  unreachable

; <label>:80                                      ; preds = %71
  %81 = load i64, i64* %arg0, align 8
  %82 = load i64, i64* %arg1, align 8
  %83 = call i32 @fgeu(i64 %81, i64 %82)
  %84 = load i32*, i32** %res, align 8
  %85 = getelementptr inbounds i32, i32* %84, i32 1
  store i32* %85, i32** %res, align 8
  %86 = load i32, i32* %84, align 4
  %87 = icmp ne i32 %83, %86
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %80
  call void @abort() #2
  unreachable

; <label>:89                                      ; preds = %80
  %90 = load i64, i64* %arg0, align 8
  %91 = load i64, i64* %arg1, align 8
  %92 = call i32 @fgtu(i64 %90, i64 %91)
  %93 = load i32*, i32** %res, align 8
  %94 = getelementptr inbounds i32, i32* %93, i32 1
  store i32* %94, i32** %res, align 8
  %95 = load i32, i32* %93, align 4
  %96 = icmp ne i32 %92, %95
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %89
  call void @abort() #2
  unreachable

; <label>:98                                      ; preds = %89
  %99 = load i64, i64* %arg0, align 8
  %100 = load i64, i64* %arg1, align 8
  %101 = call i32 @fleu(i64 %99, i64 %100)
  %102 = load i32*, i32** %res, align 8
  %103 = getelementptr inbounds i32, i32* %102, i32 1
  store i32* %103, i32** %res, align 8
  %104 = load i32, i32* %102, align 4
  %105 = icmp ne i32 %101, %104
  br i1 %105, label %106, label %107

; <label>:106                                     ; preds = %98
  call void @abort() #2
  unreachable

; <label>:107                                     ; preds = %98
  br label %108

; <label>:108                                     ; preds = %107
  %109 = load i32, i32* %j, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %j, align 4
  br label %10

; <label>:111                                     ; preds = %10
  br label %112

; <label>:112                                     ; preds = %111
  %113 = load i32, i32* %i, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %i, align 4
  br label %2

; <label>:115                                     ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %117 = load i32, i32* %1
  ret i32 %117
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
