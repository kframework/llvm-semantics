; ModuleID = './950628-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.T = type { i8, i8, i8, i16 }

; Function Attrs: nounwind uwtable
define i48 @g() #0 {
  %1 = alloca %struct.T, align 2
  %now = alloca %struct.T, align 2
  %2 = alloca i48, align 2
  %3 = getelementptr inbounds %struct.T, %struct.T* %now, i32 0, i32 0
  store i8 1, i8* %3, align 1
  %4 = getelementptr inbounds %struct.T, %struct.T* %now, i32 0, i32 1
  store i8 2, i8* %4, align 1
  %5 = getelementptr inbounds %struct.T, %struct.T* %now, i32 0, i32 2
  store i8 3, i8* %5, align 1
  %6 = getelementptr inbounds %struct.T, %struct.T* %now, i32 0, i32 3
  store i16 4, i16* %6, align 2
  %7 = bitcast %struct.T* %1 to i8*
  %8 = bitcast %struct.T* %now to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 6, i32 2, i1 false)
  %9 = bitcast i48* %2 to i8*
  %10 = bitcast %struct.T* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 6, i32 2, i1 false)
  %11 = load i48, i48* %2, align 2
  ret i48 %11
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i48 @f() #0 {
  %1 = alloca %struct.T, align 2
  %virk = alloca %struct.T, align 2
  %2 = alloca %struct.T, align 2
  %3 = alloca i48, align 2
  %4 = alloca i48, align 2
  %5 = call i48 @g()
  store i48 %5, i48* %3, align 2
  %6 = bitcast i48* %3 to i8*
  %7 = bitcast %struct.T* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %6, i64 6, i32 2, i1 false)
  %8 = bitcast %struct.T* %virk to i8*
  %9 = bitcast %struct.T* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 6, i32 2, i1 false)
  %10 = bitcast %struct.T* %1 to i8*
  %11 = bitcast %struct.T* %virk to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 6, i32 2, i1 false)
  %12 = bitcast i48* %4 to i8*
  %13 = bitcast %struct.T* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 6, i32 2, i1 false)
  %14 = load i48, i48* %4, align 2
  ret i48 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.T, align 2
  %3 = alloca i48, align 2
  %4 = alloca %struct.T, align 2
  %5 = alloca i48, align 2
  %6 = alloca %struct.T, align 2
  %7 = alloca i48, align 2
  %8 = alloca %struct.T, align 2
  %9 = alloca i48, align 2
  store i32 0, i32* %1
  %10 = call i48 @f()
  store i48 %10, i48* %3, align 2
  %11 = bitcast i48* %3 to i8*
  %12 = bitcast %struct.T* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %11, i64 6, i32 2, i1 false)
  %13 = getelementptr inbounds %struct.T, %struct.T* %2, i32 0, i32 0
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %41, label %17

; <label>:17                                      ; preds = %0
  %18 = call i48 @f()
  store i48 %18, i48* %5, align 2
  %19 = bitcast i48* %5 to i8*
  %20 = bitcast %struct.T* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %19, i64 6, i32 2, i1 false)
  %21 = getelementptr inbounds %struct.T, %struct.T* %4, i32 0, i32 1
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 2
  br i1 %24, label %41, label %25

; <label>:25                                      ; preds = %17
  %26 = call i48 @f()
  store i48 %26, i48* %7, align 2
  %27 = bitcast i48* %7 to i8*
  %28 = bitcast %struct.T* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %27, i64 6, i32 2, i1 false)
  %29 = getelementptr inbounds %struct.T, %struct.T* %6, i32 0, i32 2
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, 3
  br i1 %32, label %41, label %33

; <label>:33                                      ; preds = %25
  %34 = call i48 @f()
  store i48 %34, i48* %9, align 2
  %35 = bitcast i48* %9 to i8*
  %36 = bitcast %struct.T* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %35, i64 6, i32 2, i1 false)
  %37 = getelementptr inbounds %struct.T, %struct.T* %8, i32 0, i32 3
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i32
  %40 = icmp ne i32 %39, 4
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %33, %25, %17, %0
  call void @abort() #3
  unreachable

; <label>:42                                      ; preds = %33
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %44 = load i32, i32* %1
  ret i32 %44
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
