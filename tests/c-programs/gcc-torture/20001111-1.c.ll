; ModuleID = './20001111-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@u = internal global i32 0, align 4
@next_buffer = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i64 @foo(i32 %offset) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32, align 4
  %x = alloca i32, align 4
  %data = alloca i8*, align 8
  store i32 %offset, i32* %2, align 4
  %3 = load i32, i32* @u, align 4
  store i32 %3, i32* %i, align 4
  %4 = load i32, i32* %i, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %i, align 4
  %8 = mul i32 %7, 52783
  %9 = zext i32 %8 to i64
  store i64 %9, i64* %1
  br label %30

; <label>:10                                      ; preds = %0
  %11 = load i32, i32* @next_buffer, align 4
  store i32 %11, i32* %buffer, align 4
  %12 = load i32, i32* %buffer, align 4
  %13 = mul i32 %12, 52783
  %14 = zext i32 %13 to i64
  %15 = inttoptr i64 %14 to i8*
  store i8* %15, i8** %data, align 8
  store i32 0, i32* %i, align 4
  br label %16

; <label>:16                                      ; preds = %20, %10
  %17 = load i32, i32* %i, align 4
  %18 = icmp ult i32 %17, 2
  br i1 %18, label %19, label %23

; <label>:19                                      ; preds = %16
  call void @bar()
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32, i32* %i, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %16

; <label>:23                                      ; preds = %16
  %24 = load i32, i32* @next_buffer, align 4
  store i32 %24, i32* %buffer, align 4
  %25 = load i32, i32* %buffer, align 4
  %26 = mul i32 %25, 52783
  %27 = load i32, i32* %2, align 4
  %28 = add i32 %26, %27
  %29 = zext i32 %28 to i64
  store i64 %29, i64* %1
  br label %30

; <label>:30                                      ; preds = %23, %6
  %31 = load i64, i64* %1
  ret i64 %31
}

; Function Attrs: nounwind uwtable
define void @bar() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i64 @foo(i32 3)
  %3 = icmp ne i64 %2, 3
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  store i32 1, i32* @next_buffer, align 4
  %6 = call i64 @foo(i32 2)
  %7 = icmp ne i64 %6, 52785
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32, i32* %1
  ret i32 %11
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
