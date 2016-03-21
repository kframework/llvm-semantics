; ModuleID = './20080604-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.barstruct = type { i8* }

@x = common global %struct.barstruct zeroinitializer, align 8
@.str = private unnamed_addr constant [14 x i8] c"Everything OK\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @foo() #0 {
  %1 = load i8*, i8** getelementptr inbounds (%struct.barstruct, %struct.barstruct* @x, i32 0, i32 0), align 8
  %2 = icmp ne i8* %1, null
  br i1 %2, label %4, label %3

; <label>:3                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:4                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @baz(i32 %b) #2 {
  %1 = alloca i32, align 4
  %bar = alloca %struct.barstruct, align 8
  %barptr = alloca %struct.barstruct*, align 8
  store i32 %b, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store %struct.barstruct* %bar, %struct.barstruct** %barptr, align 8
  br label %8

; <label>:5                                       ; preds = %0
  store %struct.barstruct* getelementptr inbounds (%struct.barstruct, %struct.barstruct* @x, i64 1), %struct.barstruct** %barptr, align 8
  %6 = load %struct.barstruct*, %struct.barstruct** %barptr, align 8
  %7 = getelementptr inbounds %struct.barstruct, %struct.barstruct* %6, i64 -1
  store %struct.barstruct* %7, %struct.barstruct** %barptr, align 8
  br label %8

; <label>:8                                       ; preds = %5, %4
  %9 = load %struct.barstruct*, %struct.barstruct** %barptr, align 8
  %10 = getelementptr inbounds %struct.barstruct, %struct.barstruct* %9, i32 0, i32 0
  store i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i8** %10, align 8
  call void @foo()
  %11 = load %struct.barstruct*, %struct.barstruct** %barptr, align 8
  %12 = getelementptr inbounds %struct.barstruct, %struct.barstruct* %11, i32 0, i32 0
  store i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i8** %12, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i8* null, i8** getelementptr inbounds (%struct.barstruct, %struct.barstruct* @x, i32 0, i32 0), align 8
  call void @baz(i32 0)
  %2 = load i8*, i8** getelementptr inbounds (%struct.barstruct, %struct.barstruct* @x, i32 0, i32 0), align 8
  %3 = icmp ne i8* %2, null
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
