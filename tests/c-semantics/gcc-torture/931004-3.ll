; ModuleID = './931004-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i16 }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, i16 %x.coerce, i16 %y.coerce, i16 %z.coerce, i64 %l) #0 {
  %x = alloca %struct.tiny, align 2
  %y = alloca %struct.tiny, align 2
  %z = alloca %struct.tiny, align 2
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = getelementptr %struct.tiny* %x, i32 0, i32 0
  store i16 %x.coerce, i16* %3
  %4 = getelementptr %struct.tiny* %y, i32 0, i32 0
  store i16 %y.coerce, i16* %4
  %5 = getelementptr %struct.tiny* %z, i32 0, i32 0
  store i16 %z.coerce, i16* %5
  store i32 %n, i32* %1, align 4
  store i64 %l, i64* %2, align 8
  %6 = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %7 = load i16* %6, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp ne i32 %8, 10
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %13 = load i16* %12, align 2
  %14 = sext i16 %13 to i32
  %15 = icmp ne i32 %14, 11
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %19 = load i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp ne i32 %20, 12
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %17
  %24 = load i64* %2, align 8
  %25 = icmp ne i64 %24, 123
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23
  call void @abort() #2
  unreachable

; <label>:27                                      ; preds = %23
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 2
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny* %2, i32 0, i32 0
  store i16 10, i16* %3, align 2
  %4 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny* %4, i32 0, i32 0
  store i16 11, i16* %5, align 2
  %6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny* %6, i32 0, i32 0
  store i16 12, i16* %7, align 2
  %8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %11 = getelementptr %struct.tiny* %8, i32 0, i32 0
  %12 = load i16* %11
  %13 = getelementptr %struct.tiny* %9, i32 0, i32 0
  %14 = load i16* %13
  %15 = getelementptr %struct.tiny* %10, i32 0, i32 0
  %16 = load i16* %15
  call void @f(i32 3, i16 %12, i16 %14, i16 %16, i64 123)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %18 = load i32* %1
  ret i32 %18
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
