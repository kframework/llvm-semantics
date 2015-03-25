; ModuleID = './20000706-5.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.baz = type { i32, i32, i32 }

@c = common global %struct.baz* null, align 8

; Function Attrs: nounwind uwtable
define void @bar(i32 %b) #0 {
  %1 = alloca i32, align 4
  store i32 %b, i32* %1, align 4
  %2 = load %struct.baz** @c, align 8
  %3 = getelementptr inbounds %struct.baz* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %19, label %6

; <label>:6                                       ; preds = %0
  %7 = load %struct.baz** @c, align 8
  %8 = getelementptr inbounds %struct.baz* %7, i32 0, i32 1
  %9 = load i32* %8, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %19, label %11

; <label>:11                                      ; preds = %6
  %12 = load %struct.baz** @c, align 8
  %13 = getelementptr inbounds %struct.baz* %12, i32 0, i32 2
  %14 = load i32* %13, align 4
  %15 = icmp ne i32 %14, 3
  br i1 %15, label %19, label %16

; <label>:16                                      ; preds = %11
  %17 = load i32* %1, align 4
  %18 = icmp ne i32 %17, 4
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16, %11, %6, %0
  call void @abort() #3
  unreachable

; <label>:20                                      ; preds = %16
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @foo(i64 %a.coerce0, i32 %a.coerce1, i32 %b) #0 {
  %a = alloca %struct.baz, align 8
  %1 = alloca { i64, i32 }, align 8
  %2 = alloca i32, align 4
  %3 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  store i64 %a.coerce0, i64* %3
  %4 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  store i32 %a.coerce1, i32* %4
  %5 = bitcast %struct.baz* %a to i8*
  %6 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 12, i32 8, i1 false)
  store i32 %b, i32* %2, align 4
  store %struct.baz* %a, %struct.baz** @c, align 8
  %7 = load i32* %2, align 4
  call void @bar(i32 %7)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.baz, align 4
  %2 = alloca { i64, i32 }
  store i32 0, i32* %1
  %3 = getelementptr inbounds %struct.baz* %a, i32 0, i32 0
  store i32 1, i32* %3, align 4
  %4 = getelementptr inbounds %struct.baz* %a, i32 0, i32 1
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds %struct.baz* %a, i32 0, i32 2
  store i32 3, i32* %5, align 4
  %6 = bitcast { i64, i32 }* %2 to i8*
  %7 = bitcast %struct.baz* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 0, i1 false)
  %8 = getelementptr { i64, i32 }* %2, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr { i64, i32 }* %2, i32 0, i32 1
  %11 = load i32* %10, align 1
  call void @foo(i64 %9, i32 %11, i32 4)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %13 = load i32* %1
  ret i32 %13
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
