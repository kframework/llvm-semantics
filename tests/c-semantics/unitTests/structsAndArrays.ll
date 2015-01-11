; ModuleID = './structsAndArrays.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4

; Function Attrs: nounwind uwtable
define void @foo(%struct.S* %s) #0 {
  %1 = alloca %struct.S*, align 8
  %2 = alloca %struct.S, align 4
  store %struct.S* %s, %struct.S** %1, align 8
  %3 = load %struct.S** %1, align 8
  %4 = getelementptr inbounds %struct.S* %3, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  %7 = load %struct.S** %1, align 8
  %8 = getelementptr inbounds %struct.S* %7, i32 0, i32 1
  %9 = load i32* %8, align 4
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %9)
  %11 = load %struct.S** %1, align 8
  %12 = getelementptr inbounds %struct.S* %11, i32 0, i32 2
  %13 = getelementptr inbounds [6 x i32]* %12, i32 0, i64 0
  %14 = load i32* %13, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %14)
  %16 = load %struct.S** %1, align 8
  %17 = getelementptr inbounds %struct.S* %16, i32 0, i32 2
  %18 = getelementptr inbounds [6 x i32]* %17, i32 0, i64 1
  %19 = load i32* %18, align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %19)
  %21 = load %struct.S** %1, align 8
  %22 = getelementptr inbounds %struct.S* %21, i32 0, i32 2
  %23 = getelementptr inbounds [6 x i32]* %22, i32 0, i64 2
  %24 = load i32* %23, align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %24)
  %26 = load %struct.S** %1, align 8
  %27 = getelementptr inbounds %struct.S* %26, i32 0, i32 2
  %28 = getelementptr inbounds [6 x i32]* %27, i32 0, i64 3
  %29 = load i32* %28, align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %29)
  %31 = load %struct.S** %1, align 8
  %32 = getelementptr inbounds %struct.S* %31, i32 0, i32 2
  %33 = getelementptr inbounds [6 x i32]* %32, i32 0, i64 4
  %34 = load i32* %33, align 4
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %34)
  %36 = load %struct.S** %1, align 8
  %37 = getelementptr inbounds %struct.S* %36, i32 0, i32 2
  %38 = getelementptr inbounds [6 x i32]* %37, i32 0, i64 5
  %39 = load i32* %38, align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %39)
  %41 = load %struct.S** %1, align 8
  %42 = getelementptr inbounds %struct.S* %41, i32 0, i32 3
  %43 = getelementptr inbounds %struct.T* %42, i32 0, i32 0
  %44 = load i32* %43, align 4
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %44)
  %46 = load %struct.S** %1, align 8
  %47 = getelementptr inbounds %struct.S* %46, i32 0, i32 3
  %48 = getelementptr inbounds %struct.T* %47, i32 0, i32 1
  %49 = getelementptr inbounds [8 x i32]* %48, i32 0, i64 0
  %50 = load i32* %49, align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %50)
  %52 = load %struct.S** %1, align 8
  %53 = getelementptr inbounds %struct.S* %52, i32 0, i32 3
  %54 = getelementptr inbounds %struct.T* %53, i32 0, i32 1
  %55 = getelementptr inbounds [8 x i32]* %54, i32 0, i64 1
  %56 = load i32* %55, align 4
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %56)
  %58 = load %struct.S** %1, align 8
  %59 = getelementptr inbounds %struct.S* %58, i32 0, i32 3
  %60 = getelementptr inbounds %struct.T* %59, i32 0, i32 1
  %61 = getelementptr inbounds [8 x i32]* %60, i32 0, i64 2
  %62 = load i32* %61, align 4
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %62)
  %64 = load %struct.S** %1, align 8
  %65 = getelementptr inbounds %struct.S* %64, i32 0, i32 3
  %66 = getelementptr inbounds %struct.T* %65, i32 0, i32 1
  %67 = getelementptr inbounds [8 x i32]* %66, i32 0, i64 3
  %68 = load i32* %67, align 4
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %68)
  %70 = load %struct.S** %1, align 8
  %71 = getelementptr inbounds %struct.S* %70, i32 0, i32 3
  %72 = getelementptr inbounds %struct.T* %71, i32 0, i32 1
  %73 = getelementptr inbounds [8 x i32]* %72, i32 0, i64 4
  %74 = load i32* %73, align 4
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %74)
  %76 = load %struct.S** %1, align 8
  %77 = getelementptr inbounds %struct.S* %76, i32 0, i32 3
  %78 = getelementptr inbounds %struct.T* %77, i32 0, i32 1
  %79 = getelementptr inbounds [8 x i32]* %78, i32 0, i64 5
  %80 = load i32* %79, align 4
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %80)
  %82 = load %struct.S** %1, align 8
  %83 = getelementptr inbounds %struct.S* %82, i32 0, i32 3
  %84 = getelementptr inbounds %struct.T* %83, i32 0, i32 1
  %85 = getelementptr inbounds [8 x i32]* %84, i32 0, i64 6
  %86 = load i32* %85, align 4
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %86)
  %88 = load %struct.S** %1, align 8
  %89 = getelementptr inbounds %struct.S* %88, i32 0, i32 3
  %90 = getelementptr inbounds %struct.T* %89, i32 0, i32 1
  %91 = getelementptr inbounds [8 x i32]* %90, i32 0, i64 7
  %92 = load i32* %91, align 4
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %92)
  %94 = load %struct.S** %1, align 8
  %95 = getelementptr inbounds %struct.S* %2, i32 0, i32 0
  %96 = load %struct.S** %1, align 8
  %97 = getelementptr inbounds %struct.S* %96, i32 0, i32 1
  %98 = load i32* %97, align 4
  store i32 %98, i32* %95, align 4
  %99 = getelementptr inbounds %struct.S* %2, i32 0, i32 1
  %100 = load %struct.S** %1, align 8
  %101 = getelementptr inbounds %struct.S* %100, i32 0, i32 0
  %102 = load i32* %101, align 4
  store i32 %102, i32* %99, align 4
  %103 = getelementptr inbounds %struct.S* %2, i32 0, i32 2
  %104 = bitcast [6 x i32]* %103 to i8*
  call void @llvm.memset.p0i8.i64(i8* %104, i8 0, i64 24, i32 4, i1 false)
  %105 = getelementptr inbounds [6 x i32]* %103, i64 0, i64 0
  %106 = getelementptr inbounds i32* %105, i64 1
  %107 = getelementptr inbounds i32* %106, i64 1
  %108 = getelementptr inbounds i32* %107, i64 1
  %109 = getelementptr inbounds i32* %108, i64 1
  %110 = getelementptr inbounds i32* %109, i64 1
  %111 = getelementptr inbounds %struct.S* %2, i32 0, i32 3
  %112 = load %struct.S** %1, align 8
  %113 = getelementptr inbounds %struct.S* %112, i32 0, i32 3
  %114 = bitcast %struct.T* %111 to i8*
  %115 = bitcast %struct.T* %113 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %114, i8* %115, i64 36, i32 4, i1 false)
  %116 = bitcast %struct.S* %94 to i8*
  %117 = bitcast %struct.S* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %116, i8* %117, i64 68, i32 4, i1 false)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.S, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  call void @foo(%struct.S* %s)
  %3 = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %7 = load i32* %6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %7)
  %9 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %10 = getelementptr inbounds [6 x i32]* %9, i32 0, i64 0
  %11 = load i32* %10, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11)
  %13 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %14 = getelementptr inbounds [6 x i32]* %13, i32 0, i64 1
  %15 = load i32* %14, align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %15)
  %17 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %18 = getelementptr inbounds [6 x i32]* %17, i32 0, i64 2
  %19 = load i32* %18, align 4
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %19)
  %21 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %22 = getelementptr inbounds [6 x i32]* %21, i32 0, i64 3
  %23 = load i32* %22, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %23)
  %25 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %26 = getelementptr inbounds [6 x i32]* %25, i32 0, i64 4
  %27 = load i32* %26, align 4
  %28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %27)
  %29 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %30 = getelementptr inbounds [6 x i32]* %29, i32 0, i64 5
  %31 = load i32* %30, align 4
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %31)
  %33 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %34 = getelementptr inbounds %struct.T* %33, i32 0, i32 0
  %35 = load i32* %34, align 4
  %36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %35)
  %37 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %38 = getelementptr inbounds %struct.T* %37, i32 0, i32 1
  %39 = getelementptr inbounds [8 x i32]* %38, i32 0, i64 0
  %40 = load i32* %39, align 4
  %41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %40)
  %42 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %43 = getelementptr inbounds %struct.T* %42, i32 0, i32 1
  %44 = getelementptr inbounds [8 x i32]* %43, i32 0, i64 1
  %45 = load i32* %44, align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %45)
  %47 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %48 = getelementptr inbounds %struct.T* %47, i32 0, i32 1
  %49 = getelementptr inbounds [8 x i32]* %48, i32 0, i64 2
  %50 = load i32* %49, align 4
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %50)
  %52 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %53 = getelementptr inbounds %struct.T* %52, i32 0, i32 1
  %54 = getelementptr inbounds [8 x i32]* %53, i32 0, i64 3
  %55 = load i32* %54, align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %55)
  %57 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %58 = getelementptr inbounds %struct.T* %57, i32 0, i32 1
  %59 = getelementptr inbounds [8 x i32]* %58, i32 0, i64 4
  %60 = load i32* %59, align 4
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %60)
  %62 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %63 = getelementptr inbounds %struct.T* %62, i32 0, i32 1
  %64 = getelementptr inbounds [8 x i32]* %63, i32 0, i64 5
  %65 = load i32* %64, align 4
  %66 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %65)
  %67 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %68 = getelementptr inbounds %struct.T* %67, i32 0, i32 1
  %69 = getelementptr inbounds [8 x i32]* %68, i32 0, i64 6
  %70 = load i32* %69, align 4
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %70)
  %72 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %73 = getelementptr inbounds %struct.T* %72, i32 0, i32 1
  %74 = getelementptr inbounds [8 x i32]* %73, i32 0, i64 7
  %75 = load i32* %74, align 4
  %76 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %75)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
