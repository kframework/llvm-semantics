; ModuleID = './930622-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i32 1, align 4
@b = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @g() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @h(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @g()
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 0, i32* %1
  br label %12

; <label>:5                                       ; preds = %0
  %6 = call i32 @g()
  store i32 %6, i32* @a, align 4
  %7 = load i32, i32* @b, align 4
  %8 = icmp sge i32 %7, 1
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* @a, align 4
  call void @h(i32 %10)
  br label %11

; <label>:11                                      ; preds = %9, %5
  store i32 0, i32* %1
  br label %12

; <label>:12                                      ; preds = %11, %4
  %13 = load i32, i32* %1
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f()
  %3 = load i32, i32* @a, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
