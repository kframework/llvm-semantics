; ModuleID = './pr27260.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@buf = common global [65 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 2
  %4 = select i1 %3, i32 1, i32 0
  %5 = trunc i32 %4 to i8
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i32 0), i8 %5, i64 64, i32 16, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i8 2, i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i64 64), align 1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 64
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %5
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %2

; <label>:17                                      ; preds = %2
  call void @foo(i32 0)
  store i32 0, i32* %i, align 4
  br label %18

; <label>:18                                      ; preds = %30, %17
  %19 = load i32* %i, align 4
  %20 = icmp slt i32 %19, 64
  br i1 %20, label %21, label %33

; <label>:21                                      ; preds = %18
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %23
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %21
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %21
  br label %30

; <label>:30                                      ; preds = %29
  %31 = load i32* %i, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %i, align 4
  br label %18

; <label>:33                                      ; preds = %18
  call void @foo(i32 2)
  store i32 0, i32* %i, align 4
  br label %34

; <label>:34                                      ; preds = %46, %33
  %35 = load i32* %i, align 4
  %36 = icmp slt i32 %35, 64
  br i1 %36, label %37, label %49

; <label>:37                                      ; preds = %34
  %38 = load i32* %i, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [65 x i8]* @buf, i32 0, i64 %39
  %41 = load i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %37
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %37
  br label %46

; <label>:46                                      ; preds = %45
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %34

; <label>:49                                      ; preds = %34
  %50 = load i8* getelementptr inbounds ([65 x i8]* @buf, i32 0, i64 64), align 1
  %51 = sext i8 %50 to i32
  %52 = icmp ne i32 %51, 2
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %49
  call void @abort() #3
  unreachable

; <label>:54                                      ; preds = %49
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
