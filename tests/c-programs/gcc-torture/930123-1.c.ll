; ModuleID = './930123-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.a = private unnamed_addr constant [2 x i8] c"c\00", align 1

; Function Attrs: nounwind uwtable
define void @f(i32* %x) #0 {
  %1 = alloca i32*, align 8
  store i32* %x, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  store i32 0, i32* %2, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca i32, align 4
  %c = alloca i32, align 4
  %x = alloca i32, align 4
  %a = alloca [2 x i8], align 1
  store i32 0, i32* %1
  %2 = bitcast [2 x i8]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @main.a, i32 0, i32 0), i64 2, i32 1, i1 false)
  call void @f(i32* %s)
  %3 = load i32, i32* %s, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 1, i32* %x, align 4
  br label %7

; <label>:6                                       ; preds = %0
  store i32 2, i32* %x, align 4
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = phi i32 [ 97, %5 ], [ 98, %6 ]
  %9 = trunc i32 %8 to i8
  store i32 0, i32* %c, align 4
  %10 = getelementptr inbounds [2 x i8], [2 x i8]* %a, i32 0, i64 0
  store i8 %9, i8* %10, align 1
  %11 = load i32, i32* %c, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [2 x i8], [2 x i8]* %a, i32 0, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp ne i32 %15, 97
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %7
  call void @abort() #3
  unreachable

; <label>:18                                      ; preds = %7
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %20 = load i32, i32* %1
  ret i32 %20
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
