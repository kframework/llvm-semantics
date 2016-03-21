; ModuleID = './2003-05-31-LongShifts.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i64, i32 }

@.str = private unnamed_addr constant [15 x i8] c"0x%llx op %d:\0A\00", align 1
@.str.1 = private unnamed_addr constant [45 x i8] c"  ashr: 0x%llx\0A  lshr: 0x%llx\0A  shl: 0x%llx\0A\00", align 1
@Vals = global [8 x %struct.anon] [%struct.anon { i64 123, i32 4 }, %struct.anon { i64 123, i32 34 }, %struct.anon { i64 -4, i32 4 }, %struct.anon { i64 -5, i32 34 }, %struct.anon { i64 -6000000000, i32 4 }, %struct.anon { i64 -6000000000, i32 34 }, %struct.anon { i64 6000000000, i32 4 }, %struct.anon { i64 6000000000, i32 34 }], align 16

; Function Attrs: nounwind uwtable
define void @Test(i64 %Val, i32 %Amt) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  store i64 %Val, i64* %1, align 8
  store i32 %Amt, i32* %2, align 4
  %3 = load i64, i64* %1, align 8
  %4 = load i32, i32* %2, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i64 %3, i32 %4)
  %6 = load i64, i64* %1, align 8
  %7 = load i32, i32* %2, align 4
  %8 = zext i32 %7 to i64
  %9 = ashr i64 %6, %8
  %10 = load i64, i64* %1, align 8
  %11 = load i32, i32* %2, align 4
  %12 = zext i32 %11 to i64
  %13 = lshr i64 %10, %12
  %14 = load i64, i64* %1, align 8
  %15 = load i32, i32* %2, align 4
  %16 = zext i32 %15 to i64
  %17 = shl i64 %14, %16
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.1, i32 0, i32 0), i64 %9, i64 %13, i64 %17)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = add nsw i32 %4, -1
  store i32 %5, i32* %2, align 4
  br label %6

; <label>:6                                       ; preds = %21, %0
  %7 = load i32, i32* %2, align 4
  %8 = sext i32 %7 to i64
  %9 = icmp ult i64 %8, 8
  br i1 %9, label %10, label %24

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @Vals, i32 0, i64 %12
  %14 = getelementptr inbounds %struct.anon, %struct.anon* %13, i32 0, i32 0
  %15 = load volatile i64, i64* %14, align 8
  %16 = load i32, i32* %2, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [8 x %struct.anon], [8 x %struct.anon]* @Vals, i32 0, i64 %17
  %19 = getelementptr inbounds %struct.anon, %struct.anon* %18, i32 0, i32 1
  %20 = load volatile i32, i32* %19, align 4
  call void @Test(i64 %15, i32 %20)
  br label %21

; <label>:21                                      ; preds = %10
  %22 = load i32, i32* %2, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %2, align 4
  br label %6

; <label>:24                                      ; preds = %6
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
