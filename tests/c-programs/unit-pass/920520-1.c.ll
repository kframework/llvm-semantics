; ModuleID = './920520-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i32* %bar) #0 {
  %1 = alloca i32*, align 8
  store i32* %bar, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  store i32 8, i32* %2, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @bugger() #0 {
  %oldDepth = alloca i32, align 4
  %newDepth = alloca i32, align 4
  call void @foo(i32* %oldDepth)
  %1 = load i32, i32* %oldDepth, align 4
  switch i32 %1, label %4 [
    i32 8, label %2
    i32 500, label %2
    i32 5000, label %3
  ]

; <label>:2                                       ; preds = %0, %0
  store i32 8, i32* %newDepth, align 4
  br label %5

; <label>:3                                       ; preds = %0
  store i32 500, i32* %newDepth, align 4
  br label %5

; <label>:4                                       ; preds = %0
  store i32 17, i32* %newDepth, align 4
  br label %5

; <label>:5                                       ; preds = %4, %3, %2
  %6 = load i32, i32* %newDepth, align 4
  %7 = load i32, i32* %oldDepth, align 4
  %8 = sub nsw i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @bugger()
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
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
