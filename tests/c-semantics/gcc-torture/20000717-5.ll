; ModuleID = './20000717-5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.trio = type { i32, i32, i32 }

@main.t = private unnamed_addr constant %struct.trio { i32 1, i32 2, i32 3 }, align 4

; Function Attrs: nounwind uwtable
define i32 @bar(i32 %i, i32 %j, i32 %k, i64 %t.coerce0, i32 %t.coerce1) #0 {
  %t = alloca %struct.trio, align 8
  %1 = alloca { i64, i32 }, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %t.coerce0, i64* %5
  %6 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %t.coerce1, i32* %6
  %7 = bitcast %struct.trio* %t to i8*
  %8 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 12, i32 8, i1 false)
  store i32 %i, i32* %2, align 4
  store i32 %j, i32* %3, align 4
  store i32 %k, i32* %4, align 4
  %9 = getelementptr inbounds %struct.trio* %t, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %29, label %12

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.trio* %t, i32 0, i32 1
  %14 = load i32* %13, align 4
  %15 = icmp ne i32 %14, 2
  br i1 %15, label %29, label %16

; <label>:16                                      ; preds = %12
  %17 = getelementptr inbounds %struct.trio* %t, i32 0, i32 2
  %18 = load i32* %17, align 4
  %19 = icmp ne i32 %18, 3
  br i1 %19, label %29, label %20

; <label>:20                                      ; preds = %16
  %21 = load i32* %2, align 4
  %22 = icmp ne i32 %21, 4
  br i1 %22, label %29, label %23

; <label>:23                                      ; preds = %20
  %24 = load i32* %3, align 4
  %25 = icmp ne i32 %24, 5
  br i1 %25, label %29, label %26

; <label>:26                                      ; preds = %23
  %27 = load i32* %4, align 4
  %28 = icmp ne i32 %27, 6
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %26, %23, %20, %16, %12, %0
  call void @abort() #3
  unreachable

; <label>:30                                      ; preds = %26
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @foo(i64 %t.coerce0, i32 %t.coerce1, i32 %i, i32 %j, i32 %k) #0 {
  %t = alloca %struct.trio, align 8
  %1 = alloca { i64, i32 }, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca { i64, i32 }
  %6 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %t.coerce0, i64* %6
  %7 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %t.coerce1, i32* %7
  %8 = bitcast %struct.trio* %t to i8*
  %9 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 12, i32 8, i1 false)
  store i32 %i, i32* %2, align 4
  store i32 %j, i32* %3, align 4
  store i32 %k, i32* %4, align 4
  %10 = load i32* %2, align 4
  %11 = load i32* %3, align 4
  %12 = load i32* %4, align 4
  %13 = bitcast { i64, i32 }* %5 to i8*
  %14 = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 12, i32 0, i1 false)
  %15 = getelementptr { i64, i32 }* %5, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr { i64, i32 }* %5, i32 0, i32 1
  %18 = load i32* %17, align 1
  %19 = call i32 @bar(i32 %10, i32 %11, i32 %12, i64 %16, i32 %18)
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca %struct.trio, align 4
  %2 = alloca { i64, i32 }
  store i32 0, i32* %1
  %3 = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.trio* @main.t to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast { i64, i32 }* %2 to i8*
  %5 = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 12, i32 0, i1 false)
  %6 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  %9 = load i32* %8, align 1
  %10 = call i32 @foo(i64 %7, i32 %9, i32 4, i32 5, i32 6)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
