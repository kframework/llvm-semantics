; ModuleID = './20000801-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.foo = type { %struct.foo* }

; Function Attrs: nounwind uwtable
define %struct.foo* @test(%struct.foo* %node) #0 {
  %1 = alloca %struct.foo*, align 8
  store %struct.foo* %node, %struct.foo** %1, align 8
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load %struct.foo** %1, align 8
  %4 = icmp ne %struct.foo* %3, null
  br i1 %4, label %5, label %16

; <label>:5                                       ; preds = %2
  %6 = call i32 @bar()
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %5
  %9 = call i32 @baz()
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %8
  br label %16

; <label>:12                                      ; preds = %8, %5
  %13 = load %struct.foo** %1, align 8
  %14 = getelementptr inbounds %struct.foo* %13, i32 0, i32 0
  %15 = load %struct.foo** %14, align 8
  store %struct.foo* %15, %struct.foo** %1, align 8
  br label %2

; <label>:16                                      ; preds = %11, %2
  %17 = load %struct.foo** %1, align 8
  ret %struct.foo* %17
}

; Function Attrs: nounwind uwtable
define i32 @bar() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @baz() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.foo, align 8
  %b = alloca %struct.foo, align 8
  %c = alloca %struct.foo*, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.foo* %a, i32 0, i32 0
  store %struct.foo* %b, %struct.foo** %2, align 8
  %3 = getelementptr inbounds %struct.foo* %b, i32 0, i32 0
  store %struct.foo* null, %struct.foo** %3, align 8
  %4 = call %struct.foo* @test(%struct.foo* %a)
  store %struct.foo* %4, %struct.foo** %c, align 8
  %5 = load %struct.foo** %c, align 8
  %6 = icmp ne %struct.foo* %5, null
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32* %1
  ret i32 %10
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
