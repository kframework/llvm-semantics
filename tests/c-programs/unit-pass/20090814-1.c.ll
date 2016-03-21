; ModuleID = './20090814-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@i = common global i32 0, align 4
@a = common global [2 x i32] zeroinitializer, align 4

; Function Attrs: noinline nounwind uwtable
define i32 @bar(i32* %a) #0 {
  %1 = alloca i32*, align 8
  store i32* %a, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = load i32, i32* %2, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind uwtable
define i32 @foo([2 x i32]* %a) #0 {
  %1 = alloca [2 x i32]*, align 8
  store [2 x i32]* %a, [2 x i32]** %1, align 8
  %2 = load i32, i32* @i, align 4
  %3 = sext i32 %2 to i64
  %4 = load [2 x i32]*, [2 x i32]** %1, align 8
  %5 = getelementptr inbounds [2 x i32], [2 x i32]* %4, i32 0, i64 %3
  %6 = call i32 @bar(i32* %5)
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 -1, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @a, i32 0, i64 0), align 4
  store i32 42, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @a, i32 0, i64 1), align 4
  store i32 1, i32* @i, align 4
  %2 = call i32 @foo([2 x i32]* @a)
  %3 = icmp ne i32 %2, 42
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
