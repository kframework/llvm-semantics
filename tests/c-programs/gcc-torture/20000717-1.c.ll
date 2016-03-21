; ModuleID = './20000717-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.trio = type { i32, i32, i32 }

@main.t = private unnamed_addr constant %struct.trio { i32 1, i32 2, i32 3 }, align 4

; Function Attrs: nounwind uwtable
define i32 @bar(i32 %i, i64 %t.coerce0, i32 %t.coerce1) #0 {
  %t = alloca %struct.trio, align 8
  %1 = alloca { i64, i32 }, align 8
  %2 = alloca i32, align 4
  %3 = getelementptr { i64, i32 }, { i64, i32 }* %1, i32 0, i32 0
  store i64 %t.coerce0, i64* %3
  %4 = getelementptr { i64, i32 }, { i64, i32 }* %1, i32 0, i32 1
  store i32 %t.coerce1, i32* %4
  %5 = bitcast %struct.trio* %t to i8*
  %6 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 12, i32 8, i1 false)
  store i32 %i, i32* %2, align 4
  %7 = getelementptr inbounds %struct.trio, %struct.trio* %t, i32 0, i32 0
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %struct.trio, %struct.trio* %t, i32 0, i32 1
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %8, %10
  br i1 %11, label %18, label %12

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.trio, %struct.trio* %t, i32 0, i32 0
  %14 = load i32, i32* %13, align 4
  %15 = getelementptr inbounds %struct.trio, %struct.trio* %t, i32 0, i32 2
  %16 = load i32, i32* %15, align 4
  %17 = icmp eq i32 %14, %16
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %12, %0
  call void @abort() #3
  unreachable

; <label>:19                                      ; preds = %12
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @foo(i64 %t.coerce0, i32 %t.coerce1, i32 %i) #0 {
  %t = alloca %struct.trio, align 8
  %1 = alloca { i64, i32 }, align 8
  %2 = alloca i32, align 4
  %3 = alloca { i64, i32 }
  %4 = getelementptr { i64, i32 }, { i64, i32 }* %1, i32 0, i32 0
  store i64 %t.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }, { i64, i32 }* %1, i32 0, i32 1
  store i32 %t.coerce1, i32* %5
  %6 = bitcast %struct.trio* %t to i8*
  %7 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  store i32 %i, i32* %2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = bitcast { i64, i32 }* %3 to i8*
  %10 = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 12, i32 0, i1 false)
  %11 = getelementptr { i64, i32 }, { i64, i32 }* %3, i32 0, i32 0
  %12 = load i64, i64* %11, align 1
  %13 = getelementptr { i64, i32 }, { i64, i32 }* %3, i32 0, i32 1
  %14 = load i32, i32* %13, align 1
  %15 = call i32 @bar(i32 %8, i64 %12, i32 %14)
  ret i32 %15
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca %struct.trio, align 4
  %2 = alloca { i64, i32 }
  store i32 0, i32* %1
  %3 = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.trio* @main.t to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast { i64, i32 }* %2 to i8*
  %5 = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 12, i32 0, i1 false)
  %6 = getelementptr { i64, i32 }, { i64, i32 }* %2, i32 0, i32 0
  %7 = load i64, i64* %6, align 1
  %8 = getelementptr { i64, i32 }, { i64, i32 }* %2, i32 0, i32 1
  %9 = load i32, i32* %8, align 1
  %10 = call i32 @foo(i64 %7, i32 %9, i32 4)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %12 = load i32, i32* %1
  ret i32 %12
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
