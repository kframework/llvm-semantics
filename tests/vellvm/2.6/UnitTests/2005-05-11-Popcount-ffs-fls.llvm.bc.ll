; ModuleID = '2005-05-11-Popcount-ffs-fls.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@table.1731 = internal constant [64 x i8] c" \14\13cc\12c\07\0A\11cc\0Ec\06cc\09c\10cc\01\1Ac\0Dcc\18\05ccc\15c\08\0Bc\0Fcccc\02\1B\00\19c\16c\0Ccc\03\1Cc\17c\04\1Dcc\1E\1F", align 32 ; <[64 x i8]*> [#uses=3]
@table.1780 = internal constant [64 x i8] c" \00\01\0C\02\06c\0D\03c\07cccc\0E\0A\04cc\08cc\19ccccc\15\1B\0F\1F\0B\05ccccc\09cc\18cc\14\1A\1Ecccc\17c\13\1Dc\16\12\1C\11\10c", align 32 ; <[64 x i8]*> [#uses=2]
@.str = private constant [54 x i8] c"LLVM: n: %d, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1 ; <[54 x i8]*> [#uses=1]
@.str1 = private constant [54 x i8] c"REF : n: %d, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1 ; <[54 x i8]*> [#uses=1]
@.str2 = private constant [8 x i8] c"  ***  \00", align 1 ; <[8 x i8]*> [#uses=1]
@.str3 = private constant [56 x i8] c"LLVM: n: %lld, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1 ; <[56 x i8]*> [#uses=1]
@.str4 = private constant [64 x i8] c"REF LO BITS : n: %lld, clz(n): %d, popcount(n): %d, ctz(n): %d\0A\00", align 1 ; <[64 x i8]*> [#uses=1]
@.str5 = private constant [58 x i8] c"FFS: 0:%d, 1:%d, 2:%d, 7:%d, 1024:%d, 1234:%d i:%d, l:%d\0A\00", align 1 ; <[58 x i8]*> [#uses=1]
@.str6 = private constant [67 x i8] c"__builtin_ffs: 0:%d, 1:%d, 2:%d, 7:%d, 1024:%d, 1234:%d i:%d l:%d\0A\00", align 1 ; <[67 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  br label %bb

bb:                                               ; preds = %bb, %entry
  %i.0 = phi i32 [ 10, %entry ], [ %40, %bb ]     ; <i32> [#uses=7]
  %0 = phi i32 [ 10, %entry ], [ %40, %bb ]       ; <i32> [#uses=4]
  %1 = tail call i32 @llvm.cttz.i32(i32 %0)       ; <i32> [#uses=1]
  %2 = tail call i32 @llvm.ctpop.i32(i32 %0)      ; <i32> [#uses=1]
  %3 = tail call i32 @llvm.ctlz.i32(i32 %0)       ; <i32> [#uses=1]
  %4 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([54 x i8]* @.str, i32 0, i32 0), i32 %0, i32 %3, i32 %2, i32 %1) nounwind ; <i32> [#uses=0]
  %5 = sub i32 0, %i.0                            ; <i32> [#uses=1]
  %6 = and i32 %i.0, %5                           ; <i32> [#uses=1]
  %7 = mul i32 %6, 72416175                       ; <i32> [#uses=1]
  %8 = lshr i32 %7, 26                            ; <i32> [#uses=1]
  %9 = getelementptr inbounds [64 x i8]* @table.1780, i32 0, i32 %8 ; <i8*> [#uses=1]
  %10 = load i8* %9, align 1                      ; <i8> [#uses=1]
  %11 = sext i8 %10 to i32                        ; <i32> [#uses=1]
  %12 = lshr i32 %i.0, 1                          ; <i32> [#uses=2]
  %13 = and i32 %12, 1431655765                   ; <i32> [#uses=1]
  %14 = sub i32 %i.0, %13                         ; <i32> [#uses=2]
  %15 = and i32 %14, 858993459                    ; <i32> [#uses=1]
  %16 = lshr i32 %14, 2                           ; <i32> [#uses=1]
  %17 = and i32 %16, 858993459                    ; <i32> [#uses=1]
  %18 = add i32 %17, %15                          ; <i32> [#uses=2]
  %19 = lshr i32 %18, 4                           ; <i32> [#uses=1]
  %20 = add i32 %19, %18                          ; <i32> [#uses=1]
  %21 = and i32 %20, 252645135                    ; <i32> [#uses=1]
  %22 = mul i32 %21, 16843009                     ; <i32> [#uses=1]
  %23 = lshr i32 %22, 24                          ; <i32> [#uses=1]
  %24 = or i32 %12, %i.0                          ; <i32> [#uses=2]
  %25 = lshr i32 %24, 2                           ; <i32> [#uses=1]
  %26 = or i32 %25, %24                           ; <i32> [#uses=2]
  %27 = lshr i32 %26, 4                           ; <i32> [#uses=1]
  %28 = or i32 %27, %26                           ; <i32> [#uses=2]
  %29 = lshr i32 %28, 8                           ; <i32> [#uses=1]
  %30 = or i32 %29, %28                           ; <i32> [#uses=2]
  %31 = lshr i32 %30, 16                          ; <i32> [#uses=1]
  %not.i = xor i32 %31, -1                        ; <i32> [#uses=1]
  %32 = and i32 %30, %not.i                       ; <i32> [#uses=1]
  %33 = mul i32 %32, -42972673                    ; <i32> [#uses=1]
  %34 = lshr i32 %33, 26                          ; <i32> [#uses=1]
  %35 = getelementptr inbounds [64 x i8]* @table.1731, i32 0, i32 %34 ; <i8*> [#uses=1]
  %36 = load i8* %35, align 1                     ; <i8> [#uses=1]
  %37 = sext i8 %36 to i32                        ; <i32> [#uses=1]
  %38 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([54 x i8]* @.str1, i32 0, i32 0), i32 %i.0, i32 %37, i32 %23, i32 %11) nounwind ; <i32> [#uses=0]
  %39 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp6 = mul i32 %i.0, -3                        ; <i32> [#uses=1]
  %40 = add i32 %tmp6, -3                         ; <i32> [#uses=5]
  %41 = icmp sgt i32 %40, 139045192               ; <i1> [#uses=1]
  br i1 %41, label %bb3, label %bb

bb3:                                              ; preds = %nlzll.exit, %bb
  %indvar = phi i32 [ %indvar.next, %nlzll.exit ], [ 0, %bb ] ; <i32> [#uses=1]
  %l.01 = phi i64 [ %118, %nlzll.exit ], [ -10000, %bb ] ; <i64> [#uses=9]
  %42 = trunc i64 %l.01 to i32                    ; <i32> [#uses=6]
  %43 = tail call i32 @llvm.cttz.i32(i32 %42)     ; <i32> [#uses=1]
  %44 = tail call i64 @llvm.ctpop.i64(i64 %l.01)  ; <i64> [#uses=1]
  %45 = trunc i64 %44 to i32                      ; <i32> [#uses=1]
  %46 = tail call i64 @llvm.ctlz.i64(i64 %l.01)   ; <i64> [#uses=1]
  %47 = trunc i64 %46 to i32                      ; <i32> [#uses=1]
  %48 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([56 x i8]* @.str3, i32 0, i32 0), i64 %l.01, i32 %47, i32 %45, i32 %43) nounwind ; <i32> [#uses=0]
  %49 = sub i32 0, %42                            ; <i32> [#uses=1]
  %50 = and i32 %42, %49                          ; <i32> [#uses=1]
  %51 = mul i32 %50, 72416175                     ; <i32> [#uses=1]
  %52 = lshr i32 %51, 26                          ; <i32> [#uses=1]
  %53 = getelementptr inbounds [64 x i8]* @table.1780, i32 0, i32 %52 ; <i8*> [#uses=1]
  %54 = load i8* %53, align 1                     ; <i8> [#uses=1]
  %55 = sext i8 %54 to i32                        ; <i32> [#uses=1]
  %56 = lshr i32 %42, 1                           ; <i32> [#uses=2]
  %57 = and i32 %56, 1431655765                   ; <i32> [#uses=1]
  %58 = sub i32 %42, %57                          ; <i32> [#uses=2]
  %59 = and i32 %58, 858993459                    ; <i32> [#uses=1]
  %60 = lshr i32 %58, 2                           ; <i32> [#uses=1]
  %61 = and i32 %60, 858993459                    ; <i32> [#uses=1]
  %62 = add i32 %61, %59                          ; <i32> [#uses=2]
  %63 = lshr i32 %62, 4                           ; <i32> [#uses=1]
  %64 = add i32 %63, %62                          ; <i32> [#uses=1]
  %65 = and i32 %64, 252645135                    ; <i32> [#uses=1]
  %66 = mul i32 %65, 16843009                     ; <i32> [#uses=1]
  %67 = lshr i32 %66, 24                          ; <i32> [#uses=1]
  %68 = lshr i64 %l.01, 32                        ; <i64> [#uses=2]
  %69 = trunc i64 %68 to i32                      ; <i32> [#uses=1]
  %70 = lshr i64 %l.01, 33                        ; <i64> [#uses=2]
  %71 = trunc i64 %70 to i32                      ; <i32> [#uses=1]
  %72 = and i32 %71, 1431655765                   ; <i32> [#uses=1]
  %73 = sub i32 %69, %72                          ; <i32> [#uses=2]
  %74 = and i32 %73, 858993459                    ; <i32> [#uses=1]
  %75 = lshr i32 %73, 2                           ; <i32> [#uses=1]
  %76 = and i32 %75, 858993459                    ; <i32> [#uses=1]
  %77 = add i32 %76, %74                          ; <i32> [#uses=2]
  %78 = lshr i32 %77, 4                           ; <i32> [#uses=1]
  %79 = add i32 %78, %77                          ; <i32> [#uses=1]
  %80 = and i32 %79, 252645135                    ; <i32> [#uses=1]
  %81 = mul i32 %80, 16843009                     ; <i32> [#uses=1]
  %82 = lshr i32 %81, 24                          ; <i32> [#uses=1]
  %83 = add nsw i32 %67, %82                      ; <i32> [#uses=1]
  %84 = icmp ult i64 %l.01, 4294967296            ; <i1> [#uses=1]
  br i1 %84, label %bb.i, label %bb1.i

bb.i:                                             ; preds = %bb3
  %85 = or i32 %56, %42                           ; <i32> [#uses=2]
  %86 = lshr i32 %85, 2                           ; <i32> [#uses=1]
  %87 = or i32 %86, %85                           ; <i32> [#uses=2]
  %88 = lshr i32 %87, 4                           ; <i32> [#uses=1]
  %89 = or i32 %88, %87                           ; <i32> [#uses=2]
  %90 = lshr i32 %89, 8                           ; <i32> [#uses=1]
  %91 = or i32 %90, %89                           ; <i32> [#uses=2]
  %92 = lshr i32 %91, 16                          ; <i32> [#uses=1]
  %not.i.i = xor i32 %92, -1                      ; <i32> [#uses=1]
  %93 = and i32 %91, %not.i.i                     ; <i32> [#uses=1]
  %94 = mul i32 %93, -42972673                    ; <i32> [#uses=1]
  %95 = lshr i32 %94, 26                          ; <i32> [#uses=1]
  %96 = getelementptr inbounds [64 x i8]* @table.1731, i32 0, i32 %95 ; <i8*> [#uses=1]
  %97 = load i8* %96, align 1                     ; <i8> [#uses=1]
  %98 = sext i8 %97 to i32                        ; <i32> [#uses=1]
  %99 = add nsw i32 %98, 32                       ; <i32> [#uses=1]
  br label %nlzll.exit

bb1.i:                                            ; preds = %bb3
  %100 = or i64 %70, %68                          ; <i64> [#uses=1]
  %101 = trunc i64 %100 to i32                    ; <i32> [#uses=2]
  %102 = lshr i32 %101, 2                         ; <i32> [#uses=1]
  %103 = or i32 %102, %101                        ; <i32> [#uses=2]
  %104 = lshr i32 %103, 4                         ; <i32> [#uses=1]
  %105 = or i32 %104, %103                        ; <i32> [#uses=2]
  %106 = lshr i32 %105, 8                         ; <i32> [#uses=1]
  %107 = or i32 %106, %105                        ; <i32> [#uses=2]
  %108 = lshr i32 %107, 16                        ; <i32> [#uses=1]
  %not.i1.i = xor i32 %108, -1                    ; <i32> [#uses=1]
  %109 = and i32 %107, %not.i1.i                  ; <i32> [#uses=1]
  %110 = mul i32 %109, -42972673                  ; <i32> [#uses=1]
  %111 = lshr i32 %110, 26                        ; <i32> [#uses=1]
  %112 = getelementptr inbounds [64 x i8]* @table.1731, i32 0, i32 %111 ; <i8*> [#uses=1]
  %113 = load i8* %112, align 1                   ; <i8> [#uses=1]
  %114 = sext i8 %113 to i32                      ; <i32> [#uses=1]
  br label %nlzll.exit

nlzll.exit:                                       ; preds = %bb1.i, %bb.i
  %115 = phi i32 [ %114, %bb1.i ], [ %99, %bb.i ] ; <i32> [#uses=1]
  %116 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([64 x i8]* @.str4, i32 0, i32 0), i64 %l.01, i32 %115, i32 %83, i32 %55) nounwind ; <i32> [#uses=0]
  %117 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %tmp = mul i64 %l.01, -3                        ; <i64> [#uses=1]
  %118 = add i64 %tmp, -3                         ; <i64> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 19        ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4.bb5_crit_edge, label %bb3

bb4.bb5_crit_edge:                                ; preds = %nlzll.exit
  %119 = tail call i32 @llvm.cttz.i32(i32 %40)    ; <i32> [#uses=1]
  %120 = add i32 %119, 1                          ; <i32> [#uses=1]
  %121 = icmp eq i32 %40, 0                       ; <i1> [#uses=1]
  %122 = select i1 %121, i32 0, i32 %120          ; <i32> [#uses=2]
  %123 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([58 x i8]* @.str5, i32 0, i32 0), i32 0, i32 1, i32 2, i32 1, i32 11, i32 2, i32 %122, i32 1) nounwind ; <i32> [#uses=0]
  %124 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([67 x i8]* @.str6, i32 0, i32 0), i32 0, i32 1, i32 2, i32 1, i32 11, i32 2, i32 %122, i32 1) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @llvm.cttz.i32(i32) nounwind readnone

declare i32 @llvm.ctpop.i32(i32) nounwind readnone

declare i32 @llvm.ctlz.i32(i32) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i64 @llvm.ctpop.i64(i64) nounwind readnone

declare i64 @llvm.ctlz.i64(i64) nounwind readnone
