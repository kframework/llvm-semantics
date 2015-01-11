; ModuleID = './pr31169.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tree_type = type { [2 x i8], [2 x i8] }

; Function Attrs: nounwind uwtable
define i32 @sign_bit_p(%struct.tree_type* %t, i64 %val_hi, i64 %val_lo) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.tree_type*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %mask_lo = alloca i64, align 8
  %lo = alloca i64, align 8
  %mask_hi = alloca i64, align 8
  %hi = alloca i64, align 8
  %width = alloca i32, align 4
  store %struct.tree_type* %t, %struct.tree_type** %2, align 8
  store i64 %val_hi, i64* %3, align 8
  store i64 %val_lo, i64* %4, align 8
  %5 = load %struct.tree_type** %2, align 8
  %6 = bitcast %struct.tree_type* %5 to i16*
  %7 = load i16* %6, align 4
  %8 = and i16 %7, 511
  %9 = zext i16 %8 to i32
  store i32 %9, i32* %width, align 4
  %10 = load i32* %width, align 4
  %11 = sext i32 %10 to i64
  %12 = icmp ugt i64 %11, 64
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %0
  %14 = load i32* %width, align 4
  %15 = sext i32 %14 to i64
  %16 = sub i64 %15, 64
  %17 = sub i64 %16, 1
  %18 = shl i64 1, %17
  store i64 %18, i64* %hi, align 8
  store i64 0, i64* %lo, align 8
  %19 = load i32* %width, align 4
  %20 = sext i32 %19 to i64
  %21 = sub i64 128, %20
  %22 = lshr i64 -1, %21
  store i64 %22, i64* %mask_hi, align 8
  store i64 -1, i64* %mask_lo, align 8
  br label %32

; <label>:23                                      ; preds = %0
  store i64 0, i64* %hi, align 8
  %24 = load i32* %width, align 4
  %25 = sub nsw i32 %24, 1
  %26 = zext i32 %25 to i64
  %27 = shl i64 1, %26
  store i64 %27, i64* %lo, align 8
  store i64 0, i64* %mask_hi, align 8
  %28 = load i32* %width, align 4
  %29 = sext i32 %28 to i64
  %30 = sub i64 64, %29
  %31 = lshr i64 -1, %30
  store i64 %31, i64* %mask_lo, align 8
  br label %32

; <label>:32                                      ; preds = %23, %13
  %33 = load i64* %3, align 8
  %34 = load i64* %mask_hi, align 8
  %35 = and i64 %33, %34
  %36 = load i64* %hi, align 8
  %37 = icmp eq i64 %35, %36
  br i1 %37, label %38, label %45

; <label>:38                                      ; preds = %32
  %39 = load i64* %4, align 8
  %40 = load i64* %mask_lo, align 8
  %41 = and i64 %39, %40
  %42 = load i64* %lo, align 8
  %43 = icmp eq i64 %41, %42
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %38
  store i32 1, i32* %1
  br label %46

; <label>:45                                      ; preds = %38, %32
  store i32 0, i32* %1
  br label %46

; <label>:46                                      ; preds = %45, %44
  %47 = load i32* %1
  ret i32 %47
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca %struct.tree_type, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.tree_type* %t to i16*
  %3 = load i16* %2, align 4
  %4 = and i16 %3, -512
  %5 = or i16 %4, 1
  store i16 %5, i16* %2, align 4
  %6 = call i32 @sign_bit_p(%struct.tree_type* %t, i64 0, i64 -1)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %9, label %8

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
