; ModuleID = './931004-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i32 }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) #0 {
  %x = alloca %struct.tiny, align 4
  %y = alloca %struct.tiny, align 4
  %z = alloca %struct.tiny, align 4
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = getelementptr %struct.tiny, %struct.tiny* %x, i32 0, i32 0
  store i32 %x.coerce, i32* %3, align 4
  %4 = getelementptr %struct.tiny, %struct.tiny* %y, i32 0, i32 0
  store i32 %y.coerce, i32* %4, align 4
  %5 = getelementptr %struct.tiny, %struct.tiny* %z, i32 0, i32 0
  store i32 %z.coerce, i32* %5, align 4
  store i32 %n, i32* %1, align 4
  store i64 %l, i64* %2, align 8
  %6 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 0
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 10
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 0
  %12 = load i32, i32* %11, align 4
  %13 = icmp ne i32 %12, 11
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 0
  %17 = load i32, i32* %16, align 4
  %18 = icmp ne i32 %17, 12
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %15
  %21 = load i64, i64* %2, align 8
  %22 = icmp ne i64 %21, 123
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %20
  call void @abort() #2
  unreachable

; <label>:24                                      ; preds = %20
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny, %struct.tiny* %2, i32 0, i32 0
  store i32 10, i32* %3, align 4
  %4 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny, %struct.tiny* %4, i32 0, i32 0
  store i32 11, i32* %5, align 4
  %6 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny, %struct.tiny* %6, i32 0, i32 0
  store i32 12, i32* %7, align 4
  %8 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %10 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %11 = getelementptr %struct.tiny, %struct.tiny* %8, i32 0, i32 0
  %12 = load i32, i32* %11, align 4
  %13 = getelementptr %struct.tiny, %struct.tiny* %9, i32 0, i32 0
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr %struct.tiny, %struct.tiny* %10, i32 0, i32 0
  %16 = load i32, i32* %15, align 4
  call void @f(i32 3, i32 %12, i32 %14, i32 %16, i64 123)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
