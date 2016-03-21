; ModuleID = './950809-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32*, i32, i32*, [2 x i32] }

@main.sc = internal global [3 x i32] [i32 2, i32 3, i32 4], align 4

; Function Attrs: nounwind uwtable
define void @f(%struct.S* %x) #0 {
  %1 = alloca %struct.S*, align 8
  %t = alloca i32*, align 8
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %a0 = alloca i32, align 4
  %a1 = alloca i32, align 4
  store %struct.S* %x, %struct.S** %1, align 8
  %2 = load %struct.S*, %struct.S** %1, align 8
  %3 = getelementptr inbounds %struct.S, %struct.S* %2, i32 0, i32 2
  %4 = load i32*, i32** %3, align 8
  store i32* %4, i32** %t, align 8
  %5 = load i32*, i32** %t, align 8
  %6 = getelementptr inbounds i32, i32* %5, i64 0
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %t1, align 4
  %8 = load i32*, i32** %t, align 8
  %9 = getelementptr inbounds i32, i32* %8, i64 1
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %t2, align 4
  %11 = load i32*, i32** %t, align 8
  %12 = getelementptr inbounds i32, i32* %11, i64 2
  %13 = load i32, i32* %12, align 4
  store i32 %13, i32* %t3, align 4
  %14 = load %struct.S*, %struct.S** %1, align 8
  %15 = getelementptr inbounds %struct.S, %struct.S* %14, i32 0, i32 3
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i32 0, i64 0
  %17 = load i32, i32* %16, align 4
  store i32 %17, i32* %a0, align 4
  %18 = load %struct.S*, %struct.S** %1, align 8
  %19 = getelementptr inbounds %struct.S, %struct.S* %18, i32 0, i32 3
  %20 = getelementptr inbounds [2 x i32], [2 x i32]* %19, i32 0, i64 1
  %21 = load i32, i32* %20, align 4
  store i32 %21, i32* %a1, align 4
  %22 = load i32, i32* %t1, align 4
  %23 = load i32*, i32** %t, align 8
  %24 = getelementptr inbounds i32, i32* %23, i64 2
  store i32 %22, i32* %24, align 4
  %25 = load i32, i32* %a1, align 4
  %26 = load i32*, i32** %t, align 8
  %27 = getelementptr inbounds i32, i32* %26, i64 0
  store i32 %25, i32* %27, align 4
  %28 = load i32, i32* %a0, align 4
  %29 = load %struct.S*, %struct.S** %1, align 8
  %30 = getelementptr inbounds %struct.S, %struct.S* %29, i32 0, i32 3
  %31 = getelementptr inbounds [2 x i32], [2 x i32]* %30, i32 0, i64 1
  store i32 %28, i32* %31, align 4
  %32 = load i32, i32* %t3, align 4
  %33 = load %struct.S*, %struct.S** %1, align 8
  %34 = getelementptr inbounds %struct.S, %struct.S* %33, i32 0, i32 3
  %35 = getelementptr inbounds [2 x i32], [2 x i32]* %34, i32 0, i64 0
  store i32 %32, i32* %35, align 4
  %36 = load i32, i32* %t2, align 4
  %37 = load %struct.S*, %struct.S** %1, align 8
  %38 = getelementptr inbounds %struct.S, %struct.S* %37, i32 0, i32 1
  store i32 %36, i32* %38, align 4
  %39 = load i32*, i32** %t, align 8
  %40 = load %struct.S*, %struct.S** %1, align 8
  %41 = getelementptr inbounds %struct.S, %struct.S* %40, i32 0, i32 0
  store i32* %39, i32** %41, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.S, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 2
  store i32* getelementptr inbounds ([3 x i32], [3 x i32]* @main.sc, i32 0, i32 0), i32** %2, align 8
  %3 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %4 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i32 0, i64 0
  store i32 10, i32* %4, align 4
  %5 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 3
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i32 0, i64 1
  store i32 11, i32* %6, align 4
  call void @f(%struct.S* %s)
  %7 = getelementptr inbounds %struct.S, %struct.S* %s, i32 0, i32 0
  %8 = load i32*, i32** %7, align 8
  %9 = getelementptr inbounds i32, i32* %8, i64 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp ne i32 %10, 2
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32, i32* %1
  ret i32 %15
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
