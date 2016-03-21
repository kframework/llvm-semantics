; ModuleID = './strct-pack-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type <{ i16, [2 x i32] }>

; Function Attrs: nounwind uwtable
define i32 @f(%struct.A* %ap) #0 {
  %1 = alloca %struct.A*, align 8
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  store %struct.A* %ap, %struct.A** %1, align 8
  store i16 1, i16* %j, align 2
  %2 = load %struct.A*, %struct.A** %1, align 8
  %3 = getelementptr inbounds %struct.A, %struct.A* %2, i32 0, i32 1
  %4 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i32 0, i64 1
  %5 = load i32, i32* %4, align 2
  %6 = trunc i32 %5 to i16
  store i16 %6, i16* %i, align 2
  %7 = load i16, i16* %j, align 2
  %8 = sext i16 %7 to i64
  %9 = load %struct.A*, %struct.A** %1, align 8
  %10 = getelementptr inbounds %struct.A, %struct.A* %9, i32 0, i32 1
  %11 = getelementptr inbounds [2 x i32], [2 x i32]* %10, i32 0, i64 %8
  %12 = load i32, i32* %11, align 2
  %13 = load i16, i16* %i, align 2
  %14 = sext i16 %13 to i32
  %15 = add nsw i32 %14, %12
  %16 = trunc i32 %15 to i16
  store i16 %16, i16* %i, align 2
  store i16 0, i16* %j, align 2
  br label %17

; <label>:17                                      ; preds = %32, %0
  %18 = load i16, i16* %j, align 2
  %19 = sext i16 %18 to i32
  %20 = icmp slt i32 %19, 2
  br i1 %20, label %21, label %35

; <label>:21                                      ; preds = %17
  %22 = load i16, i16* %j, align 2
  %23 = sext i16 %22 to i64
  %24 = load %struct.A*, %struct.A** %1, align 8
  %25 = getelementptr inbounds %struct.A, %struct.A* %24, i32 0, i32 1
  %26 = getelementptr inbounds [2 x i32], [2 x i32]* %25, i32 0, i64 %23
  %27 = load i32, i32* %26, align 2
  %28 = load i16, i16* %i, align 2
  %29 = sext i16 %28 to i32
  %30 = add nsw i32 %29, %27
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* %i, align 2
  br label %32

; <label>:32                                      ; preds = %21
  %33 = load i16, i16* %j, align 2
  %34 = add i16 %33, 1
  store i16 %34, i16* %j, align 2
  br label %17

; <label>:35                                      ; preds = %17
  %36 = load i16, i16* %i, align 2
  %37 = sext i16 %36 to i32
  ret i32 %37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 2
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1
  %3 = getelementptr inbounds [2 x i32], [2 x i32]* %2, i32 0, i64 0
  store i32 100, i32* %3, align 2
  %4 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1
  %5 = getelementptr inbounds [2 x i32], [2 x i32]* %4, i32 0, i64 1
  store i32 13, i32* %5, align 2
  %6 = call i32 @f(%struct.A* %a)
  %7 = icmp ne i32 %6, 139
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32, i32* %1
  ret i32 %11
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
