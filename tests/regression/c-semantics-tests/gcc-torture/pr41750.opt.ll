; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41750.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo_link_hash_table = type { %struct.bfd_link_hash_table, i32*, i32* }
%struct.bfd_link_hash_table = type { i32 }
%struct.foo_link_info = type { %struct.foo_link_hash_table* }

@hash = common global %struct.foo_link_hash_table zeroinitializer, align 8
@link_info = common global %struct.foo_link_info zeroinitializer, align 8
@abfd = common global i32 0, align 4

define i32 @foo_create_got_section(i32* %abfd, %struct.foo_link_info* nocapture %info) nounwind uwtable noinline {
entry:
  %hash = getelementptr inbounds %struct.foo_link_info* %info, i64 0, i32 0
  %0 = load %struct.foo_link_hash_table** %hash, align 8, !tbaa !0
  %sgot = getelementptr inbounds %struct.foo_link_hash_table* %0, i64 0, i32 2
  store i32* %abfd, i32** %sgot, align 8, !tbaa !0
  ret i32 1
}

define i32* @elf64_ia64_check_relocs(i32* %abfd, %struct.foo_link_info* nocapture %info) nounwind uwtable noinline {
entry:
  %hash = getelementptr inbounds %struct.foo_link_info* %info, i64 0, i32 0
  %0 = load %struct.foo_link_hash_table** %hash, align 8, !tbaa !0
  %sgot.i = getelementptr inbounds %struct.foo_link_hash_table* %0, i64 0, i32 2
  %1 = load i32** %sgot.i, align 8, !tbaa !0
  %tobool.i = icmp eq i32* %1, null
  br i1 %tobool.i, label %if.then.i, label %get_got.exit

if.then.i:                                        ; preds = %entry
  %dynobj1.i = getelementptr inbounds %struct.foo_link_hash_table* %0, i64 0, i32 1
  %2 = load i32** %dynobj1.i, align 8, !tbaa !0
  %tobool2.i = icmp eq i32* %2, null
  br i1 %tobool2.i, label %if.then3.i, label %if.end.i

if.then3.i:                                       ; preds = %if.then.i
  store i32* %abfd, i32** %dynobj1.i, align 8, !tbaa !0
  br label %if.end.i

if.end.i:                                         ; preds = %if.then3.i, %if.then.i
  %dynobj.0.i = phi i32* [ %2, %if.then.i ], [ %abfd, %if.then3.i ]
  %call.i = tail call i32 @foo_create_got_section(i32* %dynobj.0.i, %struct.foo_link_info* %info) nounwind
  %3 = load i32** %sgot.i, align 8, !tbaa !0
  br label %get_got.exit

get_got.exit:                                     ; preds = %entry, %if.end.i
  %got.0.i = phi i32* [ %1, %entry ], [ %3, %if.end.i ]
  ret i32* %got.0.i
}

define i32 @main() nounwind uwtable {
entry:
  store %struct.foo_link_hash_table* @hash, %struct.foo_link_hash_table** getelementptr inbounds (%struct.foo_link_info* @link_info, i64 0, i32 0), align 8, !tbaa !0
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

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
