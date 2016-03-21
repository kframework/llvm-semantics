; ModuleID = './920810-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.t = type { i8*, i32, i32 }

; Function Attrs: nounwind uwtable
define %struct.t* @f(%struct.t* %clas, i32 %size) #0 {
  %1 = alloca %struct.t*, align 8
  %2 = alloca i32, align 4
  %child = alloca %struct.t*, align 8
  store %struct.t* %clas, %struct.t** %1, align 8
  store i32 %size, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = call noalias i8* @malloc(i64 %4) #2
  %6 = bitcast i8* %5 to %struct.t*
  store %struct.t* %6, %struct.t** %child, align 8
  %7 = load %struct.t*, %struct.t** %child, align 8
  %8 = bitcast %struct.t* %7 to i8*
  %9 = load %struct.t*, %struct.t** %1, align 8
  %10 = bitcast %struct.t* %9 to i8*
  %11 = load %struct.t*, %struct.t** %1, align 8
  %12 = getelementptr inbounds %struct.t, %struct.t* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = sext i32 %13 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %10, i64 %14, i32 8, i1 false)
  %15 = load %struct.t*, %struct.t** %1, align 8
  %16 = bitcast %struct.t* %15 to i8*
  %17 = load %struct.t*, %struct.t** %child, align 8
  %18 = getelementptr inbounds %struct.t, %struct.t* %17, i32 0, i32 0
  store i8* %16, i8** %18, align 8
  %19 = load %struct.t*, %struct.t** %child, align 8
  %20 = getelementptr inbounds %struct.t, %struct.t* %19, i32 0, i32 1
  store i32 0, i32* %20, align 4
  %21 = load i32, i32* %2, align 4
  %22 = load %struct.t*, %struct.t** %child, align 8
  %23 = getelementptr inbounds %struct.t, %struct.t* %22, i32 0, i32 2
  store i32 %21, i32* %23, align 4
  %24 = load %struct.t*, %struct.t** %child, align 8
  ret %struct.t* %24
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %foo = alloca %struct.t, align 8
  %bar = alloca %struct.t*, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.t* %foo to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 37, i64 16, i32 8, i1 false)
  %3 = getelementptr inbounds %struct.t, %struct.t* %foo, i32 0, i32 2
  store i32 16, i32* %3, align 4
  %4 = call %struct.t* @f(%struct.t* %foo, i32 16)
  store %struct.t* %4, %struct.t** %bar, align 8
  %5 = load %struct.t*, %struct.t** %bar, align 8
  %6 = getelementptr inbounds %struct.t, %struct.t* %5, i32 0, i32 0
  %7 = load i8*, i8** %6, align 8
  %8 = bitcast %struct.t* %foo to i8*
  %9 = icmp ne i8* %7, %8
  br i1 %9, label %21, label %10

; <label>:10                                      ; preds = %0
  %11 = load %struct.t*, %struct.t** %bar, align 8
  %12 = getelementptr inbounds %struct.t, %struct.t* %11, i32 0, i32 1
  %13 = load i32, i32* %12, align 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %21, label %15

; <label>:15                                      ; preds = %10
  %16 = load %struct.t*, %struct.t** %bar, align 8
  %17 = getelementptr inbounds %struct.t, %struct.t* %16, i32 0, i32 2
  %18 = load i32, i32* %17, align 4
  %19 = sext i32 %18 to i64
  %20 = icmp ne i64 %19, 16
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %15, %10, %0
  call void @abort() #4
  unreachable

; <label>:22                                      ; preds = %15
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %24 = load i32, i32* %1
  ret i32 %24
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
