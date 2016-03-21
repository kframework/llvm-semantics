; ModuleID = './931004-13.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tiny = type { i8, i8, i8, i8 }

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
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 10
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 1
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 20
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 2
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp ne i32 %20, 30
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %17
  %24 = getelementptr inbounds %struct.tiny, %struct.tiny* %x, i32 0, i32 3
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 40
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %23
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %23
  %30 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 0
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 11
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:35                                      ; preds = %29
  %36 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 1
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp ne i32 %38, 21
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %35
  %42 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 2
  %43 = load i8, i8* %42, align 1
  %44 = sext i8 %43 to i32
  %45 = icmp ne i32 %44, 31
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %41
  call void @abort() #2
  unreachable

; <label>:47                                      ; preds = %41
  %48 = getelementptr inbounds %struct.tiny, %struct.tiny* %y, i32 0, i32 3
  %49 = load i8, i8* %48, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp ne i32 %50, 41
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %47
  call void @abort() #2
  unreachable

; <label>:53                                      ; preds = %47
  %54 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 0
  %55 = load i8, i8* %54, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp ne i32 %56, 12
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %53
  call void @abort() #2
  unreachable

; <label>:59                                      ; preds = %53
  %60 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 1
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = icmp ne i32 %62, 22
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %59
  call void @abort() #2
  unreachable

; <label>:65                                      ; preds = %59
  %66 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 2
  %67 = load i8, i8* %66, align 1
  %68 = sext i8 %67 to i32
  %69 = icmp ne i32 %68, 32
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %65
  call void @abort() #2
  unreachable

; <label>:71                                      ; preds = %65
  %72 = getelementptr inbounds %struct.tiny, %struct.tiny* %z, i32 0, i32 3
  %73 = load i8, i8* %72, align 1
  %74 = sext i8 %73 to i32
  %75 = icmp ne i32 %74, 42
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %71
  call void @abort() #2
  unreachable

; <label>:77                                      ; preds = %71
  %78 = load i64, i64* %2, align 8
  %79 = icmp ne i64 %78, 123
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %77
  call void @abort() #2
  unreachable

; <label>:81                                      ; preds = %77
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %3 = getelementptr inbounds %struct.tiny, %struct.tiny* %2, i32 0, i32 0
  store i8 10, i8* %3, align 1
  %4 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %5 = getelementptr inbounds %struct.tiny, %struct.tiny* %4, i32 0, i32 0
  store i8 11, i8* %5, align 1
  %6 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %7 = getelementptr inbounds %struct.tiny, %struct.tiny* %6, i32 0, i32 0
  store i8 12, i8* %7, align 1
  %8 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %9 = getelementptr inbounds %struct.tiny, %struct.tiny* %8, i32 0, i32 1
  store i8 20, i8* %9, align 1
  %10 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %11 = getelementptr inbounds %struct.tiny, %struct.tiny* %10, i32 0, i32 1
  store i8 21, i8* %11, align 1
  %12 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %13 = getelementptr inbounds %struct.tiny, %struct.tiny* %12, i32 0, i32 1
  store i8 22, i8* %13, align 1
  %14 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %15 = getelementptr inbounds %struct.tiny, %struct.tiny* %14, i32 0, i32 2
  store i8 30, i8* %15, align 1
  %16 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %17 = getelementptr inbounds %struct.tiny, %struct.tiny* %16, i32 0, i32 2
  store i8 31, i8* %17, align 1
  %18 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %19 = getelementptr inbounds %struct.tiny, %struct.tiny* %18, i32 0, i32 2
  store i8 32, i8* %19, align 1
  %20 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %21 = getelementptr inbounds %struct.tiny, %struct.tiny* %20, i32 0, i32 3
  store i8 40, i8* %21, align 1
  %22 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %23 = getelementptr inbounds %struct.tiny, %struct.tiny* %22, i32 0, i32 3
  store i8 41, i8* %23, align 1
  %24 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %25 = getelementptr inbounds %struct.tiny, %struct.tiny* %24, i32 0, i32 3
  store i8 42, i8* %25, align 1
  %26 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 0
  %27 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 1
  %28 = getelementptr inbounds [3 x %struct.tiny], [3 x %struct.tiny]* %x, i32 0, i64 2
  %29 = bitcast %struct.tiny* %26 to i32*
  %30 = load i32, i32* %29, align 1
  %31 = bitcast %struct.tiny* %27 to i32*
  %32 = load i32, i32* %31, align 1
  %33 = bitcast %struct.tiny* %28 to i32*
  %34 = load i32, i32* %33, align 1
  call void @f(i32 3, i32 %30, i32 %32, i32 %34, i64 123)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %36 = load i32, i32* %1
  ret i32 %36
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
