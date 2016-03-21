; ModuleID = './20000419-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.foo = type { i32, i32, i32 }

@main.f = private unnamed_addr constant %struct.foo { i32 7, i32 8, i32 9 }, align 4

; Function Attrs: nounwind uwtable
define void @brother(i32 %a, i32 %b, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:7                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @sister(i64 %f.coerce0, i32 %f.coerce1, i32 %b, i32 %c) #0 {
  %f = alloca %struct.foo, align 8
  %1 = alloca { i64, i32 }, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = getelementptr { i64, i32 }, { i64, i32 }* %1, i32 0, i32 0
  store i64 %f.coerce0, i64* %4
  %5 = getelementptr { i64, i32 }, { i64, i32 }* %1, i32 0, i32 1
  store i32 %f.coerce1, i32* %5
  %6 = bitcast %struct.foo* %f to i8*
  %7 = bitcast { i64, i32 }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  %8 = getelementptr inbounds %struct.foo, %struct.foo* %f, i32 0, i32 1
  %9 = load i32, i32* %8, align 4
  %10 = load i32, i32* %2, align 4
  %11 = icmp eq i32 %9, %10
  %12 = zext i1 %11 to i32
  %13 = load i32, i32* %2, align 4
  %14 = load i32, i32* %3, align 4
  call void @brother(i32 %12, i32 %13, i32 %14)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f = alloca %struct.foo, align 4
  %2 = alloca { i64, i32 }
  store i32 0, i32* %1
  %3 = bitcast %struct.foo* %f to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.foo* @main.f to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast { i64, i32 }* %2 to i8*
  %5 = bitcast %struct.foo* %f to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 12, i32 0, i1 false)
  %6 = getelementptr { i64, i32 }, { i64, i32 }* %2, i32 0, i32 0
  %7 = load i64, i64* %6, align 1
  %8 = getelementptr { i64, i32 }, { i64, i32 }* %2, i32 0, i32 1
  %9 = load i32, i32* %8, align 1
  call void @sister(i64 %7, i32 %9, i32 1, i32 2)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %11 = load i32, i32* %1
  ret i32 %11
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
