; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020404-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.asection_struct = type { i8, i64, i64, i32, i32 }
%struct.bfd_struct = type { i32 }

@hello = internal global [6 x i8] c"hello\00", align 1
@.str = private unnamed_addr constant [8 x i8] c".newsec\00", align 1
@bfd_make_section_anyway.foo_section = internal global %struct.asection_struct zeroinitializer, align 8
@bfd_openw_with_cleanup.foo_bfd = internal global %struct.bfd_struct zeroinitializer, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

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
  %tmp = load i8** %filename.addr, align 8
  %tmp1 = load i8** %target.addr, align 8
  %tmp2 = load i8** %mode.addr, align 8
  %call = call %struct.bfd_struct* @bfd_openw_with_cleanup(i8* %tmp, i8* %tmp1, i8* %tmp2)
  store %struct.bfd_struct* %call, %struct.bfd_struct** %obfd, align 8
  %tmp3 = load %struct.bfd_struct** %obfd, align 8
  %call4 = call %struct.asection_struct* @bfd_make_section_anyway(%struct.bfd_struct* %tmp3, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  store %struct.asection_struct* %call4, %struct.asection_struct** %osection, align 8
  %tmp5 = load %struct.bfd_struct** %obfd, align 8
  %tmp6 = load %struct.asection_struct** %osection, align 8
  %tmp7 = load i32* %len.addr, align 4
  %conv = sext i32 %tmp7 to i64
  %call8 = call i32 @bfd_set_section_size(%struct.bfd_struct* %tmp5, %struct.asection_struct* %tmp6, i64 %conv)
  %tmp9 = load i64* %vaddr.addr, align 8
  %tmp10 = load %struct.asection_struct** %osection, align 8
  %lma = getelementptr inbounds %struct.asection_struct* %tmp10, i32 0, i32 2
  store i64 %tmp9, i64* %lma, align 8
  %tmp11 = load %struct.asection_struct** %osection, align 8
  %vma = getelementptr inbounds %struct.asection_struct* %tmp11, i32 0, i32 1
  store i64 %tmp9, i64* %vma, align 8
  %tmp12 = load %struct.asection_struct** %osection, align 8
  %0 = bitcast %struct.asection_struct* %tmp12 to i32*
  %1 = load i32* %0, align 8
  %2 = and i32 %1, -2
  %3 = or i32 %2, 1
  store i32 %3, i32* %0, align 8
  %tmp13 = load %struct.asection_struct** %osection, align 8
  %alignment_power = getelementptr inbounds %struct.asection_struct* %tmp13, i32 0, i32 3
  store i32 0, i32* %alignment_power, align 4
  %tmp14 = load %struct.bfd_struct** %obfd, align 8
  %tmp15 = load %struct.asection_struct** %osection, align 8
  %call16 = call i32 @bfd_set_section_flags(%struct.bfd_struct* %tmp14, %struct.asection_struct* %tmp15, i32 515)
  %tmp17 = load %struct.asection_struct** %osection, align 8
  %entsize = getelementptr inbounds %struct.asection_struct* %tmp17, i32 0, i32 4
  store i32 0, i32* %entsize, align 4
  %tmp18 = load %struct.bfd_struct** %obfd, align 8
  %tmp19 = load %struct.asection_struct** %osection, align 8
  %tmp20 = load i8** %buf.addr, align 8
  %tmp21 = load i32* %len.addr, align 4
  %conv22 = sext i32 %tmp21 to i64
  %call23 = call i32 @bfd_set_section_contents(%struct.bfd_struct* %tmp18, %struct.asection_struct* %tmp19, i8* %tmp20, i64 0, i64 %conv22)
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
  %tmp = load i64* %count.addr, align 8
  %cmp = icmp ne i64 %tmp, 514703087
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
