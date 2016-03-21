; ModuleID = './921117-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { [11 x i8], i32 }

@.str = private unnamed_addr constant [11 x i8] c"0123456789\00", align 1
@cell = common global %struct.s zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @check(i64 %p.coerce0, i64 %p.coerce1) #0 {
  %1 = alloca i32, align 4
  %p = alloca %struct.s, align 8
  %2 = bitcast %struct.s* %p to { i64, i64 }*
  %3 = getelementptr { i64, i64 }, { i64, i64 }* %2, i32 0, i32 0
  store i64 %p.coerce0, i64* %3
  %4 = getelementptr { i64, i64 }, { i64, i64 }* %2, i32 0, i32 1
  store i64 %p.coerce1, i64* %4
  %5 = getelementptr inbounds %struct.s, %struct.s* %p, i32 0, i32 1
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 99
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 1, i32* %1
  br label %13

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.s, %struct.s* %p, i32 0, i32 0
  %11 = getelementptr inbounds [11 x i8], [11 x i8]* %10, i32 0, i32 0
  %12 = call i32 @strcmp(i8* %11, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0)) #4
  store i32 %12, i32* %1
  br label %13

; <label>:13                                      ; preds = %9, %8
  %14 = load i32, i32* %1
  ret i32 %14
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 99, i32* getelementptr inbounds (%struct.s, %struct.s* @cell, i32 0, i32 1), align 4
  %2 = call i8* @strcpy(i8* getelementptr inbounds (%struct.s, %struct.s* @cell, i32 0, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0)) #5
  %3 = load i64, i64* getelementptr ({ i64, i64 }, { i64, i64 }* bitcast (%struct.s* @cell to { i64, i64 }*), i32 0, i32 0), align 1
  %4 = load i64, i64* getelementptr ({ i64, i64 }, { i64, i64 }* bitcast (%struct.s* @cell to { i64, i64 }*), i32 0, i32 1), align 1
  %5 = call i32 @check(i64 %3, i64 %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #6
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #6
  unreachable
                                                  ; No predecessors!
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
