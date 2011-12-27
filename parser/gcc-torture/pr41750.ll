; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr41750.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfd_link_hash_table = type { i32 }
%struct.foo_link_hash_table = type { %struct.bfd_link_hash_table, i32*, i32* }
%struct.foo_link_info = type { %struct.foo_link_hash_table* }

@hash = common global %struct.foo_link_hash_table zeroinitializer, align 8
@link_info = common global %struct.foo_link_info zeroinitializer, align 8
@abfd = common global i32 0, align 4

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

define i32 @foo_create_got_section(i32* %abfd, %struct.foo_link_info* %info) nounwind uwtable noinline {
entry:
  %abfd.addr = alloca i32*, align 8
  %info.addr = alloca %struct.foo_link_info*, align 8
  store i32* %abfd, i32** %abfd.addr, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %info.addr, align 8
  %tmp = load i32** %abfd.addr, align 8
  %tmp1 = load %struct.foo_link_info** %info.addr, align 8
  %hash = getelementptr inbounds %struct.foo_link_info* %tmp1, i32 0, i32 0
  %tmp2 = load %struct.foo_link_hash_table** %hash, align 8
  %sgot = getelementptr inbounds %struct.foo_link_hash_table* %tmp2, i32 0, i32 2
  store i32* %tmp, i32** %sgot, align 8
  ret i32 1
}

define i32* @elf64_ia64_check_relocs(i32* %abfd, %struct.foo_link_info* %info) nounwind uwtable noinline {
entry:
  %abfd.addr = alloca i32*, align 8
  %info.addr = alloca %struct.foo_link_info*, align 8
  store i32* %abfd, i32** %abfd.addr, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %info.addr, align 8
  %tmp = load i32** %abfd.addr, align 8
  %tmp1 = load %struct.foo_link_info** %info.addr, align 8
  %tmp2 = load %struct.foo_link_info** %info.addr, align 8
  %hash = getelementptr inbounds %struct.foo_link_info* %tmp2, i32 0, i32 0
  %tmp3 = load %struct.foo_link_hash_table** %hash, align 8
  %call = call i32* @get_got(i32* %tmp, %struct.foo_link_info* %tmp1, %struct.foo_link_hash_table* %tmp3)
  ret i32* %call
}

define internal i32* @get_got(i32* %abfd, %struct.foo_link_info* %info, %struct.foo_link_hash_table* %hash) nounwind uwtable {
entry:
  %retval = alloca i32*, align 8
  %abfd.addr = alloca i32*, align 8
  %info.addr = alloca %struct.foo_link_info*, align 8
  %hash.addr = alloca %struct.foo_link_hash_table*, align 8
  %got = alloca i32*, align 8
  %dynobj = alloca i32*, align 8
  store i32* %abfd, i32** %abfd.addr, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %info.addr, align 8
  store %struct.foo_link_hash_table* %hash, %struct.foo_link_hash_table** %hash.addr, align 8
  %tmp = load %struct.foo_link_hash_table** %hash.addr, align 8
  %sgot = getelementptr inbounds %struct.foo_link_hash_table* %tmp, i32 0, i32 2
  %tmp1 = load i32** %sgot, align 8
  store i32* %tmp1, i32** %got, align 8
  %tmp2 = load i32** %got, align 8
  %tobool = icmp ne i32* %tmp2, null
  br i1 %tobool, label %if.end20, label %if.then

if.then:                                          ; preds = %entry
  %tmp3 = load %struct.foo_link_hash_table** %hash.addr, align 8
  %dynobj4 = getelementptr inbounds %struct.foo_link_hash_table* %tmp3, i32 0, i32 1
  %tmp5 = load i32** %dynobj4, align 8
  store i32* %tmp5, i32** %dynobj, align 8
  %tmp6 = load i32** %dynobj, align 8
  %tobool7 = icmp ne i32* %tmp6, null
  br i1 %tobool7, label %if.end, label %if.then8

if.then8:                                         ; preds = %if.then
  %tmp9 = load i32** %abfd.addr, align 8
  store i32* %tmp9, i32** %dynobj, align 8
  %tmp10 = load %struct.foo_link_hash_table** %hash.addr, align 8
  %dynobj11 = getelementptr inbounds %struct.foo_link_hash_table* %tmp10, i32 0, i32 1
  store i32* %tmp9, i32** %dynobj11, align 8
  br label %if.end

if.end:                                           ; preds = %if.then8, %if.then
  %tmp12 = load i32** %dynobj, align 8
  %tmp13 = load %struct.foo_link_info** %info.addr, align 8
  %call = call i32 @foo_create_got_section(i32* %tmp12, %struct.foo_link_info* %tmp13)
  %tobool14 = icmp ne i32 %call, 0
  br i1 %tobool14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end
  store i32* null, i32** %retval
  br label %return

if.end16:                                         ; preds = %if.end
  %tmp17 = load %struct.foo_link_hash_table** %hash.addr, align 8
  %sgot18 = getelementptr inbounds %struct.foo_link_hash_table* %tmp17, i32 0, i32 2
  %tmp19 = load i32** %sgot18, align 8
  store i32* %tmp19, i32** %got, align 8
  br label %if.end20

if.end20:                                         ; preds = %if.end16, %entry
  %tmp21 = load i32** %got, align 8
  store i32* %tmp21, i32** %retval
  br label %return

return:                                           ; preds = %if.end20, %if.then15
  %0 = load i32** %retval
  ret i32* %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store %struct.foo_link_hash_table* @hash, %struct.foo_link_hash_table** getelementptr inbounds (%struct.foo_link_info* @link_info, i32 0, i32 0), align 8
  %call = call i32* @elf64_ia64_check_relocs(i32* @abfd, %struct.foo_link_info* @link_info)
  %cmp = icmp ne i32* %call, @abfd
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
