; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001124-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.super_block = type { i32, i8, i32 }
%struct.inode = type { i64, %struct.super_block* }
%struct.file = type { i64 }

@s = common global %struct.super_block zeroinitializer, align 4
@i = common global %struct.inode zeroinitializer, align 8
@f = common global %struct.file zeroinitializer, align 8

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
  %0 = load %struct.inode** %inode.addr, align 8
  %i_sb = getelementptr inbounds %struct.inode* %0, i32 0, i32 1
  %1 = load %struct.super_block** %i_sb, align 8
  %s_blocksize = getelementptr inbounds %struct.super_block* %1, i32 0, i32 0
  %2 = load i32* %s_blocksize, align 4
  store i32 %2, i32* %bufsize, align 4
  %3 = load %struct.inode** %inode.addr, align 8
  %i_sb1 = getelementptr inbounds %struct.inode* %3, i32 0, i32 1
  %4 = load %struct.super_block** %i_sb1, align 8
  %s_blocksize_bits = getelementptr inbounds %struct.super_block* %4, i32 0, i32 1
  %5 = load i8* %s_blocksize_bits, align 1
  store i8 %5, i8* %bufbits, align 1
  store i8* null, i8** %bh, align 8
  %6 = load %struct.file** %filp.addr, align 8
  %f_pos = getelementptr inbounds %struct.file* %6, i32 0, i32 0
  %7 = load i64* %f_pos, align 8
  %8 = load %struct.inode** %inode.addr, align 8
  %i_size = getelementptr inbounds %struct.inode* %8, i32 0, i32 0
  %9 = load i64* %i_size, align 8
  %cmp = icmp sge i64 %7, %9
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %10 = load %struct.file** %filp.addr, align 8
  %f_pos2 = getelementptr inbounds %struct.file* %10, i32 0, i32 0
  %11 = load i64* %f_pos2, align 8
  %12 = load i32* %bufsize, align 4
  %sub = sub nsw i32 %12, 1
  %conv = sext i32 %sub to i64
  %and = and i64 %11, %conv
  %conv3 = trunc i64 %and to i32
  store i32 %conv3, i32* %offset, align 4
  %13 = load %struct.file** %filp.addr, align 8
  %f_pos4 = getelementptr inbounds %struct.file* %13, i32 0, i32 0
  %14 = load i64* %f_pos4, align 8
  %15 = load i8* %bufbits, align 1
  %conv5 = zext i8 %15 to i32
  %sh_prom = zext i32 %conv5 to i64
  %shr = ashr i64 %14, %sh_prom
  %conv6 = trunc i64 %shr to i32
  store i32 %conv6, i32* %block, align 4
  %16 = load %struct.inode** %inode.addr, align 8
  %i_sb7 = getelementptr inbounds %struct.inode* %16, i32 0, i32 1
  %17 = load %struct.super_block** %i_sb7, align 8
  %s_hs = getelementptr inbounds %struct.super_block* %17, i32 0, i32 2
  %18 = load i32* %s_hs, align 4
  store i32 %18, i32* %hs, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end30, %if.end
  %19 = load %struct.file** %filp.addr, align 8
  %f_pos8 = getelementptr inbounds %struct.file* %19, i32 0, i32 0
  %20 = load i64* %f_pos8, align 8
  %21 = load %struct.inode** %inode.addr, align 8
  %i_size9 = getelementptr inbounds %struct.inode* %21, i32 0, i32 0
  %22 = load i64* %i_size9, align 8
  %cmp10 = icmp slt i64 %20, %22
  br i1 %cmp10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %23 = load i8** %bh, align 8
  %tobool = icmp ne i8* %23, null
  br i1 %tobool, label %if.end13, label %if.then12

if.then12:                                        ; preds = %while.body
  %24 = load i32* %block, align 4
  %call = call i8* @isofs_bread(i32 %24)
  store i8* %call, i8** %bh, align 8
  br label %if.end13

if.end13:                                         ; preds = %if.then12, %while.body
  %25 = load i32* %block, align 4
  %26 = load i8* %bufbits, align 1
  %conv14 = zext i8 %26 to i32
  %shl = shl i32 %25, %conv14
  %27 = load i32* %hs, align 4
  %add = add i32 %27, %shl
  store i32 %add, i32* %hs, align 4
  %28 = load i32* %hs, align 4
  %cmp15 = icmp eq i32 %28, 0
  br i1 %cmp15, label %if.then17, label %if.end19

if.then17:                                        ; preds = %if.end13
  %29 = load %struct.file** %filp.addr, align 8
  %f_pos18 = getelementptr inbounds %struct.file* %29, i32 0, i32 0
  %30 = load i64* %f_pos18, align 8
  %inc = add nsw i64 %30, 1
  store i64 %inc, i64* %f_pos18, align 8
  br label %if.end19

if.end19:                                         ; preds = %if.then17, %if.end13
  %31 = load i32* %offset, align 4
  %32 = load i32* %bufsize, align 4
  %cmp20 = icmp uge i32 %31, %32
  br i1 %cmp20, label %if.then22, label %if.end25

if.then22:                                        ; preds = %if.end19
  %33 = load i32* %bufsize, align 4
  %sub23 = sub nsw i32 %33, 1
  %34 = load i32* %offset, align 4
  %and24 = and i32 %34, %sub23
  store i32 %and24, i32* %offset, align 4
  br label %if.end25

if.end25:                                         ; preds = %if.then22, %if.end19
  %35 = load i8** %bh, align 8
  %36 = load i8* %35, align 1
  %tobool26 = icmp ne i8 %36, 0
  br i1 %tobool26, label %if.then27, label %if.end30

if.then27:                                        ; preds = %if.end25
  %37 = load %struct.file** %filp.addr, align 8
  %f_pos28 = getelementptr inbounds %struct.file* %37, i32 0, i32 0
  %38 = load i64* %f_pos28, align 8
  %inc29 = add nsw i64 %38, 1
  store i64 %inc29, i64* %f_pos28, align 8
  br label %if.end30

if.end30:                                         ; preds = %if.then27, %if.end25
  %39 = load %struct.file** %filp.addr, align 8
  %f_pos31 = getelementptr inbounds %struct.file* %39, i32 0, i32 0
  %40 = load i64* %f_pos31, align 8
  %inc32 = add nsw i64 %40, 1
  store i64 %inc32, i64* %f_pos31, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.then
  %41 = load i32* %retval
  ret i32 %41
}

declare void @abort() noreturn nounwind

define internal i8* @isofs_bread(i32 %block) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %block.addr = alloca i32, align 4
  store i32 %block, i32* %block.addr, align 4
  %0 = load i32* %block.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i8** %retval
  ret i8* %1
}

declare void @exit(i32) noreturn nounwind
