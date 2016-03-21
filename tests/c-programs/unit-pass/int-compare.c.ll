; ModuleID = './int-compare.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @gt(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sgt i32 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @ge(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sge i32 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @lt(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @le(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sle i32 %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define void @true(i32 %c) #0 {
  %1 = alloca i32, align 4
  store i32 %c, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @false(i32 %c) #0 {
  %1 = alloca i32, align 4
  store i32 %c, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %1 = call i32 @gt(i32 2, i32 1)
  call void @true(i32 %1)
  %2 = call i32 @gt(i32 1, i32 2)
  call void @false(i32 %2)
  %3 = call i32 @gt(i32 2147483647, i32 0)
  call void @true(i32 %3)
  %4 = call i32 @gt(i32 0, i32 2147483647)
  call void @false(i32 %4)
  %5 = call i32 @gt(i32 2147483647, i32 1)
  call void @true(i32 %5)
  %6 = call i32 @gt(i32 1, i32 2147483647)
  call void @false(i32 %6)
  %7 = call i32 @gt(i32 -2147483648, i32 0)
  call void @false(i32 %7)
  %8 = call i32 @gt(i32 0, i32 -2147483648)
  call void @true(i32 %8)
  %9 = call i32 @gt(i32 -2147483648, i32 1)
  call void @false(i32 %9)
  %10 = call i32 @gt(i32 1, i32 -2147483648)
  call void @true(i32 %10)
  %11 = call i32 @gt(i32 2147483647, i32 -2147483648)
  call void @true(i32 %11)
  %12 = call i32 @gt(i32 -2147483648, i32 2147483647)
  call void @false(i32 %12)
  %13 = call i32 @ge(i32 2, i32 1)
  call void @true(i32 %13)
  %14 = call i32 @ge(i32 1, i32 2)
  call void @false(i32 %14)
  %15 = call i32 @ge(i32 2147483647, i32 0)
  call void @true(i32 %15)
  %16 = call i32 @ge(i32 0, i32 2147483647)
  call void @false(i32 %16)
  %17 = call i32 @ge(i32 2147483647, i32 1)
  call void @true(i32 %17)
  %18 = call i32 @ge(i32 1, i32 2147483647)
  call void @false(i32 %18)
  %19 = call i32 @ge(i32 -2147483648, i32 0)
  call void @false(i32 %19)
  %20 = call i32 @ge(i32 0, i32 -2147483648)
  call void @true(i32 %20)
  %21 = call i32 @ge(i32 -2147483648, i32 1)
  call void @false(i32 %21)
  %22 = call i32 @ge(i32 1, i32 -2147483648)
  call void @true(i32 %22)
  %23 = call i32 @ge(i32 2147483647, i32 -2147483648)
  call void @true(i32 %23)
  %24 = call i32 @ge(i32 -2147483648, i32 2147483647)
  call void @false(i32 %24)
  %25 = call i32 @lt(i32 2, i32 1)
  call void @false(i32 %25)
  %26 = call i32 @lt(i32 1, i32 2)
  call void @true(i32 %26)
  %27 = call i32 @lt(i32 2147483647, i32 0)
  call void @false(i32 %27)
  %28 = call i32 @lt(i32 0, i32 2147483647)
  call void @true(i32 %28)
  %29 = call i32 @lt(i32 2147483647, i32 1)
  call void @false(i32 %29)
  %30 = call i32 @lt(i32 1, i32 2147483647)
  call void @true(i32 %30)
  %31 = call i32 @lt(i32 -2147483648, i32 0)
  call void @true(i32 %31)
  %32 = call i32 @lt(i32 0, i32 -2147483648)
  call void @false(i32 %32)
  %33 = call i32 @lt(i32 -2147483648, i32 1)
  call void @true(i32 %33)
  %34 = call i32 @lt(i32 1, i32 -2147483648)
  call void @false(i32 %34)
  %35 = call i32 @lt(i32 2147483647, i32 -2147483648)
  call void @false(i32 %35)
  %36 = call i32 @lt(i32 -2147483648, i32 2147483647)
  call void @true(i32 %36)
  %37 = call i32 @le(i32 2, i32 1)
  call void @false(i32 %37)
  %38 = call i32 @le(i32 1, i32 2)
  call void @true(i32 %38)
  %39 = call i32 @le(i32 2147483647, i32 0)
  call void @false(i32 %39)
  %40 = call i32 @le(i32 0, i32 2147483647)
  call void @true(i32 %40)
  %41 = call i32 @le(i32 2147483647, i32 1)
  call void @false(i32 %41)
  %42 = call i32 @le(i32 1, i32 2147483647)
  call void @true(i32 %42)
  %43 = call i32 @le(i32 -2147483648, i32 0)
  call void @true(i32 %43)
  %44 = call i32 @le(i32 0, i32 -2147483648)
  call void @false(i32 %44)
  %45 = call i32 @le(i32 -2147483648, i32 1)
  call void @true(i32 %45)
  %46 = call i32 @le(i32 1, i32 -2147483648)
  call void @false(i32 %46)
  %47 = call i32 @le(i32 2147483647, i32 -2147483648)
  call void @false(i32 %47)
  %48 = call i32 @le(i32 -2147483648, i32 2147483647)
  call void @true(i32 %48)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
