; ModuleID = './pr43438.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g_2 = internal global i8 1, align 1
@l_8 = internal global i32* @g_9, align 8
@g_9 = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %l_11 = alloca i8, align 1
  store i32 0, i32* %1
  store i8 -2, i8* %l_11, align 1
  %2 = load i8, i8* @g_2, align 1
  %3 = zext i8 %2 to i32
  %4 = load i32*, i32** @l_8, align 8
  %5 = load i32, i32* %4, align 4
  %6 = or i32 %5, %3
  store i32 %6, i32* %4, align 4
  %7 = load i32*, i32** @l_8, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load i8, i8* %l_11, align 1
  %10 = zext i8 %9 to i32
  %11 = or i32 %10, %8
  %12 = trunc i32 %11 to i8
  store i8 %12, i8* %l_11, align 1
  %13 = load i8, i8* %l_11, align 1
  %14 = zext i8 %13 to i32
  call void @func_12(i32 %14)
  %15 = load i32, i32* @g_9, align 4
  %16 = icmp ne i32 %15, 1
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @func_12(i32 %p_13) #0 {
  %1 = alloca i32, align 4
  %l_17 = alloca i32*, align 8
  store i32 %p_13, i32* %1, align 4
  store i32* @g_9, i32** %l_17, align 8
  %2 = load i32, i32* %1, align 4
  %3 = icmp slt i32 0, %2
  %4 = zext i1 %3 to i32
  %5 = load i32*, i32** %l_17, align 8
  %6 = load i32, i32* %5, align 4
  %7 = and i32 %6, %4
  store i32 %7, i32* %5, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
