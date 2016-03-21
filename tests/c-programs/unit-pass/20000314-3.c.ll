; ModuleID = './20000314-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@arg0 = internal global [5 x i8] c"arg0\00", align 1
@arg1 = internal global [5 x i8] c"arg1\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @attr_eq(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @arg0, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @arg1, i32 0, i32 0))
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define internal void @attr_eq(i8* %name, i8* %value) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %name, i8** %1, align 8
  store i8* %value, i8** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = call i8* @attr_string(i8* %3)
  %5 = load i8*, i8** %2, align 8
  %6 = call i8* @attr_string(i8* %5)
  call void @attr_rtx(i8* %4, i8* %6)
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define internal void @attr_rtx(i8* %varg0, i8* %varg1) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %varg0, i8** %1, align 8
  store i8* %varg1, i8** %2, align 8
  %3 = load i8*, i8** %1, align 8
  %4 = icmp ne i8* %3, getelementptr inbounds ([5 x i8], [5 x i8]* @arg0, i32 0, i32 0)
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i8*, i8** %2, align 8
  %8 = icmp ne i8* %7, getelementptr inbounds ([5 x i8], [5 x i8]* @arg1, i32 0, i32 0)
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define internal i8* @attr_string(i8* %str) #0 {
  %1 = alloca i8*, align 8
  store i8* %str, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  ret i8* %2
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
