; ModuleID = './bitfld-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.x = type { [2 x i8], [2 x i8] }

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %bit = alloca %struct.x, align 4
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  %unsigned_result = alloca i32, align 4
  %signed_result = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 44, i32* %unsigned_result, align 4
  store i32 -13, i32* %signed_result, align 4
  %4 = bitcast %struct.x* %bit to i16*
  %5 = load i16* %4, align 4
  %6 = and i16 %5, -16257
  %7 = or i16 %6, 7808
  store i16 %7, i16* %4, align 4
  store i32 61, i32* %u, align 4
  %8 = bitcast %struct.x* %bit to i16*
  %9 = load i16* %8, align 4
  %10 = and i16 %9, -128
  %11 = or i16 %10, 115
  store i16 %11, i16* %8, align 4
  store i32 -13, i32* %i, align 4
  %12 = load i32* %i, align 4
  %13 = load i32* %u, align 4
  %14 = urem i32 %12, %13
  %15 = load i32* %unsigned_result, align 4
  %16 = icmp ne i32 %14, %15
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %0
  %19 = load i32* %i, align 4
  %20 = load i32* %u, align 4
  %21 = urem i32 %19, %20
  %22 = load i32* %unsigned_result, align 4
  %23 = icmp ne i32 %21, %22
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %18
  %26 = load i32* %i, align 4
  %27 = bitcast %struct.x* %bit to i16*
  %28 = load i16* %27, align 4
  %29 = lshr i16 %28, 7
  %30 = and i16 %29, 127
  %31 = zext i16 %30 to i32
  %32 = srem i32 %26, %31
  %33 = load i32* %signed_result, align 4
  %34 = icmp ne i32 %32, %33
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:36                                      ; preds = %25
  %37 = bitcast %struct.x* %bit to i16*
  %38 = load i16* %37, align 4
  %39 = shl i16 %38, 9
  %40 = ashr i16 %39, 9
  %41 = sext i16 %40 to i32
  %42 = bitcast %struct.x* %bit to i16*
  %43 = load i16* %42, align 4
  %44 = lshr i16 %43, 7
  %45 = and i16 %44, 127
  %46 = zext i16 %45 to i32
  %47 = srem i32 %41, %46
  %48 = load i32* %signed_result, align 4
  %49 = icmp ne i32 %47, %48
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %36
  call void @abort() #2
  unreachable

; <label>:51                                      ; preds = %36
  %52 = load i32* %i, align 4
  %53 = bitcast %struct.x* %bit to i16*
  %54 = load i16* %53, align 4
  %55 = lshr i16 %54, 7
  %56 = and i16 %55, 127
  %57 = zext i16 %56 to i32
  %58 = urem i32 %52, %57
  %59 = load i32* %unsigned_result, align 4
  %60 = icmp ne i32 %58, %59
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %51
  call void @abort() #2
  unreachable

; <label>:62                                      ; preds = %51
  %63 = bitcast %struct.x* %bit to i16*
  %64 = load i16* %63, align 4
  %65 = shl i16 %64, 9
  %66 = ashr i16 %65, 9
  %67 = sext i16 %66 to i32
  %68 = bitcast %struct.x* %bit to i16*
  %69 = load i16* %68, align 4
  %70 = lshr i16 %69, 7
  %71 = and i16 %70, 127
  %72 = zext i16 %71 to i32
  %73 = urem i32 %67, %72
  %74 = load i32* %unsigned_result, align 4
  %75 = icmp ne i32 %73, %74
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %62
  call void @abort() #2
  unreachable

; <label>:77                                      ; preds = %62
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
