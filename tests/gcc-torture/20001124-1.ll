; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20001124-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.file = type { i64 }
%struct.inode = type { i64, %struct.super_block* }
%struct.super_block = type { i32, i8, i32 }

@s = common global %struct.super_block zeroinitializer, align 4
@i = common global %struct.inode zeroinitializer, align 8
@f = common global %struct.file zeroinitializer, align 8

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

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 512, i32* getelementptr inbounds (%struct.super_block* @s, i32 0, i32 0), align 4
  store i8 9, i8* getelementptr inbounds (%struct.super_block* @s, i32 0, i32 1), align 1
  store i64 2048, i64* getelementptr inbounds (%struct.inode* @i, i32 0, i32 0), align 8
  store %struct.super_block* @s, %struct.super_block** getelementptr inbounds (%struct.inode* @i, i32 0, i32 1), align 8
  store i64 0, i64* getelementptr inbounds (%struct.file* @f, i32 0, i32 0), align 8
  %call = call i32 @do_isofs_readdir(%struct.inode* @i, %struct.file* @f)
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal i32 @do_isofs_readdir(%struct.inode* %inode, %struct.file* %filp) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %inode.addr = alloca %struct.inode*, align 8
  %filp.addr = alloca %struct.file*, align 8
  %bufsize = alloca i32, align 4
  %bufbits = alloca i8, align 1
  %block = alloca i32, align 4
  %offset = alloca i32, align 4
  %bh = alloca i8*, align 8
  %hs = alloca i32, align 4
  store %struct.inode* %inode, %struct.inode** %inode.addr, align 8
  store %struct.file* %filp, %struct.file** %filp.addr, align 8
  %tmp = load %struct.inode** %inode.addr, align 8
  %i_sb = getelementptr inbounds %struct.inode* %tmp, i32 0, i32 1
  %tmp1 = load %struct.super_block** %i_sb, align 8
  %s_blocksize = getelementptr inbounds %struct.super_block* %tmp1, i32 0, i32 0
  %tmp2 = load i32* %s_blocksize, align 4
  store i32 %tmp2, i32* %bufsize, align 4
  %tmp4 = load %struct.inode** %inode.addr, align 8
  %i_sb5 = getelementptr inbounds %struct.inode* %tmp4, i32 0, i32 1
  %tmp6 = load %struct.super_block** %i_sb5, align 8
  %s_blocksize_bits = getelementptr inbounds %struct.super_block* %tmp6, i32 0, i32 1
  %tmp7 = load i8* %s_blocksize_bits, align 1
  store i8 %tmp7, i8* %bufbits, align 1
  store i8* null, i8** %bh, align 8
  %tmp12 = load %struct.file** %filp.addr, align 8
  %f_pos = getelementptr inbounds %struct.file* %tmp12, i32 0, i32 0
  %tmp13 = load i64* %f_pos, align 8
  %tmp14 = load %struct.inode** %inode.addr, align 8
  %i_size = getelementptr inbounds %struct.inode* %tmp14, i32 0, i32 0
  %tmp15 = load i64* %i_size, align 8
  %cmp = icmp sge i64 %tmp13, %tmp15
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %tmp16 = load %struct.file** %filp.addr, align 8
  %f_pos17 = getelementptr inbounds %struct.file* %tmp16, i32 0, i32 0
  %tmp18 = load i64* %f_pos17, align 8
  %tmp19 = load i32* %bufsize, align 4
  %sub = sub nsw i32 %tmp19, 1
  %conv = sext i32 %sub to i64
  %and = and i64 %tmp18, %conv
  %conv20 = trunc i64 %and to i32
  store i32 %conv20, i32* %offset, align 4
  %tmp21 = load %struct.file** %filp.addr, align 8
  %f_pos22 = getelementptr inbounds %struct.file* %tmp21, i32 0, i32 0
  %tmp23 = load i64* %f_pos22, align 8
  %tmp24 = load i8* %bufbits, align 1
  %conv25 = zext i8 %tmp24 to i32
  %sh_prom = zext i32 %conv25 to i64
  %shr = ashr i64 %tmp23, %sh_prom
  %conv26 = trunc i64 %shr to i32
  store i32 %conv26, i32* %block, align 4
  %tmp27 = load %struct.inode** %inode.addr, align 8
  %i_sb28 = getelementptr inbounds %struct.inode* %tmp27, i32 0, i32 1
  %tmp29 = load %struct.super_block** %i_sb28, align 8
  %s_hs = getelementptr inbounds %struct.super_block* %tmp29, i32 0, i32 2
  %tmp30 = load i32* %s_hs, align 4
  store i32 %tmp30, i32* %hs, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end73, %if.end
  %tmp31 = load %struct.file** %filp.addr, align 8
  %f_pos32 = getelementptr inbounds %struct.file* %tmp31, i32 0, i32 0
  %tmp33 = load i64* %f_pos32, align 8
  %tmp34 = load %struct.inode** %inode.addr, align 8
  %i_size35 = getelementptr inbounds %struct.inode* %tmp34, i32 0, i32 0
  %tmp36 = load i64* %i_size35, align 8
  %cmp37 = icmp slt i64 %tmp33, %tmp36
  br i1 %cmp37, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp39 = load i8** %bh, align 8
  %tobool = icmp ne i8* %tmp39, null
  br i1 %tobool, label %if.end42, label %if.then40

if.then40:                                        ; preds = %while.body
  %tmp41 = load i32* %block, align 4
  %call = call i8* @isofs_bread(i32 %tmp41)
  store i8* %call, i8** %bh, align 8
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %while.body
  %tmp43 = load i32* %block, align 4
  %tmp44 = load i8* %bufbits, align 1
  %conv45 = zext i8 %tmp44 to i32
  %shl = shl i32 %tmp43, %conv45
  %tmp46 = load i32* %hs, align 4
  %add = add i32 %tmp46, %shl
  store i32 %add, i32* %hs, align 4
  %tmp47 = load i32* %hs, align 4
  %cmp48 = icmp eq i32 %tmp47, 0
  br i1 %cmp48, label %if.then50, label %if.end54

if.then50:                                        ; preds = %if.end42
  %tmp51 = load %struct.file** %filp.addr, align 8
  %f_pos52 = getelementptr inbounds %struct.file* %tmp51, i32 0, i32 0
  %tmp53 = load i64* %f_pos52, align 8
  %inc = add nsw i64 %tmp53, 1
  store i64 %inc, i64* %f_pos52, align 8
  br label %if.end54

if.end54:                                         ; preds = %if.then50, %if.end42
  %tmp55 = load i32* %offset, align 4
  %tmp56 = load i32* %bufsize, align 4
  %cmp57 = icmp uge i32 %tmp55, %tmp56
  br i1 %cmp57, label %if.then59, label %if.end64

if.then59:                                        ; preds = %if.end54
  %tmp60 = load i32* %bufsize, align 4
  %sub61 = sub nsw i32 %tmp60, 1
  %tmp62 = load i32* %offset, align 4
  %and63 = and i32 %tmp62, %sub61
  store i32 %and63, i32* %offset, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then59, %if.end54
  %tmp65 = load i8** %bh, align 8
  %tmp66 = load i8* %tmp65
  %tobool67 = icmp ne i8 %tmp66, 0
  br i1 %tobool67, label %if.then68, label %if.end73

if.then68:                                        ; preds = %if.end64
  %tmp69 = load %struct.file** %filp.addr, align 8
  %f_pos70 = getelementptr inbounds %struct.file* %tmp69, i32 0, i32 0
  %tmp71 = load i64* %f_pos70, align 8
  %inc72 = add nsw i64 %tmp71, 1
  store i64 %inc72, i64* %f_pos70, align 8
  br label %if.end73

if.end73:                                         ; preds = %if.then68, %if.end64
  %tmp74 = load %struct.file** %filp.addr, align 8
  %f_pos75 = getelementptr inbounds %struct.file* %tmp74, i32 0, i32 0
  %tmp76 = load i64* %f_pos75, align 8
  %inc77 = add nsw i64 %tmp76, 1
  store i64 %inc77, i64* %f_pos75, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

define internal i8* @isofs_bread(i32 %block) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %block.addr = alloca i32, align 4
  store i32 %block, i32* %block.addr, align 4
  %tmp = load i32* %block.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i8** %retval
  ret i8* %0
}

declare void @exit(i32) noreturn nounwind
