; ModuleID = './20030715-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"inetd\00", align 1
@ap_standalone = common global i32 0, align 4
@.str.1 = private unnamed_addr constant [11 x i8] c"standalone\00", align 1
@.str.2 = private unnamed_addr constant [50 x i8] c"ServerType must be either 'inetd' or 'standalone'\00", align 1

; Function Attrs: nounwind uwtable
define i8* @ap_check_cmd_context(i8* %a, i32 %b) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i8* %a, i8** %1, align 8
  store i32 %b, i32* %2, align 4
  ret i8* null
}

; Function Attrs: nounwind uwtable
define i8* @server_type(i8* %a, i8* %b, i8* %arg) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %err = alloca i8*, align 8
  store i8* %a, i8** %2, align 8
  store i8* %b, i8** %3, align 8
  store i8* %arg, i8** %4, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call i8* @ap_check_cmd_context(i8* %5, i32 31)
  store i8* %6, i8** %err, align 8
  %7 = load i8*, i8** %err, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %0
  %10 = load i8*, i8** %err, align 8
  store i8* %10, i8** %1
  br label %24

; <label>:11                                      ; preds = %0
  %12 = load i8*, i8** %4, align 8
  %13 = call i32 @strcmp(i8* %12, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0))
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %16, label %15

; <label>:15                                      ; preds = %11
  store i32 0, i32* @ap_standalone, align 4
  br label %23

; <label>:16                                      ; preds = %11
  %17 = load i8*, i8** %4, align 8
  %18 = call i32 @strcmp(i8* %17, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %21, label %20

; <label>:20                                      ; preds = %16
  store i32 1, i32* @ap_standalone, align 4
  br label %22

; <label>:21                                      ; preds = %16
  store i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.2, i32 0, i32 0), i8** %1
  br label %24

; <label>:22                                      ; preds = %20
  br label %23

; <label>:23                                      ; preds = %22, %15
  store i8* null, i8** %1
  br label %24

; <label>:24                                      ; preds = %23, %21, %9
  %25 = load i8*, i8** %1
  ret i8* %25
}

declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i8* @server_type(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
