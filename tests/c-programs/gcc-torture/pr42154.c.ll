; ModuleID = './pr42154.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { [1 x i8] }

; Function Attrs: noinline nounwind uwtable
define void @foo(i8 %a.coerce) #0 {
  %a = alloca %struct.A, align 1
  %1 = getelementptr %struct.A, %struct.A* %a, i32 0, i32 0
  %2 = bitcast [1 x i8]* %1 to i8*
  store i8 %a.coerce, i8* %2, align 1
  %3 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0
  %4 = getelementptr inbounds [1 x i8], [1 x i8]* %3, i32 0, i64 0
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 97
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 1
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0
  %9 = getelementptr inbounds [1 x i8], [1 x i8]* %8, i32 0, i64 %7
  store i8 97, i8* %9, align 1
  br label %10

; <label>:10                                      ; preds = %5
  %11 = load i32, i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %2

; <label>:13                                      ; preds = %2
  %14 = getelementptr %struct.A, %struct.A* %a, i32 0, i32 0
  %15 = bitcast [1 x i8]* %14 to i8*
  %16 = load i8, i8* %15, align 1
  call void @foo(i8 %16)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
