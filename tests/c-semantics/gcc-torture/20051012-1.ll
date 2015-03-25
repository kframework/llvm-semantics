; ModuleID = './20051012-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.type = type { i32*, [4 x i8] }

@t = common global %struct.type zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %q.coerce0, i64 %q.coerce1) #0 {
  %q = alloca %struct.type, align 8
  %1 = bitcast %struct.type* %q to { i32*, i64 }*
  %2 = getelementptr { i32*, i64 }* %1, i32 0, i32 0
  store i32* %q.coerce0, i32** %2
  %3 = getelementptr { i32*, i64 }* %1, i32 0, i32 1
  store i64 %q.coerce1, i64* %3
  %4 = load i32* bitcast ([4 x i8]* getelementptr inbounds (%struct.type* @t, i32 0, i32 1) to i32*), align 8
  %5 = lshr i32 %4, 16
  %6 = and i32 %5, 511
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32* bitcast ([4 x i8]* getelementptr inbounds (%struct.type* @t, i32 0, i32 1) to i32*), align 8
  %3 = and i32 %2, -33488897
  %4 = or i32 %3, 524288
  store i32 %4, i32* bitcast ([4 x i8]* getelementptr inbounds (%struct.type* @t, i32 0, i32 1) to i32*), align 8
  %5 = load i32** getelementptr ({ i32*, i64 }* bitcast (%struct.type* @t to { i32*, i64 }*), i32 0, i32 0), align 1
  %6 = load i64* getelementptr ({ i32*, i64 }* bitcast (%struct.type* @t to { i32*, i64 }*), i32 0, i32 1), align 1
  %7 = call i32 @foo(i32* %5, i64 %6)
  %8 = icmp ne i32 %7, 8
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
