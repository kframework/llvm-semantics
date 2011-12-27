; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020402-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.ShrPcCommonStatSType = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.ShrPcGemStatSType = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [40 x i64] }
%struct.ShrPcMonStatSType = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, [10 x i64], [10 x i64], i64, i64 }
%struct.ShrPcPteSType = type { %struct.ShrPcStatsSType }
%struct.ShrPcStatsSType = type { i32, i32, %struct.ShrPcCommonStatSType, %union.ShrPcStatUnion }
%struct.WorkEntrySType = type { i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64* }
%union.ShrPcStatUnion = type { %struct.ShrPcGemStatSType }

@Local1 = common global i64* null, align 8
@Local2 = common global i64* null, align 8
@Local3 = common global i64* null, align 8
@RDbf1 = common global i64* null, align 8
@RDbf2 = common global i64* null, align 8
@RDbf3 = common global i64* null, align 8
@IntVc1 = common global i64* null, align 8
@IntVc2 = common global i64* null, align 8
@IntCode3 = common global i64* null, align 8
@IntCode4 = common global i64* null, align 8
@IntCode5 = common global i64* null, align 8
@IntCode6 = common global i64* null, align 8
@Lom1 = common global i64* null, align 8
@Lom2 = common global i64* null, align 8
@Lom3 = common global i64* null, align 8
@Lom4 = common global i64* null, align 8
@Lom5 = common global i64* null, align 8
@Lom6 = common global i64* null, align 8
@Lom7 = common global i64* null, align 8
@Lom8 = common global i64* null, align 8
@Lom9 = common global i64* null, align 8
@Lom10 = common global i64* null, align 8
@RDbf11 = common global i64* null, align 8
@RDbf12 = common global i64* null, align 8
@Workspace = common global %struct.WorkEntrySType zeroinitializer, align 8
@MyPte = common global %struct.ShrPcPteSType zeroinitializer, align 8

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

define void @InitCache(i32 %sessionId) nounwind uwtable {
entry:
  %sessionId.addr = alloca i32, align 4
  store i32 %sessionId, i32* %sessionId.addr, align 4
  %tmp = load i32* %sessionId.addr, align 4
  %conv = sext i32 %tmp to i64
  call void @initPte(i8* null, i64 %conv)
  ret void
}

define internal void @initPte(i8* %shrpcPtr, i64 %sessionId) nounwind uwtable {
entry:
  %shrpcPtr.addr = alloca i8*, align 8
  %sessionId.addr = alloca i64, align 8
  %ptePtr = alloca %struct.ShrPcPteSType*, align 8
  store i8* %shrpcPtr, i8** %shrpcPtr.addr, align 8
  store i64 %sessionId, i64* %sessionId.addr, align 8
  store %struct.ShrPcPteSType* @MyPte, %struct.ShrPcPteSType** %ptePtr, align 8
  %tmp = load %struct.ShrPcPteSType** %ptePtr, align 8
  %stats = getelementptr inbounds %struct.ShrPcPteSType* %tmp, i32 0, i32 0
  %tmp1 = load i64* %sessionId.addr, align 8
  call void @setStatPointers(%struct.ShrPcStatsSType* %stats, i64 %tmp1)
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @InitCache(i32 5)
  ret i32 0
}

define internal void @setStatPointers(%struct.ShrPcStatsSType* %statsPtr, i64 %sessionId) nounwind uwtable {
entry:
  %statsPtr.addr = alloca %struct.ShrPcStatsSType*, align 8
  %sessionId.addr = alloca i64, align 8
  %workSpPtr = alloca %struct.WorkEntrySType*, align 8
  store %struct.ShrPcStatsSType* %statsPtr, %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  store i64 %sessionId, i64* %sessionId.addr, align 8
  %tmp = load i64* %sessionId.addr, align 8
  %conv = trunc i64 %tmp to i32
  %tmp1 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %sessionId2 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp1, i32 0, i32 1
  store i32 %conv, i32* %sessionId2, align 4
  %tmp3 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn = getelementptr inbounds %struct.ShrPcStatsSType* %tmp3, i32 0, i32 2
  %a1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn, i32 0, i32 0
  store i64 0, i64* %a1, align 8
  %tmp4 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn5 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp4, i32 0, i32 2
  %n1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn5, i32 0, i32 1
  store i64 5, i64* %n1, align 8
  %tmp6 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn7 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp6, i32 0, i32 2
  %local1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn7, i32 0, i32 2
  store i64* %local1, i64** @Local1, align 8
  %tmp8 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn9 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp8, i32 0, i32 2
  %local2 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn9, i32 0, i32 3
  store i64* %local2, i64** @Local2, align 8
  %tmp10 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn11 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp10, i32 0, i32 2
  %local3 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn11, i32 0, i32 4
  store i64* %local3, i64** @Local3, align 8
  %tmp12 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn13 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp12, i32 0, i32 2
  %rdbf1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn13, i32 0, i32 5
  store i64* %rdbf1, i64** @RDbf1, align 8
  %tmp14 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn15 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp14, i32 0, i32 2
  %rdbf2 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn15, i32 0, i32 6
  store i64* %rdbf2, i64** @RDbf2, align 8
  %tmp16 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn17 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp16, i32 0, i32 2
  %milli = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn17, i32 0, i32 7
  store i64* %milli, i64** @RDbf3, align 8
  %tmp18 = load i64** @RDbf3, align 8
  store i64 1, i64* %tmp18
  %tmp19 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u = getelementptr inbounds %struct.ShrPcStatsSType* %tmp19, i32 0, i32 3
  %gem = bitcast %union.ShrPcStatUnion* %u to %struct.ShrPcGemStatSType*
  %a120 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem, i32 0, i32 12
  store i64* %a120, i64** @IntVc1, align 8
  %tmp21 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u22 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp21, i32 0, i32 3
  %gem23 = bitcast %union.ShrPcStatUnion* %u22 to %struct.ShrPcGemStatSType*
  %a2 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem23, i32 0, i32 13
  store i64* %a2, i64** @IntVc2, align 8
  %tmp24 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u25 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp24, i32 0, i32 3
  %gem26 = bitcast %union.ShrPcStatUnion* %u25 to %struct.ShrPcGemStatSType*
  %a3 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem26, i32 0, i32 14
  store i64* %a3, i64** @IntCode3, align 8
  %tmp27 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u28 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp27, i32 0, i32 3
  %gem29 = bitcast %union.ShrPcStatUnion* %u28 to %struct.ShrPcGemStatSType*
  %a4 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem29, i32 0, i32 15
  store i64* %a4, i64** @IntCode4, align 8
  %tmp30 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u31 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp30, i32 0, i32 3
  %gem32 = bitcast %union.ShrPcStatUnion* %u31 to %struct.ShrPcGemStatSType*
  %a5 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem32, i32 0, i32 16
  store i64* %a5, i64** @IntCode5, align 8
  %tmp33 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u34 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp33, i32 0, i32 3
  %gem35 = bitcast %union.ShrPcStatUnion* %u34 to %struct.ShrPcGemStatSType*
  %a6 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem35, i32 0, i32 17
  store i64* %a6, i64** @IntCode6, align 8
  store %struct.WorkEntrySType* @Workspace, %struct.WorkEntrySType** %workSpPtr, align 8
  %tmp37 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u38 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp37, i32 0, i32 3
  %gem39 = bitcast %union.ShrPcStatUnion* %u38 to %struct.ShrPcGemStatSType*
  %a7 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem39, i32 0, i32 18
  %tmp40 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p1 = getelementptr inbounds %struct.WorkEntrySType* %tmp40, i32 0, i32 0
  store i64* %a7, i64** %p1, align 8
  %tmp41 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u42 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp41, i32 0, i32 3
  %gem43 = bitcast %union.ShrPcStatUnion* %u42 to %struct.ShrPcGemStatSType*
  %a8 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem43, i32 0, i32 19
  %tmp44 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p2 = getelementptr inbounds %struct.WorkEntrySType* %tmp44, i32 0, i32 1
  store i64* %a8, i64** %p2, align 8
  %tmp45 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u46 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp45, i32 0, i32 3
  %gem47 = bitcast %union.ShrPcStatUnion* %u46 to %struct.ShrPcGemStatSType*
  %a9 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem47, i32 0, i32 20
  %tmp48 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p3 = getelementptr inbounds %struct.WorkEntrySType* %tmp48, i32 0, i32 2
  store i64* %a9, i64** %p3, align 8
  %tmp49 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u50 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp49, i32 0, i32 3
  %gem51 = bitcast %union.ShrPcStatUnion* %u50 to %struct.ShrPcGemStatSType*
  %a10 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem51, i32 0, i32 21
  %tmp52 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p4 = getelementptr inbounds %struct.WorkEntrySType* %tmp52, i32 0, i32 3
  store i64* %a10, i64** %p4, align 8
  %tmp53 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u54 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp53, i32 0, i32 3
  %gem55 = bitcast %union.ShrPcStatUnion* %u54 to %struct.ShrPcGemStatSType*
  %a11 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem55, i32 0, i32 22
  %tmp56 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p5 = getelementptr inbounds %struct.WorkEntrySType* %tmp56, i32 0, i32 4
  store i64* %a11, i64** %p5, align 8
  %tmp57 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u58 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp57, i32 0, i32 3
  %gem59 = bitcast %union.ShrPcStatUnion* %u58 to %struct.ShrPcGemStatSType*
  %a12 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem59, i32 0, i32 23
  %tmp60 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p6 = getelementptr inbounds %struct.WorkEntrySType* %tmp60, i32 0, i32 5
  store i64* %a12, i64** %p6, align 8
  %tmp61 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u62 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp61, i32 0, i32 3
  %gem63 = bitcast %union.ShrPcStatUnion* %u62 to %struct.ShrPcGemStatSType*
  %a13 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem63, i32 0, i32 24
  %tmp64 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p7 = getelementptr inbounds %struct.WorkEntrySType* %tmp64, i32 0, i32 6
  store i64* %a13, i64** %p7, align 8
  %tmp65 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u66 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp65, i32 0, i32 3
  %gem67 = bitcast %union.ShrPcStatUnion* %u66 to %struct.ShrPcGemStatSType*
  %a14 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem67, i32 0, i32 25
  %tmp68 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p8 = getelementptr inbounds %struct.WorkEntrySType* %tmp68, i32 0, i32 7
  store i64* %a14, i64** %p8, align 8
  %tmp69 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u70 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp69, i32 0, i32 3
  %gem71 = bitcast %union.ShrPcStatUnion* %u70 to %struct.ShrPcGemStatSType*
  %a15 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem71, i32 0, i32 26
  %tmp72 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p9 = getelementptr inbounds %struct.WorkEntrySType* %tmp72, i32 0, i32 8
  store i64* %a15, i64** %p9, align 8
  %tmp73 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u74 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp73, i32 0, i32 3
  %gem75 = bitcast %union.ShrPcStatUnion* %u74 to %struct.ShrPcGemStatSType*
  %a16 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem75, i32 0, i32 27
  %tmp76 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p10 = getelementptr inbounds %struct.WorkEntrySType* %tmp76, i32 0, i32 9
  store i64* %a16, i64** %p10, align 8
  %tmp77 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u78 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp77, i32 0, i32 3
  %gem79 = bitcast %union.ShrPcStatUnion* %u78 to %struct.ShrPcGemStatSType*
  %a17 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem79, i32 0, i32 28
  %tmp80 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p11 = getelementptr inbounds %struct.WorkEntrySType* %tmp80, i32 0, i32 10
  store i64* %a17, i64** %p11, align 8
  %tmp81 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u82 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp81, i32 0, i32 3
  %gem83 = bitcast %union.ShrPcStatUnion* %u82 to %struct.ShrPcGemStatSType*
  %c1 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem83, i32 0, i32 0
  store i64* %c1, i64** @Lom1, align 8
  %tmp84 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u85 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp84, i32 0, i32 3
  %gem86 = bitcast %union.ShrPcStatUnion* %u85 to %struct.ShrPcGemStatSType*
  %c2 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem86, i32 0, i32 1
  store i64* %c2, i64** @Lom2, align 8
  %tmp87 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u88 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp87, i32 0, i32 3
  %gem89 = bitcast %union.ShrPcStatUnion* %u88 to %struct.ShrPcGemStatSType*
  %c3 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem89, i32 0, i32 2
  store i64* %c3, i64** @Lom3, align 8
  %tmp90 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u91 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp90, i32 0, i32 3
  %gem92 = bitcast %union.ShrPcStatUnion* %u91 to %struct.ShrPcGemStatSType*
  %c4 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem92, i32 0, i32 3
  store i64* %c4, i64** @Lom4, align 8
  %tmp93 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u94 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp93, i32 0, i32 3
  %gem95 = bitcast %union.ShrPcStatUnion* %u94 to %struct.ShrPcGemStatSType*
  %c5 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem95, i32 0, i32 4
  store i64* %c5, i64** @Lom5, align 8
  %tmp96 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u97 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp96, i32 0, i32 3
  %gem98 = bitcast %union.ShrPcStatUnion* %u97 to %struct.ShrPcGemStatSType*
  %c6 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem98, i32 0, i32 5
  store i64* %c6, i64** @Lom6, align 8
  %tmp99 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u100 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp99, i32 0, i32 3
  %gem101 = bitcast %union.ShrPcStatUnion* %u100 to %struct.ShrPcGemStatSType*
  %c7 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem101, i32 0, i32 6
  store i64* %c7, i64** @Lom7, align 8
  %tmp102 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u103 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp102, i32 0, i32 3
  %gem104 = bitcast %union.ShrPcStatUnion* %u103 to %struct.ShrPcGemStatSType*
  %c8 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem104, i32 0, i32 7
  store i64* %c8, i64** @Lom8, align 8
  %tmp105 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u106 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp105, i32 0, i32 3
  %gem107 = bitcast %union.ShrPcStatUnion* %u106 to %struct.ShrPcGemStatSType*
  %c9 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem107, i32 0, i32 8
  store i64* %c9, i64** @Lom9, align 8
  %tmp108 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u109 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp108, i32 0, i32 3
  %gem110 = bitcast %union.ShrPcStatUnion* %u109 to %struct.ShrPcGemStatSType*
  %c10 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem110, i32 0, i32 9
  store i64* %c10, i64** @Lom10, align 8
  %tmp111 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u112 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp111, i32 0, i32 3
  %gem113 = bitcast %union.ShrPcStatUnion* %u112 to %struct.ShrPcGemStatSType*
  %c11 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem113, i32 0, i32 10
  store i64* %c11, i64** @RDbf11, align 8
  %tmp114 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u115 = getelementptr inbounds %struct.ShrPcStatsSType* %tmp114, i32 0, i32 3
  %gem116 = bitcast %union.ShrPcStatUnion* %u115 to %struct.ShrPcGemStatSType*
  %c12 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem116, i32 0, i32 11
  store i64* %c12, i64** @RDbf12, align 8
  ret void
}
