; ModuleID = './memory.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.myStruct = type { i32, i32 }

@.str = private unnamed_addr constant [7 x i8] c"error\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @mem_test(i32 %num) #0 {
  %1 = alloca i32, align 4
  %inum = alloca i32, align 4
  %i = alloca i32, align 4
  %array = alloca i32*, align 8
  store i32 %num, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  store i32 %2, i32* %inum, align 4
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %inum, align 4
  %4 = sext i32 %3 to i64
  %5 = mul i64 4, %4
  %6 = call noalias i8* @malloc(i64 %5) #3
  %7 = bitcast i8* %6 to i32*
  store i32* %7, i32** %array, align 8
  store i32 0, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %18, %0
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %1, align 4
  %11 = icmp ult i32 %9, %10
  br i1 %11, label %12, label %21

; <label>:12                                      ; preds = %8
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %i, align 4
  %15 = zext i32 %14 to i64
  %16 = load i32*, i32** %array, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 %15
  store i32 %13, i32* %17, align 4
  br label %18

; <label>:18                                      ; preds = %12
  %19 = load i32, i32* %i, align 4
  %20 = add i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %8

; <label>:21                                      ; preds = %8
  %22 = load i32*, i32** %array, align 8
  %23 = bitcast i32* %22 to i8*
  call void @free(i8* %23) #3
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @mem_test2() #0 {
  %ptr = alloca %struct.myStruct*, align 8
  %1 = call noalias i8* @malloc(i64 8) #3
  %2 = bitcast i8* %1 to %struct.myStruct*
  store %struct.myStruct* %2, %struct.myStruct** %ptr, align 8
  %3 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %4 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %3, i32 0, i32 1
  store i32 0, i32* %4, align 4
  %5 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %6 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %5, i32 0, i32 1
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  br label %11

; <label>:11                                      ; preds = %9, %0
  %12 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %13 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %13, align 4
  %16 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %17 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %16, i32 0, i32 0
  store i32 %15, i32* %17, align 4
  %18 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %19 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %18, i32 0, i32 0
  %20 = load i32, i32* %19, align 4
  %21 = mul nsw i32 %20, 2
  store i32 %21, i32* %19, align 4
  %22 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %23 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %22, i32 0, i32 0
  %24 = load i32, i32* %23, align 4
  %25 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %26 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %25, i32 0, i32 1
  %27 = load i32, i32* %26, align 4
  %28 = sub nsw i32 %24, %27
  %29 = icmp ne i32 %28, 1
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %11
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0))
  br label %32

; <label>:32                                      ; preds = %30, %11
  %33 = load %struct.myStruct*, %struct.myStruct** %ptr, align 8
  %34 = bitcast %struct.myStruct* %33 to i8*
  call void @free(i8* %34) #3
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @mem_test(i32 255)
  call void @mem_test2()
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
