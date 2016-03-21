; ModuleID = './20020529-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xx = type { i32, %struct.xx*, i16 }

@f1.beenhere = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @foo(%struct.xx* %p, i32 %b, i32 %c, i32 %d) #0 {
  %1 = alloca %struct.xx*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %a = alloca i32, align 4
  store %struct.xx* %p, %struct.xx** %1, align 8
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  br label %5

; <label>:5                                       ; preds = %47, %14, %0
  %6 = load %struct.xx*, %struct.xx** %1, align 8
  %7 = call i32 @f1(%struct.xx* %6)
  store i32 %7, i32* %a, align 4
  %8 = load i32, i32* %a, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %5
  ret i32 0

; <label>:11                                      ; preds = %5
  %12 = load i32, i32* %2, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  br label %5

; <label>:15                                      ; preds = %11
  %16 = load i32, i32* %4, align 4
  %17 = trunc i32 %16 to i16
  %18 = load %struct.xx*, %struct.xx** %1, align 8
  %19 = getelementptr inbounds %struct.xx, %struct.xx* %18, i32 0, i32 2
  store i16 %17, i16* %19, align 2
  %20 = load %struct.xx*, %struct.xx** %1, align 8
  %21 = getelementptr inbounds %struct.xx, %struct.xx* %20, i32 0, i32 0
  %22 = load i32, i32* %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %15
  call void @f2()
  br label %25

; <label>:25                                      ; preds = %24, %15
  %26 = load i32, i32* %3, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @f2()
  br label %29

; <label>:29                                      ; preds = %28, %25
  %30 = load %struct.xx*, %struct.xx** %1, align 8
  %31 = getelementptr inbounds %struct.xx, %struct.xx* %30, i32 0, i32 2
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  store i32 %33, i32* %4, align 4
  %34 = load i32, i32* %a, align 4
  switch i32 %34, label %46 [
    i32 1, label %35
  ]

; <label>:35                                      ; preds = %29
  %36 = load %struct.xx*, %struct.xx** %1, align 8
  %37 = getelementptr inbounds %struct.xx, %struct.xx* %36, i32 0, i32 1
  %38 = load %struct.xx*, %struct.xx** %37, align 8
  %39 = icmp ne %struct.xx* %38, null
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %35
  call void @f2()
  br label %41

; <label>:41                                      ; preds = %40, %35
  %42 = load i32, i32* %3, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @f2()
  br label %45

; <label>:45                                      ; preds = %44, %41
  br label %46

; <label>:46                                      ; preds = %29, %45
  br label %47

; <label>:47                                      ; preds = %46
  br label %5
}

; Function Attrs: nounwind uwtable
define i32 @f1(%struct.xx* %p) #0 {
  %1 = alloca %struct.xx*, align 8
  store %struct.xx* %p, %struct.xx** %1, align 8
  %2 = load i32, i32* @f1.beenhere, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @f1.beenhere, align 4
  %4 = icmp sgt i32 %2, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* @f1.beenhere, align 4
  %8 = icmp sgt i32 %7, 1
  %9 = zext i1 %8 to i32
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define void @f2() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.xx, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.xx, %struct.xx* %s, i32 0, i32 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct.xx, %struct.xx* %s, i32 0, i32 1
  store %struct.xx* %s, %struct.xx** %3, align 8
  %4 = getelementptr inbounds %struct.xx, %struct.xx* %s, i32 0, i32 2
  store i16 23, i16* %4, align 2
  %5 = call i32 @foo(%struct.xx* %s, i32 0, i32 0, i32 0)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %20, label %7

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.xx, %struct.xx* %s, i32 0, i32 0
  %9 = load i32, i32* %8, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %20, label %11

; <label>:11                                      ; preds = %7
  %12 = getelementptr inbounds %struct.xx, %struct.xx* %s, i32 0, i32 1
  %13 = load %struct.xx*, %struct.xx** %12, align 8
  %14 = icmp ne %struct.xx* %13, %s
  br i1 %14, label %20, label %15

; <label>:15                                      ; preds = %11
  %16 = getelementptr inbounds %struct.xx, %struct.xx* %s, i32 0, i32 2
  %17 = load i16, i16* %16, align 2
  %18 = sext i16 %17 to i32
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %15, %11, %7, %0
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %15
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %23 = load i32, i32* %1
  ret i32 %23
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
