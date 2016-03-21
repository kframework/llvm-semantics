; ModuleID = './challenge04.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.t = type { [2 x i32] }

@s = common global %struct.t zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @f(i64 %s.coerce) #0 {
  %s = alloca %struct.t, align 8
  %1 = getelementptr %struct.t, %struct.t* %s, i32 0, i32 0
  %2 = bitcast [2 x i32]* %1 to i64*
  store i64 %s.coerce, i64* %2, align 8
  %3 = getelementptr inbounds %struct.t, %struct.t* %s, i32 0, i32 0
  %4 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i32 0, i64 1
  store i32 3, i32* %4, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @g(i32* %a) #0 {
  %1 = alloca i32*, align 8
  store i32* %a, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = getelementptr inbounds i32, i32* %2, i64 1
  store i32 5, i32* %3, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i64, i64* bitcast (%struct.t* @s to i64*), align 4
  call void @f(i64 %2)
  %3 = load i32, i32* getelementptr inbounds (%struct.t, %struct.t* @s, i32 0, i32 0, i64 1), align 4
  store i32 %3, i32* %x, align 4
  call void @g(i32* getelementptr inbounds (%struct.t, %struct.t* @s, i32 0, i32 0, i32 0))
  %4 = load i32, i32* getelementptr inbounds (%struct.t, %struct.t* @s, i32 0, i32 0, i64 1), align 4
  store i32 %4, i32* %y, align 4
  %5 = load i32, i32* %x, align 4
  %6 = load i32, i32* %y, align 4
  %7 = add nsw i32 %5, %6
  ret i32 %7
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
