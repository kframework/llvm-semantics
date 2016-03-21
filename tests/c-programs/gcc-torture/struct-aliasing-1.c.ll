; ModuleID = './struct-aliasing-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { float }

; Function Attrs: noinline nounwind uwtable
define i32 @foo(i32* %r, %struct.S* %p) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca %struct.S*, align 8
  %q = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %r, i32** %1, align 8
  store %struct.S* %p, %struct.S** %2, align 8
  %3 = load %struct.S*, %struct.S** %2, align 8
  %4 = getelementptr inbounds %struct.S, %struct.S* %3, i32 0, i32 0
  %5 = bitcast float* %4 to i32*
  store i32* %5, i32** %q, align 8
  %6 = load i32*, i32** %q, align 8
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %i, align 4
  %8 = load i32*, i32** %1, align 8
  store i32 0, i32* %8, align 4
  %9 = load i32, i32* %i, align 4
  %10 = load i32*, i32** %q, align 8
  %11 = load i32, i32* %10, align 4
  %12 = add nsw i32 %9, %11
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %i, align 4
  %2 = bitcast i32* %i to %struct.S*
  %3 = call i32 @foo(i32* %i, %struct.S* %2)
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
