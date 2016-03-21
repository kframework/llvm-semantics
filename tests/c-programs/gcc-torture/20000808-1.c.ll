; ModuleID = './20000808-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Point = type { i64, i64 }

; Function Attrs: nounwind uwtable
define void @bar() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define void @f(i64 %p0.coerce0, i64 %p0.coerce1, i64 %p1.coerce0, i64 %p1.coerce1, i64 %p2.coerce0, i64 %p2.coerce1, %struct.Point* byval align 8 %p3, %struct.Point* byval align 8 %p4, %struct.Point* byval align 8 %p5) #0 {
  %p0 = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %1 = bitcast %struct.Point* %p0 to { i64, i64 }*
  %2 = getelementptr { i64, i64 }, { i64, i64 }* %1, i32 0, i32 0
  store i64 %p0.coerce0, i64* %2
  %3 = getelementptr { i64, i64 }, { i64, i64 }* %1, i32 0, i32 1
  store i64 %p0.coerce1, i64* %3
  %4 = bitcast %struct.Point* %p1 to { i64, i64 }*
  %5 = getelementptr { i64, i64 }, { i64, i64 }* %4, i32 0, i32 0
  store i64 %p1.coerce0, i64* %5
  %6 = getelementptr { i64, i64 }, { i64, i64 }* %4, i32 0, i32 1
  store i64 %p1.coerce1, i64* %6
  %7 = bitcast %struct.Point* %p2 to { i64, i64 }*
  %8 = getelementptr { i64, i64 }, { i64, i64 }* %7, i32 0, i32 0
  store i64 %p2.coerce0, i64* %8
  %9 = getelementptr { i64, i64 }, { i64, i64 }* %7, i32 0, i32 1
  store i64 %p2.coerce1, i64* %9
  %10 = getelementptr inbounds %struct.Point, %struct.Point* %p0, i32 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = icmp ne i64 %11, 0
  br i1 %12, label %57, label %13

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.Point, %struct.Point* %p0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8
  %16 = icmp ne i64 %15, 1
  br i1 %16, label %57, label %17

; <label>:17                                      ; preds = %13
  %18 = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 0
  %19 = load i64, i64* %18, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %57, label %21

; <label>:21                                      ; preds = %17
  %22 = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 1
  %23 = load i64, i64* %22, align 8
  %24 = icmp ne i64 %23, 0
  br i1 %24, label %57, label %25

; <label>:25                                      ; preds = %21
  %26 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 0
  %27 = load i64, i64* %26, align 8
  %28 = icmp ne i64 %27, 1
  br i1 %28, label %57, label %29

; <label>:29                                      ; preds = %25
  %30 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 1
  %31 = load i64, i64* %30, align 8
  %32 = icmp ne i64 %31, -1
  br i1 %32, label %57, label %33

; <label>:33                                      ; preds = %29
  %34 = getelementptr inbounds %struct.Point, %struct.Point* %p3, i32 0, i32 0
  %35 = load i64, i64* %34, align 8
  %36 = icmp ne i64 %35, -1
  br i1 %36, label %57, label %37

; <label>:37                                      ; preds = %33
  %38 = getelementptr inbounds %struct.Point, %struct.Point* %p3, i32 0, i32 1
  %39 = load i64, i64* %38, align 8
  %40 = icmp ne i64 %39, 1
  br i1 %40, label %57, label %41

; <label>:41                                      ; preds = %37
  %42 = getelementptr inbounds %struct.Point, %struct.Point* %p4, i32 0, i32 0
  %43 = load i64, i64* %42, align 8
  %44 = icmp ne i64 %43, 0
  br i1 %44, label %57, label %45

; <label>:45                                      ; preds = %41
  %46 = getelementptr inbounds %struct.Point, %struct.Point* %p4, i32 0, i32 1
  %47 = load i64, i64* %46, align 8
  %48 = icmp ne i64 %47, -1
  br i1 %48, label %57, label %49

; <label>:49                                      ; preds = %45
  %50 = getelementptr inbounds %struct.Point, %struct.Point* %p5, i32 0, i32 0
  %51 = load i64, i64* %50, align 8
  %52 = icmp ne i64 %51, 1
  br i1 %52, label %57, label %53

; <label>:53                                      ; preds = %49
  %54 = getelementptr inbounds %struct.Point, %struct.Point* %p5, i32 0, i32 1
  %55 = load i64, i64* %54, align 8
  %56 = icmp ne i64 %55, 0
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %53, %49, %45, %41, %37, %33, %29, %25, %21, %17, %13, %0
  call void @abort() #2
  unreachable

; <label>:58                                      ; preds = %53
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  %p0 = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %p3 = alloca %struct.Point, align 8
  %p4 = alloca %struct.Point, align 8
  %p5 = alloca %struct.Point, align 8
  call void @bar()
  %1 = getelementptr inbounds %struct.Point, %struct.Point* %p0, i32 0, i32 0
  store i64 0, i64* %1, align 8
  %2 = getelementptr inbounds %struct.Point, %struct.Point* %p0, i32 0, i32 1
  store i64 1, i64* %2, align 8
  %3 = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 0
  store i64 -1, i64* %3, align 8
  %4 = getelementptr inbounds %struct.Point, %struct.Point* %p1, i32 0, i32 1
  store i64 0, i64* %4, align 8
  %5 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 0
  store i64 1, i64* %5, align 8
  %6 = getelementptr inbounds %struct.Point, %struct.Point* %p2, i32 0, i32 1
  store i64 -1, i64* %6, align 8
  %7 = getelementptr inbounds %struct.Point, %struct.Point* %p3, i32 0, i32 0
  store i64 -1, i64* %7, align 8
  %8 = getelementptr inbounds %struct.Point, %struct.Point* %p3, i32 0, i32 1
  store i64 1, i64* %8, align 8
  %9 = getelementptr inbounds %struct.Point, %struct.Point* %p4, i32 0, i32 0
  store i64 0, i64* %9, align 8
  %10 = getelementptr inbounds %struct.Point, %struct.Point* %p4, i32 0, i32 1
  store i64 -1, i64* %10, align 8
  %11 = getelementptr inbounds %struct.Point, %struct.Point* %p5, i32 0, i32 0
  store i64 1, i64* %11, align 8
  %12 = getelementptr inbounds %struct.Point, %struct.Point* %p5, i32 0, i32 1
  store i64 0, i64* %12, align 8
  %13 = bitcast %struct.Point* %p0 to { i64, i64 }*
  %14 = getelementptr { i64, i64 }, { i64, i64 }* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 1
  %16 = getelementptr { i64, i64 }, { i64, i64 }* %13, i32 0, i32 1
  %17 = load i64, i64* %16, align 1
  %18 = bitcast %struct.Point* %p1 to { i64, i64 }*
  %19 = getelementptr { i64, i64 }, { i64, i64 }* %18, i32 0, i32 0
  %20 = load i64, i64* %19, align 1
  %21 = getelementptr { i64, i64 }, { i64, i64 }* %18, i32 0, i32 1
  %22 = load i64, i64* %21, align 1
  %23 = bitcast %struct.Point* %p2 to { i64, i64 }*
  %24 = getelementptr { i64, i64 }, { i64, i64 }* %23, i32 0, i32 0
  %25 = load i64, i64* %24, align 1
  %26 = getelementptr { i64, i64 }, { i64, i64 }* %23, i32 0, i32 1
  %27 = load i64, i64* %26, align 1
  call void @f(i64 %15, i64 %17, i64 %20, i64 %22, i64 %25, i64 %27, %struct.Point* byval align 8 %p3, %struct.Point* byval align 8 %p4, %struct.Point* byval align 8 %p5)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
