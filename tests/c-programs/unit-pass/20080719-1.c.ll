; ModuleID = './20080719-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@cfb_tab8_be = internal constant [16 x i32] [i32 0, i32 255, i32 65280, i32 65535, i32 16711680, i32 16711935, i32 16776960, i32 16777215, i32 -16777216, i32 -16776961, i32 -16711936, i32 -16711681, i32 -65536, i32 -65281, i32 -256, i32 -1], align 16
@cfb_tab16_be = internal constant [4 x i32] [i32 0, i32 65535, i32 -65536, i32 -1], align 16
@cfb_tab32 = internal constant [2 x i32] [i32 0, i32 -1], align 4

; Function Attrs: nounwind uwtable
define i32* @xxx(i32 %bpp) #0 {
  %1 = alloca i32, align 4
  %tab = alloca i32*, align 8
  store i32 %bpp, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  switch i32 %2, label %6 [
    i32 8, label %3
    i32 16, label %4
    i32 32, label %5
  ]

; <label>:3                                       ; preds = %0
  store i32* getelementptr inbounds ([16 x i32], [16 x i32]* @cfb_tab8_be, i32 0, i32 0), i32** %tab, align 8
  br label %7

; <label>:4                                       ; preds = %0
  store i32* getelementptr inbounds ([4 x i32], [4 x i32]* @cfb_tab16_be, i32 0, i32 0), i32** %tab, align 8
  br label %7

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %0, %5
  store i32* getelementptr inbounds ([2 x i32], [2 x i32]* @cfb_tab32, i32 0, i32 0), i32** %tab, align 8
  br label %7

; <label>:7                                       ; preds = %6, %4, %3
  %8 = load i32*, i32** %tab, align 8
  ret i32* %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32*, align 8
  %b = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32* @xxx(i32 8)
  store i32* %2, i32** %a, align 8
  %3 = load i32*, i32** %a, align 8
  %4 = getelementptr inbounds i32, i32* %3, i64 0
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %b, align 4
  %6 = load i32, i32* %b, align 4
  %7 = load i32, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @cfb_tab8_be, i32 0, i64 0), align 4
  %8 = icmp ne i32 %6, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
