; ModuleID = './conditionalTests.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, i32 }

@main.a = private unnamed_addr constant %struct.S { i32 1, i32 0 }, align 4
@main.b = private unnamed_addr constant %struct.S { i32 2, i32 0 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @f() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %p1 = alloca %struct.S*, align 8
  %p2 = alloca %struct.S*, align 8
  %2 = alloca %struct.S, align 4
  %3 = alloca %struct.S, align 4
  store i32 0, i32* %1
  %4 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast (%struct.S* @main.a to i8*), i64 8, i32 4, i1 false)
  %5 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* bitcast (%struct.S* @main.b to i8*), i64 8, i32 4, i1 false)
  store %struct.S* %a, %struct.S** %p1, align 8
  store %struct.S* %b, %struct.S** %p2, align 8
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 -2147483648)
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 -2147483648)
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 250)
  %9 = load %struct.S** %p2, align 8
  %10 = getelementptr inbounds %struct.S* %9, i32 0, i32 0
  %11 = load i32* %10, align 4
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %11)
  br i1 true, label %13, label %17

; <label>:13                                      ; preds = %0
  %14 = load %struct.S** %p1, align 8
  %15 = bitcast %struct.S* %2 to i8*
  %16 = bitcast %struct.S* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 8, i32 4, i1 false)
  br label %21

; <label>:17                                      ; preds = %0
  %18 = load %struct.S** %p2, align 8
  %19 = bitcast %struct.S* %2 to i8*
  %20 = bitcast %struct.S* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 8, i32 4, i1 false)
  br label %21

; <label>:21                                      ; preds = %17, %13
  %22 = getelementptr inbounds %struct.S* %2, i32 0, i32 0
  %23 = load i32* %22, align 4
  %24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %23)
  %25 = getelementptr inbounds %struct.S* %b, i32 0, i32 0
  %26 = load i32* %25, align 4
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %26)
  br i1 true, label %28, label %31

; <label>:28                                      ; preds = %21
  %29 = bitcast %struct.S* %3 to i8*
  %30 = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 8, i32 4, i1 false)
  br label %34

; <label>:31                                      ; preds = %21
  %32 = bitcast %struct.S* %3 to i8*
  %33 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 8, i32 4, i1 false)
  br label %34

; <label>:34                                      ; preds = %31, %28
  %35 = getelementptr inbounds %struct.S* %3, i32 0, i32 0
  %36 = load i32* %35, align 4
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %36)
  call void @f()
  %38 = load i32* %1
  ret i32 %38
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
