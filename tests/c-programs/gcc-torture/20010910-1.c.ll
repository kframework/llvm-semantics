; ModuleID = './20010910-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.epic_private = type { %struct.epic_rx_desc*, [5 x i32] }
%struct.epic_rx_desc = type { i32 }

@check_rx_ring = internal global [5 x i32] [i32 12, i32 14, i32 16, i32 18, i32 10], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %ep = alloca %struct.epic_private, align 8
  %rx_ring = alloca [5 x %struct.epic_rx_desc], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [5 x %struct.epic_rx_desc], [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i64 %7
  %9 = getelementptr inbounds %struct.epic_rx_desc, %struct.epic_rx_desc* %8, i32 0, i32 0
  store i32 0, i32* %9, align 4
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.epic_private, %struct.epic_private* %ep, i32 0, i32 1
  %13 = getelementptr inbounds [5 x i32], [5 x i32]* %12, i32 0, i64 %11
  store i32 5, i32* %13, align 4
  br label %14

; <label>:14                                      ; preds = %5
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %2

; <label>:17                                      ; preds = %2
  %18 = getelementptr inbounds [5 x %struct.epic_rx_desc], [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i32 0
  %19 = getelementptr inbounds %struct.epic_private, %struct.epic_private* %ep, i32 0, i32 0
  store %struct.epic_rx_desc* %18, %struct.epic_rx_desc** %19, align 8
  call void @epic_init_ring(%struct.epic_private* %ep)
  store i32 0, i32* %i, align 4
  br label %20

; <label>:20                                      ; preds = %44, %17
  %21 = load i32, i32* %i, align 4
  %22 = icmp slt i32 %21, 5
  br i1 %22, label %23, label %47

; <label>:23                                      ; preds = %20
  %24 = load i32, i32* %i, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [5 x %struct.epic_rx_desc], [5 x %struct.epic_rx_desc]* %rx_ring, i32 0, i64 %25
  %27 = getelementptr inbounds %struct.epic_rx_desc, %struct.epic_rx_desc* %26, i32 0, i32 0
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [5 x i32], [5 x i32]* @check_rx_ring, i32 0, i64 %30
  %32 = load i32, i32* %31, align 4
  %33 = icmp ne i32 %28, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %23
  call void @abort() #2
  unreachable

; <label>:35                                      ; preds = %23
  %36 = load i32, i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %struct.epic_private, %struct.epic_private* %ep, i32 0, i32 1
  %39 = getelementptr inbounds [5 x i32], [5 x i32]* %38, i32 0, i64 %37
  %40 = load i32, i32* %39, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %35
  call void @abort() #2
  unreachable

; <label>:43                                      ; preds = %35
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32, i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %20

; <label>:47                                      ; preds = %20
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @epic_init_ring(%struct.epic_private* %ep) #0 {
  %1 = alloca %struct.epic_private*, align 8
  %i = alloca i32, align 4
  store %struct.epic_private* %ep, %struct.epic_private** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %22, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 5
  br i1 %4, label %5, label %25

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = add nsw i32 %6, 1
  %8 = mul nsw i32 %7, 2
  %9 = add nsw i32 10, %8
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load %struct.epic_private*, %struct.epic_private** %1, align 8
  %13 = getelementptr inbounds %struct.epic_private, %struct.epic_private* %12, i32 0, i32 0
  %14 = load %struct.epic_rx_desc*, %struct.epic_rx_desc** %13, align 8
  %15 = getelementptr inbounds %struct.epic_rx_desc, %struct.epic_rx_desc* %14, i64 %11
  %16 = getelementptr inbounds %struct.epic_rx_desc, %struct.epic_rx_desc* %15, i32 0, i32 0
  store i32 %9, i32* %16, align 4
  %17 = load i32, i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = load %struct.epic_private*, %struct.epic_private** %1, align 8
  %20 = getelementptr inbounds %struct.epic_private, %struct.epic_private* %19, i32 0, i32 1
  %21 = getelementptr inbounds [5 x i32], [5 x i32]* %20, i32 0, i64 %18
  store i32 0, i32* %21, align 4
  br label %22

; <label>:22                                      ; preds = %5
  %23 = load i32, i32* %i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %2

; <label>:25                                      ; preds = %2
  %26 = load i32, i32* %i, align 4
  %27 = sub nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = load %struct.epic_private*, %struct.epic_private** %1, align 8
  %30 = getelementptr inbounds %struct.epic_private, %struct.epic_private* %29, i32 0, i32 0
  %31 = load %struct.epic_rx_desc*, %struct.epic_rx_desc** %30, align 8
  %32 = getelementptr inbounds %struct.epic_rx_desc, %struct.epic_rx_desc* %31, i64 %28
  %33 = getelementptr inbounds %struct.epic_rx_desc, %struct.epic_rx_desc* %32, i32 0, i32 0
  store i32 10, i32* %33, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
