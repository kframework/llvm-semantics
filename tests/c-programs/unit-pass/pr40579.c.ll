; ModuleID = './pr40579.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 -2147483644, i32* %x, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %x, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, i32* %x, align 4
  %8 = load i32, i32* %x, align 4
  %9 = call i8* @itos(i32 %8)
  store i8* %9, i8** %p, align 8
  %10 = load i32, i32* %i, align 4
  %11 = load i8*, i8** %p, align 8
  call void @foo(i32 %10, i8* %11)
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32, i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @itos(i32 %num) #1 {
  %1 = alloca i32, align 4
  store i32 %num, i32* %1, align 4
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define internal void @foo(i32 %i, i8* %x) #1 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  store i32 %i, i32* %1, align 4
  store i8* %x, i8** %2, align 8
  %3 = load i32, i32* %1, align 4
  %4 = icmp sge i32 %3, 4
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
