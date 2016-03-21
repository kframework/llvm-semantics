; ModuleID = './20000801-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.s = private unnamed_addr constant [2 x i8] c"x\00", align 1
@t = common global i8* null, align 8

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  %s = alloca [2 x i8], align 1
  %1 = bitcast [2 x i8]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 2, i32 1, i1 false)
  %2 = getelementptr inbounds [2 x i8], [2 x i8]* %s, i32 0, i64 1
  %3 = load i8, i8* %2, align 1
  %4 = sext i8 %3 to i32
  %5 = icmp eq i32 0, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca [2 x i8], align 1
  store i32 0, i32* %1
  %2 = bitcast [2 x i8]* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @main.s, i32 0, i32 0), i64 2, i32 1, i1 false)
  %3 = getelementptr inbounds [2 x i8], [2 x i8]* %s, i32 0, i32 0
  store i8* %3, i8** @t, align 8
  %4 = call i32 @foo()
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable
                                                  ; No predecessors!
  %9 = load i32, i32* %1
  ret i32 %9
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
