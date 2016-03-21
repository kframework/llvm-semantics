; ModuleID = './2003-10-29-ScalarReplBug.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.data = type { [80 x i8], i32, i32 }

@.str = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %d = alloca %struct.data, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.data, %struct.data* %d, i32 0, i32 2
  store i32 0, i32* %2, align 4
  %3 = bitcast %struct.data* %d to i8*
  call void @iter(i32 (i8*)* @callback, i8* %3)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @iter(i32 (i8*)* %cb, i8* %d) #0 {
  %1 = alloca i32 (i8*)*, align 8
  %2 = alloca i8*, align 8
  store i32 (i8*)* %cb, i32 (i8*)** %1, align 8
  store i8* %d, i8** %2, align 8
  %3 = load i32 (i8*)*, i32 (i8*)** %1, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i32 %3(i8* %4)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @callback(i8* %d) #0 {
  %1 = alloca i8*, align 8
  %iter_data = alloca %struct.data*, align 8
  store i8* %d, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = bitcast i8* %2 to %struct.data*
  store %struct.data* %3, %struct.data** %iter_data, align 8
  %4 = load %struct.data*, %struct.data** %iter_data, align 8
  %5 = getelementptr inbounds %struct.data, %struct.data* %4, i32 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load %struct.data*, %struct.data** %iter_data, align 8
  %9 = getelementptr inbounds %struct.data, %struct.data* %8, i32 0, i32 2
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %10, 0
  %12 = zext i1 %11 to i32
  ret i32 %12
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
