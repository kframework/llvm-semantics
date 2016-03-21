; ModuleID = './20020118-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@q = common global i8* null, align 8
@n = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  %p = alloca i8*, align 8
  br label %1

; <label>:1                                       ; preds = %1, %0
  %2 = load i8*, i8** @q, align 8
  store i8* %2, i8** %p, align 8
  %3 = load i8*, i8** %p, align 8
  %4 = getelementptr inbounds i8, i8* %3, i64 2
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  store volatile i32 %6, i32* @n, align 4
  %7 = load i8*, i8** @q, align 8
  store i8* %7, i8** %p, align 8
  %8 = load i8*, i8** %p, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 2
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i32
  store volatile i32 %11, i32* @n, align 4
  %12 = load i8*, i8** @q, align 8
  store i8* %12, i8** %p, align 8
  %13 = load i8*, i8** %p, align 8
  %14 = getelementptr inbounds i8, i8* %13, i64 2
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  store volatile i32 %16, i32* @n, align 4
  %17 = load i8*, i8** @q, align 8
  store i8* %17, i8** %p, align 8
  %18 = load i8*, i8** %p, align 8
  %19 = getelementptr inbounds i8, i8* %18, i64 2
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  store volatile i32 %21, i32* @n, align 4
  %22 = load i8*, i8** @q, align 8
  store i8* %22, i8** %p, align 8
  %23 = load i8*, i8** %p, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 2
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  store volatile i32 %26, i32* @n, align 4
  %27 = load i8*, i8** @q, align 8
  store i8* %27, i8** %p, align 8
  %28 = load i8*, i8** %p, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 2
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  store volatile i32 %31, i32* @n, align 4
  %32 = load i8*, i8** @q, align 8
  store i8* %32, i8** %p, align 8
  %33 = load i8*, i8** %p, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 2
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  store volatile i32 %36, i32* @n, align 4
  %37 = load i8*, i8** @q, align 8
  store i8* %37, i8** %p, align 8
  %38 = load i8*, i8** %p, align 8
  %39 = getelementptr inbounds i8, i8* %38, i64 2
  %40 = load i8, i8* %39, align 1
  %41 = sext i8 %40 to i32
  store volatile i32 %41, i32* @n, align 4
  %42 = load i8*, i8** @q, align 8
  store i8* %42, i8** %p, align 8
  %43 = load i8*, i8** %p, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 2
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  store volatile i32 %46, i32* @n, align 4
  %47 = load i8*, i8** @q, align 8
  store i8* %47, i8** %p, align 8
  %48 = load i8*, i8** %p, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 2
  %50 = load i8, i8* %49, align 1
  %51 = sext i8 %50 to i32
  store volatile i32 %51, i32* @n, align 4
  %52 = load i8*, i8** @q, align 8
  store i8* %52, i8** %p, align 8
  %53 = load i8*, i8** %p, align 8
  %54 = getelementptr inbounds i8, i8* %53, i64 2
  %55 = load i8, i8* %54, align 1
  %56 = sext i8 %55 to i32
  store volatile i32 %56, i32* @n, align 4
  br label %1
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
