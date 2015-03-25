; ModuleID = './20020201-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@cx = global i8 7, align 1
@sx = global i16 14, align 2
@ix = global i32 21, align 4
@lx = global i64 28, align 8
@Lx = global i64 35, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %cy = alloca i8, align 1
  %sy = alloca i16, align 2
  %iy = alloca i32, align 4
  %ly = alloca i64, align 8
  %Ly = alloca i64, align 8
  store i32 0, i32* %1
  %2 = load i8* @cx, align 1
  %3 = zext i8 %2 to i32
  %4 = sdiv i32 %3, 6
  %5 = trunc i32 %4 to i8
  store i8 %5, i8* %cy, align 1
  %6 = load i8* %cy, align 1
  %7 = zext i8 %6 to i32
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %0
  %11 = load i8* @cx, align 1
  %12 = zext i8 %11 to i32
  %13 = srem i32 %12, 6
  %14 = trunc i32 %13 to i8
  store i8 %14, i8* %cy, align 1
  %15 = load i8* %cy, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %10
  %20 = load i16* @sx, align 2
  %21 = zext i16 %20 to i32
  %22 = sdiv i32 %21, 6
  %23 = trunc i32 %22 to i16
  store i16 %23, i16* %sy, align 2
  %24 = load i16* %sy, align 2
  %25 = zext i16 %24 to i32
  %26 = icmp ne i32 %25, 2
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %19
  call void @abort() #2
  unreachable

; <label>:28                                      ; preds = %19
  %29 = load i16* @sx, align 2
  %30 = zext i16 %29 to i32
  %31 = srem i32 %30, 6
  %32 = trunc i32 %31 to i16
  store i16 %32, i16* %sy, align 2
  %33 = load i16* %sy, align 2
  %34 = zext i16 %33 to i32
  %35 = icmp ne i32 %34, 2
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %28
  call void @abort() #2
  unreachable

; <label>:37                                      ; preds = %28
  %38 = load i32* @ix, align 4
  %39 = udiv i32 %38, 6
  store i32 %39, i32* %iy, align 4
  %40 = load i32* %iy, align 4
  %41 = icmp ne i32 %40, 3
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %37
  call void @abort() #2
  unreachable

; <label>:43                                      ; preds = %37
  %44 = load i32* @ix, align 4
  %45 = urem i32 %44, 6
  store i32 %45, i32* %iy, align 4
  %46 = load i32* %iy, align 4
  %47 = icmp ne i32 %46, 3
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %43
  call void @abort() #2
  unreachable

; <label>:49                                      ; preds = %43
  %50 = load i64* @lx, align 8
  %51 = udiv i64 %50, 6
  store i64 %51, i64* %ly, align 8
  %52 = load i64* %ly, align 8
  %53 = icmp ne i64 %52, 4
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %49
  call void @abort() #2
  unreachable

; <label>:55                                      ; preds = %49
  %56 = load i64* @lx, align 8
  %57 = urem i64 %56, 6
  store i64 %57, i64* %ly, align 8
  %58 = load i64* %ly, align 8
  %59 = icmp ne i64 %58, 4
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %55
  call void @abort() #2
  unreachable

; <label>:61                                      ; preds = %55
  %62 = load i64* @Lx, align 8
  %63 = udiv i64 %62, 6
  store i64 %63, i64* %Ly, align 8
  %64 = load i64* %Ly, align 8
  %65 = icmp ne i64 %64, 5
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %61
  call void @abort() #2
  unreachable

; <label>:67                                      ; preds = %61
  %68 = load i64* @Lx, align 8
  %69 = urem i64 %68, 6
  store i64 %69, i64* %Ly, align 8
  %70 = load i64* %Ly, align 8
  %71 = icmp ne i64 %70, 5
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %67
  call void @abort() #2
  unreachable

; <label>:73                                      ; preds = %67
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %75 = load i32* %1
  ret i32 %75
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
