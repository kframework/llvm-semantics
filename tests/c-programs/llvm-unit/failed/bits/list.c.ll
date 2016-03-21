; ModuleID = './list.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.myList = type { %struct.myStruct, %struct.myList* }
%struct.myStruct = type { i32, i32 }

@array = global [192 x i32] [i32 103, i32 198, i32 105, i32 115, i32 81, i32 255, i32 74, i32 236, i32 41, i32 205, i32 186, i32 171, i32 242, i32 251, i32 227, i32 70, i32 124, i32 194, i32 84, i32 248, i32 27, i32 232, i32 231, i32 141, i32 118, i32 90, i32 46, i32 99, i32 51, i32 159, i32 201, i32 154, i32 102, i32 50, i32 13, i32 183, i32 49, i32 88, i32 163, i32 90, i32 37, i32 93, i32 5, i32 23, i32 88, i32 233, i32 94, i32 212, i32 171, i32 178, i32 205, i32 198, i32 155, i32 180, i32 84, i32 17, i32 14, i32 130, i32 116, i32 65, i32 33, i32 61, i32 220, i32 135, i32 112, i32 233, i32 62, i32 161, i32 65, i32 225, i32 252, i32 103, i32 62, i32 1, i32 126, i32 151, i32 234, i32 220, i32 107, i32 150, i32 143, i32 56, i32 92, i32 42, i32 236, i32 176, i32 59, i32 251, i32 50, i32 175, i32 60, i32 84, i32 236, i32 24, i32 219, i32 92, i32 2, i32 26, i32 254, i32 67, i32 251, i32 250, i32 170, i32 58, i32 251, i32 41, i32 209, i32 230, i32 5, i32 60, i32 124, i32 148, i32 117, i32 216, i32 190, i32 97, i32 137, i32 249, i32 92, i32 187, i32 168, i32 153, i32 15, i32 149, i32 177, i32 235, i32 241, i32 179, i32 5, i32 239, i32 247, i32 0, i32 233, i32 161, i32 58, i32 229, i32 202, i32 11, i32 203, i32 208, i32 72, i32 71, i32 100, i32 189, i32 31, i32 35, i32 30, i32 168, i32 28, i32 123, i32 100, i32 197, i32 20, i32 115, i32 90, i32 197, i32 94, i32 75, i32 121, i32 99, i32 59, i32 112, i32 100, i32 36, i32 17, i32 158, i32 9, i32 220, i32 170, i32 212, i32 172, i32 242, i32 27, i32 16, i32 175, i32 59, i32 51, i32 205, i32 227, i32 80, i32 72, i32 71, i32 21, i32 92, i32 187, i32 111, i32 34, i32 25, i32 186, i32 155, i32 125, i32 245], align 16
@.str = private unnamed_addr constant [35 x i8] c"error: i = %d, x = %d, array = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [42 x i8] c"error: i = %d, y = %hhd, expected = %hhd\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @test() #0 {
  %i = alloca i32, align 4
  %cnt = alloca i32, align 4
  %head = alloca %struct.myList*, align 8
  %elem = alloca %struct.myList*, align 8
  %tmp = alloca %struct.myList*, align 8
  store i32 0, i32* %i, align 4
  store i32 192, i32* %cnt, align 4
  store %struct.myList* null, %struct.myList** %head, align 8
  %1 = load i32, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %28, %0
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %cnt, align 4
  %5 = icmp ult i32 %3, %4
  br i1 %5, label %6, label %31

; <label>:6                                       ; preds = %2
  %7 = call noalias i8* @malloc(i64 16) #3
  %8 = bitcast i8* %7 to %struct.myList*
  store %struct.myList* %8, %struct.myList** %elem, align 8
  %9 = load %struct.myList*, %struct.myList** %head, align 8
  %10 = load %struct.myList*, %struct.myList** %elem, align 8
  %11 = getelementptr inbounds %struct.myList, %struct.myList* %10, i32 0, i32 1
  store %struct.myList* %9, %struct.myList** %11, align 8
  %12 = load %struct.myList*, %struct.myList** %elem, align 8
  store %struct.myList* %12, %struct.myList** %head, align 8
  %13 = load i32, i32* %i, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [192 x i32], [192 x i32]* @array, i32 0, i64 %14
  %16 = load i32, i32* %15, align 4
  %17 = load %struct.myList*, %struct.myList** %elem, align 8
  %18 = getelementptr inbounds %struct.myList, %struct.myList* %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %18, i32 0, i32 0
  store i32 %16, i32* %19, align 4
  %20 = load i32, i32* %i, align 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds [192 x i32], [192 x i32]* @array, i32 0, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = sub nsw i32 %23, 1
  %25 = load %struct.myList*, %struct.myList** %elem, align 8
  %26 = getelementptr inbounds %struct.myList, %struct.myList* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %26, i32 0, i32 1
  store i32 %24, i32* %27, align 4
  br label %28

; <label>:28                                      ; preds = %6
  %29 = load i32, i32* %i, align 4
  %30 = add i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %2

; <label>:31                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %32

; <label>:32                                      ; preds = %90, %31
  %33 = load %struct.myList*, %struct.myList** %head, align 8
  %34 = icmp ne %struct.myList* %33, null
  br i1 %34, label %35, label %97

; <label>:35                                      ; preds = %32
  %36 = load i32, i32* %i, align 4
  %37 = add i32 %36, 1
  store i32 %37, i32* %i, align 4
  %38 = load %struct.myList*, %struct.myList** %head, align 8
  %39 = getelementptr inbounds %struct.myList, %struct.myList* %38, i32 0, i32 0
  %40 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %39, i32 0, i32 0
  %41 = load i32, i32* %40, align 4
  %42 = load i32, i32* %i, align 4
  %43 = sub i32 192, %42
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds [192 x i32], [192 x i32]* @array, i32 0, i64 %44
  %46 = load i32, i32* %45, align 4
  %47 = icmp ne i32 %41, %46
  br i1 %47, label %48, label %60

; <label>:48                                      ; preds = %35
  %49 = load i32, i32* %i, align 4
  %50 = load %struct.myList*, %struct.myList** %head, align 8
  %51 = getelementptr inbounds %struct.myList, %struct.myList* %50, i32 0, i32 0
  %52 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %51, i32 0, i32 0
  %53 = load i32, i32* %52, align 4
  %54 = load i32, i32* %i, align 4
  %55 = sub i32 192, %54
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds [192 x i32], [192 x i32]* @array, i32 0, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0), i32 %49, i32 %53, i32 %58)
  br label %60

; <label>:60                                      ; preds = %48, %35
  %61 = load %struct.myList*, %struct.myList** %head, align 8
  %62 = getelementptr inbounds %struct.myList, %struct.myList* %61, i32 0, i32 0
  %63 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %62, i32 0, i32 1
  %64 = load i32, i32* %63, align 4
  %65 = load i32, i32* %i, align 4
  %66 = sub i32 192, %65
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [192 x i32], [192 x i32]* @array, i32 0, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = sub nsw i32 %69, 1
  %71 = and i32 %70, 127
  %72 = xor i32 %64, %71
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %90

; <label>:74                                      ; preds = %60
  %75 = load i32, i32* %i, align 4
  %76 = load %struct.myList*, %struct.myList** %head, align 8
  %77 = getelementptr inbounds %struct.myList, %struct.myList* %76, i32 0, i32 0
  %78 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %77, i32 0, i32 1
  %79 = load i32, i32* %78, align 4
  %80 = trunc i32 %79 to i8
  %81 = zext i8 %80 to i32
  %82 = load i32, i32* %i, align 4
  %83 = sub i32 192, %82
  %84 = zext i32 %83 to i64
  %85 = getelementptr inbounds [192 x i32], [192 x i32]* @array, i32 0, i64 %84
  %86 = load i32, i32* %85, align 4
  %87 = sub nsw i32 %86, 1
  %88 = and i32 %87, 127
  %89 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i32 0, i32 0), i32 %75, i32 %81, i32 %88)
  br label %90

; <label>:90                                      ; preds = %74, %60
  %91 = load %struct.myList*, %struct.myList** %head, align 8
  store %struct.myList* %91, %struct.myList** %tmp, align 8
  %92 = load %struct.myList*, %struct.myList** %head, align 8
  %93 = getelementptr inbounds %struct.myList, %struct.myList* %92, i32 0, i32 1
  %94 = load %struct.myList*, %struct.myList** %93, align 8
  store %struct.myList* %94, %struct.myList** %head, align 8
  %95 = load %struct.myList*, %struct.myList** %tmp, align 8
  %96 = bitcast %struct.myList* %95 to i8*
  call void @free(i8* %96) #3
  br label %32

; <label>:97                                      ; preds = %32
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test()
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
