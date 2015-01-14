; ModuleID = './20030613-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.CS = type { i64, i64 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.CS, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.CS* %x, i32 0, i32 0
  store i64 -7, i64* %2, align 8
  %3 = getelementptr inbounds %struct.CS* %x, i32 0, i32 1
  store i64 -7, i64* %3, align 8
  %4 = bitcast %struct.CS* %x to { i64, i64 }*
  %5 = getelementptr { i64, i64 }* %4, i32 0, i32 0
  %6 = load i64* %5, align 1
  %7 = getelementptr { i64, i64 }* %4, i32 0, i32 1
  %8 = load i64* %7, align 1
  %9 = call i32 @c5p(i64 %6, i64 %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:12                                      ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @c5p(i64 %x.coerce0, i64 %x.coerce1) #0 {
  %x = alloca %struct.CS, align 8
  %a = alloca %struct.CS, align 8
  %b = alloca %struct.CS, align 8
  %1 = alloca %struct.CS, align 8
  %2 = alloca %struct.CS, align 8
  %3 = alloca %struct.CS, align 8
  %4 = bitcast %struct.CS* %x to { i64, i64 }*
  %5 = getelementptr { i64, i64 }* %4, i32 0, i32 0
  store i64 %x.coerce0, i64* %5
  %6 = getelementptr { i64, i64 }* %4, i32 0, i32 1
  store i64 %x.coerce1, i64* %6
  %7 = bitcast %struct.CS* %x to { i64, i64 }*
  %8 = getelementptr { i64, i64 }* %7, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr { i64, i64 }* %7, i32 0, i32 1
  %11 = load i64* %10, align 1
  %12 = call { i64, i64 } @CPOW(i64 %9, i64 %11, i32 2)
  %13 = bitcast %struct.CS* %1 to { i64, i64 }*
  %14 = getelementptr { i64, i64 }* %13, i32 0, i32 0
  %15 = extractvalue { i64, i64 } %12, 0
  store i64 %15, i64* %14, align 1
  %16 = getelementptr { i64, i64 }* %13, i32 0, i32 1
  %17 = extractvalue { i64, i64 } %12, 1
  store i64 %17, i64* %16, align 1
  %18 = bitcast %struct.CS* %a to i8*
  %19 = bitcast %struct.CS* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 16, i32 8, i1 false)
  %20 = bitcast %struct.CS* %a to { i64, i64 }*
  %21 = getelementptr { i64, i64 }* %20, i32 0, i32 0
  %22 = load i64* %21, align 1
  %23 = getelementptr { i64, i64 }* %20, i32 0, i32 1
  %24 = load i64* %23, align 1
  %25 = call { i64, i64 } @CPOW(i64 %22, i64 %24, i32 2)
  %26 = bitcast %struct.CS* %2 to { i64, i64 }*
  %27 = getelementptr { i64, i64 }* %26, i32 0, i32 0
  %28 = extractvalue { i64, i64 } %25, 0
  store i64 %28, i64* %27, align 1
  %29 = getelementptr { i64, i64 }* %26, i32 0, i32 1
  %30 = extractvalue { i64, i64 } %25, 1
  store i64 %30, i64* %29, align 1
  %31 = bitcast %struct.CS* %2 to { i64, i64 }*
  %32 = getelementptr { i64, i64 }* %31, i32 0, i32 0
  %33 = load i64* %32, align 1
  %34 = getelementptr { i64, i64 }* %31, i32 0, i32 1
  %35 = load i64* %34, align 1
  %36 = call { i64, i64 } @CCID(i64 %33, i64 %35)
  %37 = bitcast %struct.CS* %3 to { i64, i64 }*
  %38 = getelementptr { i64, i64 }* %37, i32 0, i32 0
  %39 = extractvalue { i64, i64 } %36, 0
  store i64 %39, i64* %38, align 1
  %40 = getelementptr { i64, i64 }* %37, i32 0, i32 1
  %41 = extractvalue { i64, i64 } %36, 1
  store i64 %41, i64* %40, align 1
  %42 = bitcast %struct.CS* %b to i8*
  %43 = bitcast %struct.CS* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* %43, i64 16, i32 8, i1 false)
  %44 = getelementptr inbounds %struct.CS* %b, i32 0, i32 0
  %45 = load i64* %44, align 8
  %46 = getelementptr inbounds %struct.CS* %b, i32 0, i32 1
  %47 = load i64* %46, align 8
  %48 = icmp eq i64 %45, %47
  %49 = zext i1 %48 to i32
  ret i32 %49
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define internal { i64, i64 } @CPOW(i64 %x.coerce0, i64 %x.coerce1, i32 %y) #0 {
  %1 = alloca %struct.CS, align 8
  %x = alloca %struct.CS, align 8
  %2 = alloca i32, align 4
  %a = alloca %struct.CS, align 8
  %3 = alloca %struct.CS, align 8
  %4 = bitcast %struct.CS* %x to { i64, i64 }*
  %5 = getelementptr { i64, i64 }* %4, i32 0, i32 0
  store i64 %x.coerce0, i64* %5
  %6 = getelementptr { i64, i64 }* %4, i32 0, i32 1
  store i64 %x.coerce1, i64* %6
  store i32 %y, i32* %2, align 4
  %7 = bitcast %struct.CS* %a to i8*
  %8 = bitcast %struct.CS* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 16, i32 8, i1 false)
  br label %9

; <label>:9                                       ; preds = %13, %0
  %10 = load i32* %2, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, i32* %2, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %27

; <label>:13                                      ; preds = %9
  %14 = bitcast %struct.CS* %a to { i64, i64 }*
  %15 = getelementptr { i64, i64 }* %14, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr { i64, i64 }* %14, i32 0, i32 1
  %18 = load i64* %17, align 1
  %19 = call { i64, i64 } @CCID(i64 %16, i64 %18)
  %20 = bitcast %struct.CS* %3 to { i64, i64 }*
  %21 = getelementptr { i64, i64 }* %20, i32 0, i32 0
  %22 = extractvalue { i64, i64 } %19, 0
  store i64 %22, i64* %21, align 1
  %23 = getelementptr { i64, i64 }* %20, i32 0, i32 1
  %24 = extractvalue { i64, i64 } %19, 1
  store i64 %24, i64* %23, align 1
  %25 = bitcast %struct.CS* %a to i8*
  %26 = bitcast %struct.CS* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 16, i32 8, i1 false)
  br label %9

; <label>:27                                      ; preds = %9
  %28 = bitcast %struct.CS* %1 to i8*
  %29 = bitcast %struct.CS* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 16, i32 8, i1 false)
  %30 = bitcast %struct.CS* %1 to { i64, i64 }*
  %31 = load { i64, i64 }* %30, align 1
  ret { i64, i64 } %31
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define internal { i64, i64 } @CCID(i64 %x.coerce0, i64 %x.coerce1) #0 {
  %1 = alloca %struct.CS, align 8
  %x = alloca %struct.CS, align 8
  %a = alloca %struct.CS, align 8
  %2 = bitcast %struct.CS* %x to { i64, i64 }*
  %3 = getelementptr { i64, i64 }* %2, i32 0, i32 0
  store i64 %x.coerce0, i64* %3
  %4 = getelementptr { i64, i64 }* %2, i32 0, i32 1
  store i64 %x.coerce1, i64* %4
  %5 = getelementptr inbounds %struct.CS* %x, i32 0, i32 0
  %6 = load i64* %5, align 8
  %7 = getelementptr inbounds %struct.CS* %a, i32 0, i32 0
  store i64 %6, i64* %7, align 8
  %8 = getelementptr inbounds %struct.CS* %x, i32 0, i32 1
  %9 = load i64* %8, align 8
  %10 = getelementptr inbounds %struct.CS* %a, i32 0, i32 1
  store i64 %9, i64* %10, align 8
  %11 = bitcast %struct.CS* %1 to i8*
  %12 = bitcast %struct.CS* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 16, i32 8, i1 false)
  %13 = bitcast %struct.CS* %1 to { i64, i64 }*
  %14 = load { i64, i64 }* %13, align 1
  ret { i64, i64 } %14
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
