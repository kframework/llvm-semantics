; ModuleID = './ipa-sra-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.both = type { %struct.big }
%struct.big = type { [1000000 x i32] }
%struct.small = type { [10 x i32] }

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %agg = alloca %union.both*, align 8
  %r = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i8* @calloc(i32 1, i32 40)
  %5 = bitcast i8* %4 to %union.both*
  store %union.both* %5, %union.both** %agg, align 8
  %6 = load i32, i32* %2, align 4
  %7 = icmp sgt i32 %6, 2000
  %8 = zext i1 %7 to i32
  %9 = load %union.both*, %union.both** %agg, align 8
  %10 = call i32 @foo(i32 %8, %union.both* %9)
  store i32 %10, i32* %r, align 4
  %11 = load %union.both*, %union.both** %agg, align 8
  %12 = bitcast %union.both* %11 to i8*
  call void @free(i8* %12)
  %13 = load i32, i32* %r, align 4
  ret i32 %13
}

declare i8* @calloc(i32, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @foo(i32 %fail, %union.both* %agg) #2 {
  %1 = alloca i32, align 4
  %2 = alloca %union.both*, align 8
  %r = alloca i32, align 4
  store i32 %fail, i32* %1, align 4
  store %union.both* %agg, %union.both** %2, align 8
  %3 = load i32, i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = load %union.both*, %union.both** %2, align 8
  %7 = bitcast %union.both* %6 to %struct.big*
  %8 = getelementptr inbounds %struct.big, %struct.big* %7, i32 0, i32 0
  %9 = getelementptr inbounds [1000000 x i32], [1000000 x i32]* %8, i32 0, i64 999999
  %10 = load i32, i32* %9, align 4
  store i32 %10, i32* %r, align 4
  br label %17

; <label>:11                                      ; preds = %0
  %12 = load %union.both*, %union.both** %2, align 8
  %13 = bitcast %union.both* %12 to %struct.small*
  %14 = getelementptr inbounds %struct.small, %struct.small* %13, i32 0, i32 0
  %15 = getelementptr inbounds [10 x i32], [10 x i32]* %14, i32 0, i64 0
  %16 = load i32, i32* %15, align 4
  store i32 %16, i32* %r, align 4
  br label %17

; <label>:17                                      ; preds = %11, %5
  %18 = load i32, i32* %r, align 4
  ret i32 %18
}

declare void @free(i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
