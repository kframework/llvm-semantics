; ModuleID = './20010123-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32, i8* }

@.str = private unnamed_addr constant [10 x i8] c"hey there\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %t = alloca %struct.s*, align 8
  %2 = alloca %struct.s, align 8
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %23, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %26

; <label>:6                                       ; preds = %3
  %7 = getelementptr inbounds %struct.s, %struct.s* %2, i32 0, i32 0
  store i32 3, i32* %7, align 4
  %8 = getelementptr inbounds %struct.s, %struct.s* %2, i32 0, i32 1
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i8** %8, align 8
  store %struct.s* %2, %struct.s** %t, align 8
  %9 = load %struct.s*, %struct.s** %t, align 8
  %10 = getelementptr inbounds %struct.s, %struct.s* %9, i32 0, i32 0
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %6
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %6
  %15 = load %struct.s*, %struct.s** %t, align 8
  %16 = getelementptr inbounds %struct.s, %struct.s* %15, i32 0, i32 0
  store i32 4, i32* %16, align 4
  %17 = load %struct.s*, %struct.s** %t, align 8
  %18 = getelementptr inbounds %struct.s, %struct.s* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 4
  %20 = icmp ne i32 %19, 4
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %14
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %14
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load i32, i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %3

; <label>:26                                      ; preds = %3
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %28 = load i32, i32* %1
  ret i32 %28
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
