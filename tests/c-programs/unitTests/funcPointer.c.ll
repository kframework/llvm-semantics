; ModuleID = './funcPointer.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [20 x i8] c"\22%s!!!\22 you shout.\0A\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"\22%s\22 you whisper.\0A\00", align 1
@say = global void (i8*)* null, align 8
@.str.2 = private unnamed_addr constant [5 x i8] c"WHAT\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"I know a secret!\00", align 1

; Function Attrs: nounwind uwtable
define void @say_loud(i8* %a_message) #0 {
  %1 = alloca i8*, align 8
  store i8* %a_message, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i8* %2)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @say_soft(i8* %a_message) #0 {
  %1 = alloca i8*, align 8
  store i8* %a_message, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %2)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store void (i8*)* @say_loud, void (i8*)** @say, align 8
  %2 = load void (i8*)*, void (i8*)** @say, align 8
  call void %2(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0))
  store void (i8*)* @say_soft, void (i8*)** @say, align 8
  %3 = load void (i8*)*, void (i8*)** @say, align 8
  call void %3(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
