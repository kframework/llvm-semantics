; ModuleID = './980506-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %s = alloca %struct.anon, align 4
  %sp = alloca %struct.anon*, align 8
  %ip = alloca i32*, align 8
  %1 = getelementptr inbounds %struct.anon, %struct.anon* %s, i32 0, i32 0
  store i32* %1, i32** %ip, align 8
  %2 = getelementptr inbounds %struct.anon, %struct.anon* %s, i32 0, i32 0
  store i32 1, i32* %2, align 4
  %3 = bitcast %struct.anon* %s to i8*
  %4 = call i8* @self(i8* %3)
  %5 = bitcast i8* %4 to %struct.anon*
  store %struct.anon* %5, %struct.anon** %sp, align 8
  %6 = load i32*, i32** %ip, align 8
  store i32 0, i32* %6, align 4
  %7 = load %struct.anon*, %struct.anon** %sp, align 8
  %8 = getelementptr inbounds %struct.anon, %struct.anon* %7, i32 0, i32 0
  %9 = load i32, i32* %8, align 4
  %10 = add nsw i32 %9, 1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define internal i8* @self(i8* %p) #0 {
  %1 = alloca i8*, align 8
  store i8* %p, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  ret i8* %2
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f()
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
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
