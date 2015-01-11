; ModuleID = './20000706-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.baz = type { i32, i32, i32, i32, i32 }

; Function Attrs: nounwind uwtable
define void @bar(%struct.baz* %x, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j) #0 {
  %1 = alloca %struct.baz*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.baz* %x, %struct.baz** %1, align 8
  store i32 %f, i32* %2, align 4
  store i32 %g, i32* %3, align 4
  store i32 %h, i32* %4, align 4
  store i32 %i, i32* %5, align 4
  store i32 %j, i32* %6, align 4
  %7 = load %struct.baz** %1, align 8
  %8 = getelementptr inbounds %struct.baz* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  %10 = icmp ne i32 %9, 1
  br i1 %10, label %46, label %11

; <label>:11                                      ; preds = %0
  %12 = load %struct.baz** %1, align 8
  %13 = getelementptr inbounds %struct.baz* %12, i32 0, i32 1
  %14 = load i32* %13, align 4
  %15 = icmp ne i32 %14, 2
  br i1 %15, label %46, label %16

; <label>:16                                      ; preds = %11
  %17 = load %struct.baz** %1, align 8
  %18 = getelementptr inbounds %struct.baz* %17, i32 0, i32 2
  %19 = load i32* %18, align 4
  %20 = icmp ne i32 %19, 3
  br i1 %20, label %46, label %21

; <label>:21                                      ; preds = %16
  %22 = load %struct.baz** %1, align 8
  %23 = getelementptr inbounds %struct.baz* %22, i32 0, i32 3
  %24 = load i32* %23, align 4
  %25 = icmp ne i32 %24, 4
  br i1 %25, label %46, label %26

; <label>:26                                      ; preds = %21
  %27 = load %struct.baz** %1, align 8
  %28 = getelementptr inbounds %struct.baz* %27, i32 0, i32 4
  %29 = load i32* %28, align 4
  %30 = icmp ne i32 %29, 5
  br i1 %30, label %46, label %31

; <label>:31                                      ; preds = %26
  %32 = load i32* %2, align 4
  %33 = icmp ne i32 %32, 6
  br i1 %33, label %46, label %34

; <label>:34                                      ; preds = %31
  %35 = load i32* %3, align 4
  %36 = icmp ne i32 %35, 7
  br i1 %36, label %46, label %37

; <label>:37                                      ; preds = %34
  %38 = load i32* %4, align 4
  %39 = icmp ne i32 %38, 8
  br i1 %39, label %46, label %40

; <label>:40                                      ; preds = %37
  %41 = load i32* %5, align 4
  %42 = icmp ne i32 %41, 9
  br i1 %42, label %46, label %43

; <label>:43                                      ; preds = %40
  %44 = load i32* %6, align 4
  %45 = icmp ne i32 %44, 10
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %43, %40, %37, %34, %31, %26, %21, %16, %11, %0
  call void @abort() #2
  unreachable

; <label>:47                                      ; preds = %43
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @foo(i8* %z, %struct.baz* byval align 8 %x, i8* %y) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %z, i8** %1, align 8
  store i8* %y, i8** %2, align 8
  call void @bar(%struct.baz* %x, i32 6, i32 7, i32 8, i32 9, i32 10)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.baz, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.baz* %x, i32 0, i32 0
  store i32 1, i32* %2, align 4
  %3 = getelementptr inbounds %struct.baz* %x, i32 0, i32 1
  store i32 2, i32* %3, align 4
  %4 = getelementptr inbounds %struct.baz* %x, i32 0, i32 2
  store i32 3, i32* %4, align 4
  %5 = getelementptr inbounds %struct.baz* %x, i32 0, i32 3
  store i32 4, i32* %5, align 4
  %6 = getelementptr inbounds %struct.baz* %x, i32 0, i32 4
  store i32 5, i32* %6, align 4
  call void @foo(i8* null, %struct.baz* byval align 8 %x, i8* null)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32* %1
  ret i32 %8
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
