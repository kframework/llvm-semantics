; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/zerolen-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.iso_directory_record = type { [4 x i8] }
%struct.anon = type { [1 x i8], [0 x i8] }

@entry = common global %union.iso_directory_record zeroinitializer, align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %de = alloca %union.iso_directory_record*, align 8
  store i32 0, i32* %retval
  store %union.iso_directory_record* @entry, %union.iso_directory_record** %de, align 8
  %0 = load %union.iso_directory_record** %de, align 8
  call void @set(%union.iso_directory_record* %0)
  %1 = load %union.iso_directory_record** %de, align 8
  %u = bitcast %union.iso_directory_record* %1 to %struct.anon*
  %name_len = getelementptr inbounds %struct.anon* %u, i32 0, i32 0
  %arrayidx = getelementptr inbounds [1 x i8]* %name_len, i32 0, i64 0
  %2 = load i8* %arrayidx, align 1
  %conv = zext i8 %2 to i32
  %cmp = icmp eq i32 %conv, 1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %3 = load %union.iso_directory_record** %de, align 8
  %u2 = bitcast %union.iso_directory_record* %3 to %struct.anon*
  %name = getelementptr inbounds %struct.anon* %u2, i32 0, i32 1
  %arrayidx3 = getelementptr inbounds [0 x i8]* %name, i32 0, i64 0
  %4 = load i8* %arrayidx3, align 1
  %conv4 = sext i8 %4 to i32
  %cmp5 = icmp eq i32 %conv4, 0
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  call void @exit(i32 0) noreturn
  unreachable

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @abort() noreturn
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

define void @set(%union.iso_directory_record* %p) nounwind uwtable {
entry:
  %p.addr = alloca %union.iso_directory_record*, align 8
  store %union.iso_directory_record* %p, %union.iso_directory_record** %p.addr, align 8
  %0 = load %union.iso_directory_record** %p.addr, align 8
  %carr = bitcast %union.iso_directory_record* %0 to [4 x i8]*
  %arrayidx = getelementptr inbounds [4 x i8]* %carr, i32 0, i64 0
  store i8 1, i8* %arrayidx, align 1
  %1 = load %union.iso_directory_record** %p.addr, align 8
  %carr1 = bitcast %union.iso_directory_record* %1 to [4 x i8]*
  %arrayidx2 = getelementptr inbounds [4 x i8]* %carr1, i32 0, i64 1
  store i8 0, i8* %arrayidx2, align 1
  ret void
}

declare void @exit(i32) noreturn

declare void @abort() noreturn
