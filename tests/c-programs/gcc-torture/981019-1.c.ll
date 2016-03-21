; ModuleID = './981019-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@f3.x = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @ff(i32 %fname, i32 %part, i32 %nparts) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %fname, i32* %1, align 4
  store i32 %part, i32* %2, align 4
  store i32 %nparts, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %3, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6
  call void @f1()
  br label %10

; <label>:10                                      ; preds = %9, %6
  br label %12

; <label>:11                                      ; preds = %0
  store i32 2, i32* %1, align 4
  br label %12

; <label>:12                                      ; preds = %11, %10
  br label %13

; <label>:13                                      ; preds = %28, %12
  %14 = call i32 @f3()
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %29

; <label>:16                                      ; preds = %13
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %28

; <label>:19                                      ; preds = %16
  %20 = call i32 @f2()
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %28

; <label>:22                                      ; preds = %19
  call void @f1()
  %23 = load i32, i32* %2, align 4
  store i32 %23, i32* %3, align 4
  %24 = call i32 @f3()
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %22
  call void @f1()
  br label %27

; <label>:27                                      ; preds = %26, %22
  call void @f1()
  br label %29

; <label>:28                                      ; preds = %19, %16
  br label %13

; <label>:29                                      ; preds = %27, %13
  %30 = load i32, i32* %3, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @f1()
  br label %33

; <label>:33                                      ; preds = %32, %29
  ret void
}

; Function Attrs: nounwind uwtable
define void @f1() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @f3() #0 {
  %1 = load i32, i32* @f3.x, align 4
  %2 = icmp ne i32 %1, 0
  %3 = xor i1 %2, true
  %4 = zext i1 %3 to i32
  store i32 %4, i32* @f3.x, align 4
  %5 = load i32, i32* @f3.x, align 4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @f2() #0 {
  %1 = alloca i32, align 4
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @ff(i32 0, i32 1, i32 0)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
