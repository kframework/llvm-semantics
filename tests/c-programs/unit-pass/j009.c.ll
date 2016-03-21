; ModuleID = './j009.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i32*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %y1 = alloca i32, align 4
  %q = alloca i32*, align 8
  %x2 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  store i32 0, i32* %y, align 4
  store i32 5, i32* %y1, align 4
  %2 = load i32, i32* %y, align 4
  %3 = call noalias i8* @malloc(i64 4) #2
  %4 = bitcast i8* %3 to i32*
  store i32* %4, i32** %p, align 8
  %5 = load i32*, i32** %p, align 8
  store i32 5, i32* %5, align 4
  %6 = load i32*, i32** %p, align 8
  %7 = bitcast i32* %6 to i8*
  call void @free(i8* %7) #2
  store i32* %x2, i32** %q, align 8
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
