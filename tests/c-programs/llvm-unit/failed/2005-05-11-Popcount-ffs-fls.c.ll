; ModuleID = './2005-05-11-Popcount-ffs-fls.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@nlz10b.table = internal global [64 x i8] c" \14\13cc\12c\07\0A\11cc\0Ec\06cc\09c\10cc\01\1Ac\0Dcc\18\05ccc\15c\08\0Bc\0Fcccc\02\1B\00\19c\16c\0Ccc\03\1Cc\17c\04\1Dcc\1E\1F", align 16
@ntz8.table = internal global [64 x i8] c" \00\01\0C\02\06c\0D\03c\07cccc\0E\0A\04cc\08cc\19ccccc\15\1B\0F\1F\0B\05ccccc\09cc\18cc\14\1A\1Ecccc\17c\13\1Dc\16\12\1C\11\10c", align 16
@i = common global i32 0, align 4
@.str = private unnamed_addr constant [54 x i8] c"LLVM: n: %d, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [54 x i8] c"REF : n: %d, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"  ***  \0A\00", align 1
@.str.3 = private unnamed_addr constant [56 x i8] c"LLVM: n: %lld, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [64 x i8] c"REF LO BITS : n: %lld, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [58 x i8] c"FFS: 0:%d, 1:%d, 2:%d, 7:%d, 1024:%d, 1234:%d i:%d, l:%d\0A\00", align 1
@.str.6 = private unnamed_addr constant [67 x i8] c"__builtin_ffs: 0:%d, 1:%d, 2:%d, 7:%d, 1024:%d, 1234:%d i:%d l:%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @nlz10b(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = lshr i32 %3, 1
  %5 = or i32 %2, %4
  store i32 %5, i32* %1, align 4
  %6 = load i32, i32* %1, align 4
  %7 = load i32, i32* %1, align 4
  %8 = lshr i32 %7, 2
  %9 = or i32 %6, %8
  store i32 %9, i32* %1, align 4
  %10 = load i32, i32* %1, align 4
  %11 = load i32, i32* %1, align 4
  %12 = lshr i32 %11, 4
  %13 = or i32 %10, %12
  store i32 %13, i32* %1, align 4
  %14 = load i32, i32* %1, align 4
  %15 = load i32, i32* %1, align 4
  %16 = lshr i32 %15, 8
  %17 = or i32 %14, %16
  store i32 %17, i32* %1, align 4
  %18 = load i32, i32* %1, align 4
  %19 = load i32, i32* %1, align 4
  %20 = lshr i32 %19, 16
  %21 = xor i32 %20, -1
  %22 = and i32 %18, %21
  store i32 %22, i32* %1, align 4
  %23 = load i32, i32* %1, align 4
  %24 = shl i32 %23, 9
  %25 = load i32, i32* %1, align 4
  %26 = sub i32 %24, %25
  store i32 %26, i32* %1, align 4
  %27 = load i32, i32* %1, align 4
  %28 = shl i32 %27, 11
  %29 = load i32, i32* %1, align 4
  %30 = sub i32 %28, %29
  store i32 %30, i32* %1, align 4
  %31 = load i32, i32* %1, align 4
  %32 = shl i32 %31, 14
  %33 = load i32, i32* %1, align 4
  %34 = sub i32 %32, %33
  store i32 %34, i32* %1, align 4
  %35 = load i32, i32* %1, align 4
  %36 = lshr i32 %35, 26
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds [64 x i8], [64 x i8]* @nlz10b.table, i32 0, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  ret i32 %40
}

; Function Attrs: nounwind uwtable
define i32 @nlzll(i64 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i64 %x, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = lshr i64 %3, 32
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i64, i64* %2, align 8
  %8 = trunc i64 %7 to i32
  %9 = call i32 @nlz10b(i32 %8)
  %10 = add nsw i32 %9, 32
  store i32 %10, i32* %1
  br label %16

; <label>:11                                      ; preds = %0
  %12 = load i64, i64* %2, align 8
  %13 = lshr i64 %12, 32
  %14 = trunc i64 %13 to i32
  %15 = call i32 @nlz10b(i32 %14)
  store i32 %15, i32* %1
  br label %16

; <label>:16                                      ; preds = %11, %6
  %17 = load i32, i32* %1
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @pop(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = lshr i32 %3, 1
  %5 = and i32 %4, 1431655765
  %6 = sub i32 %2, %5
  store i32 %6, i32* %1, align 4
  %7 = load i32, i32* %1, align 4
  %8 = and i32 %7, 858993459
  %9 = load i32, i32* %1, align 4
  %10 = lshr i32 %9, 2
  %11 = and i32 %10, 858993459
  %12 = add i32 %8, %11
  store i32 %12, i32* %1, align 4
  %13 = load i32, i32* %1, align 4
  %14 = load i32, i32* %1, align 4
  %15 = lshr i32 %14, 4
  %16 = add i32 %13, %15
  %17 = and i32 %16, 252645135
  store i32 %17, i32* %1, align 4
  %18 = load i32, i32* %1, align 4
  %19 = load i32, i32* %1, align 4
  %20 = shl i32 %19, 8
  %21 = add i32 %18, %20
  store i32 %21, i32* %1, align 4
  %22 = load i32, i32* %1, align 4
  %23 = load i32, i32* %1, align 4
  %24 = shl i32 %23, 16
  %25 = add i32 %22, %24
  store i32 %25, i32* %1, align 4
  %26 = load i32, i32* %1, align 4
  %27 = lshr i32 %26, 24
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define i32 @popll(i64 %x) #0 {
  %1 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = trunc i64 %2 to i32
  %4 = call i32 @pop(i32 %3)
  %5 = load i64, i64* %1, align 8
  %6 = lshr i64 %5, 32
  %7 = trunc i64 %6 to i32
  %8 = call i32 @pop(i32 %7)
  %9 = add nsw i32 %4, %8
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @ntz8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sub i32 0, %3
  %5 = and i32 %2, %4
  %6 = mul i32 %5, 72416175
  store i32 %6, i32* %1, align 4
  %7 = load i32, i32* %1, align 4
  %8 = lshr i32 %7, 26
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [64 x i8], [64 x i8]* @ntz8.table, i32 0, i64 %9
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %l = alloca i64, align 8
  store i32 0, i32* %1
  store i32 10, i32* @i, align 4
  br label %2

; <label>:2                                       ; preds = %25, %0
  %3 = load i32, i32* @i, align 4
  %4 = icmp slt i32 %3, 139045193
  br i1 %4, label %5, label %28

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* @i, align 4
  %7 = load i32, i32* @i, align 4
  %8 = call i32 @llvm.ctlz.i32(i32 %7, i1 true)
  %9 = load i32, i32* @i, align 4
  %10 = call i32 @llvm.ctpop.i32(i32 %9)
  %11 = load i32, i32* @i, align 4
  %12 = call i32 @llvm.cttz.i32(i32 %11, i1 true)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str, i32 0, i32 0), i32 %6, i32 %8, i32 %10, i32 %12)
  %14 = load i32, i32* @i, align 4
  %15 = load i32, i32* @i, align 4
  %16 = call i32 @nlz10b(i32 %15)
  %17 = load i32, i32* @i, align 4
  %18 = call i32 @pop(i32 %17)
  %19 = load i32, i32* @i, align 4
  %20 = call i32 @ntz8(i32 %19)
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.1, i32 0, i32 0), i32 %14, i32 %16, i32 %18, i32 %20)
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0))
  %23 = load i32, i32* @i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* @i, align 4
  br label %25

; <label>:25                                      ; preds = %5
  %26 = load i32, i32* @i, align 4
  %27 = mul nsw i32 %26, -3
  store i32 %27, i32* @i, align 4
  br label %2

; <label>:28                                      ; preds = %2
  store i64 -10000, i64* %l, align 8
  br label %29

; <label>:29                                      ; preds = %56, %28
  %30 = load i64, i64* %l, align 8
  %31 = icmp slt i64 %30, 1390451930000
  br i1 %31, label %32, label %59

; <label>:32                                      ; preds = %29
  %33 = load i64, i64* %l, align 8
  %34 = load i64, i64* %l, align 8
  %35 = call i64 @llvm.ctlz.i64(i64 %34, i1 true)
  %36 = trunc i64 %35 to i32
  %37 = load i64, i64* %l, align 8
  %38 = call i64 @llvm.ctpop.i64(i64 %37)
  %39 = trunc i64 %38 to i32
  %40 = load i64, i64* %l, align 8
  %41 = trunc i64 %40 to i32
  %42 = call i32 @llvm.cttz.i32(i32 %41, i1 true)
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @.str.3, i32 0, i32 0), i64 %33, i32 %36, i32 %39, i32 %42)
  %44 = load i64, i64* %l, align 8
  %45 = load i64, i64* %l, align 8
  %46 = call i32 @nlzll(i64 %45)
  %47 = load i64, i64* %l, align 8
  %48 = call i32 @popll(i64 %47)
  %49 = load i64, i64* %l, align 8
  %50 = trunc i64 %49 to i32
  %51 = call i32 @ntz8(i32 %50)
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.4, i32 0, i32 0), i64 %44, i32 %46, i32 %48, i32 %51)
  %53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0))
  %54 = load i64, i64* %l, align 8
  %55 = add nsw i64 %54, 1
  store i64 %55, i64* %l, align 8
  br label %56

; <label>:56                                      ; preds = %32
  %57 = load i64, i64* %l, align 8
  %58 = mul nsw i64 %57, -3
  store i64 %58, i64* %l, align 8
  br label %29

; <label>:59                                      ; preds = %29
  %60 = call i32 (i32, ...) bitcast (i32 (...)* @ffs to i32 (i32, ...)*)(i32 0)
  %61 = call i32 (i32, ...) bitcast (i32 (...)* @ffs to i32 (i32, ...)*)(i32 1)
  %62 = call i32 (i32, ...) bitcast (i32 (...)* @ffs to i32 (i32, ...)*)(i32 2)
  %63 = call i32 (i32, ...) bitcast (i32 (...)* @ffs to i32 (i32, ...)*)(i32 7)
  %64 = call i32 (i32, ...) bitcast (i32 (...)* @ffs to i32 (i32, ...)*)(i32 1024)
  %65 = call i32 (i32, ...) bitcast (i32 (...)* @ffs to i32 (i32, ...)*)(i32 1234)
  %66 = load i32, i32* @i, align 4
  %67 = call i32 (i32, ...) bitcast (i32 (...)* @ffs to i32 (i32, ...)*)(i32 %66)
  %68 = load i64, i64* %l, align 8
  %69 = call i32 (i64, ...) bitcast (i32 (...)* @ffsl to i32 (i64, ...)*)(i64 %68)
  %70 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.5, i32 0, i32 0), i32 %60, i32 %61, i32 %62, i32 %63, i32 %64, i32 %65, i32 %67, i32 %69)
  %71 = load i32, i32* @i, align 4
  %72 = call i32 @llvm.cttz.i32(i32 %71, i1 true)
  %73 = add i32 %72, 1
  %74 = icmp eq i32 %71, 0
  %75 = select i1 %74, i32 0, i32 %73
  %76 = load i64, i64* %l, align 8
  %77 = call i64 @llvm.cttz.i64(i64 %76, i1 true)
  %78 = add i64 %77, 1
  %79 = icmp eq i64 %76, 0
  %80 = select i1 %79, i64 0, i64 %78
  %81 = trunc i64 %80 to i32
  %82 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.6, i32 0, i32 0), i32 0, i32 1, i32 2, i32 1, i32 11, i32 2, i32 %75, i32 %81)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readnone
declare i32 @llvm.ctlz.i32(i32, i1) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ctpop.i32(i32) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.cttz.i32(i32, i1) #2

; Function Attrs: nounwind readnone
declare i64 @llvm.ctlz.i64(i64, i1) #2

; Function Attrs: nounwind readnone
declare i64 @llvm.ctpop.i64(i64) #2

declare i32 @ffs(...) #1

declare i32 @ffsl(...) #1

; Function Attrs: nounwind readnone
declare i64 @llvm.cttz.i64(i64, i1) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
