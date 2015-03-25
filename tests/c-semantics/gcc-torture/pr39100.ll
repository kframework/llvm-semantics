; ModuleID = './pr39100.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.E = type { i32, %struct.E* }
%struct.C = type { %struct.E*, i16, i16 }

@main.c = private unnamed_addr constant { %struct.E*, i16, i16, [4 x i8] } { %struct.E* null, i16 0, i16 0, [4 x i8] undef }, align 8

; Function Attrs: noinline nounwind uwtable
define %struct.C* @foo(%struct.C* %h, %struct.E* %x) #0 {
  %1 = alloca %struct.C*, align 8
  %2 = alloca %struct.E*, align 8
  %pl = alloca %struct.E*, align 8
  %pa = alloca %struct.E**, align 8
  %nl = alloca %struct.E*, align 8
  %na = alloca %struct.E**, align 8
  %n = alloca %struct.E*, align 8
  store %struct.C* %h, %struct.C** %1, align 8
  store %struct.E* %x, %struct.E** %2, align 8
  store %struct.E* null, %struct.E** %pl, align 8
  store %struct.E** %pl, %struct.E*** %pa, align 8
  store %struct.E* null, %struct.E** %nl, align 8
  store %struct.E** %nl, %struct.E*** %na, align 8
  br label %3

; <label>:3                                       ; preds = %35, %0
  %4 = load %struct.E** %2, align 8
  %5 = icmp ne %struct.E* %4, null
  br i1 %5, label %6, label %37

; <label>:6                                       ; preds = %3
  %7 = load %struct.E** %2, align 8
  %8 = getelementptr inbounds %struct.E* %7, i32 0, i32 1
  %9 = load %struct.E** %8, align 8
  store %struct.E* %9, %struct.E** %n, align 8
  %10 = load %struct.E** %2, align 8
  %11 = getelementptr inbounds %struct.E* %10, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = and i32 %12, 1
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %25

; <label>:15                                      ; preds = %6
  %16 = load %struct.C** %1, align 8
  %17 = getelementptr inbounds %struct.C* %16, i32 0, i32 2
  %18 = load i16* %17, align 2
  %19 = add i16 %18, 1
  store i16 %19, i16* %17, align 2
  %20 = load %struct.E** %2, align 8
  %21 = load %struct.E*** %pa, align 8
  store %struct.E* %20, %struct.E** %21, align 8
  %22 = load %struct.E*** %pa, align 8
  %23 = load %struct.E** %22, align 8
  %24 = getelementptr inbounds %struct.E* %23, i32 0, i32 1
  store %struct.E** %24, %struct.E*** %pa, align 8
  br label %35

; <label>:25                                      ; preds = %6
  %26 = load %struct.C** %1, align 8
  %27 = getelementptr inbounds %struct.C* %26, i32 0, i32 1
  %28 = load i16* %27, align 2
  %29 = add i16 %28, 1
  store i16 %29, i16* %27, align 2
  %30 = load %struct.E** %2, align 8
  %31 = load %struct.E*** %na, align 8
  store %struct.E* %30, %struct.E** %31, align 8
  %32 = load %struct.E*** %na, align 8
  %33 = load %struct.E** %32, align 8
  %34 = getelementptr inbounds %struct.E* %33, i32 0, i32 1
  store %struct.E** %34, %struct.E*** %na, align 8
  br label %35

; <label>:35                                      ; preds = %25, %15
  %36 = load %struct.E** %n, align 8
  store %struct.E* %36, %struct.E** %2, align 8
  br label %3

; <label>:37                                      ; preds = %3
  %38 = load %struct.E** %nl, align 8
  %39 = load %struct.E*** %pa, align 8
  store %struct.E* %38, %struct.E** %39, align 8
  %40 = load %struct.E*** %na, align 8
  store %struct.E* null, %struct.E** %40, align 8
  %41 = load %struct.E** %pl, align 8
  %42 = load %struct.C** %1, align 8
  %43 = getelementptr inbounds %struct.C* %42, i32 0, i32 0
  store %struct.E* %41, %struct.E** %43, align 8
  %44 = load %struct.C** %1, align 8
  ret %struct.C* %44
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %c = alloca %struct.C, align 8
  %e = alloca [2 x %struct.E], align 16
  %p = alloca %struct.E*, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.C* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ({ %struct.E*, i16, i16, [4 x i8] }* @main.c to i8*), i64 16, i32 8, i1 false)
  %3 = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0
  %4 = getelementptr inbounds %struct.E* %3, i32 0, i32 0
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %struct.E* %3, i32 0, i32 1
  %6 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  store %struct.E* %6, %struct.E** %5, align 8
  %7 = getelementptr inbounds %struct.E* %3, i64 1
  %8 = getelementptr inbounds %struct.E* %7, i32 0, i32 0
  store i32 1, i32* %8, align 4
  %9 = getelementptr inbounds %struct.E* %7, i32 0, i32 1
  store %struct.E* null, %struct.E** %9, align 8
  %10 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %11 = call %struct.C* @foo(%struct.C* %c, %struct.E* %10)
  %12 = getelementptr inbounds %struct.C* %c, i32 0, i32 1
  %13 = load i16* %12, align 2
  %14 = sext i16 %13 to i32
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %21, label %16

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.C* %c, i32 0, i32 2
  %18 = load i16* %17, align 2
  %19 = sext i16 %18 to i32
  %20 = icmp ne i32 %19, 1
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %16, %0
  call void @abort() #4
  unreachable

; <label>:22                                      ; preds = %16
  %23 = getelementptr inbounds %struct.C* %c, i32 0, i32 0
  %24 = load %struct.E** %23, align 8
  %25 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  %26 = icmp ne %struct.E* %24, %25
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %22
  call void @abort() #4
  unreachable

; <label>:28                                      ; preds = %22
  %29 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  %30 = getelementptr inbounds %struct.E* %29, i32 0, i32 1
  %31 = load %struct.E** %30, align 8
  %32 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %33 = icmp ne %struct.E* %31, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %28
  call void @abort() #4
  unreachable

; <label>:35                                      ; preds = %28
  %36 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %37 = getelementptr inbounds %struct.E* %36, i32 0, i32 1
  %38 = load %struct.E** %37, align 8
  %39 = icmp ne %struct.E* %38, null
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35
  call void @abort() #4
  unreachable

; <label>:41                                      ; preds = %35
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
