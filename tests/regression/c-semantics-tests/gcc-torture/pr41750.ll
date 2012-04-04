; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41750.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo_link_hash_table = type { %struct.bfd_link_hash_table, i32*, i32* }
%struct.bfd_link_hash_table = type { i32 }
%struct.foo_link_info = type { %struct.foo_link_hash_table* }

@hash = common global %struct.foo_link_hash_table zeroinitializer, align 8
@link_info = common global %struct.foo_link_info zeroinitializer, align 8
@abfd = common global i32 0, align 4

define i32 @foo_create_got_section(i32* %abfd, %struct.foo_link_info* %info) nounwind uwtable noinline {
entry:
  %abfd.addr = alloca i32*, align 8
  %info.addr = alloca %struct.foo_link_info*, align 8
  store i32* %abfd, i32** %abfd.addr, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %info.addr, align 8
  %0 = load i32** %abfd.addr, align 8
  %1 = load %struct.foo_link_info** %info.addr, align 8
  %hash = getelementptr inbounds %struct.foo_link_info* %1, i32 0, i32 0
  %2 = load %struct.foo_link_hash_table** %hash, align 8
  %sgot = getelementptr inbounds %struct.foo_link_hash_table* %2, i32 0, i32 2
  store i32* %0, i32** %sgot, align 8
  ret i32 1
}

define i32* @elf64_ia64_check_relocs(i32* %abfd, %struct.foo_link_info* %info) nounwind uwtable noinline {
entry:
  %abfd.addr = alloca i32*, align 8
  %info.addr = alloca %struct.foo_link_info*, align 8
  store i32* %abfd, i32** %abfd.addr, align 8
  store %struct.foo_link_info* %info, %struct.foo_link_info** %info.addr, align 8
  %0 = load i32** %abfd.addr, align 8
  %1 = load %struct.foo_link_info** %info.addr, align 8
  %2 = load %struct.foo_link_info** %info.addr, align 8
  %hash = getelementptr inbounds %struct.foo_link_info* %2, i32 0, i32 0
  %3 = load %struct.foo_link_hash_table** %hash, align 8
  %call = call i32* @get_got(i32* %0, %struct.foo_link_info* %1, %struct.foo_link_hash_table* %3)
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
  %0 = load %struct.foo_link_hash_table** %hash.addr, align 8
  %sgot = getelementptr inbounds %struct.foo_link_hash_table* %0, i32 0, i32 2
  %1 = load i32** %sgot, align 8
  store i32* %1, i32** %got, align 8
  %2 = load i32** %got, align 8
  %tobool = icmp ne i32* %2, null
  br i1 %tobool, label %if.end9, label %if.then

if.then:                                          ; preds = %entry
  %3 = load %struct.foo_link_hash_table** %hash.addr, align 8
  %dynobj1 = getelementptr inbounds %struct.foo_link_hash_table* %3, i32 0, i32 1
  %4 = load i32** %dynobj1, align 8
  store i32* %4, i32** %dynobj, align 8
  %5 = load i32** %dynobj, align 8
  %tobool2 = icmp ne i32* %5, null
  br i1 %tobool2, label %if.end, label %if.then3

if.then3:                                         ; preds = %if.then
  %6 = load i32** %abfd.addr, align 8
  store i32* %6, i32** %dynobj, align 8
  %7 = load %struct.foo_link_hash_table** %hash.addr, align 8
  %dynobj4 = getelementptr inbounds %struct.foo_link_hash_table* %7, i32 0, i32 1
  store i32* %6, i32** %dynobj4, align 8
  br label %if.end

if.end:                                           ; preds = %if.then3, %if.then
  %8 = load i32** %dynobj, align 8
  %9 = load %struct.foo_link_info** %info.addr, align 8
  %call = call i32 @foo_create_got_section(i32* %8, %struct.foo_link_info* %9)
  %tobool5 = icmp ne i32 %call, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  store i32* null, i32** %retval
  br label %return

if.end7:                                          ; preds = %if.end
  %10 = load %struct.foo_link_hash_table** %hash.addr, align 8
  %sgot8 = getelementptr inbounds %struct.foo_link_hash_table* %10, i32 0, i32 2
  %11 = load i32** %sgot8, align 8
  store i32* %11, i32** %got, align 8
  br label %if.end9

if.end9:                                          ; preds = %if.end7, %entry
  %12 = load i32** %got, align 8
  store i32* %12, i32** %retval
  br label %return

return:                                           ; preds = %if.end9, %if.then6
  %13 = load i32** %retval
  ret i32* %13
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
