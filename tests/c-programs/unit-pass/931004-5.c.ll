; ModuleID = './931004-5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i16, i16 }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) #0 {
  %x = alloca %struct.tiny, align 4
  %y = alloca %struct.tiny, align 4
  %z = alloca %struct.tiny, align 4
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = bitcast %struct.tiny* %x to i32*
  store i32 %x.coerce, i32* %3, align 4
  %4 = bitcast %struct.tiny* %y to i32*
  store i32 %y.coerce, i32* %4, align 4
  %5 = bitcast %struct.tiny* %z to i32*
  store i32 %z.coerce, i32* %5, align 4
  store i32 %n, i32* %1, align 4
  store i64 %l, i64* %2, align 8
  %6 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 0
  %7 = load i16, i16* %6, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp ne i32 %8, 10
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 1
  %13 = load i16, i16* %12, align 2
  %14 = sext i16 %13 to i32
  %15 = icmp ne i32 %14, 20
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 0
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp ne i32 %20, 11
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %17
  %24 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 1
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = icmp ne i32 %26, 21
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %23
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %23
  %30 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 0
  %31 = load i16, i16* %30, align 2
  %32 = sext i16 %31 to i32
  %33 = icmp ne i32 %32, 12
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:35                                      ; preds = %29
  %36 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 1
  %37 = load i16, i16* %36, align 2
  %38 = sext i16 %37 to i32
  %39 = icmp ne i32 %38, 22
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %35
  %42 = load i64, i64* %2, align 8
  %43 = icmp ne i64 %42, 123
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #2
  unreachable

; <label>:45                                      ; preds = %41
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 2
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny, %struct.tiny* %2, i32 0, i32 0
  store i16 10, i16* %3, align 2
  %4 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny, %struct.tiny* %4, i32 0, i32 0
  store i16 11, i16* %5, align 2
  %6 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny, %struct.tiny* %6, i32 0, i32 0
  store i16 12, i16* %7, align 2
  %8 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds %struct.tiny, %struct.tiny* %8, i32 0, i32 1
  store i16 20, i16* %9, align 2
  %10 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %11 = getelementptr inbounds %struct.tiny, %struct.tiny* %10, i32 0, i32 1
  store i16 21, i16* %11, align 2
  %12 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %13 = getelementptr inbounds %struct.tiny, %struct.tiny* %12, i32 0, i32 1
  store i16 22, i16* %13, align 2
  %14 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %15 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %16 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %17 = bitcast %struct.tiny* %14 to i32*
  %18 = load i32, i32* %17, align 2
  %19 = bitcast %struct.tiny* %15 to i32*
  %20 = load i32, i32* %19, align 2
  %21 = bitcast %struct.tiny* %16 to i32*
  %22 = load i32, i32* %21, align 2
  call void @f(i32 3, i32 %18, i32 %20, i32 %22, i64 123)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %24 = load i32, i32* %1
  ret i32 %24
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
