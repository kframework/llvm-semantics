; ModuleID = './930208-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.T = type { i64 }
%struct.anon = type { i8, i8, i8, i8 }

; Function Attrs: nounwind uwtable
define i32 @f(i64 %u.coerce) #0 {
  %u = alloca %union.T, align 8
  %1 = getelementptr %union.T, %union.T* %u, i32 0, i32 0
  store i64 %u.coerce, i64* %1, align 8
  %2 = bitcast %union.T* %u to %struct.anon*
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %2, i32 0, i32 3
  %4 = load i8, i8* %3, align 1
  %5 = add i8 %4, 1
  store i8 %5, i8* %3, align 1
  %6 = bitcast %union.T* %u to %struct.anon*
  %7 = getelementptr inbounds %struct.anon, %struct.anon* %6, i32 0, i32 0
  %8 = load i8, i8* %7, align 1
  %9 = add i8 %8, 1
  store i8 %9, i8* %7, align 1
  %10 = bitcast %union.T* %u to %struct.anon*
  %11 = getelementptr inbounds %struct.anon, %struct.anon* %10, i32 0, i32 2
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 2
  br i1 %14, label %21, label %15

; <label>:15                                      ; preds = %0
  %16 = bitcast %union.T* %u to %struct.anon*
  %17 = getelementptr inbounds %struct.anon, %struct.anon* %16, i32 0, i32 1
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 2
  br label %21

; <label>:21                                      ; preds = %15, %0
  %22 = phi i1 [ true, %0 ], [ %20, %15 ]
  %23 = zext i1 %22 to i32
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %u = alloca %union.T, align 8
  store i32 0, i32* %1
  %2 = bitcast %union.T* %u to %struct.anon*
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %2, i32 0, i32 2
  store i8 2, i8* %3, align 1
  %4 = bitcast %union.T* %u to %struct.anon*
  %5 = getelementptr inbounds %struct.anon, %struct.anon* %4, i32 0, i32 1
  store i8 2, i8* %5, align 1
  %6 = bitcast %union.T* %u to %struct.anon*
  %7 = getelementptr inbounds %struct.anon, %struct.anon* %6, i32 0, i32 3
  store i8 -1, i8* %7, align 1
  %8 = bitcast %union.T* %u to %struct.anon*
  %9 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 0
  store i8 -1, i8* %9, align 1
  %10 = getelementptr %union.T, %union.T* %u, i32 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = call i32 @f(i64 %11)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %17 = load i32, i32* %1
  ret i32 %17
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
