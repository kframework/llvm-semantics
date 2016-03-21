; ModuleID = './990525-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.blah = type { i32, i32 }

@main.s = private unnamed_addr constant %struct.blah { i32 1, i32 2 }, align 4

; Function Attrs: nounwind uwtable
define void @die(i64 %arg.coerce) #0 {
  %arg = alloca %struct.blah, align 8
  %i = alloca i32, align 4
  %buf = alloca [1 x %struct.blah], align 4
  %1 = bitcast %struct.blah* %arg to i64*
  store i64 %arg.coerce, i64* %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 1
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  br label %6

; <label>:6                                       ; preds = %5
  %7 = load i32, i32* %i, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %i, align 4
  %9 = sext i32 %7 to i64
  %10 = getelementptr inbounds [1 x %struct.blah], [1 x %struct.blah]* %buf, i32 0, i64 %9
  %11 = bitcast %struct.blah* %10 to i8*
  %12 = bitcast %struct.blah* %arg to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 8, i32 4, i1 false)
  br label %2

; <label>:13                                      ; preds = %2
  %14 = getelementptr inbounds [1 x %struct.blah], [1 x %struct.blah]* %buf, i32 0, i64 0
  %15 = getelementptr inbounds %struct.blah, %struct.blah* %14, i32 0, i32 0
  %16 = load i32, i32* %15, align 4
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:19                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.blah, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.blah* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.blah* @main.s to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast %struct.blah* %s to i64*
  %4 = load i64, i64* %3, align 4
  call void @die(i64 %4)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %6 = load i32, i32* %1
  ret i32 %6
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
