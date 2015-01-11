; ModuleID = './950607-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Point = type { i64, i64 }

; Function Attrs: nounwind uwtable
define i32 @f(i64 %basePt.coerce0, i64 %basePt.coerce1, i64 %pt1.coerce0, i64 %pt1.coerce1, i64 %pt2.coerce0, i64 %pt2.coerce1) #0 {
  %1 = alloca i32, align 4
  %basePt = alloca %struct.Point, align 8
  %pt1 = alloca %struct.Point, align 8
  %pt2 = alloca %struct.Point, align 8
  %vector = alloca i64, align 8
  %2 = bitcast %struct.Point* %basePt to { i64, i64 }*
  %3 = getelementptr { i64, i64 }* %2, i32 0, i32 0
  store i64 %basePt.coerce0, i64* %3
  %4 = getelementptr { i64, i64 }* %2, i32 0, i32 1
  store i64 %basePt.coerce1, i64* %4
  %5 = bitcast %struct.Point* %pt1 to { i64, i64 }*
  %6 = getelementptr { i64, i64 }* %5, i32 0, i32 0
  store i64 %pt1.coerce0, i64* %6
  %7 = getelementptr { i64, i64 }* %5, i32 0, i32 1
  store i64 %pt1.coerce1, i64* %7
  %8 = bitcast %struct.Point* %pt2 to { i64, i64 }*
  %9 = getelementptr { i64, i64 }* %8, i32 0, i32 0
  store i64 %pt2.coerce0, i64* %9
  %10 = getelementptr { i64, i64 }* %8, i32 0, i32 1
  store i64 %pt2.coerce1, i64* %10
  %11 = getelementptr inbounds %struct.Point* %pt1, i32 0, i32 0
  %12 = load i64* %11, align 8
  %13 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 0
  %14 = load i64* %13, align 8
  %15 = sub nsw i64 %12, %14
  %16 = getelementptr inbounds %struct.Point* %pt2, i32 0, i32 1
  %17 = load i64* %16, align 8
  %18 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 1
  %19 = load i64* %18, align 8
  %20 = sub nsw i64 %17, %19
  %21 = mul nsw i64 %15, %20
  %22 = getelementptr inbounds %struct.Point* %pt1, i32 0, i32 1
  %23 = load i64* %22, align 8
  %24 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 1
  %25 = load i64* %24, align 8
  %26 = sub nsw i64 %23, %25
  %27 = getelementptr inbounds %struct.Point* %pt2, i32 0, i32 0
  %28 = load i64* %27, align 8
  %29 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 0
  %30 = load i64* %29, align 8
  %31 = sub nsw i64 %28, %30
  %32 = mul nsw i64 %26, %31
  %33 = sub nsw i64 %21, %32
  store i64 %33, i64* %vector, align 8
  %34 = load i64* %vector, align 8
  %35 = icmp sgt i64 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %0
  store i32 0, i32* %1
  br label %42

; <label>:37                                      ; preds = %0
  %38 = load i64* %vector, align 8
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  store i32 1, i32* %1
  br label %42

; <label>:41                                      ; preds = %37
  store i32 2, i32* %1
  br label %42

; <label>:42                                      ; preds = %41, %40, %36
  %43 = load i32* %1
  ret i32 %43
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %b = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %answer = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.Point* %b, i32 0, i32 0
  store i64 -23250, i64* %2, align 8
  %3 = getelementptr inbounds %struct.Point* %b, i32 0, i32 1
  store i64 23250, i64* %3, align 8
  %4 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 0
  store i64 23250, i64* %4, align 8
  %5 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 1
  store i64 -23250, i64* %5, align 8
  %6 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 0
  store i64 -23250, i64* %6, align 8
  %7 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 1
  store i64 -23250, i64* %7, align 8
  %8 = bitcast %struct.Point* %b to { i64, i64 }*
  %9 = getelementptr { i64, i64 }* %8, i32 0, i32 0
  %10 = load i64* %9, align 1
  %11 = getelementptr { i64, i64 }* %8, i32 0, i32 1
  %12 = load i64* %11, align 1
  %13 = bitcast %struct.Point* %p1 to { i64, i64 }*
  %14 = getelementptr { i64, i64 }* %13, i32 0, i32 0
  %15 = load i64* %14, align 1
  %16 = getelementptr { i64, i64 }* %13, i32 0, i32 1
  %17 = load i64* %16, align 1
  %18 = bitcast %struct.Point* %p2 to { i64, i64 }*
  %19 = getelementptr { i64, i64 }* %18, i32 0, i32 0
  %20 = load i64* %19, align 1
  %21 = getelementptr { i64, i64 }* %18, i32 0, i32 1
  %22 = load i64* %21, align 1
  %23 = call i32 @f(i64 %10, i64 %12, i64 %15, i64 %17, i64 %20, i64 %22)
  store i32 %23, i32* %answer, align 4
  %24 = load i32* %answer, align 4
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:27                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %29 = load i32* %1
  ret i32 %29
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
