; ModuleID = './20030313-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i64, i64, i64, i64 }

@x = global %struct.A { i64 13, i64 14, i64 15, i64 16 }, align 8

; Function Attrs: nounwind uwtable
define void @foo(i64* %x, i32 %y) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i32, align 4
  store i64* %x, i64** %1, align 8
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp ne i32 %3, 12
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i64*, i64** %1, align 8
  %8 = getelementptr inbounds i64, i64* %7, i64 0
  %9 = load i64, i64* %8, align 8
  %10 = icmp ne i64 %9, 1
  br i1 %10, label %16, label %11

; <label>:11                                      ; preds = %6
  %12 = load i64*, i64** %1, align 8
  %13 = getelementptr inbounds i64, i64* %12, i64 1
  %14 = load i64, i64* %13, align 8
  %15 = icmp ne i64 %14, 11
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11, %6
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %11
  %18 = load i64*, i64** %1, align 8
  %19 = getelementptr inbounds i64, i64* %18, i64 2
  %20 = load i64, i64* %19, align 8
  %21 = icmp ne i64 %20, 2
  br i1 %21, label %27, label %22

; <label>:22                                      ; preds = %17
  %23 = load i64*, i64** %1, align 8
  %24 = getelementptr inbounds i64, i64* %23, i64 3
  %25 = load i64, i64* %24, align 8
  %26 = icmp ne i64 %25, 12
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %22, %17
  call void @abort() #3
  unreachable

; <label>:28                                      ; preds = %22
  %29 = load i64*, i64** %1, align 8
  %30 = getelementptr inbounds i64, i64* %29, i64 4
  %31 = load i64, i64* %30, align 8
  %32 = icmp ne i64 %31, 3
  br i1 %32, label %38, label %33

; <label>:33                                      ; preds = %28
  %34 = load i64*, i64** %1, align 8
  %35 = getelementptr inbounds i64, i64* %34, i64 5
  %36 = load i64, i64* %35, align 8
  %37 = icmp ne i64 %36, 13
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %33, %28
  call void @abort() #3
  unreachable

; <label>:39                                      ; preds = %33
  %40 = load i64*, i64** %1, align 8
  %41 = getelementptr inbounds i64, i64* %40, i64 6
  %42 = load i64, i64* %41, align 8
  %43 = icmp ne i64 %42, 4
  br i1 %43, label %49, label %44

; <label>:44                                      ; preds = %39
  %45 = load i64*, i64** %1, align 8
  %46 = getelementptr inbounds i64, i64* %45, i64 7
  %47 = load i64, i64* %46, align 8
  %48 = icmp ne i64 %47, 14
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %44, %39
  call void @abort() #3
  unreachable

; <label>:50                                      ; preds = %44
  %51 = load i64*, i64** %1, align 8
  %52 = getelementptr inbounds i64, i64* %51, i64 8
  %53 = load i64, i64* %52, align 8
  %54 = icmp ne i64 %53, 5
  br i1 %54, label %60, label %55

; <label>:55                                      ; preds = %50
  %56 = load i64*, i64** %1, align 8
  %57 = getelementptr inbounds i64, i64* %56, i64 9
  %58 = load i64, i64* %57, align 8
  %59 = icmp ne i64 %58, 15
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %55, %50
  call void @abort() #3
  unreachable

; <label>:61                                      ; preds = %55
  %62 = load i64*, i64** %1, align 8
  %63 = getelementptr inbounds i64, i64* %62, i64 10
  %64 = load i64, i64* %63, align 8
  %65 = icmp ne i64 %64, 6
  br i1 %65, label %71, label %66

; <label>:66                                      ; preds = %61
  %67 = load i64*, i64** %1, align 8
  %68 = getelementptr inbounds i64, i64* %67, i64 11
  %69 = load i64, i64* %68, align 8
  %70 = icmp ne i64 %69, 16
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %66, %61
  call void @abort() #3
  unreachable

; <label>:72                                      ; preds = %66
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [40 x i64], align 16
  %b = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %b, align 4
  %2 = load i32, i32* %b, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* %b, align 4
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %4
  store i64 1, i64* %5, align 8
  %6 = load i32, i32* %b, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %b, align 4
  %8 = sext i32 %6 to i64
  %9 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %8
  store i64 11, i64* %9, align 8
  %10 = load i32, i32* %b, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %b, align 4
  %12 = sext i32 %10 to i64
  %13 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %12
  store i64 2, i64* %13, align 8
  %14 = load i32, i32* %b, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %b, align 4
  %16 = sext i32 %14 to i64
  %17 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %16
  store i64 12, i64* %17, align 8
  %18 = load i32, i32* %b, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %b, align 4
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %20
  store i64 3, i64* %21, align 8
  %22 = call %struct.A* @bar()
  %23 = getelementptr inbounds %struct.A, %struct.A* %22, i32 0, i32 0
  %24 = load i64, i64* %23, align 8
  %25 = load i32, i32* %b, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %b, align 4
  %27 = sext i32 %25 to i64
  %28 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %27
  store i64 %24, i64* %28, align 8
  %29 = load i32, i32* %b, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %b, align 4
  %31 = sext i32 %29 to i64
  %32 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %31
  store i64 4, i64* %32, align 8
  %33 = call %struct.A* @bar()
  %34 = getelementptr inbounds %struct.A, %struct.A* %33, i32 0, i32 1
  %35 = load i64, i64* %34, align 8
  %36 = load i32, i32* %b, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %b, align 4
  %38 = sext i32 %36 to i64
  %39 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %38
  store i64 %35, i64* %39, align 8
  %40 = load i32, i32* %b, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %b, align 4
  %42 = sext i32 %40 to i64
  %43 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %42
  store i64 5, i64* %43, align 8
  %44 = call %struct.A* @bar()
  %45 = getelementptr inbounds %struct.A, %struct.A* %44, i32 0, i32 2
  %46 = load i64, i64* %45, align 8
  %47 = load i32, i32* %b, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %b, align 4
  %49 = sext i32 %47 to i64
  %50 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %49
  store i64 %46, i64* %50, align 8
  %51 = load i32, i32* %b, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %b, align 4
  %53 = sext i32 %51 to i64
  %54 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %53
  store i64 6, i64* %54, align 8
  %55 = call %struct.A* @bar()
  %56 = getelementptr inbounds %struct.A, %struct.A* %55, i32 0, i32 3
  %57 = load i64, i64* %56, align 8
  %58 = load i32, i32* %b, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %b, align 4
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i64 %60
  store i64 %57, i64* %61, align 8
  %62 = getelementptr inbounds [40 x i64], [40 x i64]* %a, i32 0, i32 0
  %63 = load i32, i32* %b, align 4
  call void @foo(i64* %62, i32 %63)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %65 = load i32, i32* %1
  ret i32 %65
}

; Function Attrs: inlinehint nounwind uwtable
define internal %struct.A* @bar() #2 {
  %r = alloca %struct.A*, align 8
  store %struct.A* @x, %struct.A** %r, align 8
  %1 = load %struct.A*, %struct.A** %r, align 8
  ret %struct.A* %1
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
