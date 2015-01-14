; ModuleID = './20001024-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.b = type { %struct.a, %struct.a }
%struct.a = type { i64, i64 }

; Function Attrs: nounwind uwtable
define i32 @bar(i32 %x, %struct.b* noalias %y, %struct.b* noalias %z) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.b*, align 8
  %3 = alloca %struct.b*, align 8
  store i32 %x, i32* %1, align 4
  store %struct.b* %y, %struct.b** %2, align 8
  store %struct.b* %z, %struct.b** %3, align 8
  %4 = load %struct.b** %2, align 8
  %5 = getelementptr inbounds %struct.b* %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.a* %5, i32 0, i32 0
  %7 = load i64* %6, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %27, label %9

; <label>:9                                       ; preds = %0
  %10 = load %struct.b** %2, align 8
  %11 = getelementptr inbounds %struct.b* %10, i32 0, i32 0
  %12 = getelementptr inbounds %struct.a* %11, i32 0, i32 1
  %13 = load i64* %12, align 8
  %14 = icmp ne i64 %13, 250000
  br i1 %14, label %27, label %15

; <label>:15                                      ; preds = %9
  %16 = load %struct.b** %2, align 8
  %17 = getelementptr inbounds %struct.b* %16, i32 0, i32 1
  %18 = getelementptr inbounds %struct.a* %17, i32 0, i32 0
  %19 = load i64* %18, align 8
  %20 = icmp ne i64 %19, 0
  br i1 %20, label %27, label %21

; <label>:21                                      ; preds = %15
  %22 = load %struct.b** %2, align 8
  %23 = getelementptr inbounds %struct.b* %22, i32 0, i32 1
  %24 = getelementptr inbounds %struct.a* %23, i32 0, i32 1
  %25 = load i64* %24, align 8
  %26 = icmp ne i64 %25, 250000
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %21, %15, %9, %0
  call void @abort() #3
  unreachable

; <label>:28                                      ; preds = %21
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  %x = alloca %struct.b, align 8
  %1 = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %2 = getelementptr inbounds %struct.a* %1, i32 0, i32 0
  store i64 0, i64* %2, align 8
  %3 = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %4 = getelementptr inbounds %struct.a* %3, i32 0, i32 1
  store i64 250000, i64* %4, align 8
  %5 = getelementptr inbounds %struct.b* %x, i32 0, i32 1
  %6 = getelementptr inbounds %struct.b* %x, i32 0, i32 0
  %7 = bitcast %struct.a* %5 to i8*
  %8 = bitcast %struct.a* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 16, i32 8, i1 false)
  %9 = call i32 @bar(i32 0, %struct.b* %x, %struct.b* null)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo()
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
