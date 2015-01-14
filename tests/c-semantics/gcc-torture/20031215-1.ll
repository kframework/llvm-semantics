; ModuleID = './20031215-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.pstr = type { i32, i32, [3 x i8] }

@ao = constant { i32, i32, [3 x i8], i8 } { i32 2, i32 2, [3 x i8] c"OK\00", i8 undef }, align 4
@a = constant %struct.pstr* bitcast ({ i32, i32, [3 x i8], i8 }* @ao to %struct.pstr*), align 8

; Function Attrs: nounwind uwtable
define void @test1() #0 {
  %1 = load %struct.pstr** @a, align 8
  %2 = getelementptr inbounds %struct.pstr* %1, i32 0, i32 1
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct.pstr** @a, align 8
  %6 = getelementptr inbounds %struct.pstr* %5, i32 0, i32 2
  %7 = getelementptr inbounds [3 x i8]* %6, i32 0, i64 %4
  %8 = load i8* %7, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %0
  %11 = load %struct.pstr** @a, align 8
  %12 = getelementptr inbounds %struct.pstr* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.pstr** @a, align 8
  %16 = getelementptr inbounds %struct.pstr* %15, i32 0, i32 2
  %17 = getelementptr inbounds [3 x i8]* %16, i32 0, i32 0
  %18 = getelementptr inbounds i8* %17, i64 %14
  store i8 0, i8* %18, align 1
  br label %19

; <label>:19                                      ; preds = %10, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @test2() #0 {
  %1 = load %struct.pstr** @a, align 8
  %2 = getelementptr inbounds %struct.pstr* %1, i32 0, i32 1
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct.pstr** @a, align 8
  %6 = getelementptr inbounds %struct.pstr* %5, i32 0, i32 2
  %7 = getelementptr inbounds [3 x i8]* %6, i32 0, i64 %4
  %8 = load i8* %7, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %0
  %11 = load %struct.pstr** @a, align 8
  %12 = getelementptr inbounds %struct.pstr* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.pstr** @a, align 8
  %16 = getelementptr inbounds %struct.pstr* %15, i32 0, i32 2
  %17 = getelementptr inbounds [3 x i8]* %16, i32 0, i32 0
  %18 = getelementptr inbounds i8* %17, i64 %14
  store i8 -1, i8* %18, align 1
  br label %19

; <label>:19                                      ; preds = %10, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @test3() #0 {
  %1 = load %struct.pstr** @a, align 8
  %2 = getelementptr inbounds %struct.pstr* %1, i32 0, i32 1
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct.pstr** @a, align 8
  %6 = getelementptr inbounds %struct.pstr* %5, i32 0, i32 2
  %7 = getelementptr inbounds [3 x i8]* %6, i32 0, i64 %4
  %8 = load i8* %7, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %0
  %11 = load %struct.pstr** @a, align 8
  %12 = getelementptr inbounds %struct.pstr* %11, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.pstr** @a, align 8
  %16 = getelementptr inbounds %struct.pstr* %15, i32 0, i32 2
  %17 = getelementptr inbounds [3 x i8]* %16, i32 0, i32 0
  %18 = getelementptr inbounds i8* %17, i64 %14
  store i8 1, i8* %18, align 1
  br label %19

; <label>:19                                      ; preds = %10, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test1()
  call void @test2()
  call void @test3()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
