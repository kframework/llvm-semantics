; ModuleID = './20020810-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.R = type { %struct.A, %struct.A }
%struct.A = type { i64 }

@R = global %struct.R { %struct.A { i64 100 }, %struct.A { i64 200 } }, align 8

; Function Attrs: nounwind uwtable
define void @f(i64 %r.coerce0, i64 %r.coerce1) #0 {
  %r = alloca %struct.R, align 8
  %1 = bitcast %struct.R* %r to { i64, i64 }*
  %2 = getelementptr { i64, i64 }, { i64, i64 }* %1, i32 0, i32 0
  store i64 %r.coerce0, i64* %2
  %3 = getelementptr { i64, i64 }, { i64, i64 }* %1, i32 0, i32 1
  store i64 %r.coerce1, i64* %3
  %4 = getelementptr inbounds %struct.R, %struct.R* %r, i32 0, i32 0
  %5 = getelementptr inbounds %struct.A, %struct.A* %4, i32 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = load i64, i64* getelementptr inbounds (%struct.R, %struct.R* @R, i32 0, i32 0, i32 0), align 8
  %8 = icmp ne i64 %6, %7
  br i1 %8, label %15, label %9

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.R, %struct.R* %r, i32 0, i32 1
  %11 = getelementptr inbounds %struct.A, %struct.A* %10, i32 0, i32 0
  %12 = load i64, i64* %11, align 8
  %13 = load i64, i64* getelementptr inbounds (%struct.R, %struct.R* @R, i32 0, i32 1, i32 0), align 8
  %14 = icmp ne i64 %12, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %9, %0
  call void @abort() #3
  unreachable

; <label>:16                                      ; preds = %9
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define { i64, i64 } @g() #0 {
  %1 = alloca %struct.R, align 8
  %2 = bitcast %struct.R* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.R* @R to i8*), i64 16, i32 8, i1 false)
  %3 = bitcast %struct.R* %1 to { i64, i64 }*
  %4 = load { i64, i64 }, { i64, i64 }* %3, align 8
  ret { i64, i64 } %4
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %r = alloca %struct.R, align 8
  %2 = alloca %struct.R, align 8
  store i32 0, i32* %1
  %3 = load i64, i64* getelementptr ({ i64, i64 }, { i64, i64 }* bitcast (%struct.R* @R to { i64, i64 }*), i32 0, i32 0), align 1
  %4 = load i64, i64* getelementptr ({ i64, i64 }, { i64, i64 }* bitcast (%struct.R* @R to { i64, i64 }*), i32 0, i32 1), align 1
  call void @f(i64 %3, i64 %4)
  %5 = call { i64, i64 } @g()
  %6 = bitcast %struct.R* %2 to { i64, i64 }*
  %7 = getelementptr { i64, i64 }, { i64, i64 }* %6, i32 0, i32 0
  %8 = extractvalue { i64, i64 } %5, 0
  store i64 %8, i64* %7, align 8
  %9 = getelementptr { i64, i64 }, { i64, i64 }* %6, i32 0, i32 1
  %10 = extractvalue { i64, i64 } %5, 1
  store i64 %10, i64* %9, align 8
  %11 = bitcast %struct.R* %r to i8*
  %12 = bitcast %struct.R* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 16, i32 8, i1 false)
  %13 = getelementptr inbounds %struct.R, %struct.R* %r, i32 0, i32 0
  %14 = getelementptr inbounds %struct.A, %struct.A* %13, i32 0, i32 0
  %15 = load i64, i64* %14, align 8
  %16 = load i64, i64* getelementptr inbounds (%struct.R, %struct.R* @R, i32 0, i32 0, i32 0), align 8
  %17 = icmp ne i64 %15, %16
  br i1 %17, label %24, label %18

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds %struct.R, %struct.R* %r, i32 0, i32 1
  %20 = getelementptr inbounds %struct.A, %struct.A* %19, i32 0, i32 0
  %21 = load i64, i64* %20, align 8
  %22 = load i64, i64* getelementptr inbounds (%struct.R, %struct.R* @R, i32 0, i32 1, i32 0), align 8
  %23 = icmp ne i64 %21, %22
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %18, %0
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %18
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
