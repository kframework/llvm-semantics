; ModuleID = './20010518-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.a_struct = type <{ i16, i64, i16, i16, %struct.b_struct }>
%struct.b_struct = type <{ i8, i8, i8, i8, i8, i8 }>

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.a_struct*, align 8
  %b = alloca %struct.a_struct, align 1
  %2 = alloca %struct.a_struct, align 1
  store i32 0, i32* %1
  store %struct.a_struct* %b, %struct.a_struct** %a, align 8
  %3 = load %struct.a_struct** %a, align 8
  %4 = getelementptr inbounds %struct.a_struct* %2, i32 0, i32 0
  store i16 1, i16* %4, align 1
  %5 = getelementptr inbounds %struct.a_struct* %2, i32 0, i32 1
  store i64 2, i64* %5, align 1
  %6 = getelementptr inbounds %struct.a_struct* %2, i32 0, i32 2
  store i16 3, i16* %6, align 1
  %7 = getelementptr inbounds %struct.a_struct* %2, i32 0, i32 3
  store i16 4, i16* %7, align 1
  %8 = getelementptr inbounds %struct.a_struct* %2, i32 0, i32 4
  %9 = bitcast %struct.b_struct* %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 6, i32 1, i1 false)
  %10 = bitcast %struct.a_struct* %3 to i8*
  %11 = bitcast %struct.a_struct* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 20, i32 1, i1 true)
  %12 = load %struct.a_struct** %a, align 8
  %13 = getelementptr inbounds %struct.a_struct* %12, i32 0, i32 4
  %14 = getelementptr inbounds %struct.b_struct* %13, i32 0, i32 4
  store volatile i8 99, i8* %14, align 1
  %15 = load %struct.a_struct** %a, align 8
  %16 = getelementptr inbounds %struct.a_struct* %15, i32 0, i32 0
  %17 = load volatile i16* %16, align 1
  %18 = sext i16 %17 to i32
  %19 = icmp ne i32 %18, 1
  br i1 %19, label %44, label %20

; <label>:20                                      ; preds = %0
  %21 = load %struct.a_struct** %a, align 8
  %22 = getelementptr inbounds %struct.a_struct* %21, i32 0, i32 1
  %23 = load volatile i64* %22, align 1
  %24 = icmp ne i64 %23, 2
  br i1 %24, label %44, label %25

; <label>:25                                      ; preds = %20
  %26 = load %struct.a_struct** %a, align 8
  %27 = getelementptr inbounds %struct.a_struct* %26, i32 0, i32 2
  %28 = load volatile i16* %27, align 1
  %29 = sext i16 %28 to i32
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %44, label %31

; <label>:31                                      ; preds = %25
  %32 = load %struct.a_struct** %a, align 8
  %33 = getelementptr inbounds %struct.a_struct* %32, i32 0, i32 3
  %34 = load volatile i16* %33, align 1
  %35 = sext i16 %34 to i32
  %36 = icmp ne i32 %35, 4
  br i1 %36, label %44, label %37

; <label>:37                                      ; preds = %31
  %38 = load %struct.a_struct** %a, align 8
  %39 = getelementptr inbounds %struct.a_struct* %38, i32 0, i32 4
  %40 = getelementptr inbounds %struct.b_struct* %39, i32 0, i32 4
  %41 = load volatile i8* %40, align 1
  %42 = sext i8 %41 to i32
  %43 = icmp ne i32 %42, 99
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %37, %31, %25, %20, %0
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %37
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %47 = load i32* %1
  ret i32 %47
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

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
