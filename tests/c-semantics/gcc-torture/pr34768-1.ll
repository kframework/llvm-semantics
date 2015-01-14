; ModuleID = './pr34768-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = common global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define void @foo() #0 {
  %1 = load i32* @x, align 4
  %2 = sub nsw i32 0, %1
  store i32 %2, i32* @x, align 4
  ret void
}

; Function Attrs: noinline nounwind readnone uwtable
define void @bar() #1 {
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @test(i32 %c) #0 {
  %1 = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32 %c, i32* %1, align 4
  %2 = load i32* @x, align 4
  store i32 %2, i32* %tmp, align 4
  %3 = load i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  %5 = select i1 %4, void ()* @foo, void ()* @bar
  call void %5()
  %6 = load i32* %tmp, align 4
  %7 = load i32* @x, align 4
  %8 = add nsw i32 %6, %7
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* @x, align 4
  %2 = call i32 @test(i32 1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
