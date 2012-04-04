; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020404-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.asection_struct = type { i8, i64, i64, i32, i32 }
%struct.bfd_struct = type { i32 }

@hello = internal global [6 x i8] c"hello\00", align 1
@.str = private unnamed_addr constant [8 x i8] c".newsec\00", align 1
@bfd_make_section_anyway.foo_section = internal global %struct.asection_struct zeroinitializer, align 8
@bfd_openw_with_cleanup.foo_bfd = internal global %struct.bfd_struct zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @dump_bfd_file(i8* null, i8* null, i8* null, i64 3735928559, i8* getelementptr inbounds ([6 x i8]* @hello, i32 0, i32 0), i32 514703087)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal void @dump_bfd_file(i8* %filename, i8* %mode, i8* %target, i64 %vaddr, i8* %buf, i32 %len) nounwind uwtable {
entry:
  %filename.addr = alloca i8*, align 8
  %mode.addr = alloca i8*, align 8
  %target.addr = alloca i8*, align 8
  %vaddr.addr = alloca i64, align 8
  %buf.addr = alloca i8*, align 8
  %len.addr = alloca i32, align 4
  %obfd = alloca %struct.bfd_struct*, align 8
  %osection = alloca %struct.asection_struct*, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %mode, i8** %mode.addr, align 8
  store i8* %target, i8** %target.addr, align 8
  store i64 %vaddr, i64* %vaddr.addr, align 8
  store i8* %buf, i8** %buf.addr, align 8
  store i32 %len, i32* %len.addr, align 4
  %0 = load i8** %filename.addr, align 8
  %1 = load i8** %target.addr, align 8
  %2 = load i8** %mode.addr, align 8
  %call = call %struct.bfd_struct* @bfd_openw_with_cleanup(i8* %0, i8* %1, i8* %2)
  store %struct.bfd_struct* %call, %struct.bfd_struct** %obfd, align 8
  %3 = load %struct.bfd_struct** %obfd, align 8
  %call1 = call %struct.asection_struct* @bfd_make_section_anyway(%struct.bfd_struct* %3, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  store %struct.asection_struct* %call1, %struct.asection_struct** %osection, align 8
  %4 = load %struct.bfd_struct** %obfd, align 8
  %5 = load %struct.asection_struct** %osection, align 8
  %6 = load i32* %len.addr, align 4
  %conv = sext i32 %6 to i64
  %call2 = call i32 @bfd_set_section_size(%struct.bfd_struct* %4, %struct.asection_struct* %5, i64 %conv)
  %7 = load i64* %vaddr.addr, align 8
  %8 = load %struct.asection_struct** %osection, align 8
  %lma = getelementptr inbounds %struct.asection_struct* %8, i32 0, i32 2
  store i64 %7, i64* %lma, align 8
  %9 = load %struct.asection_struct** %osection, align 8
  %vma = getelementptr inbounds %struct.asection_struct* %9, i32 0, i32 1
  store i64 %7, i64* %vma, align 8
  %10 = load %struct.asection_struct** %osection, align 8
  %11 = bitcast %struct.asection_struct* %10 to i32*
  %12 = load i32* %11, align 8
  %13 = and i32 %12, -2
  %14 = or i32 %13, 1
  store i32 %14, i32* %11, align 8
  %15 = load %struct.asection_struct** %osection, align 8
  %alignment_power = getelementptr inbounds %struct.asection_struct* %15, i32 0, i32 3
  store i32 0, i32* %alignment_power, align 4
  %16 = load %struct.bfd_struct** %obfd, align 8
  %17 = load %struct.asection_struct** %osection, align 8
  %call3 = call i32 @bfd_set_section_flags(%struct.bfd_struct* %16, %struct.asection_struct* %17, i32 515)
  %18 = load %struct.asection_struct** %osection, align 8
  %entsize = getelementptr inbounds %struct.asection_struct* %18, i32 0, i32 4
  store i32 0, i32* %entsize, align 4
  %19 = load %struct.bfd_struct** %obfd, align 8
  %20 = load %struct.asection_struct** %osection, align 8
  %21 = load i8** %buf.addr, align 8
  %22 = load i32* %len.addr, align 4
  %conv4 = sext i32 %22 to i64
  %call5 = call i32 @bfd_set_section_contents(%struct.bfd_struct* %19, %struct.asection_struct* %20, i8* %21, i64 0, i64 %conv4)
  ret void
}

declare void @exit(i32) noreturn nounwind

define internal %struct.bfd_struct* @bfd_openw_with_cleanup(i8* %filename, i8* %target, i8* %mode) nounwind uwtable {
entry:
  %filename.addr = alloca i8*, align 8
  %target.addr = alloca i8*, align 8
  %mode.addr = alloca i8*, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i8* %target, i8** %target.addr, align 8
  store i8* %mode, i8** %mode.addr, align 8
  ret %struct.bfd_struct* @bfd_openw_with_cleanup.foo_bfd
}

define internal %struct.asection_struct* @bfd_make_section_anyway(%struct.bfd_struct* %abfd, i8* %name) nounwind uwtable {
entry:
  %abfd.addr = alloca %struct.bfd_struct*, align 8
  %name.addr = alloca i8*, align 8
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %abfd.addr, align 8
  store i8* %name, i8** %name.addr, align 8
  ret %struct.asection_struct* @bfd_make_section_anyway.foo_section
}

define internal i32 @bfd_set_section_size(%struct.bfd_struct* %abfd, %struct.asection_struct* %sec, i64 %val) nounwind uwtable {
entry:
  %abfd.addr = alloca %struct.bfd_struct*, align 8
  %sec.addr = alloca %struct.asection_struct*, align 8
  %val.addr = alloca i64, align 8
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %abfd.addr, align 8
  store %struct.asection_struct* %sec, %struct.asection_struct** %sec.addr, align 8
  store i64 %val, i64* %val.addr, align 8
  ret i32 1
}

define internal i32 @bfd_set_section_flags(%struct.bfd_struct* %abfd, %struct.asection_struct* %sec, i32 %flags) nounwind uwtable {
entry:
  %abfd.addr = alloca %struct.bfd_struct*, align 8
  %sec.addr = alloca %struct.asection_struct*, align 8
  %flags.addr = alloca i32, align 4
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %abfd.addr, align 8
  store %struct.asection_struct* %sec, %struct.asection_struct** %sec.addr, align 8
  store i32 %flags, i32* %flags.addr, align 4
  ret i32 0
}

define internal i32 @bfd_set_section_contents(%struct.bfd_struct* %abfd, %struct.asection_struct* %section, i8* %data, i64 %offset, i64 %count) nounwind uwtable {
entry:
  %abfd.addr = alloca %struct.bfd_struct*, align 8
  %section.addr = alloca %struct.asection_struct*, align 8
  %data.addr = alloca i8*, align 8
  %offset.addr = alloca i64, align 8
  %count.addr = alloca i64, align 8
  store %struct.bfd_struct* %abfd, %struct.bfd_struct** %abfd.addr, align 8
  store %struct.asection_struct* %section, %struct.asection_struct** %section.addr, align 8
  store i8* %data, i8** %data.addr, align 8
  store i64 %offset, i64* %offset.addr, align 8
  store i64 %count, i64* %count.addr, align 8
  %0 = load i64* %count.addr, align 8
  %cmp = icmp ne i64 %0, 514703087
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
