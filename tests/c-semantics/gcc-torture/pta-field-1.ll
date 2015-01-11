; ModuleID = './pta-field-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Foo = type { i32*, i32* }

; Function Attrs: noinline nounwind uwtable
define void @bar(i32** %x) #0 {
  %1 = alloca i32**, align 8
  %f = alloca %struct.Foo*, align 8
  store i32** %x, i32*** %1, align 8
  %2 = load i32*** %1, align 8
  %3 = bitcast i32** %2 to %struct.Foo*
  store %struct.Foo* %3, %struct.Foo** %f, align 8
  %4 = load %struct.Foo** %f, align 8
  %5 = getelementptr inbounds %struct.Foo* %4, i32 0, i32 1
  %6 = load i32** %5, align 8
  store i32 0, i32* %6, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @foo() #1 {
  %f = alloca %struct.Foo, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %i, align 4
  store i32 2, i32* %j, align 4
  %1 = getelementptr inbounds %struct.Foo* %f, i32 0, i32 0
  store i32* %i, i32** %1, align 8
  %2 = getelementptr inbounds %struct.Foo* %f, i32 0, i32 1
  store i32* %j, i32** %2, align 8
  %3 = getelementptr inbounds %struct.Foo* %f, i32 0, i32 0
  call void @bar(i32** %3)
  %4 = load i32* %j, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
