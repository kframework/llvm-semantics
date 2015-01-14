; ModuleID = './reverse.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.list_el = type { i32, %struct.list_el* }

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define %struct.list_el* @listAppend(%struct.list_el* %p, i32 %n) #0 {
  %1 = alloca %struct.list_el*, align 8
  %2 = alloca i32, align 4
  %x = alloca %struct.list_el*, align 8
  %next = alloca %struct.list_el*, align 8
  store %struct.list_el* %p, %struct.list_el** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %struct.list_el** %1, align 8
  %4 = icmp eq %struct.list_el* %3, null
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = call noalias i8* @malloc(i64 16) #3
  %7 = bitcast i8* %6 to %struct.list_el*
  store %struct.list_el* %7, %struct.list_el** %1, align 8
  %8 = load i32* %2, align 4
  %9 = load %struct.list_el** %1, align 8
  %10 = getelementptr inbounds %struct.list_el* %9, i32 0, i32 0
  store i32 %8, i32* %10, align 4
  %11 = load %struct.list_el** %1, align 8
  %12 = getelementptr inbounds %struct.list_el* %11, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %12, align 8
  br label %35

; <label>:13                                      ; preds = %0
  %14 = load %struct.list_el** %1, align 8
  store %struct.list_el* %14, %struct.list_el** %x, align 8
  br label %15

; <label>:15                                      ; preds = %20, %13
  %16 = load %struct.list_el** %x, align 8
  %17 = getelementptr inbounds %struct.list_el* %16, i32 0, i32 1
  %18 = load %struct.list_el** %17, align 8
  %19 = icmp ne %struct.list_el* %18, null
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %15
  %21 = load %struct.list_el** %x, align 8
  %22 = getelementptr inbounds %struct.list_el* %21, i32 0, i32 1
  %23 = load %struct.list_el** %22, align 8
  store %struct.list_el* %23, %struct.list_el** %x, align 8
  br label %15

; <label>:24                                      ; preds = %15
  %25 = call noalias i8* @malloc(i64 16) #3
  %26 = bitcast i8* %25 to %struct.list_el*
  store %struct.list_el* %26, %struct.list_el** %next, align 8
  %27 = load %struct.list_el** %next, align 8
  %28 = load %struct.list_el** %x, align 8
  %29 = getelementptr inbounds %struct.list_el* %28, i32 0, i32 1
  store %struct.list_el* %27, %struct.list_el** %29, align 8
  %30 = load i32* %2, align 4
  %31 = load %struct.list_el** %next, align 8
  %32 = getelementptr inbounds %struct.list_el* %31, i32 0, i32 0
  store i32 %30, i32* %32, align 4
  %33 = load %struct.list_el** %next, align 8
  %34 = getelementptr inbounds %struct.list_el* %33, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %34, align 8
  br label %35

; <label>:35                                      ; preds = %24, %5
  %36 = load %struct.list_el** %1, align 8
  ret %struct.list_el* %36
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define %struct.list_el* @listReverse(%struct.list_el* %p) #0 {
  %1 = alloca %struct.list_el*, align 8
  %x = alloca %struct.list_el*, align 8
  %tmp = alloca %struct.list_el*, align 8
  store %struct.list_el* %p, %struct.list_el** %1, align 8
  %2 = load %struct.list_el** %1, align 8
  %3 = icmp ne %struct.list_el* %2, null
  br i1 %3, label %4, label %23

; <label>:4                                       ; preds = %0
  %5 = load %struct.list_el** %1, align 8
  %6 = getelementptr inbounds %struct.list_el* %5, i32 0, i32 1
  %7 = load %struct.list_el** %6, align 8
  store %struct.list_el* %7, %struct.list_el** %x, align 8
  %8 = load %struct.list_el** %1, align 8
  %9 = getelementptr inbounds %struct.list_el* %8, i32 0, i32 1
  store %struct.list_el* null, %struct.list_el** %9, align 8
  br label %10

; <label>:10                                      ; preds = %13, %4
  %11 = load %struct.list_el** %x, align 8
  %12 = icmp ne %struct.list_el* %11, null
  br i1 %12, label %13, label %22

; <label>:13                                      ; preds = %10
  %14 = load %struct.list_el** %x, align 8
  %15 = getelementptr inbounds %struct.list_el* %14, i32 0, i32 1
  %16 = load %struct.list_el** %15, align 8
  store %struct.list_el* %16, %struct.list_el** %tmp, align 8
  %17 = load %struct.list_el** %1, align 8
  %18 = load %struct.list_el** %x, align 8
  %19 = getelementptr inbounds %struct.list_el* %18, i32 0, i32 1
  store %struct.list_el* %17, %struct.list_el** %19, align 8
  %20 = load %struct.list_el** %x, align 8
  store %struct.list_el* %20, %struct.list_el** %1, align 8
  %21 = load %struct.list_el** %tmp, align 8
  store %struct.list_el* %21, %struct.list_el** %x, align 8
  br label %10

; <label>:22                                      ; preds = %10
  br label %23

; <label>:23                                      ; preds = %22, %0
  %24 = load %struct.list_el** %1, align 8
  ret %struct.list_el* %24
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %head = alloca %struct.list_el*, align 8
  %curr = alloca %struct.list_el*, align 8
  %first = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call %struct.list_el* @listAppend(%struct.list_el* null, i32 20)
  store %struct.list_el* %2, %struct.list_el** %head, align 8
  %3 = load %struct.list_el** %head, align 8
  %4 = call %struct.list_el* @listAppend(%struct.list_el* %3, i32 25)
  %5 = load %struct.list_el** %head, align 8
  %6 = call %struct.list_el* @listAppend(%struct.list_el* %5, i32 15)
  %7 = load %struct.list_el** %head, align 8
  %8 = call %struct.list_el* @listAppend(%struct.list_el* %7, i32 30)
  %9 = load %struct.list_el** %head, align 8
  %10 = call %struct.list_el* @listAppend(%struct.list_el* %9, i32 10)
  %11 = load %struct.list_el** %head, align 8
  %12 = call %struct.list_el* @listAppend(%struct.list_el* %11, i32 35)
  %13 = load %struct.list_el** %head, align 8
  store %struct.list_el* %13, %struct.list_el** %curr, align 8
  br label %14

; <label>:14                                      ; preds = %17, %0
  %15 = load %struct.list_el** %curr, align 8
  %16 = icmp ne %struct.list_el* %15, null
  br i1 %16, label %17, label %25

; <label>:17                                      ; preds = %14
  %18 = load %struct.list_el** %curr, align 8
  %19 = getelementptr inbounds %struct.list_el* %18, i32 0, i32 0
  %20 = load i32* %19, align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %20)
  %22 = load %struct.list_el** %curr, align 8
  %23 = getelementptr inbounds %struct.list_el* %22, i32 0, i32 1
  %24 = load %struct.list_el** %23, align 8
  store %struct.list_el* %24, %struct.list_el** %curr, align 8
  br label %14

; <label>:25                                      ; preds = %14
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  %27 = load %struct.list_el** %head, align 8
  %28 = getelementptr inbounds %struct.list_el* %27, i32 0, i32 0
  %29 = load i32* %28, align 4
  store i32 %29, i32* %first, align 4
  %30 = load %struct.list_el** %head, align 8
  %31 = call %struct.list_el* @listReverse(%struct.list_el* %30)
  store %struct.list_el* %31, %struct.list_el** %head, align 8
  %32 = load %struct.list_el** %head, align 8
  store %struct.list_el* %32, %struct.list_el** %curr, align 8
  br label %33

; <label>:33                                      ; preds = %36, %25
  %34 = load %struct.list_el** %curr, align 8
  %35 = icmp ne %struct.list_el* %34, null
  br i1 %35, label %36, label %44

; <label>:36                                      ; preds = %33
  %37 = load %struct.list_el** %curr, align 8
  %38 = getelementptr inbounds %struct.list_el* %37, i32 0, i32 0
  %39 = load i32* %38, align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %39)
  %41 = load %struct.list_el** %curr, align 8
  %42 = getelementptr inbounds %struct.list_el* %41, i32 0, i32 1
  %43 = load %struct.list_el** %42, align 8
  store %struct.list_el* %43, %struct.list_el** %curr, align 8
  br label %33

; <label>:44                                      ; preds = %33
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
