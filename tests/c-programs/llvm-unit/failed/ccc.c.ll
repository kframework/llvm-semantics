; ModuleID = './ccc.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@Y = global i32 0, align 4
@.str = private unnamed_addr constant [35 x i8] c"Program requires integer parameter\00", align 1
@F1 = common global i32 0, align 4
@F2 = common global i32 0, align 4
@F3 = common global i32 0, align 4
@F4 = common global i32 0, align 4
@.str.1 = private unnamed_addr constant [12 x i8] c"%d %hd %hu\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @ubyteArg(i8 zeroext %X) #0 {
  %1 = alloca i8, align 1
  store i8 %X, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = add nsw i32 %3, 2
  %5 = load i32, i32* @Y, align 4
  %6 = add nsw i32 %4, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @sbyteArg(i8 signext %X) #0 {
  %1 = alloca i8, align 1
  store i8 %X, i8* %1, align 1
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = add nsw i32 %3, 3
  %5 = load i32, i32* @Y, align 4
  %6 = add nsw i32 %4, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @ushortArg(i16 zeroext %X) #0 {
  %1 = alloca i16, align 2
  store i16 %X, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = add nsw i32 %3, 4
  %5 = load i32, i32* @Y, align 4
  %6 = add nsw i32 %4, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @sshortArg(i16 signext %X) #0 {
  %1 = alloca i16, align 2
  store i16 %X, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = add nsw i32 %3, 5
  %5 = load i32, i32* @Y, align 4
  %6 = add nsw i32 %4, %5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %TestVal = alloca i32, align 4
  %sh = alloca i16, align 2
  %ush = alloca i16, align 2
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #4
  unreachable

; <label>:8                                       ; preds = %0
  store i32 ptrtoint (i32 (i8)* @ubyteArg to i32), i32* @F1, align 4
  store i32 ptrtoint (i32 (i8)* @sbyteArg to i32), i32* @F2, align 4
  store i32 ptrtoint (i32 (i16)* @ushortArg to i32), i32* @F3, align 4
  store i32 ptrtoint (i32 (i16)* @sshortArg to i32), i32* @F4, align 4
  %9 = load i8**, i8*** %3, align 8
  %10 = getelementptr inbounds i8*, i8** %9, i64 1
  %11 = load i8*, i8** %10, align 8
  %12 = call i32 @atoi(i8* %11) #5
  store i32 %12, i32* %TestVal, align 4
  store i16 -1, i16* %sh, align 2
  store i16 -1, i16* %ush, align 2
  %13 = load i32, i32* %TestVal, align 4
  %14 = load i16, i16* %sh, align 2
  %15 = sext i16 %14 to i32
  %16 = load i16, i16* %ush, align 2
  %17 = zext i16 %16 to i32
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0), i32 %13, i32 %15, i32 %17)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
