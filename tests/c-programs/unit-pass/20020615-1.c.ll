; ModuleID = './20020615-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.font_hints_s = type { i32, i32, i32 }
%struct.gs_fixed_point_s = type { i64, i64 }

@main.fh = internal global [3 x %struct.font_hints_s] [%struct.font_hints_s { i32 0, i32 1, i32 0 }, %struct.font_hints_s { i32 0, i32 0, i32 1 }, %struct.font_hints_s zeroinitializer], align 16
@main.gsf = internal global [4 x %struct.gs_fixed_point_s] [%struct.gs_fixed_point_s { i64 196608, i64 80216 }, %struct.gs_fixed_point_s { i64 196608, i64 98697 }, %struct.gs_fixed_point_s { i64 80216, i64 196608 }, %struct.gs_fixed_point_s { i64 98697, i64 196608 }], align 16

; Function Attrs: nounwind uwtable
define i32 @line_hints(%struct.font_hints_s* %fh, %struct.gs_fixed_point_s* %p0, %struct.gs_fixed_point_s* %p1) #0 {
  %1 = alloca %struct.font_hints_s*, align 8
  %2 = alloca %struct.gs_fixed_point_s*, align 8
  %3 = alloca %struct.gs_fixed_point_s*, align 8
  %dx = alloca i64, align 8
  %dy = alloca i64, align 8
  %adx = alloca i64, align 8
  %ady = alloca i64, align 8
  %xi = alloca i32, align 4
  %yi = alloca i32, align 4
  %hints = alloca i32, align 4
  %t = alloca i64, align 8
  %ti = alloca i32, align 4
  store %struct.font_hints_s* %fh, %struct.font_hints_s** %1, align 8
  store %struct.gs_fixed_point_s* %p0, %struct.gs_fixed_point_s** %2, align 8
  store %struct.gs_fixed_point_s* %p1, %struct.gs_fixed_point_s** %3, align 8
  %4 = load %struct.gs_fixed_point_s*, %struct.gs_fixed_point_s** %3, align 8
  %5 = getelementptr inbounds %struct.gs_fixed_point_s, %struct.gs_fixed_point_s* %4, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = load %struct.gs_fixed_point_s*, %struct.gs_fixed_point_s** %2, align 8
  %8 = getelementptr inbounds %struct.gs_fixed_point_s, %struct.gs_fixed_point_s* %7, i32 0, i32 0
  %9 = load i64, i64* %8, align 8
  %10 = sub nsw i64 %6, %9
  store i64 %10, i64* %dx, align 8
  %11 = load %struct.gs_fixed_point_s*, %struct.gs_fixed_point_s** %3, align 8
  %12 = getelementptr inbounds %struct.gs_fixed_point_s, %struct.gs_fixed_point_s* %11, i32 0, i32 1
  %13 = load i64, i64* %12, align 8
  %14 = load %struct.gs_fixed_point_s*, %struct.gs_fixed_point_s** %2, align 8
  %15 = getelementptr inbounds %struct.gs_fixed_point_s, %struct.gs_fixed_point_s* %14, i32 0, i32 1
  %16 = load i64, i64* %15, align 8
  %17 = sub nsw i64 %13, %16
  store i64 %17, i64* %dy, align 8
  %18 = load %struct.font_hints_s*, %struct.font_hints_s** %1, align 8
  %19 = getelementptr inbounds %struct.font_hints_s, %struct.font_hints_s* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 4
  store i32 %20, i32* %xi, align 4
  %21 = load %struct.font_hints_s*, %struct.font_hints_s** %1, align 8
  %22 = getelementptr inbounds %struct.font_hints_s, %struct.font_hints_s* %21, i32 0, i32 2
  %23 = load i32, i32* %22, align 4
  store i32 %23, i32* %yi, align 4
  %24 = load i32, i32* %xi, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %29

; <label>:26                                      ; preds = %0
  %27 = load i64, i64* %dx, align 8
  %28 = sub nsw i64 0, %27
  store i64 %28, i64* %dx, align 8
  br label %29

; <label>:29                                      ; preds = %26, %0
  %30 = load i32, i32* %yi, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %35

; <label>:32                                      ; preds = %29
  %33 = load i64, i64* %dy, align 8
  %34 = sub nsw i64 0, %33
  store i64 %34, i64* %dy, align 8
  br label %35

; <label>:35                                      ; preds = %32, %29
  %36 = load %struct.font_hints_s*, %struct.font_hints_s** %1, align 8
  %37 = getelementptr inbounds %struct.font_hints_s, %struct.font_hints_s* %36, i32 0, i32 0
  %38 = load i32, i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %47

; <label>:40                                      ; preds = %35
  %41 = load i64, i64* %dx, align 8
  store i64 %41, i64* %t, align 8
  %42 = load i32, i32* %xi, align 4
  store i32 %42, i32* %ti, align 4
  %43 = load i64, i64* %dy, align 8
  store i64 %43, i64* %dx, align 8
  %44 = load i32, i32* %yi, align 4
  store i32 %44, i32* %xi, align 4
  %45 = load i64, i64* %t, align 8
  store i64 %45, i64* %dy, align 8
  %46 = load i32, i32* %ti, align 4
  store i32 %46, i32* %yi, align 4
  br label %47

; <label>:47                                      ; preds = %40, %35
  %48 = load i64, i64* %dx, align 8
  %49 = icmp slt i64 %48, 0
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %47
  %51 = load i64, i64* %dx, align 8
  %52 = sub nsw i64 0, %51
  br label %55

; <label>:53                                      ; preds = %47
  %54 = load i64, i64* %dx, align 8
  br label %55

; <label>:55                                      ; preds = %53, %50
  %56 = phi i64 [ %52, %50 ], [ %54, %53 ]
  store i64 %56, i64* %adx, align 8
  %57 = load i64, i64* %dy, align 8
  %58 = icmp slt i64 %57, 0
  br i1 %58, label %59, label %62

; <label>:59                                      ; preds = %55
  %60 = load i64, i64* %dy, align 8
  %61 = sub nsw i64 0, %60
  br label %64

; <label>:62                                      ; preds = %55
  %63 = load i64, i64* %dy, align 8
  br label %64

; <label>:64                                      ; preds = %62, %59
  %65 = phi i64 [ %61, %59 ], [ %63, %62 ]
  store i64 %65, i64* %ady, align 8
  %66 = load i64, i64* %dy, align 8
  %67 = icmp ne i64 %66, 0
  br i1 %67, label %68, label %83

; <label>:68                                      ; preds = %64
  %69 = load i64, i64* %adx, align 8
  %70 = load i64, i64* %ady, align 8
  %71 = ashr i64 %70, 4
  %72 = icmp sle i64 %69, %71
  br i1 %72, label %73, label %83

; <label>:73                                      ; preds = %68
  %74 = load i64, i64* %dy, align 8
  %75 = icmp sgt i64 %74, 0
  %76 = select i1 %75, i32 2, i32 1
  store i32 %76, i32* %hints, align 4
  %77 = load i32, i32* %xi, align 4
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %79, label %82

; <label>:79                                      ; preds = %73
  %80 = load i32, i32* %hints, align 4
  %81 = xor i32 %80, 3
  store i32 %81, i32* %hints, align 4
  br label %82

; <label>:82                                      ; preds = %79, %73
  br label %103

; <label>:83                                      ; preds = %68, %64
  %84 = load i64, i64* %dx, align 8
  %85 = icmp ne i64 %84, 0
  br i1 %85, label %86, label %101

; <label>:86                                      ; preds = %83
  %87 = load i64, i64* %ady, align 8
  %88 = load i64, i64* %adx, align 8
  %89 = ashr i64 %88, 4
  %90 = icmp sle i64 %87, %89
  br i1 %90, label %91, label %101

; <label>:91                                      ; preds = %86
  %92 = load i64, i64* %dx, align 8
  %93 = icmp slt i64 %92, 0
  %94 = select i1 %93, i32 8, i32 4
  store i32 %94, i32* %hints, align 4
  %95 = load i32, i32* %yi, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %100

; <label>:97                                      ; preds = %91
  %98 = load i32, i32* %hints, align 4
  %99 = xor i32 %98, 12
  store i32 %99, i32* %hints, align 4
  br label %100

; <label>:100                                     ; preds = %97, %91
  br label %102

; <label>:101                                     ; preds = %86, %83
  store i32 0, i32* %hints, align 4
  br label %102

; <label>:102                                     ; preds = %101, %100
  br label %103

; <label>:103                                     ; preds = %102, %82
  %104 = load i32, i32* %hints, align 4
  ret i32 %104
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @line_hints(%struct.font_hints_s* getelementptr inbounds ([3 x %struct.font_hints_s], [3 x %struct.font_hints_s]* @main.fh, i32 0, i32 0), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s], [4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i32 0), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s], [4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 1))
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %10, label %4

; <label>:4                                       ; preds = %0
  %5 = call i32 @line_hints(%struct.font_hints_s* getelementptr inbounds ([3 x %struct.font_hints_s], [3 x %struct.font_hints_s]* @main.fh, i32 0, i64 1), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s], [4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 2), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s], [4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 3))
  %6 = icmp ne i32 %5, 8
  br i1 %6, label %10, label %7

; <label>:7                                       ; preds = %4
  %8 = call i32 @line_hints(%struct.font_hints_s* getelementptr inbounds ([3 x %struct.font_hints_s], [3 x %struct.font_hints_s]* @main.fh, i32 0, i64 2), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s], [4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 2), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s], [4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 3))
  %9 = icmp ne i32 %8, 4
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %7, %4, %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %7
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %13 = load i32, i32* %1
  ret i32 %13
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
