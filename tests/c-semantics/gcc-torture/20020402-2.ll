; ModuleID = './20020402-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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

; Function Attrs: nounwind uwtable
define void @InitCache(i32 %sessionId) #0 {
  %1 = alloca i32, align 4
  store i32 %sessionId, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  call void @initPte(i8* null, i64 %3)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @initPte(i8* %shrpcPtr, i64 %sessionId) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %ptePtr = alloca %struct.ShrPcPteSType*, align 8
  store i8* %shrpcPtr, i8** %1, align 8
  store i64 %sessionId, i64* %2, align 8
  store %struct.ShrPcPteSType* @MyPte, %struct.ShrPcPteSType** %ptePtr, align 8
  %3 = load %struct.ShrPcPteSType** %ptePtr, align 8
  %4 = getelementptr inbounds %struct.ShrPcPteSType* %3, i32 0, i32 0
  %5 = load i64* %2, align 8
  call void @setStatPointers(%struct.ShrPcStatsSType* %4, i64 %5)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  call void @InitCache(i32 5)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @setStatPointers(%struct.ShrPcStatsSType* %statsPtr, i64 %sessionId) #0 {
  %1 = alloca %struct.ShrPcStatsSType*, align 8
  %2 = alloca i64, align 8
  %workSpPtr = alloca %struct.WorkEntrySType*, align 8
  store %struct.ShrPcStatsSType* %statsPtr, %struct.ShrPcStatsSType** %1, align 8
  store i64 %sessionId, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = trunc i64 %3 to i32
  %5 = load %struct.ShrPcStatsSType** %1, align 8
  %6 = getelementptr inbounds %struct.ShrPcStatsSType* %5, i32 0, i32 1
  store i32 %4, i32* %6, align 4
  %7 = load %struct.ShrPcStatsSType** %1, align 8
  %8 = getelementptr inbounds %struct.ShrPcStatsSType* %7, i32 0, i32 2
  %9 = getelementptr inbounds %struct.ShrPcCommonStatSType* %8, i32 0, i32 0
  store i64 0, i64* %9, align 8
  %10 = load %struct.ShrPcStatsSType** %1, align 8
  %11 = getelementptr inbounds %struct.ShrPcStatsSType* %10, i32 0, i32 2
  %12 = getelementptr inbounds %struct.ShrPcCommonStatSType* %11, i32 0, i32 1
  store i64 5, i64* %12, align 8
  %13 = load %struct.ShrPcStatsSType** %1, align 8
  %14 = getelementptr inbounds %struct.ShrPcStatsSType* %13, i32 0, i32 2
  %15 = getelementptr inbounds %struct.ShrPcCommonStatSType* %14, i32 0, i32 2
  store i64* %15, i64** @Local1, align 8
  %16 = load %struct.ShrPcStatsSType** %1, align 8
  %17 = getelementptr inbounds %struct.ShrPcStatsSType* %16, i32 0, i32 2
  %18 = getelementptr inbounds %struct.ShrPcCommonStatSType* %17, i32 0, i32 3
  store i64* %18, i64** @Local2, align 8
  %19 = load %struct.ShrPcStatsSType** %1, align 8
  %20 = getelementptr inbounds %struct.ShrPcStatsSType* %19, i32 0, i32 2
  %21 = getelementptr inbounds %struct.ShrPcCommonStatSType* %20, i32 0, i32 4
  store i64* %21, i64** @Local3, align 8
  %22 = load %struct.ShrPcStatsSType** %1, align 8
  %23 = getelementptr inbounds %struct.ShrPcStatsSType* %22, i32 0, i32 2
  %24 = getelementptr inbounds %struct.ShrPcCommonStatSType* %23, i32 0, i32 5
  store i64* %24, i64** @RDbf1, align 8
  %25 = load %struct.ShrPcStatsSType** %1, align 8
  %26 = getelementptr inbounds %struct.ShrPcStatsSType* %25, i32 0, i32 2
  %27 = getelementptr inbounds %struct.ShrPcCommonStatSType* %26, i32 0, i32 6
  store i64* %27, i64** @RDbf2, align 8
  %28 = load %struct.ShrPcStatsSType** %1, align 8
  %29 = getelementptr inbounds %struct.ShrPcStatsSType* %28, i32 0, i32 2
  %30 = getelementptr inbounds %struct.ShrPcCommonStatSType* %29, i32 0, i32 7
  store i64* %30, i64** @RDbf3, align 8
  %31 = load i64** @RDbf3, align 8
  store i64 1, i64* %31, align 8
  %32 = load %struct.ShrPcStatsSType** %1, align 8
  %33 = getelementptr inbounds %struct.ShrPcStatsSType* %32, i32 0, i32 3
  %34 = bitcast %union.ShrPcStatUnion* %33 to %struct.ShrPcGemStatSType*
  %35 = getelementptr inbounds %struct.ShrPcGemStatSType* %34, i32 0, i32 12
  store i64* %35, i64** @IntVc1, align 8
  %36 = load %struct.ShrPcStatsSType** %1, align 8
  %37 = getelementptr inbounds %struct.ShrPcStatsSType* %36, i32 0, i32 3
  %38 = bitcast %union.ShrPcStatUnion* %37 to %struct.ShrPcGemStatSType*
  %39 = getelementptr inbounds %struct.ShrPcGemStatSType* %38, i32 0, i32 13
  store i64* %39, i64** @IntVc2, align 8
  %40 = load %struct.ShrPcStatsSType** %1, align 8
  %41 = getelementptr inbounds %struct.ShrPcStatsSType* %40, i32 0, i32 3
  %42 = bitcast %union.ShrPcStatUnion* %41 to %struct.ShrPcGemStatSType*
  %43 = getelementptr inbounds %struct.ShrPcGemStatSType* %42, i32 0, i32 14
  store i64* %43, i64** @IntCode3, align 8
  %44 = load %struct.ShrPcStatsSType** %1, align 8
  %45 = getelementptr inbounds %struct.ShrPcStatsSType* %44, i32 0, i32 3
  %46 = bitcast %union.ShrPcStatUnion* %45 to %struct.ShrPcGemStatSType*
  %47 = getelementptr inbounds %struct.ShrPcGemStatSType* %46, i32 0, i32 15
  store i64* %47, i64** @IntCode4, align 8
  %48 = load %struct.ShrPcStatsSType** %1, align 8
  %49 = getelementptr inbounds %struct.ShrPcStatsSType* %48, i32 0, i32 3
  %50 = bitcast %union.ShrPcStatUnion* %49 to %struct.ShrPcGemStatSType*
  %51 = getelementptr inbounds %struct.ShrPcGemStatSType* %50, i32 0, i32 16
  store i64* %51, i64** @IntCode5, align 8
  %52 = load %struct.ShrPcStatsSType** %1, align 8
  %53 = getelementptr inbounds %struct.ShrPcStatsSType* %52, i32 0, i32 3
  %54 = bitcast %union.ShrPcStatUnion* %53 to %struct.ShrPcGemStatSType*
  %55 = getelementptr inbounds %struct.ShrPcGemStatSType* %54, i32 0, i32 17
  store i64* %55, i64** @IntCode6, align 8
  store %struct.WorkEntrySType* @Workspace, %struct.WorkEntrySType** %workSpPtr, align 8
  %56 = load %struct.ShrPcStatsSType** %1, align 8
  %57 = getelementptr inbounds %struct.ShrPcStatsSType* %56, i32 0, i32 3
  %58 = bitcast %union.ShrPcStatUnion* %57 to %struct.ShrPcGemStatSType*
  %59 = getelementptr inbounds %struct.ShrPcGemStatSType* %58, i32 0, i32 18
  %60 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %61 = getelementptr inbounds %struct.WorkEntrySType* %60, i32 0, i32 0
  store i64* %59, i64** %61, align 8
  %62 = load %struct.ShrPcStatsSType** %1, align 8
  %63 = getelementptr inbounds %struct.ShrPcStatsSType* %62, i32 0, i32 3
  %64 = bitcast %union.ShrPcStatUnion* %63 to %struct.ShrPcGemStatSType*
  %65 = getelementptr inbounds %struct.ShrPcGemStatSType* %64, i32 0, i32 19
  %66 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %67 = getelementptr inbounds %struct.WorkEntrySType* %66, i32 0, i32 1
  store i64* %65, i64** %67, align 8
  %68 = load %struct.ShrPcStatsSType** %1, align 8
  %69 = getelementptr inbounds %struct.ShrPcStatsSType* %68, i32 0, i32 3
  %70 = bitcast %union.ShrPcStatUnion* %69 to %struct.ShrPcGemStatSType*
  %71 = getelementptr inbounds %struct.ShrPcGemStatSType* %70, i32 0, i32 20
  %72 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %73 = getelementptr inbounds %struct.WorkEntrySType* %72, i32 0, i32 2
  store i64* %71, i64** %73, align 8
  %74 = load %struct.ShrPcStatsSType** %1, align 8
  %75 = getelementptr inbounds %struct.ShrPcStatsSType* %74, i32 0, i32 3
  %76 = bitcast %union.ShrPcStatUnion* %75 to %struct.ShrPcGemStatSType*
  %77 = getelementptr inbounds %struct.ShrPcGemStatSType* %76, i32 0, i32 21
  %78 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %79 = getelementptr inbounds %struct.WorkEntrySType* %78, i32 0, i32 3
  store i64* %77, i64** %79, align 8
  %80 = load %struct.ShrPcStatsSType** %1, align 8
  %81 = getelementptr inbounds %struct.ShrPcStatsSType* %80, i32 0, i32 3
  %82 = bitcast %union.ShrPcStatUnion* %81 to %struct.ShrPcGemStatSType*
  %83 = getelementptr inbounds %struct.ShrPcGemStatSType* %82, i32 0, i32 22
  %84 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %85 = getelementptr inbounds %struct.WorkEntrySType* %84, i32 0, i32 4
  store i64* %83, i64** %85, align 8
  %86 = load %struct.ShrPcStatsSType** %1, align 8
  %87 = getelementptr inbounds %struct.ShrPcStatsSType* %86, i32 0, i32 3
  %88 = bitcast %union.ShrPcStatUnion* %87 to %struct.ShrPcGemStatSType*
  %89 = getelementptr inbounds %struct.ShrPcGemStatSType* %88, i32 0, i32 23
  %90 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %91 = getelementptr inbounds %struct.WorkEntrySType* %90, i32 0, i32 5
  store i64* %89, i64** %91, align 8
  %92 = load %struct.ShrPcStatsSType** %1, align 8
  %93 = getelementptr inbounds %struct.ShrPcStatsSType* %92, i32 0, i32 3
  %94 = bitcast %union.ShrPcStatUnion* %93 to %struct.ShrPcGemStatSType*
  %95 = getelementptr inbounds %struct.ShrPcGemStatSType* %94, i32 0, i32 24
  %96 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %97 = getelementptr inbounds %struct.WorkEntrySType* %96, i32 0, i32 6
  store i64* %95, i64** %97, align 8
  %98 = load %struct.ShrPcStatsSType** %1, align 8
  %99 = getelementptr inbounds %struct.ShrPcStatsSType* %98, i32 0, i32 3
  %100 = bitcast %union.ShrPcStatUnion* %99 to %struct.ShrPcGemStatSType*
  %101 = getelementptr inbounds %struct.ShrPcGemStatSType* %100, i32 0, i32 25
  %102 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %103 = getelementptr inbounds %struct.WorkEntrySType* %102, i32 0, i32 7
  store i64* %101, i64** %103, align 8
  %104 = load %struct.ShrPcStatsSType** %1, align 8
  %105 = getelementptr inbounds %struct.ShrPcStatsSType* %104, i32 0, i32 3
  %106 = bitcast %union.ShrPcStatUnion* %105 to %struct.ShrPcGemStatSType*
  %107 = getelementptr inbounds %struct.ShrPcGemStatSType* %106, i32 0, i32 26
  %108 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %109 = getelementptr inbounds %struct.WorkEntrySType* %108, i32 0, i32 8
  store i64* %107, i64** %109, align 8
  %110 = load %struct.ShrPcStatsSType** %1, align 8
  %111 = getelementptr inbounds %struct.ShrPcStatsSType* %110, i32 0, i32 3
  %112 = bitcast %union.ShrPcStatUnion* %111 to %struct.ShrPcGemStatSType*
  %113 = getelementptr inbounds %struct.ShrPcGemStatSType* %112, i32 0, i32 27
  %114 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %115 = getelementptr inbounds %struct.WorkEntrySType* %114, i32 0, i32 9
  store i64* %113, i64** %115, align 8
  %116 = load %struct.ShrPcStatsSType** %1, align 8
  %117 = getelementptr inbounds %struct.ShrPcStatsSType* %116, i32 0, i32 3
  %118 = bitcast %union.ShrPcStatUnion* %117 to %struct.ShrPcGemStatSType*
  %119 = getelementptr inbounds %struct.ShrPcGemStatSType* %118, i32 0, i32 28
  %120 = load %struct.WorkEntrySType** %workSpPtr, align 8
  %121 = getelementptr inbounds %struct.WorkEntrySType* %120, i32 0, i32 10
  store i64* %119, i64** %121, align 8
  %122 = load %struct.ShrPcStatsSType** %1, align 8
  %123 = getelementptr inbounds %struct.ShrPcStatsSType* %122, i32 0, i32 3
  %124 = bitcast %union.ShrPcStatUnion* %123 to %struct.ShrPcGemStatSType*
  %125 = getelementptr inbounds %struct.ShrPcGemStatSType* %124, i32 0, i32 0
  store i64* %125, i64** @Lom1, align 8
  %126 = load %struct.ShrPcStatsSType** %1, align 8
  %127 = getelementptr inbounds %struct.ShrPcStatsSType* %126, i32 0, i32 3
  %128 = bitcast %union.ShrPcStatUnion* %127 to %struct.ShrPcGemStatSType*
  %129 = getelementptr inbounds %struct.ShrPcGemStatSType* %128, i32 0, i32 1
  store i64* %129, i64** @Lom2, align 8
  %130 = load %struct.ShrPcStatsSType** %1, align 8
  %131 = getelementptr inbounds %struct.ShrPcStatsSType* %130, i32 0, i32 3
  %132 = bitcast %union.ShrPcStatUnion* %131 to %struct.ShrPcGemStatSType*
  %133 = getelementptr inbounds %struct.ShrPcGemStatSType* %132, i32 0, i32 2
  store i64* %133, i64** @Lom3, align 8
  %134 = load %struct.ShrPcStatsSType** %1, align 8
  %135 = getelementptr inbounds %struct.ShrPcStatsSType* %134, i32 0, i32 3
  %136 = bitcast %union.ShrPcStatUnion* %135 to %struct.ShrPcGemStatSType*
  %137 = getelementptr inbounds %struct.ShrPcGemStatSType* %136, i32 0, i32 3
  store i64* %137, i64** @Lom4, align 8
  %138 = load %struct.ShrPcStatsSType** %1, align 8
  %139 = getelementptr inbounds %struct.ShrPcStatsSType* %138, i32 0, i32 3
  %140 = bitcast %union.ShrPcStatUnion* %139 to %struct.ShrPcGemStatSType*
  %141 = getelementptr inbounds %struct.ShrPcGemStatSType* %140, i32 0, i32 4
  store i64* %141, i64** @Lom5, align 8
  %142 = load %struct.ShrPcStatsSType** %1, align 8
  %143 = getelementptr inbounds %struct.ShrPcStatsSType* %142, i32 0, i32 3
  %144 = bitcast %union.ShrPcStatUnion* %143 to %struct.ShrPcGemStatSType*
  %145 = getelementptr inbounds %struct.ShrPcGemStatSType* %144, i32 0, i32 5
  store i64* %145, i64** @Lom6, align 8
  %146 = load %struct.ShrPcStatsSType** %1, align 8
  %147 = getelementptr inbounds %struct.ShrPcStatsSType* %146, i32 0, i32 3
  %148 = bitcast %union.ShrPcStatUnion* %147 to %struct.ShrPcGemStatSType*
  %149 = getelementptr inbounds %struct.ShrPcGemStatSType* %148, i32 0, i32 6
  store i64* %149, i64** @Lom7, align 8
  %150 = load %struct.ShrPcStatsSType** %1, align 8
  %151 = getelementptr inbounds %struct.ShrPcStatsSType* %150, i32 0, i32 3
  %152 = bitcast %union.ShrPcStatUnion* %151 to %struct.ShrPcGemStatSType*
  %153 = getelementptr inbounds %struct.ShrPcGemStatSType* %152, i32 0, i32 7
  store i64* %153, i64** @Lom8, align 8
  %154 = load %struct.ShrPcStatsSType** %1, align 8
  %155 = getelementptr inbounds %struct.ShrPcStatsSType* %154, i32 0, i32 3
  %156 = bitcast %union.ShrPcStatUnion* %155 to %struct.ShrPcGemStatSType*
  %157 = getelementptr inbounds %struct.ShrPcGemStatSType* %156, i32 0, i32 8
  store i64* %157, i64** @Lom9, align 8
  %158 = load %struct.ShrPcStatsSType** %1, align 8
  %159 = getelementptr inbounds %struct.ShrPcStatsSType* %158, i32 0, i32 3
  %160 = bitcast %union.ShrPcStatUnion* %159 to %struct.ShrPcGemStatSType*
  %161 = getelementptr inbounds %struct.ShrPcGemStatSType* %160, i32 0, i32 9
  store i64* %161, i64** @Lom10, align 8
  %162 = load %struct.ShrPcStatsSType** %1, align 8
  %163 = getelementptr inbounds %struct.ShrPcStatsSType* %162, i32 0, i32 3
  %164 = bitcast %union.ShrPcStatUnion* %163 to %struct.ShrPcGemStatSType*
  %165 = getelementptr inbounds %struct.ShrPcGemStatSType* %164, i32 0, i32 10
  store i64* %165, i64** @RDbf11, align 8
  %166 = load %struct.ShrPcStatsSType** %1, align 8
  %167 = getelementptr inbounds %struct.ShrPcStatsSType* %166, i32 0, i32 3
  %168 = bitcast %union.ShrPcStatUnion* %167 to %struct.ShrPcGemStatSType*
  %169 = getelementptr inbounds %struct.ShrPcGemStatSType* %168, i32 0, i32 11
  store i64* %169, i64** @RDbf12, align 8
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
