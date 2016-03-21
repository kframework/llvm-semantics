; ModuleID = './20000726-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.adjust_template = type { i16, i16, i16, i16 }

@adjust = internal global %struct.adjust_template { i16 0, i16 0, i16 1, i16 1 }, align 2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i16, align 2
  %y = alloca i16, align 2
  store i32 0, i32* %1
  store i16 1, i16* %x, align 2
  store i16 1, i16* %y, align 2
  call void @adjust_xy(i16* %x, i16* %y)
  %2 = load i16, i16* %x, align 2
  %3 = sext i16 %2 to i32
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define void @adjust_xy(i16* %x, i16* %y) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i16*, align 8
  store i16* %x, i16** %1, align 8
  store i16* %y, i16** %2, align 8
  %3 = load i16, i16* getelementptr inbounds (%struct.adjust_template, %struct.adjust_template* @adjust, i32 0, i32 0), align 2
  %4 = sext i16 %3 to i32
  %5 = load i16*, i16** %1, align 8
  %6 = load i16, i16* %5, align 2
  %7 = sext i16 %6 to i32
  %8 = mul nsw i32 %4, %7
  %9 = load i16, i16* getelementptr inbounds (%struct.adjust_template, %struct.adjust_template* @adjust, i32 0, i32 1), align 2
  %10 = sext i16 %9 to i32
  %11 = load i16*, i16** %2, align 8
  %12 = load i16, i16* %11, align 2
  %13 = sext i16 %12 to i32
  %14 = mul nsw i32 %10, %13
  %15 = add nsw i32 %8, %14
  %16 = load i16, i16* getelementptr inbounds (%struct.adjust_template, %struct.adjust_template* @adjust, i32 0, i32 2), align 2
  %17 = sext i16 %16 to i32
  %18 = add nsw i32 %15, %17
  %19 = trunc i32 %18 to i16
  %20 = load i16*, i16** %1, align 8
  store i16 %19, i16* %20, align 2
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
