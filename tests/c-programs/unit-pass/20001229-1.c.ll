; ModuleID = './20001229-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i8* %a, i8* %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  store i8* %a, i8** %1, align 8
  store i8* %b, i8** %2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @showinfo() #0 {
  %uname = alloca [33 x i8], align 16
  %tty = alloca [38 x i8], align 16
  %1 = bitcast [33 x i8]* %uname to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 33, i32 16, i1 false)
  %2 = bitcast [38 x i8]* %tty to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 38, i32 16, i1 false)
  %3 = bitcast i8* %2 to [38 x i8]*
  %4 = getelementptr [38 x i8], [38 x i8]* %3, i32 0, i32 0
  store i8 47, i8* %4
  %5 = getelementptr [38 x i8], [38 x i8]* %3, i32 0, i32 1
  store i8 100, i8* %5
  %6 = getelementptr [38 x i8], [38 x i8]* %3, i32 0, i32 2
  store i8 101, i8* %6
  %7 = getelementptr [38 x i8], [38 x i8]* %3, i32 0, i32 3
  store i8 118, i8* %7
  %8 = getelementptr [38 x i8], [38 x i8]* %3, i32 0, i32 4
  store i8 47, i8* %8
  %9 = getelementptr inbounds [33 x i8], [33 x i8]* %uname, i32 0, i32 0
  %10 = getelementptr inbounds [38 x i8], [38 x i8]* %tty, i32 0, i32 0
  call void @foo(i8* %9, i8* %10)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @showinfo()
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
