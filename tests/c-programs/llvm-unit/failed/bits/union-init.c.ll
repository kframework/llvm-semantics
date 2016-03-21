; ModuleID = './union-init.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Bar = type { %union.anon }
%union.anon = type { i8**, [8 x i8] }
%struct.Foo = type { i32, i32, i32 }

@test = global %struct.Bar { %union.anon { i8** null, [8 x i8] undef } }, align 8
@.str = private unnamed_addr constant [15 x i8] c"error: a = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%p\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32, i32* getelementptr inbounds (%struct.Foo, %struct.Foo* bitcast (%struct.Bar* @test to %struct.Foo*), i32 0, i32 0), align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* getelementptr inbounds (%struct.Foo, %struct.Foo* bitcast (%struct.Bar* @test to %struct.Foo*), i32 0, i32 0), align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 %5)
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = load i32, i32* getelementptr inbounds (%struct.Foo, %struct.Foo* bitcast (%struct.Bar* @test to %struct.Foo*), i32 0, i32 1), align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* getelementptr inbounds (%struct.Foo, %struct.Foo* bitcast (%struct.Bar* @test to %struct.Foo*), i32 0, i32 1), align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 %11)
  br label %13

; <label>:13                                      ; preds = %10, %7
  %14 = load i32, i32* getelementptr inbounds (%struct.Foo, %struct.Foo* bitcast (%struct.Bar* @test to %struct.Foo*), i32 0, i32 2), align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %13
  %17 = load i32, i32* getelementptr inbounds (%struct.Foo, %struct.Foo* bitcast (%struct.Bar* @test to %struct.Foo*), i32 0, i32 2), align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 %17)
  br label %19

; <label>:19                                      ; preds = %16, %13
  %20 = load i8**, i8*** getelementptr inbounds (%struct.Bar, %struct.Bar* @test, i32 0, i32 0, i32 0), align 8
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8** %20)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
