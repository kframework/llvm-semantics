; ModuleID = './991112-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @rl_show_char(i32 %c) #0 {
  %1 = alloca i32, align 4
  store i32 %c, i32* %1, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @rl_character_len(i32 %c, i32 %pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %c, i32* %1, align 4
  store i32 %pos, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = call i16** @__ctype_b_loc() #3
  %6 = load i16*, i16** %5, align 8
  %7 = getelementptr inbounds i16, i16* %6, i64 %4
  %8 = load i16, i16* %7, align 2
  %9 = zext i16 %8 to i32
  %10 = and i32 %9, 16384
  %11 = icmp ne i32 %10, 0
  %12 = select i1 %11, i32 1, i32 2
  ret i32 %12
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32 (i32, i32)*, align 8
  store i32 0, i32* %1
  store i32 (i32, i32)* @rl_character_len, i32 (i32, i32)** %x, align 8
  %2 = load i32 (i32, i32)*, i32 (i32, i32)** %x, align 8
  %3 = call i32 %2(i32 97, i32 1)
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i32 (i32, i32)*, i32 (i32, i32)** %x, align 8
  %8 = call i32 %7(i32 2, i32 1)
  %9 = icmp ne i32 %8, 2
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @abort() #4
  unreachable

; <label>:11                                      ; preds = %6
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
