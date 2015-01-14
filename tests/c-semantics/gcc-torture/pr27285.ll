; ModuleID = './pr27285.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i8, i8, i8, [16 x i8] }

@main.x = private unnamed_addr constant %struct.S { i8 0, i8 25, i8 0, [16 x i8] c"\AA\BB\CC\DD\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1

; Function Attrs: noinline nounwind uwtable
define void @foo(%struct.S* %x, %struct.S* %y) #0 {
  %1 = alloca %struct.S*, align 8
  %2 = alloca %struct.S*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i8, align 1
  %d = alloca i8*, align 8
  %e = alloca i8*, align 8
  store %struct.S* %x, %struct.S** %1, align 8
  store %struct.S* %y, %struct.S** %2, align 8
  %3 = load %struct.S** %1, align 8
  %4 = getelementptr inbounds %struct.S* %3, i32 0, i32 1
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  store i32 %6, i32* %b, align 4
  %7 = load %struct.S** %1, align 8
  %8 = getelementptr inbounds %struct.S* %7, i32 0, i32 3
  %9 = getelementptr inbounds [16 x i8]* %8, i32 0, i32 0
  store i8* %9, i8** %d, align 8
  %10 = load %struct.S** %2, align 8
  %11 = getelementptr inbounds %struct.S* %10, i32 0, i32 3
  %12 = getelementptr inbounds [16 x i8]* %11, i32 0, i32 0
  store i8* %12, i8** %e, align 8
  store i32 0, i32* %a, align 4
  br label %13

; <label>:13                                      ; preds = %27, %0
  %14 = load i32* %b, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %44

; <label>:16                                      ; preds = %13
  %17 = load i32* %b, align 4
  %18 = icmp sge i32 %17, 8
  br i1 %18, label %19, label %22

; <label>:19                                      ; preds = %16
  store i8 -1, i8* %c, align 1
  %20 = load i32* %b, align 4
  %21 = sub nsw i32 %20, 8
  store i32 %21, i32* %b, align 4
  br label %27

; <label>:22                                      ; preds = %16
  %23 = load i32* %b, align 4
  %24 = sub nsw i32 8, %23
  %25 = shl i32 255, %24
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* %c, align 1
  store i32 0, i32* %b, align 4
  br label %27

; <label>:27                                      ; preds = %22, %19
  %28 = load i32* %a, align 4
  %29 = sext i32 %28 to i64
  %30 = load i8** %d, align 8
  %31 = getelementptr inbounds i8* %30, i64 %29
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = load i8* %c, align 1
  %35 = zext i8 %34 to i32
  %36 = and i32 %33, %35
  %37 = trunc i32 %36 to i8
  %38 = load i32* %a, align 4
  %39 = sext i32 %38 to i64
  %40 = load i8** %e, align 8
  %41 = getelementptr inbounds i8* %40, i64 %39
  store i8 %37, i8* %41, align 1
  %42 = load i32* %a, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %a, align 4
  br label %13

; <label>:44                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %x = alloca %struct.S, align 1
  %y = alloca %struct.S, align 1
  store i32 0, i32* %1
  %2 = bitcast %struct.S* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds (%struct.S* @main.x, i32 0, i32 0), i64 19, i32 1, i1 false)
  %3 = bitcast %struct.S* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 19, i32 1, i1 false)
  call void @foo(%struct.S* %x, %struct.S* %y)
  %4 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %5 = getelementptr inbounds [16 x i8]* %4, i32 0, i64 0
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  %8 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %9 = getelementptr inbounds [16 x i8]* %8, i32 0, i64 0
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %7, %11
  br i1 %12, label %44, label %13

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %15 = getelementptr inbounds [16 x i8]* %14, i32 0, i64 1
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %19 = getelementptr inbounds [16 x i8]* %18, i32 0, i64 1
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp ne i32 %17, %21
  br i1 %22, label %44, label %23

; <label>:23                                      ; preds = %13
  %24 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %25 = getelementptr inbounds [16 x i8]* %24, i32 0, i64 2
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %29 = getelementptr inbounds [16 x i8]* %28, i32 0, i64 2
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp ne i32 %27, %31
  br i1 %32, label %44, label %33

; <label>:33                                      ; preds = %23
  %34 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %35 = getelementptr inbounds [16 x i8]* %34, i32 0, i64 3
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = and i32 %37, 128
  %39 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %40 = getelementptr inbounds [16 x i8]* %39, i32 0, i64 3
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp ne i32 %38, %42
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %33, %23, %13, %0
  call void @abort() #4
  unreachable

; <label>:45                                      ; preds = %33
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
