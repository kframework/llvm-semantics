; ModuleID = './simplestQueue.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@head = internal global i32 0, align 4
@tail = internal global i32 0, align 4
@q = internal global [16 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"emtpy==%d\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"full==%d\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"qents==%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @full() #0 {
  %1 = load i32* @head, align 4
  %2 = call i32 @inc(i32 %1)
  %3 = load i32* @tail, align 4
  %4 = icmp eq i32 %2, %3
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define internal i32 @inc(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = add nsw i32 %2, 1
  %4 = and i32 %3, 15
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @mt() #0 {
  %1 = load i32* @head, align 4
  %2 = load i32* @tail, align 4
  %3 = icmp eq i32 %1, %2
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @enq(i32 %item) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %item, i32* %2, align 4
  %3 = call i32 @full()
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %13

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = load i32* @head, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [16 x i32]* @q, i32 0, i64 %9
  store i32 %7, i32* %10, align 4
  %11 = load i32* @head, align 4
  %12 = call i32 @inc(i32 %11)
  store i32 %12, i32* @head, align 4
  store i32 1, i32* %1
  br label %13

; <label>:13                                      ; preds = %6, %5
  %14 = load i32* %1
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @deq(i32* %loc) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  store i32* %loc, i32** %2, align 8
  %3 = call i32 @mt()
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* @tail, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [16 x i32]* @q, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = load i32** %2, align 8
  store i32 %10, i32* %11, align 4
  %12 = load i32* @tail, align 4
  %13 = call i32 @inc(i32 %12)
  store i32 %13, i32* @tail, align 4
  store i32 1, i32* %1
  br label %14

; <label>:14                                      ; preds = %6, %5
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @qents() #0 {
  %s = alloca i32, align 4
  %1 = load i32* @head, align 4
  %2 = load i32* @tail, align 4
  %3 = sub nsw i32 %1, %2
  store i32 %3, i32* %s, align 4
  %4 = load i32* %s, align 4
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %s, align 4
  %8 = add nsw i32 %7, 16
  store i32 %8, i32* %s, align 4
  br label %9

; <label>:9                                       ; preds = %6, %0
  %10 = load i32* %s, align 4
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define void @printdeq() #0 {
  %item = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 0, i32* %item, align 4
  %1 = call i32 @deq(i32* %item)
  store i32 %1, i32* %res, align 4
  %2 = load i32* %res, align 4
  %3 = load i32* %item, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %3)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @mt()
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %2)
  %4 = call i32 @full()
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %4)
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %13, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 16
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = mul nsw i32 %10, 2
  %12 = call i32 @enq(i32 %11)
  br label %13

; <label>:13                                      ; preds = %9
  %14 = load i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %6

; <label>:16                                      ; preds = %6
  %17 = call i32 @mt()
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %17)
  %19 = call i32 @full()
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %19)
  %21 = call i32 @qents()
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %21)
  store i32 0, i32* %i1, align 4
  br label %23

; <label>:23                                      ; preds = %27, %16
  %24 = load i32* %i1, align 4
  %25 = icmp slt i32 %24, 8
  br i1 %25, label %26, label %30

; <label>:26                                      ; preds = %23
  call void @printdeq()
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %i1, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i1, align 4
  br label %23

; <label>:30                                      ; preds = %23
  %31 = call i32 @mt()
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %31)
  %33 = call i32 @full()
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %33)
  %35 = call i32 @qents()
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %35)
  store i32 0, i32* %i2, align 4
  br label %37

; <label>:37                                      ; preds = %44, %30
  %38 = load i32* %i2, align 4
  %39 = icmp slt i32 %38, 8
  br i1 %39, label %40, label %47

; <label>:40                                      ; preds = %37
  %41 = load i32* %i2, align 4
  %42 = mul nsw i32 %41, 2
  %43 = call i32 @enq(i32 %42)
  br label %44

; <label>:44                                      ; preds = %40
  %45 = load i32* %i2, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i2, align 4
  br label %37

; <label>:47                                      ; preds = %37
  %48 = call i32 @mt()
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i32 %48)
  %50 = call i32 @full()
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 %50)
  %52 = call i32 @qents()
  %53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i32 %52)
  br label %54

; <label>:54                                      ; preds = %58, %47
  %55 = call i32 @mt()
  %56 = icmp ne i32 %55, 0
  %57 = xor i1 %56, true
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %54
  call void @printdeq()
  br label %54

; <label>:59                                      ; preds = %54
  call void @printdeq()
  %60 = load i32* %1
  ret i32 %60
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
