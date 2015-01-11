; ModuleID = './20021118-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { [4 x i32] }

@main.s = private unnamed_addr constant %struct.s { [4 x i32] [i32 1, i32 2, i32 3, i32 4] }, align 4

; Function Attrs: nounwind uwtable
define i32 @foo(i64 %s.coerce0, i64 %s.coerce1, i32 %x1, i32 %x2, i32 %x3, i32 %x4, i32 %x5, i32 %x6, i32 %x7) #0 {
  %s = alloca %struct.s, align 8
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = bitcast %struct.s* %s to { i64, i64 }*
  %9 = getelementptr { i64, i64 }* %8, i32 0, i32 0
  store i64 %s.coerce0, i64* %9
  %10 = getelementptr { i64, i64 }* %8, i32 0, i32 1
  store i64 %s.coerce1, i64* %10
  store i32 %x1, i32* %1, align 4
  store i32 %x2, i32* %2, align 4
  store i32 %x3, i32* %3, align 4
  store i32 %x4, i32* %4, align 4
  store i32 %x5, i32* %5, align 4
  store i32 %x6, i32* %6, align 4
  store i32 %x7, i32* %7, align 4
  %11 = getelementptr inbounds %struct.s* %s, i32 0, i32 0
  %12 = getelementptr inbounds [4 x i32]* %11, i32 0, i64 3
  %13 = load i32* %12, align 4
  %14 = load i32* %7, align 4
  %15 = add nsw i32 %13, %14
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.s, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.s* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.s* @main.s to i8*), i64 16, i32 4, i1 false)
  %3 = bitcast %struct.s* %s to { i64, i64 }*
  %4 = getelementptr { i64, i64 }* %3, i32 0, i32 0
  %5 = load i64* %4, align 1
  %6 = getelementptr { i64, i64 }* %3, i32 0, i32 1
  %7 = load i64* %6, align 1
  %8 = call i32 @foo(i64 %5, i64 %7, i32 100, i32 200, i32 300, i32 400, i32 500, i32 600, i32 700)
  %9 = icmp ne i32 %8, 704
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:11                                      ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %13 = load i32* %1
  ret i32 %13
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
