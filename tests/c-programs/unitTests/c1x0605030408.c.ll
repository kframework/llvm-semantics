; ModuleID = './c1x0605030408.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @fsize3(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*
  store i32 %n, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = add nsw i32 %3, 3
  %5 = zext i32 %4 to i64
  %6 = call i8* @llvm.stacksave()
  store i8* %6, i8** %2
  %7 = alloca i8, i64 %5, align 16
  %8 = load i8*, i8** %2
  call void @llvm.stackrestore(i8* %8)
  ret i64 %5
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %size = alloca i64, align 8
  store i32 0, i32* %1
  %2 = call i64 @fsize3(i32 10)
  store i64 %2, i64* %size, align 8
  %3 = load i64, i64* %size, align 8
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
