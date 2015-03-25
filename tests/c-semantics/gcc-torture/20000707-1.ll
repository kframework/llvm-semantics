; ModuleID = './20000707-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.baz = type { i32, i32, i32 }

@main.x = private unnamed_addr constant %struct.baz { i32 3, i32 4, i32 5 }, align 4

; Function Attrs: nounwind uwtable
define void @foo(i32 %a, i32 %b, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = icmp ne i32 %4, 4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:7                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @bar(i64 %x.coerce0, i32 %x.coerce1, i32 %b, i32 %c) #0 {
  %x = alloca %struct.baz, align 8
  %1 = alloca { i64, i32 }, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %x.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %x.coerce1, i32* %5
  %6 = bitcast %struct.baz* %x to i8*
  %7 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  %8 = getelementptr inbounds %struct.baz* %x, i32 0, i32 1
  %9 = load i32* %8, align 4
  %10 = load i32* %2, align 4
  %11 = load i32* %3, align 4
  call void @foo(i32 %9, i32 %10, i32 %11)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.baz, align 4
  %2 = alloca { i64, i32 }
  store i32 0, i32* %1
  %3 = bitcast %struct.baz* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.baz* @main.x to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast { i64, i32 }* %2 to i8*
  %5 = bitcast %struct.baz* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 12, i32 0, i1 false)
  %6 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  %9 = load i32* %8, align 1
  call void @bar(i64 %7, i32 %9, i32 1, i32 2)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
