; ModuleID = './20080424-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@bar.i = internal global i32 0, align 4
@g = common global [48 x [3 x [3 x i32]]] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define void @bar([3 x i32]* %x, [3 x i32]* %y) #0 {
  %1 = alloca [3 x i32]*, align 8
  %2 = alloca [3 x i32]*, align 8
  store [3 x i32]* %x, [3 x i32]** %1, align 8
  store [3 x i32]* %y, [3 x i32]** %2, align 8
  %3 = load [3 x i32]*, [3 x i32]** %1, align 8
  %4 = load i32, i32* @bar.i, align 4
  %5 = add nsw i32 %4, 8
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [48 x [3 x [3 x i32]]], [48 x [3 x [3 x i32]]]* @g, i32 0, i64 %6
  %8 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %7, i32 0, i32 0
  %9 = icmp ne [3 x i32]* %3, %8
  br i1 %9, label %18, label %10

; <label>:10                                      ; preds = %0
  %11 = load [3 x i32]*, [3 x i32]** %2, align 8
  %12 = load i32, i32* @bar.i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @bar.i, align 4
  %14 = sext i32 %12 to i64
  %15 = getelementptr inbounds [48 x [3 x [3 x i32]]], [48 x [3 x [3 x i32]]]* @g, i32 0, i64 %14
  %16 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %15, i32 0, i32 0
  %17 = icmp ne [3 x i32]* %11, %16
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %10, %0
  call void @abort() #3
  unreachable

; <label>:19                                      ; preds = %10
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca [3 x [3 x i32]]*, align 8
  %i.i = alloca i32, align 4
  %k.i = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %2
  store [3 x [3 x i32]]* getelementptr inbounds ([48 x [3 x [3 x i32]]], [48 x [3 x [3 x i32]]]* @g, i32 0, i32 0), [3 x [3 x i32]]** %1, align 8
  store i32 0, i32* %i.i, align 4
  br label %3

; <label>:3                                       ; preds = %6, %0
  %4 = load i32, i32* %i.i, align 4
  %5 = icmp slt i32 %4, 8
  br i1 %5, label %6, label %foo.exit

; <label>:6                                       ; preds = %3
  %7 = load i32, i32* %i.i, align 4
  %8 = add nsw i32 %7, 8
  store i32 %8, i32* %k.i, align 4
  %9 = load i32, i32* %k.i, align 4
  %10 = sext i32 %9 to i64
  %11 = load [3 x [3 x i32]]*, [3 x [3 x i32]]** %1, align 8
  %12 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %11, i64 %10
  %13 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %12, i32 0, i32 0
  %14 = load i32, i32* %k.i, align 4
  %15 = sub nsw i32 %14, 8
  %16 = sext i32 %15 to i64
  %17 = load [3 x [3 x i32]]*, [3 x [3 x i32]]** %1, align 8
  %18 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %17, i64 %16
  %19 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %18, i32 0, i32 0
  call void @bar([3 x i32]* %13, [3 x i32]* %19) #4
  %20 = load i32, i32* %i.i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i.i, align 4
  br label %3

foo.exit:                                         ; preds = %3
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
