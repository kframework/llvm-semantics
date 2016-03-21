; ModuleID = './20010409-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.B = type { %struct.A**, i32 }
%struct.A = type { i32, i32 }

@b = global i32 1, align 4
@c = common global i32 0, align 4
@d = common global [1 x %struct.B] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c"test\00", align 1
@a = common global %struct.A* null, align 8
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind uwtable
define void @foo(%struct.A* %x, i8* %y, i32 %z) #0 {
  %1 = alloca %struct.A*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store %struct.A* %x, %struct.A** %1, align 8
  store i8* %y, i8** %2, align 8
  store i32 %z, i32* %3, align 4
  %4 = load i8*, i8** %2, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 4
  %6 = load i8, i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = load i32, i32* %3, align 4
  %9 = mul nsw i32 %8, 25
  %10 = add nsw i32 %7, %9
  store i32 %10, i32* @c, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.A* @bar(i8* %v, i32 %w, i32 %x, i8* %y, i32 %z) #0 {
  %1 = alloca %struct.A*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i8* %v, i8** %2, align 8
  store i32 %w, i32* %3, align 4
  store i32 %x, i32* %4, align 4
  store i8* %y, i8** %5, align 8
  store i32 %z, i32* %6, align 4
  %7 = load i32, i32* %3, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:10                                      ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %12 = load %struct.A*, %struct.A** %1
  ret %struct.A* %12
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define void @test(i8* %x, i32* %y) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32*, align 8
  store i8* %x, i8** %1, align 8
  store i32* %y, i32** %2, align 8
  %3 = load i32, i32* getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %4 = sext i32 %3 to i64
  %5 = load %struct.A**, %struct.A*** getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %6 = getelementptr inbounds %struct.A*, %struct.A** %5, i64 %4
  %7 = load %struct.A*, %struct.A** %6, align 8
  call void @foo(%struct.A* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 200)
  %8 = load i8*, i8** %1, align 8
  %9 = load i32, i32* @b, align 4
  %10 = icmp ne i32 %9, 0
  %11 = select i1 %10, i32 0, i32 65536
  %12 = load i8*, i8** %1, align 8
  %13 = call i64 @strlen(i8* %12)
  %14 = trunc i64 %13 to i32
  %15 = call %struct.A* @bar(i8* %8, i32 %11, i32 %14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 201)
  %16 = load i32, i32* getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %17 = sext i32 %16 to i64
  %18 = load %struct.A**, %struct.A*** getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %19 = getelementptr inbounds %struct.A*, %struct.A** %18, i64 %17
  store %struct.A* %15, %struct.A** %19, align 8
  %20 = load i32, i32* getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct.A**, %struct.A*** getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %23 = getelementptr inbounds %struct.A*, %struct.A** %22, i64 %21
  %24 = load %struct.A*, %struct.A** %23, align 8
  %25 = getelementptr inbounds %struct.A, %struct.A* %24, i32 0, i32 0
  %26 = load i32, i32* %25, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %25, align 4
  %28 = load i32*, i32** %2, align 8
  %29 = icmp ne i32* %28, null
  br i1 %29, label %30, label %39

; <label>:30                                      ; preds = %0
  %31 = load i32*, i32** %2, align 8
  %32 = load i32, i32* %31, align 4
  %33 = load i32, i32* getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %34 = sext i32 %33 to i64
  %35 = load %struct.A**, %struct.A*** getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %36 = getelementptr inbounds %struct.A*, %struct.A** %35, i64 %34
  %37 = load %struct.A*, %struct.A** %36, align 8
  %38 = getelementptr inbounds %struct.A, %struct.A* %37, i32 0, i32 1
  store i32 %32, i32* %38, align 4
  br label %39

; <label>:39                                      ; preds = %30, %0
  ret void
}

declare i64 @strlen(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  store i32 0, i32* getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  store %struct.A** @a, %struct.A*** getelementptr inbounds ([1 x %struct.B], [1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  call void @test(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i32 0, i32 0), i32* null)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
