; ModuleID = './20000412-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.X = type { i8, [32 x i8] }

; Function Attrs: nounwind uwtable
define i32 @z() #0 {
  %xxx = alloca %struct.X, align 8
  %1 = getelementptr inbounds %struct.X, %struct.X* %xxx, i32 0, i32 1
  %2 = getelementptr inbounds [32 x i8], [32 x i8]* %1, i32 0, i64 31
  store i8 48, i8* %2, align 1
  %3 = getelementptr inbounds %struct.X, %struct.X* %xxx, i32 0, i32 1
  %4 = getelementptr inbounds [32 x i8], [32 x i8]* %3, i32 0, i64 0
  store i8 48, i8* %4, align 1
  %5 = getelementptr inbounds %struct.X, %struct.X* %xxx, i32 0, i32 0
  store i8 15, i8* %5, align 1
  %6 = call i32 @f(%struct.X* byval align 8 %xxx, %struct.X* byval align 8 %xxx)
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @z()
  store i32 %2, i32* %val, align 4
  %3 = load i32, i32* %val, align 4
  %4 = icmp ne i32 %3, 96
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @f(%struct.X* byval align 8 %x, %struct.X* byval align 8 %y) #0 {
  %1 = alloca i32, align 4
  %2 = getelementptr inbounds %struct.X, %struct.X* %x, i32 0, i32 0
  %3 = load i8, i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = getelementptr inbounds %struct.X, %struct.X* %y, i32 0, i32 0
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %4, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  store i32 70, i32* %1
  br label %20

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds %struct.X, %struct.X* %x, i32 0, i32 1
  %12 = getelementptr inbounds [32 x i8], [32 x i8]* %11, i32 0, i64 0
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = getelementptr inbounds %struct.X, %struct.X* %y, i32 0, i32 1
  %16 = getelementptr inbounds [32 x i8], [32 x i8]* %15, i32 0, i64 0
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = add nsw i32 %14, %18
  store i32 %19, i32* %1
  br label %20

; <label>:20                                      ; preds = %10, %9
  %21 = load i32, i32* %1
  ret i32 %21
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
