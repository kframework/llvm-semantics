; ModuleID = './pr30185.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i8, i64 }

; Function Attrs: nounwind uwtable
define { i8, i64 } @foo(i8 %x.coerce0, i64 %x.coerce1, i8 %y.coerce0, i64 %y.coerce1) #0 {
  %1 = alloca %struct.S, align 8
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %z = alloca %struct.S, align 8
  %2 = bitcast %struct.S* %x to { i8, i64 }*
  %3 = getelementptr { i8, i64 }, { i8, i64 }* %2, i32 0, i32 0
  store i8 %x.coerce0, i8* %3
  %4 = getelementptr { i8, i64 }, { i8, i64 }* %2, i32 0, i32 1
  store i64 %x.coerce1, i64* %4
  %5 = bitcast %struct.S* %y to { i8, i64 }*
  %6 = getelementptr { i8, i64 }, { i8, i64 }* %5, i32 0, i32 0
  store i8 %y.coerce0, i8* %6
  %7 = getelementptr { i8, i64 }, { i8, i64 }* %5, i32 0, i32 1
  store i64 %y.coerce1, i64* %7
  %8 = getelementptr inbounds %struct.S, %struct.S* %x, i32 0, i32 1
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds %struct.S, %struct.S* %y, i32 0, i32 1
  %11 = load i64, i64* %10, align 8
  %12 = sdiv i64 %9, %11
  %13 = getelementptr inbounds %struct.S, %struct.S* %z, i32 0, i32 1
  store i64 %12, i64* %13, align 8
  %14 = bitcast %struct.S* %1 to i8*
  %15 = bitcast %struct.S* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 16, i32 8, i1 false)
  %16 = bitcast %struct.S* %1 to { i8, i64 }*
  %17 = load { i8, i64 }, { i8, i64 }* %16, align 8
  ret { i8, i64 } %17
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.S, align 8
  %b = alloca %struct.S, align 8
  %2 = alloca %struct.S, align 8
  %3 = alloca %struct.S, align 8
  store i32 0, i32* %1
  %4 = getelementptr inbounds %struct.S, %struct.S* %a, i32 0, i32 1
  store i64 32, i64* %4, align 8
  %5 = getelementptr inbounds %struct.S, %struct.S* %b, i32 0, i32 1
  store i64 4, i64* %5, align 8
  %6 = bitcast %struct.S* %a to { i8, i64 }*
  %7 = getelementptr { i8, i64 }, { i8, i64 }* %6, i32 0, i32 0
  %8 = load i8, i8* %7, align 1
  %9 = getelementptr { i8, i64 }, { i8, i64 }* %6, i32 0, i32 1
  %10 = load i64, i64* %9, align 1
  %11 = bitcast %struct.S* %b to { i8, i64 }*
  %12 = getelementptr { i8, i64 }, { i8, i64 }* %11, i32 0, i32 0
  %13 = load i8, i8* %12, align 1
  %14 = getelementptr { i8, i64 }, { i8, i64 }* %11, i32 0, i32 1
  %15 = load i64, i64* %14, align 1
  %16 = call { i8, i64 } @foo(i8 %8, i64 %10, i8 %13, i64 %15)
  %17 = bitcast %struct.S* %2 to { i8, i64 }*
  %18 = getelementptr { i8, i64 }, { i8, i64 }* %17, i32 0, i32 0
  %19 = extractvalue { i8, i64 } %16, 0
  store i8 %19, i8* %18, align 8
  %20 = getelementptr { i8, i64 }, { i8, i64 }* %17, i32 0, i32 1
  %21 = extractvalue { i8, i64 } %16, 1
  store i64 %21, i64* %20, align 8
  %22 = getelementptr inbounds %struct.S, %struct.S* %2, i32 0, i32 1
  %23 = load i64, i64* %22, align 8
  %24 = icmp ne i64 %23, 8
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:26                                      ; preds = %0
  %27 = getelementptr inbounds %struct.S, %struct.S* %a, i32 0, i32 1
  store i64 -8, i64* %27, align 8
  %28 = getelementptr inbounds %struct.S, %struct.S* %b, i32 0, i32 1
  store i64 -2, i64* %28, align 8
  %29 = bitcast %struct.S* %a to { i8, i64 }*
  %30 = getelementptr { i8, i64 }, { i8, i64 }* %29, i32 0, i32 0
  %31 = load i8, i8* %30, align 1
  %32 = getelementptr { i8, i64 }, { i8, i64 }* %29, i32 0, i32 1
  %33 = load i64, i64* %32, align 1
  %34 = bitcast %struct.S* %b to { i8, i64 }*
  %35 = getelementptr { i8, i64 }, { i8, i64 }* %34, i32 0, i32 0
  %36 = load i8, i8* %35, align 1
  %37 = getelementptr { i8, i64 }, { i8, i64 }* %34, i32 0, i32 1
  %38 = load i64, i64* %37, align 1
  %39 = call { i8, i64 } @foo(i8 %31, i64 %33, i8 %36, i64 %38)
  %40 = bitcast %struct.S* %3 to { i8, i64 }*
  %41 = getelementptr { i8, i64 }, { i8, i64 }* %40, i32 0, i32 0
  %42 = extractvalue { i8, i64 } %39, 0
  store i8 %42, i8* %41, align 8
  %43 = getelementptr { i8, i64 }, { i8, i64 }* %40, i32 0, i32 1
  %44 = extractvalue { i8, i64 } %39, 1
  store i64 %44, i64* %43, align 8
  %45 = getelementptr inbounds %struct.S, %struct.S* %3, i32 0, i32 1
  %46 = load i64, i64* %45, align 8
  %47 = icmp ne i64 %46, 4
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %26
  call void @abort() #3
  unreachable

; <label>:49                                      ; preds = %26
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
