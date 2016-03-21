; ModuleID = './pr44164.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.X = type { %struct.Y }
%struct.Y = type { %struct.YY }
%struct.YY = type { %struct.Z }
%struct.Z = type { i32 }

@a = common global %struct.X zeroinitializer, align 4

; Function Attrs: noinline nounwind uwtable
define i32 @foo(%struct.Z* %p) #0 {
  %1 = alloca %struct.Z*, align 8
  %i = alloca i32, align 4
  %2 = alloca %struct.Y, align 4
  store %struct.Z* %p, %struct.Z** %1, align 8
  %3 = load %struct.Z*, %struct.Z** %1, align 8
  %4 = getelementptr inbounds %struct.Z, %struct.Z* %3, i32 0, i32 0
  %5 = load i32, i32* %4, align 4
  store i32 %5, i32* %i, align 4
  %6 = getelementptr inbounds %struct.Y, %struct.Y* %2, i32 0, i32 0
  %7 = bitcast %struct.YY* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 4, i32 4, i1 false)
  %8 = bitcast %struct.Y* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.X* @a to i8*), i8* %8, i64 4, i32 4, i1 false)
  %9 = load %struct.Z*, %struct.Z** %1, align 8
  %10 = getelementptr inbounds %struct.Z, %struct.Z* %9, i32 0, i32 0
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %i, align 4
  %13 = add nsw i32 %11, %12
  ret i32 %13
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* getelementptr inbounds (%struct.X, %struct.X* @a, i32 0, i32 0, i32 0, i32 0, i32 0), align 4
  %2 = call i32 @foo(%struct.Z* getelementptr inbounds (%struct.X, %struct.X* @a, i32 0, i32 0, i32 0, i32 0))
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
