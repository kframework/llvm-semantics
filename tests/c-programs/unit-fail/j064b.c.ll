; ModuleID = './j064b.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.p = internal constant [6 x i8] c"hello\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %q = alloca i8*, align 8
  store i32 0, i32* %1
  %2 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @main.p, i32 0, i64 0), align 1
  %3 = sext i8 %2 to i32
  %4 = call i8* @strchr(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @main.p, i32 0, i32 0), i32 %3) #2
  store i8* %4, i8** %q, align 8
  %5 = load i8*, i8** %q, align 8
  %6 = getelementptr inbounds i8, i8* %5, i64 0
  store i8 120, i8* %6, align 1
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
