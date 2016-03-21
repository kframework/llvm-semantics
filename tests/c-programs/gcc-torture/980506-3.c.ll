; ModuleID = './980506-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"bind\00", align 1
@lookup_table = common global [257 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i32 @build_lookup(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  %5 = icmp ne i32 %4, 4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:7                                       ; preds = %0
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %9 = load i32, i32* %1
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define internal i32 @build_lookup(i8* %pattern) #0 {
  %1 = alloca i8*, align 8
  %m = alloca i32, align 4
  store i8* %pattern, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = call i64 @strlen(i8* %2) #5
  %4 = sub i64 %3, 1
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %m, align 4
  %6 = load i32, i32* %m, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %m, align 4
  %8 = trunc i32 %7 to i8
  call void @llvm.memset.p0i8.i64(i8* getelementptr inbounds ([257 x i8], [257 x i8]* @lookup_table, i32 0, i32 0), i8 %8, i64 257, i32 16, i1 false)
  %9 = load i32, i32* %m, align 4
  ret i32 %9
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
