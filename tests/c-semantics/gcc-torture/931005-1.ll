; ModuleID = './931005-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.T = type { i8 }

; Function Attrs: nounwind uwtable
define i8 @f(i8 %s1.coerce) #0 {
  %1 = alloca %struct.T, align 1
  %s1 = alloca %struct.T, align 1
  %s1a = alloca %struct.T, align 1
  %2 = getelementptr %struct.T* %s1, i32 0, i32 0
  store i8 %s1.coerce, i8* %2
  %3 = getelementptr inbounds %struct.T* %s1, i32 0, i32 0
  %4 = load i8* %3, align 1
  %5 = getelementptr inbounds %struct.T* %s1a, i32 0, i32 0
  store i8 %4, i8* %5, align 1
  %6 = bitcast %struct.T* %1 to i8*
  %7 = bitcast %struct.T* %s1a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 1, i32 1, i1 false)
  %8 = getelementptr %struct.T* %1, i32 0, i32 0
  %9 = load i8* %8
  ret i8 %9
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1a = alloca %struct.T, align 1
  %s1b = alloca %struct.T, align 1
  %2 = alloca %struct.T, align 1
  store i32 0, i32* %1
  %3 = getelementptr inbounds %struct.T* %s1a, i32 0, i32 0
  store i8 100, i8* %3, align 1
  %4 = getelementptr %struct.T* %s1a, i32 0, i32 0
  %5 = load i8* %4
  %6 = call i8 @f(i8 %5)
  %7 = getelementptr %struct.T* %2, i32 0, i32 0
  store i8 %6, i8* %7
  %8 = bitcast %struct.T* %s1b to i8*
  %9 = bitcast %struct.T* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 1, i32 1, i1 false)
  %10 = getelementptr inbounds %struct.T* %s1b, i32 0, i32 0
  %11 = load i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 100
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:15                                      ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %17 = load i32* %1
  ret i32 %17
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
