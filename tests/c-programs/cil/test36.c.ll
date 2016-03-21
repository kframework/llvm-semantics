; ModuleID = './test36.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.a = type { i32, i32 }

@z = common global %struct.a zeroinitializer, align 4
@.str = private unnamed_addr constant [19 x i8] c"hello world %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @g(i64 %b.coerce) #0 {
  %1 = alloca %struct.a, align 4
  %b = alloca %struct.a, align 8
  %2 = bitcast %struct.a* %b to i64*
  store i64 %b.coerce, i64* %2, align 8
  %3 = getelementptr inbounds %struct.a, %struct.a* %b, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4
  %6 = bitcast %struct.a* %1 to i8*
  %7 = bitcast %struct.a* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 8, i32 4, i1 false)
  %8 = bitcast %struct.a* %1 to i64*
  %9 = load i64, i64* %8, align 4
  ret i64 %9
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %1 = alloca %struct.a, align 4
  %2 = load i64, i64* bitcast (%struct.a* @z to i64*), align 4
  %3 = call i64 @g(i64 %2)
  %4 = bitcast %struct.a* %1 to i64*
  store i64 %3, i64* %4, align 4
  %5 = bitcast %struct.a* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.a* @z to i8*), i8* %5, i64 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 22, i32* getelementptr inbounds (%struct.a, %struct.a* @z, i32 0, i32 0), align 4
  call void @f()
  %4 = load i32, i32* getelementptr inbounds (%struct.a, %struct.a* @z, i32 0, i32 0), align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.a, %struct.a* @z, i32 0, i32 1), align 4
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i32 0, i32 0), i32 %4, i32 %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
