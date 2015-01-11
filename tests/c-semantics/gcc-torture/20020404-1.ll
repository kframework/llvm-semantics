; ModuleID = './20020404-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.asection_struct = type { i8, i64, i64, i32, i32 }
%struct.bfd_struct = type { i32 }

@hello = internal global [6 x i8] c"hello\00", align 1
@.str = private unnamed_addr constant [8 x i8] c".newsec\00", align 1
@bfd_make_section_anyway.foo_section = internal global %struct.asection_struct zeroinitializer, align 8
@bfd_openw_with_cleanup.foo_bfd = internal global %struct.bfd_struct zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @dump_bfd_file(i8* null, i8* null, i8* null, i64 3735928559, i8* getelementptr inbounds ([6 x i8]* @hello, i32 0, i32 0), i32 514703087)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define internal void @dump_bfd_file(i8* %filename, i8* %mode, i8* %target, i64 %vaddr, i8* %buf, i32 %len) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %obfd = alloca %struct.bfd_struct*, align 8
  %osection = alloca %struct.asection_struct*, align 8
  store i8* %filename, i8** %1, align 8
  store i8* %mode, i8** %2, align 8
  store i8* %target, i8** %3, align 8
  store i64 %vaddr, i64* %4, align 8
  store i8* %buf, i8** %5, align 8
  store i32 %len, i32* %6, align 4
  %7 = load i8** %1, align 8
  %8 = load i8** %3, align 8
  %9 = load i8** %2, align 8
  %10 = call %struct.bfd_struct* @bfd_openw_with_cleanup(i8* %7, i8* %8, i8* %9)
  store %struct.bfd_struct* %10, %struct.bfd_struct** %obfd, align 8
  %11 = load %struct.bfd_struct** %obfd, align 8
  %12 = call %struct.asection_struct* @bfd_make_section_anyway(%struct.bfd_struct* %11, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  store %struct.asection_struct* %12, %struct.asection_struct** %osection, align 8
  %13 = load %struct.bfd_struct** %obfd, align 8
  %14 = load %struct.asection_struct** %osection, align 8
  %15 = load i32* %6, align 4
  %16 = sext i32 %15 to i64
  %17 = call i32 @bfd_set_section_size(%struct.bfd_struct* %13, %struct.asection_struct* %14, i64 %16)
  %18 = load i64* %4, align 8
  %19 = load %struct.asection_struct** %osection, align 8
  %20 = getelementptr inbounds %struct.asection_struct* %19, i32 0, i32 2
  store i64 %18, i64* %20, align 8
  %21 = load %struct.asection_struct** %osection, align 8
  %22 = getelementptr inbounds %struct.asection_struct* %21, i32 0, i32 1
  store i64 %18, i64* %22, align 8
  %23 = load %struct.asection_struct** %osection, align 8
  %24 = bitcast %struct.asection_struct* %23 to i8*
  %25 = load i8* %24, align 8
  %26 = and i8 %25, -2
  %27 = or i8 %26, 1
  store i8 %27, i8* %24, align 8
  %28 = load %struct.asection_struct** %osection, align 8
  %29 = getelementptr inbounds %struct.asection_struct* %28, i32 0, i32 3
  store i32 0, i32* %29, align 4
  %30 = load %struct.bfd_struct** %obfd, align 8
  %31 = load %struct.asection_struct** %osection, align 8
  %32 = call i32 @bfd_set_section_flags(%struct.bfd_struct* %30, %struct.asection_struct* %31, i32 515)
  %33 = load %struct.asection_struct** %osection, align 8
  %34 = getelementptr inbounds %struct.asection_struct* %33, i32 0, i32 4
  store i32 0, i32* %34, align 4
  %35 = load %struct.bfd_struct** %obfd, align 8
  %36 = load %struct.asection_struct** %osection, align 8
  %37 = load i8** %5, align 8
  %38 = load i32* %6, align 4
  %39 = sext i32 %38 to i64
  %40 = call i32 @bfd_set_section_contents(%struct.bfd_struct* %35, %struct.asection_struct* %36, i8* %37, i64 0, i64 %39)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define internal %struct.bfd_struct* @bfd_openw_with_cleanup(i8* %filename, i8* %target, i8* %mode) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %filename, i8** %1, align 8
  store i8* %target, i8** %2, align 8
  store i8* %mode, i8** %3, align 8
  ret %struct.bfd_struct* @bfd_openw_with_cleanup.foo_bfd
}

; Function Attrs: nounwind uwtable
define internal %struct.asection_struct* @bfd_make_section_anyway(%struct.bfd_struct* %abfd, i8* %name) #0 {
  %1 = alloca %struct.bfd_struct*, align 8
  %2 = alloca i8*, align 8
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %1, align 8
  store i8* %name, i8** %2, align 8
  ret %struct.asection_struct* @bfd_make_section_anyway.foo_section
}

; Function Attrs: nounwind uwtable
define internal i32 @bfd_set_section_size(%struct.bfd_struct* %abfd, %struct.asection_struct* %sec, i64 %val) #0 {
  %1 = alloca %struct.bfd_struct*, align 8
  %2 = alloca %struct.asection_struct*, align 8
  %3 = alloca i64, align 8
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %1, align 8
  store %struct.asection_struct* %sec, %struct.asection_struct** %2, align 8
  store i64 %val, i64* %3, align 8
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal i32 @bfd_set_section_flags(%struct.bfd_struct* %abfd, %struct.asection_struct* %sec, i32 %flags) #0 {
  %1 = alloca %struct.bfd_struct*, align 8
  %2 = alloca %struct.asection_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %1, align 8
  store %struct.asection_struct* %sec, %struct.asection_struct** %2, align 8
  store i32 %flags, i32* %3, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i32 @bfd_set_section_contents(%struct.bfd_struct* %abfd, %struct.asection_struct* %section, i8* %data, i64 %offset, i64 %count) #0 {
  %1 = alloca %struct.bfd_struct*, align 8
  %2 = alloca %struct.asection_struct*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %1, align 8
  store %struct.asection_struct* %section, %struct.asection_struct** %2, align 8
  store i8* %data, i8** %3, align 8
  store i64 %offset, i64* %4, align 8
  store i64 %count, i64* %5, align 8
  %6 = load i64* %5, align 8
  %7 = icmp ne i64 %6, 514703087
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
