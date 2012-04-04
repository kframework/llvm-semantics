; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020402-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.WorkEntrySType = type { i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64*, i64* }
%struct.ShrPcPteSType = type { %struct.ShrPcStatsSType }
%struct.ShrPcStatsSType = type { i32, i32, %struct.ShrPcCommonStatSType, %union.ShrPcStatUnion }
%struct.ShrPcCommonStatSType = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%union.ShrPcStatUnion = type { %struct.ShrPcGemStatSType }
%struct.ShrPcGemStatSType = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [40 x i64] }

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

define void @InitCache(i32 %sessionId) nounwind uwtable {
entry:
  %sessionId.addr = alloca i32, align 4
  store i32 %sessionId, i32* %sessionId.addr, align 4
  %0 = load i32* %sessionId.addr, align 4
  %conv = sext i32 %0 to i64
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
  %0 = load %struct.ShrPcPteSType** %ptePtr, align 8
  %stats = getelementptr inbounds %struct.ShrPcPteSType* %0, i32 0, i32 0
  %1 = load i64* %sessionId.addr, align 8
  call void @setStatPointers(%struct.ShrPcStatsSType* %stats, i64 %1)
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
  %0 = load i64* %sessionId.addr, align 8
  %conv = trunc i64 %0 to i32
  %1 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %sessionId1 = getelementptr inbounds %struct.ShrPcStatsSType* %1, i32 0, i32 1
  store i32 %conv, i32* %sessionId1, align 4
  %2 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn = getelementptr inbounds %struct.ShrPcStatsSType* %2, i32 0, i32 2
  %a1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn, i32 0, i32 0
  store i64 0, i64* %a1, align 8
  %3 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn2 = getelementptr inbounds %struct.ShrPcStatsSType* %3, i32 0, i32 2
  %n1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn2, i32 0, i32 1
  store i64 5, i64* %n1, align 8
  %4 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn3 = getelementptr inbounds %struct.ShrPcStatsSType* %4, i32 0, i32 2
  %local1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn3, i32 0, i32 2
  store i64* %local1, i64** @Local1, align 8
  %5 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn4 = getelementptr inbounds %struct.ShrPcStatsSType* %5, i32 0, i32 2
  %local2 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn4, i32 0, i32 3
  store i64* %local2, i64** @Local2, align 8
  %6 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn5 = getelementptr inbounds %struct.ShrPcStatsSType* %6, i32 0, i32 2
  %local3 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn5, i32 0, i32 4
  store i64* %local3, i64** @Local3, align 8
  %7 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn6 = getelementptr inbounds %struct.ShrPcStatsSType* %7, i32 0, i32 2
  %rdbf1 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn6, i32 0, i32 5
  store i64* %rdbf1, i64** @RDbf1, align 8
  %8 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn7 = getelementptr inbounds %struct.ShrPcStatsSType* %8, i32 0, i32 2
  %rdbf2 = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn7, i32 0, i32 6
  store i64* %rdbf2, i64** @RDbf2, align 8
  %9 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %cmn8 = getelementptr inbounds %struct.ShrPcStatsSType* %9, i32 0, i32 2
  %milli = getelementptr inbounds %struct.ShrPcCommonStatSType* %cmn8, i32 0, i32 7
  store i64* %milli, i64** @RDbf3, align 8
  %10 = load i64** @RDbf3, align 8
  store i64 1, i64* %10, align 8
  %11 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u = getelementptr inbounds %struct.ShrPcStatsSType* %11, i32 0, i32 3
  %gem = bitcast %union.ShrPcStatUnion* %u to %struct.ShrPcGemStatSType*
  %a19 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem, i32 0, i32 12
  store i64* %a19, i64** @IntVc1, align 8
  %12 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u10 = getelementptr inbounds %struct.ShrPcStatsSType* %12, i32 0, i32 3
  %gem11 = bitcast %union.ShrPcStatUnion* %u10 to %struct.ShrPcGemStatSType*
  %a2 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem11, i32 0, i32 13
  store i64* %a2, i64** @IntVc2, align 8
  %13 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u12 = getelementptr inbounds %struct.ShrPcStatsSType* %13, i32 0, i32 3
  %gem13 = bitcast %union.ShrPcStatUnion* %u12 to %struct.ShrPcGemStatSType*
  %a3 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem13, i32 0, i32 14
  store i64* %a3, i64** @IntCode3, align 8
  %14 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u14 = getelementptr inbounds %struct.ShrPcStatsSType* %14, i32 0, i32 3
  %gem15 = bitcast %union.ShrPcStatUnion* %u14 to %struct.ShrPcGemStatSType*
  %a4 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem15, i32 0, i32 15
  store i64* %a4, i64** @IntCode4, align 8
  %15 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u16 = getelementptr inbounds %struct.ShrPcStatsSType* %15, i32 0, i32 3
  %gem17 = bitcast %union.ShrPcStatUnion* %u16 to %struct.ShrPcGemStatSType*
  %a5 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem17, i32 0, i32 16
  store i64* %a5, i64** @IntCode5, align 8
  %16 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u18 = getelementptr inbounds %struct.ShrPcStatsSType* %16, i32 0, i32 3
  %gem19 = bitcast %union.ShrPcStatUnion* %u18 to %struct.ShrPcGemStatSType*
  %a6 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem19, i32 0, i32 17
  store i64* %a6, i64** @IntCode6, align 8
  store %struct.WorkEntrySType* @Workspace, %struct.WorkEntrySType** %workSpPtr, align 8
  %17 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u20 = getelementptr inbounds %struct.ShrPcStatsSType* %17, i32 0, i32 3
  %gem21 = bitcast %union.ShrPcStatUnion* %u20 to %struct.ShrPcGemStatSType*
  %a7 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem21, i32 0, i32 18
  %18 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p1 = getelementptr inbounds %struct.WorkEntrySType* %18, i32 0, i32 0
  store i64* %a7, i64** %p1, align 8
  %19 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u22 = getelementptr inbounds %struct.ShrPcStatsSType* %19, i32 0, i32 3
  %gem23 = bitcast %union.ShrPcStatUnion* %u22 to %struct.ShrPcGemStatSType*
  %a8 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem23, i32 0, i32 19
  %20 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p2 = getelementptr inbounds %struct.WorkEntrySType* %20, i32 0, i32 1
  store i64* %a8, i64** %p2, align 8
  %21 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u24 = getelementptr inbounds %struct.ShrPcStatsSType* %21, i32 0, i32 3
  %gem25 = bitcast %union.ShrPcStatUnion* %u24 to %struct.ShrPcGemStatSType*
  %a9 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem25, i32 0, i32 20
  %22 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p3 = getelementptr inbounds %struct.WorkEntrySType* %22, i32 0, i32 2
  store i64* %a9, i64** %p3, align 8
  %23 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u26 = getelementptr inbounds %struct.ShrPcStatsSType* %23, i32 0, i32 3
  %gem27 = bitcast %union.ShrPcStatUnion* %u26 to %struct.ShrPcGemStatSType*
  %a10 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem27, i32 0, i32 21
  %24 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p4 = getelementptr inbounds %struct.WorkEntrySType* %24, i32 0, i32 3
  store i64* %a10, i64** %p4, align 8
  %25 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u28 = getelementptr inbounds %struct.ShrPcStatsSType* %25, i32 0, i32 3
  %gem29 = bitcast %union.ShrPcStatUnion* %u28 to %struct.ShrPcGemStatSType*
  %a11 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem29, i32 0, i32 22
  %26 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p5 = getelementptr inbounds %struct.WorkEntrySType* %26, i32 0, i32 4
  store i64* %a11, i64** %p5, align 8
  %27 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u30 = getelementptr inbounds %struct.ShrPcStatsSType* %27, i32 0, i32 3
  %gem31 = bitcast %union.ShrPcStatUnion* %u30 to %struct.ShrPcGemStatSType*
  %a12 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem31, i32 0, i32 23
  %28 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p6 = getelementptr inbounds %struct.WorkEntrySType* %28, i32 0, i32 5
  store i64* %a12, i64** %p6, align 8
  %29 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u32 = getelementptr inbounds %struct.ShrPcStatsSType* %29, i32 0, i32 3
  %gem33 = bitcast %union.ShrPcStatUnion* %u32 to %struct.ShrPcGemStatSType*
  %a13 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem33, i32 0, i32 24
  %30 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p7 = getelementptr inbounds %struct.WorkEntrySType* %30, i32 0, i32 6
  store i64* %a13, i64** %p7, align 8
  %31 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u34 = getelementptr inbounds %struct.ShrPcStatsSType* %31, i32 0, i32 3
  %gem35 = bitcast %union.ShrPcStatUnion* %u34 to %struct.ShrPcGemStatSType*
  %a14 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem35, i32 0, i32 25
  %32 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p8 = getelementptr inbounds %struct.WorkEntrySType* %32, i32 0, i32 7
  store i64* %a14, i64** %p8, align 8
  %33 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u36 = getelementptr inbounds %struct.ShrPcStatsSType* %33, i32 0, i32 3
  %gem37 = bitcast %union.ShrPcStatUnion* %u36 to %struct.ShrPcGemStatSType*
  %a15 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem37, i32 0, i32 26
  %34 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p9 = getelementptr inbounds %struct.WorkEntrySType* %34, i32 0, i32 8
  store i64* %a15, i64** %p9, align 8
  %35 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u38 = getelementptr inbounds %struct.ShrPcStatsSType* %35, i32 0, i32 3
  %gem39 = bitcast %union.ShrPcStatUnion* %u38 to %struct.ShrPcGemStatSType*
  %a16 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem39, i32 0, i32 27
  %36 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p10 = getelementptr inbounds %struct.WorkEntrySType* %36, i32 0, i32 9
  store i64* %a16, i64** %p10, align 8
  %37 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u40 = getelementptr inbounds %struct.ShrPcStatsSType* %37, i32 0, i32 3
  %gem41 = bitcast %union.ShrPcStatUnion* %u40 to %struct.ShrPcGemStatSType*
  %a17 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem41, i32 0, i32 28
  %38 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %p11 = getelementptr inbounds %struct.WorkEntrySType* %38, i32 0, i32 10
  store i64* %a17, i64** %p11, align 8
  %39 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u42 = getelementptr inbounds %struct.ShrPcStatsSType* %39, i32 0, i32 3
  %gem43 = bitcast %union.ShrPcStatUnion* %u42 to %struct.ShrPcGemStatSType*
  %c1 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem43, i32 0, i32 0
  store i64* %c1, i64** @Lom1, align 8
  %40 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u44 = getelementptr inbounds %struct.ShrPcStatsSType* %40, i32 0, i32 3
  %gem45 = bitcast %union.ShrPcStatUnion* %u44 to %struct.ShrPcGemStatSType*
  %c2 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem45, i32 0, i32 1
  store i64* %c2, i64** @Lom2, align 8
  %41 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u46 = getelementptr inbounds %struct.ShrPcStatsSType* %41, i32 0, i32 3
  %gem47 = bitcast %union.ShrPcStatUnion* %u46 to %struct.ShrPcGemStatSType*
  %c3 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem47, i32 0, i32 2
  store i64* %c3, i64** @Lom3, align 8
  %42 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u48 = getelementptr inbounds %struct.ShrPcStatsSType* %42, i32 0, i32 3
  %gem49 = bitcast %union.ShrPcStatUnion* %u48 to %struct.ShrPcGemStatSType*
  %c4 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem49, i32 0, i32 3
  store i64* %c4, i64** @Lom4, align 8
  %43 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u50 = getelementptr inbounds %struct.ShrPcStatsSType* %43, i32 0, i32 3
  %gem51 = bitcast %union.ShrPcStatUnion* %u50 to %struct.ShrPcGemStatSType*
  %c5 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem51, i32 0, i32 4
  store i64* %c5, i64** @Lom5, align 8
  %44 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u52 = getelementptr inbounds %struct.ShrPcStatsSType* %44, i32 0, i32 3
  %gem53 = bitcast %union.ShrPcStatUnion* %u52 to %struct.ShrPcGemStatSType*
  %c6 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem53, i32 0, i32 5
  store i64* %c6, i64** @Lom6, align 8
  %45 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u54 = getelementptr inbounds %struct.ShrPcStatsSType* %45, i32 0, i32 3
  %gem55 = bitcast %union.ShrPcStatUnion* %u54 to %struct.ShrPcGemStatSType*
  %c7 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem55, i32 0, i32 6
  store i64* %c7, i64** @Lom7, align 8
  %46 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u56 = getelementptr inbounds %struct.ShrPcStatsSType* %46, i32 0, i32 3
  %gem57 = bitcast %union.ShrPcStatUnion* %u56 to %struct.ShrPcGemStatSType*
  %c8 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem57, i32 0, i32 7
  store i64* %c8, i64** @Lom8, align 8
  %47 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u58 = getelementptr inbounds %struct.ShrPcStatsSType* %47, i32 0, i32 3
  %gem59 = bitcast %union.ShrPcStatUnion* %u58 to %struct.ShrPcGemStatSType*
  %c9 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem59, i32 0, i32 8
  store i64* %c9, i64** @Lom9, align 8
  %48 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u60 = getelementptr inbounds %struct.ShrPcStatsSType* %48, i32 0, i32 3
  %gem61 = bitcast %union.ShrPcStatUnion* %u60 to %struct.ShrPcGemStatSType*
  %c10 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem61, i32 0, i32 9
  store i64* %c10, i64** @Lom10, align 8
  %49 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u62 = getelementptr inbounds %struct.ShrPcStatsSType* %49, i32 0, i32 3
  %gem63 = bitcast %union.ShrPcStatUnion* %u62 to %struct.ShrPcGemStatSType*
  %c11 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem63, i32 0, i32 10
  store i64* %c11, i64** @RDbf11, align 8
  %50 = load %struct.ShrPcStatsSType** %statsPtr.addr, align 8
  %u64 = getelementptr inbounds %struct.ShrPcStatsSType* %50, i32 0, i32 3
  %gem65 = bitcast %union.ShrPcStatUnion* %u64 to %struct.ShrPcGemStatSType*
  %c12 = getelementptr inbounds %struct.ShrPcGemStatSType* %gem65, i32 0, i32 11
  store i64* %c12, i64** @RDbf12, align 8
  ret void
}
