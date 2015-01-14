; ModuleID = './931004-11.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i8, i8, i8 }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) #0 {
  %x = alloca %struct.tiny, align 4
  %1 = alloca i24
  %y = alloca %struct.tiny, align 4
  %2 = alloca i24
  %z = alloca %struct.tiny, align 4
  %3 = alloca i24
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i24 %x.coerce, i24* %1
  %6 = bitcast i24* %1 to i8*
  %7 = bitcast %struct.tiny* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %6, i64 3, i32 1, i1 false)
  store i24 %y.coerce, i24* %2
  %8 = bitcast i24* %2 to i8*
  %9 = bitcast %struct.tiny* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %8, i64 3, i32 1, i1 false)
  store i24 %z.coerce, i24* %3
  %10 = bitcast i24* %3 to i8*
  %11 = bitcast %struct.tiny* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %10, i64 3, i32 1, i1 false)
  store i32 %n, i32* %4, align 4
  store i64 %l, i64* %5, align 8
  %12 = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %13 = load i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 10
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %0
  %18 = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %19 = load i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp ne i32 %20, 20
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:23                                      ; preds = %17
  %24 = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 30
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %23
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %23
  %30 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %31 = load i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 11
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %29
  call void @abort() #3
  unreachable

; <label>:35                                      ; preds = %29
  %36 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %37 = load i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp ne i32 %38, 21
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35
  call void @abort() #3
  unreachable

; <label>:41                                      ; preds = %35
  %42 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 2
  %43 = load i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 31
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %41
  call void @abort() #3
  unreachable

; <label>:47                                      ; preds = %41
  %48 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %49 = load i8* %48, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp ne i32 %50, 12
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %47
  call void @abort() #3
  unreachable

; <label>:53                                      ; preds = %47
  %54 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %55 = load i8* %54, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp ne i32 %56, 22
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %53
  call void @abort() #3
  unreachable

; <label>:59                                      ; preds = %53
  %60 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 2
  %61 = load i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp ne i32 %62, 32
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %59
  call void @abort() #3
  unreachable

; <label>:65                                      ; preds = %59
  %66 = load i64* %5, align 8
  %67 = icmp ne i64 %66, 123
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  call void @abort() #3
  unreachable

; <label>:69                                      ; preds = %65
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  %2 = alloca i24
  %3 = alloca i24
  %4 = alloca i24
  store i32 0, i32* %1
  %5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %6 = getelementptr inbounds %struct.tiny* %5, i32 0, i32 0
  store i8 10, i8* %6, align 1
  %7 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %8 = getelementptr inbounds %struct.tiny* %7, i32 0, i32 0
  store i8 11, i8* %8, align 1
  %9 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %10 = getelementptr inbounds %struct.tiny* %9, i32 0, i32 0
  store i8 12, i8* %10, align 1
  %11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %12 = getelementptr inbounds %struct.tiny* %11, i32 0, i32 1
  store i8 20, i8* %12, align 1
  %13 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %14 = getelementptr inbounds %struct.tiny* %13, i32 0, i32 1
  store i8 21, i8* %14, align 1
  %15 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %16 = getelementptr inbounds %struct.tiny* %15, i32 0, i32 1
  store i8 22, i8* %16, align 1
  %17 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %18 = getelementptr inbounds %struct.tiny* %17, i32 0, i32 2
  store i8 30, i8* %18, align 1
  %19 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %20 = getelementptr inbounds %struct.tiny* %19, i32 0, i32 2
  store i8 31, i8* %20, align 1
  %21 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %22 = getelementptr inbounds %struct.tiny* %21, i32 0, i32 2
  store i8 32, i8* %22, align 1
  %23 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %24 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %25 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %26 = bitcast i24* %2 to i8*
  %27 = bitcast %struct.tiny* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 3, i32 1, i1 false)
  %28 = load i24* %2
  %29 = bitcast i24* %3 to i8*
  %30 = bitcast %struct.tiny* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 3, i32 1, i1 false)
  %31 = load i24* %3
  %32 = bitcast i24* %4 to i8*
  %33 = bitcast %struct.tiny* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 3, i32 1, i1 false)
  %34 = load i24* %4
  call void @f(i32 3, i24 %28, i24 %31, i24 %34, i64 123)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %36 = load i32* %1
  ret i32 %36
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
