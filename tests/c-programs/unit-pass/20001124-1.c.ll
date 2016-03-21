; ModuleID = './20001124-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.super_block = type { i32, i8, i32 }
%struct.inode = type { i64, %struct.super_block* }
%struct.file = type { i64 }

@s = common global %struct.super_block zeroinitializer, align 4
@i = common global %struct.inode zeroinitializer, align 8
@f = common global %struct.file zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 512, i32* getelementptr inbounds (%struct.super_block, %struct.super_block* @s, i32 0, i32 0), align 4
  store i8 9, i8* getelementptr inbounds (%struct.super_block, %struct.super_block* @s, i32 0, i32 1), align 1
  store i64 2048, i64* getelementptr inbounds (%struct.inode, %struct.inode* @i, i32 0, i32 0), align 8
  store %struct.super_block* @s, %struct.super_block** getelementptr inbounds (%struct.inode, %struct.inode* @i, i32 0, i32 1), align 8
  store i64 0, i64* getelementptr inbounds (%struct.file, %struct.file* @f, i32 0, i32 0), align 8
  %4 = call i32 @do_isofs_readdir(%struct.inode* @i, %struct.file* @f)
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  %6 = load i32, i32* %1
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define internal i32 @do_isofs_readdir(%struct.inode* %inode, %struct.file* %filp) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.inode*, align 8
  %3 = alloca %struct.file*, align 8
  %bufsize = alloca i32, align 4
  %bufbits = alloca i8, align 1
  %block = alloca i32, align 4
  %offset = alloca i32, align 4
  %bh = alloca i8*, align 8
  %hs = alloca i32, align 4
  store %struct.inode* %inode, %struct.inode** %2, align 8
  store %struct.file* %filp, %struct.file** %3, align 8
  %4 = load %struct.inode*, %struct.inode** %2, align 8
  %5 = getelementptr inbounds %struct.inode, %struct.inode* %4, i32 0, i32 1
  %6 = load %struct.super_block*, %struct.super_block** %5, align 8
  %7 = getelementptr inbounds %struct.super_block, %struct.super_block* %6, i32 0, i32 0
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %bufsize, align 4
  %9 = load %struct.inode*, %struct.inode** %2, align 8
  %10 = getelementptr inbounds %struct.inode, %struct.inode* %9, i32 0, i32 1
  %11 = load %struct.super_block*, %struct.super_block** %10, align 8
  %12 = getelementptr inbounds %struct.super_block, %struct.super_block* %11, i32 0, i32 1
  %13 = load i8, i8* %12, align 1
  store i8 %13, i8* %bufbits, align 1
  store i8* null, i8** %bh, align 8
  %14 = load %struct.file*, %struct.file** %3, align 8
  %15 = getelementptr inbounds %struct.file, %struct.file* %14, i32 0, i32 0
  %16 = load i64, i64* %15, align 8
  %17 = load %struct.inode*, %struct.inode** %2, align 8
  %18 = getelementptr inbounds %struct.inode, %struct.inode* %17, i32 0, i32 0
  %19 = load i64, i64* %18, align 8
  %20 = icmp sge i64 %16, %19
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %0
  store i32 0, i32* %1
  br label %96

; <label>:22                                      ; preds = %0
  %23 = load %struct.file*, %struct.file** %3, align 8
  %24 = getelementptr inbounds %struct.file, %struct.file* %23, i32 0, i32 0
  %25 = load i64, i64* %24, align 8
  %26 = load i32, i32* %bufsize, align 4
  %27 = sub nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = and i64 %25, %28
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* %offset, align 4
  %31 = load %struct.file*, %struct.file** %3, align 8
  %32 = getelementptr inbounds %struct.file, %struct.file* %31, i32 0, i32 0
  %33 = load i64, i64* %32, align 8
  %34 = load i8, i8* %bufbits, align 1
  %35 = zext i8 %34 to i32
  %36 = zext i32 %35 to i64
  %37 = ashr i64 %33, %36
  %38 = trunc i64 %37 to i32
  store i32 %38, i32* %block, align 4
  %39 = load %struct.inode*, %struct.inode** %2, align 8
  %40 = getelementptr inbounds %struct.inode, %struct.inode* %39, i32 0, i32 1
  %41 = load %struct.super_block*, %struct.super_block** %40, align 8
  %42 = getelementptr inbounds %struct.super_block, %struct.super_block* %41, i32 0, i32 2
  %43 = load i32, i32* %42, align 4
  store i32 %43, i32* %hs, align 4
  br label %44

; <label>:44                                      ; preds = %90, %22
  %45 = load %struct.file*, %struct.file** %3, align 8
  %46 = getelementptr inbounds %struct.file, %struct.file* %45, i32 0, i32 0
  %47 = load i64, i64* %46, align 8
  %48 = load %struct.inode*, %struct.inode** %2, align 8
  %49 = getelementptr inbounds %struct.inode, %struct.inode* %48, i32 0, i32 0
  %50 = load i64, i64* %49, align 8
  %51 = icmp slt i64 %47, %50
  br i1 %51, label %52, label %95

; <label>:52                                      ; preds = %44
  %53 = load i8*, i8** %bh, align 8
  %54 = icmp ne i8* %53, null
  br i1 %54, label %58, label %55

; <label>:55                                      ; preds = %52
  %56 = load i32, i32* %block, align 4
  %57 = call i8* @isofs_bread(i32 %56)
  store i8* %57, i8** %bh, align 8
  br label %58

; <label>:58                                      ; preds = %55, %52
  %59 = load i32, i32* %block, align 4
  %60 = load i8, i8* %bufbits, align 1
  %61 = zext i8 %60 to i32
  %62 = shl i32 %59, %61
  %63 = load i32, i32* %hs, align 4
  %64 = add i32 %63, %62
  store i32 %64, i32* %hs, align 4
  %65 = load i32, i32* %hs, align 4
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %72

; <label>:67                                      ; preds = %58
  %68 = load %struct.file*, %struct.file** %3, align 8
  %69 = getelementptr inbounds %struct.file, %struct.file* %68, i32 0, i32 0
  %70 = load i64, i64* %69, align 8
  %71 = add nsw i64 %70, 1
  store i64 %71, i64* %69, align 8
  br label %72

; <label>:72                                      ; preds = %67, %58
  %73 = load i32, i32* %offset, align 4
  %74 = load i32, i32* %bufsize, align 4
  %75 = icmp uge i32 %73, %74
  br i1 %75, label %76, label %81

; <label>:76                                      ; preds = %72
  %77 = load i32, i32* %bufsize, align 4
  %78 = sub nsw i32 %77, 1
  %79 = load i32, i32* %offset, align 4
  %80 = and i32 %79, %78
  store i32 %80, i32* %offset, align 4
  br label %81

; <label>:81                                      ; preds = %76, %72
  %82 = load i8*, i8** %bh, align 8
  %83 = load i8, i8* %82, align 1
  %84 = icmp ne i8 %83, 0
  br i1 %84, label %85, label %90

; <label>:85                                      ; preds = %81
  %86 = load %struct.file*, %struct.file** %3, align 8
  %87 = getelementptr inbounds %struct.file, %struct.file* %86, i32 0, i32 0
  %88 = load i64, i64* %87, align 8
  %89 = add nsw i64 %88, 1
  store i64 %89, i64* %87, align 8
  br label %90

; <label>:90                                      ; preds = %85, %81
  %91 = load %struct.file*, %struct.file** %3, align 8
  %92 = getelementptr inbounds %struct.file, %struct.file* %91, i32 0, i32 0
  %93 = load i64, i64* %92, align 8
  %94 = add nsw i64 %93, 1
  store i64 %94, i64* %92, align 8
  br label %44

; <label>:95                                      ; preds = %44
  store i32 0, i32* %1
  br label %96

; <label>:96                                      ; preds = %95, %21
  %97 = load i32, i32* %1
  ret i32 %97
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define internal i8* @isofs_bread(i32 %block) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  store i32 %block, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i8*, i8** %1
  ret i8* %8
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
