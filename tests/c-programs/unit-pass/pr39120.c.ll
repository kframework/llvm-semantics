; ModuleID = './pr39120.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.X = type { i32* }

@x = common global %struct.X zeroinitializer, align 8

; Function Attrs: noinline nounwind uwtable
define i32* @foo(i32* %p) #0 {
  %1 = alloca %struct.X, align 8
  %2 = alloca i32*, align 8
  %x = alloca %struct.X, align 8
  store i32* %p, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = getelementptr inbounds %struct.X, %struct.X* %x, i32 0, i32 0
  store i32* %3, i32** %4, align 8
  %5 = bitcast %struct.X* %1 to i8*
  %6 = bitcast %struct.X* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 8, i32 8, i1 false)
  %7 = getelementptr %struct.X, %struct.X* %1, i32 0, i32 0
  %8 = load i32*, i32** %7, align 8
  ret i32* %8
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @bar() #0 {
  %1 = load i32*, i32** getelementptr inbounds (%struct.X, %struct.X* @x, i32 0, i32 0), align 8
  store i32 1, i32* %1, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %2 = alloca %struct.X, align 8
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  %3 = call i32* @foo(i32* %i)
  %4 = getelementptr %struct.X, %struct.X* %2, i32 0, i32 0
  store i32* %3, i32** %4, align 8
  %5 = bitcast %struct.X* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.X* @x to i8*), i8* %5, i64 8, i32 8, i1 false)
  call void @bar()
  %6 = load i32, i32* %i, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:9                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
