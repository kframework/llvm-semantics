; ModuleID = './20031204-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.addr = internal global [19 x i8] c"10.11.12.13:/hello\00", align 16

; Function Attrs: nounwind uwtable
define i64 @in_aton(i8* %x) #0 {
  %1 = alloca i8*, align 8
  store i8* %x, i8** %1, align 8
  ret i64 168496141
}

; Function Attrs: nounwind uwtable
define i64 @root_nfs_parse_addr(i8* %name) #0 {
  %1 = alloca i8*, align 8
  %addr = alloca i64, align 8
  %octets = alloca i32, align 4
  %cp = alloca i8*, align 8
  %cq = alloca i8*, align 8
  store i8* %name, i8** %1, align 8
  store i32 0, i32* %octets, align 4
  %2 = load i8*, i8** %1, align 8
  store i8* %2, i8** %cq, align 8
  store i8* %2, i8** %cp, align 8
  br label %3

; <label>:3                                       ; preds = %51, %0
  %4 = load i32, i32* %octets, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %53

; <label>:6                                       ; preds = %3
  br label %7

; <label>:7                                       ; preds = %19, %6
  %8 = load i8*, i8** %cp, align 8
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp sge i32 %10, 48
  br i1 %11, label %12, label %17

; <label>:12                                      ; preds = %7
  %13 = load i8*, i8** %cp, align 8
  %14 = load i8, i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp sle i32 %15, 57
  br label %17

; <label>:17                                      ; preds = %12, %7
  %18 = phi i1 [ false, %7 ], [ %16, %12 ]
  br i1 %18, label %19, label %22

; <label>:19                                      ; preds = %17
  %20 = load i8*, i8** %cp, align 8
  %21 = getelementptr inbounds i8, i8* %20, i32 1
  store i8* %21, i8** %cp, align 8
  br label %7

; <label>:22                                      ; preds = %17
  %23 = load i8*, i8** %cp, align 8
  %24 = load i8*, i8** %cq, align 8
  %25 = icmp eq i8* %23, %24
  br i1 %25, label %33, label %26

; <label>:26                                      ; preds = %22
  %27 = load i8*, i8** %cp, align 8
  %28 = load i8*, i8** %cq, align 8
  %29 = ptrtoint i8* %27 to i64
  %30 = ptrtoint i8* %28 to i64
  %31 = sub i64 %29, %30
  %32 = icmp sgt i64 %31, 3
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %26, %22
  br label %53

; <label>:34                                      ; preds = %26
  %35 = load i8*, i8** %cp, align 8
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp eq i32 %37, 46
  br i1 %38, label %42, label %39

; <label>:39                                      ; preds = %34
  %40 = load i32, i32* %octets, align 4
  %41 = icmp eq i32 %40, 3
  br i1 %41, label %42, label %45

; <label>:42                                      ; preds = %39, %34
  %43 = load i32, i32* %octets, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %octets, align 4
  br label %45

; <label>:45                                      ; preds = %42, %39
  %46 = load i32, i32* %octets, align 4
  %47 = icmp slt i32 %46, 4
  br i1 %47, label %48, label %51

; <label>:48                                      ; preds = %45
  %49 = load i8*, i8** %cp, align 8
  %50 = getelementptr inbounds i8, i8* %49, i32 1
  store i8* %50, i8** %cp, align 8
  br label %51

; <label>:51                                      ; preds = %48, %45
  %52 = load i8*, i8** %cp, align 8
  store i8* %52, i8** %cq, align 8
  br label %3

; <label>:53                                      ; preds = %33, %3
  %54 = load i32, i32* %octets, align 4
  %55 = icmp eq i32 %54, 4
  br i1 %55, label %56, label %80

; <label>:56                                      ; preds = %53
  %57 = load i8*, i8** %cp, align 8
  %58 = load i8, i8* %57, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp eq i32 %59, 58
  br i1 %60, label %66, label %61

; <label>:61                                      ; preds = %56
  %62 = load i8*, i8** %cp, align 8
  %63 = load i8, i8* %62, align 1
  %64 = sext i8 %63 to i32
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %66, label %80

; <label>:66                                      ; preds = %61, %56
  %67 = load i8*, i8** %cp, align 8
  %68 = load i8, i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = icmp eq i32 %69, 58
  br i1 %70, label %71, label %74

; <label>:71                                      ; preds = %66
  %72 = load i8*, i8** %cp, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %cp, align 8
  store i8 0, i8* %72, align 1
  br label %74

; <label>:74                                      ; preds = %71, %66
  %75 = load i8*, i8** %1, align 8
  %76 = call i64 @in_aton(i8* %75)
  store i64 %76, i64* %addr, align 8
  %77 = load i8*, i8** %1, align 8
  %78 = load i8*, i8** %cp, align 8
  %79 = call i8* @strcpy(i8* %77, i8* %78) #3
  br label %81

; <label>:80                                      ; preds = %61, %53
  store i64 -1, i64* %addr, align 8
  br label %81

; <label>:81                                      ; preds = %80, %74
  %82 = load i64, i64* %addr, align 8
  ret i64 %82
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %result = alloca i64, align 8
  store i32 0, i32* %1
  %2 = call i64 @root_nfs_parse_addr(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @main.addr, i32 0, i32 0))
  store i64 %2, i64* %result, align 8
  %3 = load i64, i64* %result, align 8
  %4 = icmp ne i64 %3, 168496141
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
