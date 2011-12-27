; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr41750.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfd_link_hash_table = type { i32 }
%struct.foo_link_hash_table = type { %struct.bfd_link_hash_table, i32*, i32* }
%struct.foo_link_info = type { %struct.foo_link_hash_table* }

@hash = common global %struct.foo_link_hash_table zeroinitializer, align 8
@link_info = common global %struct.foo_link_info zeroinitializer, align 8
@abfd = common global i32 0, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @foo_create_got_section(i32* %abfd, %struct.foo_link_info* nocapture %info) nounwind uwtable noinline {
entry:
  %hash = getelementptr inbounds %struct.foo_link_info* %info, i64 0, i32 0
  %tmp2 = load %struct.foo_link_hash_table** %hash, align 8
  %sgot = getelementptr inbounds %struct.foo_link_hash_table* %tmp2, i64 0, i32 2
  store i32* %abfd, i32** %sgot, align 8
  ret i32 1
}

define i32* @elf64_ia64_check_relocs(i32* %abfd, %struct.foo_link_info* nocapture %info) nounwind uwtable noinline {
entry:
  %hash = getelementptr inbounds %struct.foo_link_info* %info, i64 0, i32 0
  %tmp3 = load %struct.foo_link_hash_table** %hash, align 8
  %sgot.i = getelementptr inbounds %struct.foo_link_hash_table* %tmp3, i64 0, i32 2
  %tmp1.i = load i32** %sgot.i, align 8
  %tobool.i = icmp eq i32* %tmp1.i, null
  br i1 %tobool.i, label %if.then.i, label %get_got.exit

if.then.i:                                        ; preds = %entry
  %dynobj4.i = getelementptr inbounds %struct.foo_link_hash_table* %tmp3, i64 0, i32 1
  %tmp5.i = load i32** %dynobj4.i, align 8
  %tobool7.i = icmp eq i32* %tmp5.i, null
  br i1 %tobool7.i, label %if.then8.i, label %if.end.i

if.then8.i:                                       ; preds = %if.then.i
  store i32* %abfd, i32** %dynobj4.i, align 8
  br label %if.end.i

if.end.i:                                         ; preds = %if.then8.i, %if.then.i
  %tmp122.i = phi i32* [ %tmp5.i, %if.then.i ], [ %abfd, %if.then8.i ]
  %call.i = tail call i32 @foo_create_got_section(i32* %tmp122.i, %struct.foo_link_info* %info) nounwind
  %tmp19.i = load i32** %sgot.i, align 8
  br label %get_got.exit

get_got.exit:                                     ; preds = %entry, %if.end.i
  %tmp211.i = phi i32* [ %tmp1.i, %entry ], [ %tmp19.i, %if.end.i ]
  ret i32* %tmp211.i
}

define i32 @main() nounwind uwtable {
entry:
  store %struct.foo_link_hash_table* @hash, %struct.foo_link_hash_table** getelementptr inbounds (%struct.foo_link_info* @link_info, i64 0, i32 0), align 8
  %call = tail call i32* @elf64_ia64_check_relocs(i32* @abfd, %struct.foo_link_info* @link_info)
  %cmp = icmp eq i32* %call, @abfd
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
