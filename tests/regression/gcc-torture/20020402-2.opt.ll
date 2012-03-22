; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020402-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.ShrPcCommonStatSType = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.ShrPcGemStatSType = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [40 x i64] }
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

define void @InitCache(i32 %sessionId) nounwind uwtable {
entry:
  store i32 %sessionId, i32* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 1), align 4
  store i64 0, i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 0), align 8
  store i64 5, i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 1), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 2), i64** @Local1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 3), i64** @Local2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 4), i64** @Local3, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 5), i64** @RDbf1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 6), i64** @RDbf2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 7), i64** @RDbf3, align 8
  store i64 1, i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 7), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 12), i64** @IntVc1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 13), i64** @IntVc2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 14), i64** @IntCode3, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 15), i64** @IntCode4, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 16), i64** @IntCode5, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 17), i64** @IntCode6, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 18), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 0), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 19), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 1), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 20), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 2), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 21), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 3), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 22), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 4), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 23), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 5), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 24), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 6), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 25), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 7), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 26), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 8), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 27), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 9), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 28), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 10), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 0), i64** @Lom1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 1), i64** @Lom2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 2), i64** @Lom3, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 3), i64** @Lom4, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 4), i64** @Lom5, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 5), i64** @Lom6, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 6), i64** @Lom7, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 7), i64** @Lom8, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 8), i64** @Lom9, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 9), i64** @Lom10, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 10), i64** @RDbf11, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 11), i64** @RDbf12, align 8
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 5, i32* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 1), align 4
  store i64 0, i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 0), align 8
  store i64 5, i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 1), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 2), i64** @Local1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 3), i64** @Local2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 4), i64** @Local3, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 5), i64** @RDbf1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 6), i64** @RDbf2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 7), i64** @RDbf3, align 8
  store i64 1, i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 2, i32 7), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 12), i64** @IntVc1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 13), i64** @IntVc2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 14), i64** @IntCode3, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 15), i64** @IntCode4, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 16), i64** @IntCode5, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 17), i64** @IntCode6, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 18), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 0), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 19), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 1), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 20), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 2), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 21), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 3), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 22), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 4), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 23), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 5), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 24), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 6), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 25), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 7), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 26), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 8), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 27), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 9), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 28), i64** getelementptr inbounds (%struct.WorkEntrySType* @Workspace, i64 0, i32 10), align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 0), i64** @Lom1, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 1), i64** @Lom2, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 2), i64** @Lom3, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 3), i64** @Lom4, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 4), i64** @Lom5, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 5), i64** @Lom6, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 6), i64** @Lom7, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 7), i64** @Lom8, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 8), i64** @Lom9, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 9), i64** @Lom10, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 10), i64** @RDbf11, align 8
  store i64* getelementptr inbounds (%struct.ShrPcPteSType* @MyPte, i64 0, i32 0, i32 3, i32 0, i32 11), i64** @RDbf12, align 8
  ret i32 0
}
