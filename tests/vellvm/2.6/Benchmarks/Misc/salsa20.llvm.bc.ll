; ModuleID = 'salsa20.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@outbuf = internal global [16 x i32] zeroinitializer, align 32 ; <[16 x i32]*> [#uses=2]
@STATE = internal global [16 x i32] zeroinitializer, align 32 ; <[16 x i32]*> [#uses=18]
@.str = private constant [15 x i8] c"got:       %x\0A\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str1 = private constant [15 x i8] c"should be: %x\0A\00", align 1 ; <[15 x i8]*> [#uses=1]

define i32 @main() nounwind {
entry:
  %x.i = alloca [16 x i32], align 4               ; <[16 x i32]*> [#uses=17]
  br label %bb

bb:                                               ; preds = %bb, %entry
  %i.01 = phi i32 [ 0, %entry ], [ %1, %bb ]      ; <i32> [#uses=4]
  %scevgep = getelementptr [16 x i32]* @STATE, i32 0, i32 %i.01 ; <i32*> [#uses=1]
  %tmp2 = sub i32 -559038737, %i.01               ; <i32> [#uses=1]
  %tmp3 = add i32 %i.01, -307516430               ; <i32> [#uses=1]
  %0 = xor i32 %tmp3, %tmp2                       ; <i32> [#uses=1]
  store i32 %0, i32* %scevgep, align 4
  %1 = add i32 %i.01, 1                           ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %1, 16                  ; <i1> [#uses=1]
  br i1 %exitcond, label %bb4.loopexit, label %bb

bb3:                                              ; preds = %salsa.exit
  %2 = add i32 %4, 1                              ; <i32> [#uses=1]
  br label %bb4

bb4.loopexit:                                     ; preds = %bb
  %scevgep72.i = getelementptr [16 x i32]* %x.i, i32 0, i32 0 ; <i32*> [#uses=2]
  %scevgep72.1.i = getelementptr [16 x i32]* %x.i, i32 0, i32 1 ; <i32*> [#uses=2]
  %scevgep72.2.i = getelementptr [16 x i32]* %x.i, i32 0, i32 2 ; <i32*> [#uses=2]
  %scevgep72.3.i = getelementptr [16 x i32]* %x.i, i32 0, i32 3 ; <i32*> [#uses=2]
  %scevgep72.4.i = getelementptr [16 x i32]* %x.i, i32 0, i32 4 ; <i32*> [#uses=2]
  %scevgep72.5.i = getelementptr [16 x i32]* %x.i, i32 0, i32 5 ; <i32*> [#uses=2]
  %scevgep72.6.i = getelementptr [16 x i32]* %x.i, i32 0, i32 6 ; <i32*> [#uses=2]
  %scevgep72.7.i = getelementptr [16 x i32]* %x.i, i32 0, i32 7 ; <i32*> [#uses=2]
  %scevgep72.8.i = getelementptr [16 x i32]* %x.i, i32 0, i32 8 ; <i32*> [#uses=2]
  %scevgep72.9.i = getelementptr [16 x i32]* %x.i, i32 0, i32 9 ; <i32*> [#uses=2]
  %scevgep72.10.i = getelementptr [16 x i32]* %x.i, i32 0, i32 10 ; <i32*> [#uses=2]
  %scevgep72.11.i = getelementptr [16 x i32]* %x.i, i32 0, i32 11 ; <i32*> [#uses=2]
  %scevgep72.12.i = getelementptr [16 x i32]* %x.i, i32 0, i32 12 ; <i32*> [#uses=2]
  %scevgep72.13.i = getelementptr [16 x i32]* %x.i, i32 0, i32 13 ; <i32*> [#uses=2]
  %scevgep72.14.i = getelementptr [16 x i32]* %x.i, i32 0, i32 14 ; <i32*> [#uses=2]
  %scevgep72.15.i = getelementptr [16 x i32]* %x.i, i32 0, i32 15 ; <i32*> [#uses=2]
  br label %bb4

bb4:                                              ; preds = %bb4.loopexit, %bb3
  %ptr.0 = phi i32 [ 0, %bb4.loopexit ], [ %190, %bb3 ] ; <i32> [#uses=1]
  %3 = phi i32 [ 0, %bb4.loopexit ], [ %190, %bb3 ] ; <i32> [#uses=2]
  %4 = phi i32 [ %2, %bb3 ], [ 0, %bb4.loopexit ] ; <i32> [#uses=2]
  %5 = icmp ugt i32 %4, 537919487                 ; <i1> [#uses=1]
  %6 = icmp eq i32 %3, 0                          ; <i1> [#uses=1]
  br i1 %6, label %bb.i, label %salsa.exit

bb.i:                                             ; preds = %bb4
  %7 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 0), align 32 ; <i32> [#uses=3]
  store i32 %7, i32* %scevgep72.i, align 4
  %8 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 1), align 4 ; <i32> [#uses=2]
  store i32 %8, i32* %scevgep72.1.i, align 4
  %9 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 2), align 8 ; <i32> [#uses=2]
  store i32 %9, i32* %scevgep72.2.i, align 4
  %10 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 3), align 4 ; <i32> [#uses=2]
  store i32 %10, i32* %scevgep72.3.i, align 4
  %11 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 4), align 16 ; <i32> [#uses=2]
  store i32 %11, i32* %scevgep72.4.i, align 4
  %12 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 5), align 4 ; <i32> [#uses=2]
  store i32 %12, i32* %scevgep72.5.i, align 4
  %13 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 6), align 8 ; <i32> [#uses=2]
  store i32 %13, i32* %scevgep72.6.i, align 4
  %14 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 7), align 4 ; <i32> [#uses=2]
  store i32 %14, i32* %scevgep72.7.i, align 4
  %15 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 8), align 32 ; <i32> [#uses=2]
  store i32 %15, i32* %scevgep72.8.i, align 4
  %16 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 9), align 4 ; <i32> [#uses=2]
  store i32 %16, i32* %scevgep72.9.i, align 4
  %17 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 10), align 8 ; <i32> [#uses=2]
  store i32 %17, i32* %scevgep72.10.i, align 4
  %18 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 11), align 4 ; <i32> [#uses=2]
  store i32 %18, i32* %scevgep72.11.i, align 4
  %19 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 12), align 16 ; <i32> [#uses=2]
  store i32 %19, i32* %scevgep72.12.i, align 4
  %20 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 13), align 4 ; <i32> [#uses=2]
  store i32 %20, i32* %scevgep72.13.i, align 4
  %21 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 14), align 8 ; <i32> [#uses=2]
  store i32 %21, i32* %scevgep72.14.i, align 4
  %22 = load i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 15), align 4 ; <i32> [#uses=2]
  store i32 %22, i32* %scevgep72.15.i, align 4
  br label %bb3.i

bb3.i:                                            ; preds = %bb3.i, %bb.i
  %indvar.i = phi i32 [ 0, %bb.i ], [ %indvar.next.i, %bb3.i ] ; <i32> [#uses=1]
  %.tmp18.0.i = phi i32 [ %14, %bb.i ], [ %132, %bb3.i ] ; <i32> [#uses=1]
  %.tmp17.0.i = phi i32 [ %18, %bb.i ], [ %147, %bb3.i ] ; <i32> [#uses=2]
  %.tmp16.0.i = phi i32 [ %22, %bb.i ], [ %182, %bb3.i ] ; <i32> [#uses=3]
  %.tmp15.0.i = phi i32 [ %10, %bb.i ], [ %117, %bb3.i ] ; <i32> [#uses=1]
  %.tmp14.0.i = phi i32 [ %9, %bb.i ], [ %112, %bb3.i ] ; <i32> [#uses=1]
  %.tmp13.0.i = phi i32 [ %13, %bb.i ], [ %127, %bb3.i ] ; <i32> [#uses=2]
  %.tmp12.0.i = phi i32 [ %17, %bb.i ], [ %162, %bb3.i ] ; <i32> [#uses=3]
  %.tmp11.0.i = phi i32 [ %21, %bb.i ], [ %177, %bb3.i ] ; <i32> [#uses=1]
  %.tmp10.0.i = phi i32 [ %20, %bb.i ], [ %172, %bb3.i ] ; <i32> [#uses=1]
  %.tmp9.0.i = phi i32 [ %8, %bb.i ], [ %107, %bb3.i ] ; <i32> [#uses=2]
  %.tmp8.0.i = phi i32 [ %12, %bb.i ], [ %142, %bb3.i ] ; <i32> [#uses=3]
  %.tmp7.0.i = phi i32 [ %16, %bb.i ], [ %157, %bb3.i ] ; <i32> [#uses=1]
  %.tmp6.0.i = phi i32 [ %15, %bb.i ], [ %152, %bb3.i ] ; <i32> [#uses=1]
  %.tmp5.0.i = phi i32 [ %19, %bb.i ], [ %167, %bb3.i ] ; <i32> [#uses=2]
  %.tmp4.0.i = phi i32 [ %7, %bb.i ], [ %122, %bb3.i ] ; <i32> [#uses=3]
  %.tmp.0.i = phi i32 [ %11, %bb.i ], [ %137, %bb3.i ] ; <i32> [#uses=1]
  %23 = add i32 %.tmp5.0.i, %.tmp4.0.i            ; <i32> [#uses=2]
  %24 = lshr i32 %23, 25                          ; <i32> [#uses=1]
  %25 = shl i32 %23, 7                            ; <i32> [#uses=1]
  %26 = or i32 %24, %25                           ; <i32> [#uses=1]
  %27 = xor i32 %26, %.tmp.0.i                    ; <i32> [#uses=4]
  %28 = add i32 %27, %.tmp4.0.i                   ; <i32> [#uses=2]
  %29 = lshr i32 %28, 23                          ; <i32> [#uses=1]
  %30 = shl i32 %28, 9                            ; <i32> [#uses=1]
  %31 = or i32 %29, %30                           ; <i32> [#uses=1]
  %32 = xor i32 %31, %.tmp6.0.i                   ; <i32> [#uses=3]
  %33 = add i32 %32, %27                          ; <i32> [#uses=2]
  %34 = lshr i32 %33, 19                          ; <i32> [#uses=1]
  %35 = shl i32 %33, 13                           ; <i32> [#uses=1]
  %36 = or i32 %34, %35                           ; <i32> [#uses=1]
  %37 = xor i32 %36, %.tmp5.0.i                   ; <i32> [#uses=2]
  %38 = add i32 %37, %32                          ; <i32> [#uses=2]
  %39 = lshr i32 %38, 14                          ; <i32> [#uses=1]
  %40 = shl i32 %38, 18                           ; <i32> [#uses=1]
  %41 = or i32 %39, %40                           ; <i32> [#uses=1]
  %42 = xor i32 %41, %.tmp4.0.i                   ; <i32> [#uses=3]
  %43 = add i32 %.tmp9.0.i, %.tmp8.0.i            ; <i32> [#uses=2]
  %44 = lshr i32 %43, 25                          ; <i32> [#uses=1]
  %45 = shl i32 %43, 7                            ; <i32> [#uses=1]
  %46 = or i32 %44, %45                           ; <i32> [#uses=1]
  %47 = xor i32 %46, %.tmp7.0.i                   ; <i32> [#uses=4]
  %48 = add i32 %47, %.tmp8.0.i                   ; <i32> [#uses=2]
  %49 = lshr i32 %48, 23                          ; <i32> [#uses=1]
  %50 = shl i32 %48, 9                            ; <i32> [#uses=1]
  %51 = or i32 %49, %50                           ; <i32> [#uses=1]
  %52 = xor i32 %51, %.tmp10.0.i                  ; <i32> [#uses=3]
  %53 = add i32 %52, %47                          ; <i32> [#uses=2]
  %54 = lshr i32 %53, 19                          ; <i32> [#uses=1]
  %55 = shl i32 %53, 13                           ; <i32> [#uses=1]
  %56 = or i32 %54, %55                           ; <i32> [#uses=1]
  %57 = xor i32 %56, %.tmp9.0.i                   ; <i32> [#uses=2]
  %58 = add i32 %57, %52                          ; <i32> [#uses=2]
  %59 = lshr i32 %58, 14                          ; <i32> [#uses=1]
  %60 = shl i32 %58, 18                           ; <i32> [#uses=1]
  %61 = or i32 %59, %60                           ; <i32> [#uses=1]
  %62 = xor i32 %61, %.tmp8.0.i                   ; <i32> [#uses=3]
  %63 = add i32 %.tmp13.0.i, %.tmp12.0.i          ; <i32> [#uses=2]
  %64 = lshr i32 %63, 25                          ; <i32> [#uses=1]
  %65 = shl i32 %63, 7                            ; <i32> [#uses=1]
  %66 = or i32 %64, %65                           ; <i32> [#uses=1]
  %67 = xor i32 %66, %.tmp11.0.i                  ; <i32> [#uses=4]
  %68 = add i32 %67, %.tmp12.0.i                  ; <i32> [#uses=2]
  %69 = lshr i32 %68, 23                          ; <i32> [#uses=1]
  %70 = shl i32 %68, 9                            ; <i32> [#uses=1]
  %71 = or i32 %69, %70                           ; <i32> [#uses=1]
  %72 = xor i32 %71, %.tmp14.0.i                  ; <i32> [#uses=3]
  %73 = add i32 %72, %67                          ; <i32> [#uses=2]
  %74 = lshr i32 %73, 19                          ; <i32> [#uses=1]
  %75 = shl i32 %73, 13                           ; <i32> [#uses=1]
  %76 = or i32 %74, %75                           ; <i32> [#uses=1]
  %77 = xor i32 %76, %.tmp13.0.i                  ; <i32> [#uses=2]
  %78 = add i32 %77, %72                          ; <i32> [#uses=2]
  %79 = lshr i32 %78, 14                          ; <i32> [#uses=1]
  %80 = shl i32 %78, 18                           ; <i32> [#uses=1]
  %81 = or i32 %79, %80                           ; <i32> [#uses=1]
  %82 = xor i32 %81, %.tmp12.0.i                  ; <i32> [#uses=3]
  %83 = add i32 %.tmp17.0.i, %.tmp16.0.i          ; <i32> [#uses=2]
  %84 = lshr i32 %83, 25                          ; <i32> [#uses=1]
  %85 = shl i32 %83, 7                            ; <i32> [#uses=1]
  %86 = or i32 %84, %85                           ; <i32> [#uses=1]
  %87 = xor i32 %86, %.tmp15.0.i                  ; <i32> [#uses=4]
  %88 = add i32 %87, %.tmp16.0.i                  ; <i32> [#uses=2]
  %89 = lshr i32 %88, 23                          ; <i32> [#uses=1]
  %90 = shl i32 %88, 9                            ; <i32> [#uses=1]
  %91 = or i32 %89, %90                           ; <i32> [#uses=1]
  %92 = xor i32 %91, %.tmp18.0.i                  ; <i32> [#uses=3]
  %93 = add i32 %92, %87                          ; <i32> [#uses=2]
  %94 = lshr i32 %93, 19                          ; <i32> [#uses=1]
  %95 = shl i32 %93, 13                           ; <i32> [#uses=1]
  %96 = or i32 %94, %95                           ; <i32> [#uses=1]
  %97 = xor i32 %96, %.tmp17.0.i                  ; <i32> [#uses=2]
  %98 = add i32 %97, %92                          ; <i32> [#uses=2]
  %99 = lshr i32 %98, 14                          ; <i32> [#uses=1]
  %100 = shl i32 %98, 18                          ; <i32> [#uses=1]
  %101 = or i32 %99, %100                         ; <i32> [#uses=1]
  %102 = xor i32 %101, %.tmp16.0.i                ; <i32> [#uses=3]
  %103 = add i32 %87, %42                         ; <i32> [#uses=2]
  %104 = lshr i32 %103, 25                        ; <i32> [#uses=1]
  %105 = shl i32 %103, 7                          ; <i32> [#uses=1]
  %106 = or i32 %104, %105                        ; <i32> [#uses=1]
  %107 = xor i32 %106, %57                        ; <i32> [#uses=4]
  %108 = add i32 %107, %42                        ; <i32> [#uses=2]
  %109 = lshr i32 %108, 23                        ; <i32> [#uses=1]
  %110 = shl i32 %108, 9                          ; <i32> [#uses=1]
  %111 = or i32 %109, %110                        ; <i32> [#uses=1]
  %112 = xor i32 %111, %72                        ; <i32> [#uses=4]
  %113 = add i32 %112, %107                       ; <i32> [#uses=2]
  %114 = lshr i32 %113, 19                        ; <i32> [#uses=1]
  %115 = shl i32 %113, 13                         ; <i32> [#uses=1]
  %116 = or i32 %114, %115                        ; <i32> [#uses=1]
  %117 = xor i32 %116, %87                        ; <i32> [#uses=3]
  %118 = add i32 %117, %112                       ; <i32> [#uses=2]
  %119 = lshr i32 %118, 14                        ; <i32> [#uses=1]
  %120 = shl i32 %118, 18                         ; <i32> [#uses=1]
  %121 = or i32 %119, %120                        ; <i32> [#uses=1]
  %122 = xor i32 %121, %42                        ; <i32> [#uses=2]
  %123 = add i32 %27, %62                         ; <i32> [#uses=2]
  %124 = lshr i32 %123, 25                        ; <i32> [#uses=1]
  %125 = shl i32 %123, 7                          ; <i32> [#uses=1]
  %126 = or i32 %124, %125                        ; <i32> [#uses=1]
  %127 = xor i32 %126, %77                        ; <i32> [#uses=4]
  %128 = add i32 %127, %62                        ; <i32> [#uses=2]
  %129 = lshr i32 %128, 23                        ; <i32> [#uses=1]
  %130 = shl i32 %128, 9                          ; <i32> [#uses=1]
  %131 = or i32 %129, %130                        ; <i32> [#uses=1]
  %132 = xor i32 %131, %92                        ; <i32> [#uses=4]
  %133 = add i32 %132, %127                       ; <i32> [#uses=2]
  %134 = lshr i32 %133, 19                        ; <i32> [#uses=1]
  %135 = shl i32 %133, 13                         ; <i32> [#uses=1]
  %136 = or i32 %134, %135                        ; <i32> [#uses=1]
  %137 = xor i32 %136, %27                        ; <i32> [#uses=3]
  %138 = add i32 %137, %132                       ; <i32> [#uses=2]
  %139 = lshr i32 %138, 14                        ; <i32> [#uses=1]
  %140 = shl i32 %138, 18                         ; <i32> [#uses=1]
  %141 = or i32 %139, %140                        ; <i32> [#uses=1]
  %142 = xor i32 %141, %62                        ; <i32> [#uses=2]
  %143 = add i32 %47, %82                         ; <i32> [#uses=2]
  %144 = lshr i32 %143, 25                        ; <i32> [#uses=1]
  %145 = shl i32 %143, 7                          ; <i32> [#uses=1]
  %146 = or i32 %144, %145                        ; <i32> [#uses=1]
  %147 = xor i32 %146, %97                        ; <i32> [#uses=4]
  %148 = add i32 %147, %82                        ; <i32> [#uses=2]
  %149 = lshr i32 %148, 23                        ; <i32> [#uses=1]
  %150 = shl i32 %148, 9                          ; <i32> [#uses=1]
  %151 = or i32 %149, %150                        ; <i32> [#uses=1]
  %152 = xor i32 %151, %32                        ; <i32> [#uses=4]
  %153 = add i32 %152, %147                       ; <i32> [#uses=2]
  %154 = lshr i32 %153, 19                        ; <i32> [#uses=1]
  %155 = shl i32 %153, 13                         ; <i32> [#uses=1]
  %156 = or i32 %154, %155                        ; <i32> [#uses=1]
  %157 = xor i32 %156, %47                        ; <i32> [#uses=3]
  %158 = add i32 %157, %152                       ; <i32> [#uses=2]
  %159 = lshr i32 %158, 14                        ; <i32> [#uses=1]
  %160 = shl i32 %158, 18                         ; <i32> [#uses=1]
  %161 = or i32 %159, %160                        ; <i32> [#uses=1]
  %162 = xor i32 %161, %82                        ; <i32> [#uses=2]
  %163 = add i32 %67, %102                        ; <i32> [#uses=2]
  %164 = lshr i32 %163, 25                        ; <i32> [#uses=1]
  %165 = shl i32 %163, 7                          ; <i32> [#uses=1]
  %166 = or i32 %164, %165                        ; <i32> [#uses=1]
  %167 = xor i32 %166, %37                        ; <i32> [#uses=4]
  %168 = add i32 %167, %102                       ; <i32> [#uses=2]
  %169 = lshr i32 %168, 23                        ; <i32> [#uses=1]
  %170 = shl i32 %168, 9                          ; <i32> [#uses=1]
  %171 = or i32 %169, %170                        ; <i32> [#uses=1]
  %172 = xor i32 %171, %52                        ; <i32> [#uses=4]
  %173 = add i32 %172, %167                       ; <i32> [#uses=2]
  %174 = lshr i32 %173, 19                        ; <i32> [#uses=1]
  %175 = shl i32 %173, 13                         ; <i32> [#uses=1]
  %176 = or i32 %174, %175                        ; <i32> [#uses=1]
  %177 = xor i32 %176, %67                        ; <i32> [#uses=3]
  %178 = add i32 %177, %172                       ; <i32> [#uses=2]
  %179 = lshr i32 %178, 14                        ; <i32> [#uses=1]
  %180 = shl i32 %178, 18                         ; <i32> [#uses=1]
  %181 = or i32 %179, %180                        ; <i32> [#uses=1]
  %182 = xor i32 %181, %102                       ; <i32> [#uses=2]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond70.i = icmp eq i32 %indvar.next.i, 10  ; <i1> [#uses=1]
  br i1 %exitcond70.i, label %bb4.bb7.loopexit_crit_edge.i, label %bb3.i

bb4.bb7.loopexit_crit_edge.i:                     ; preds = %bb3.i
  store i32 %137, i32* %scevgep72.4.i
  store i32 %122, i32* %scevgep72.i
  store i32 %167, i32* %scevgep72.12.i
  store i32 %152, i32* %scevgep72.8.i
  store i32 %157, i32* %scevgep72.9.i
  store i32 %142, i32* %scevgep72.5.i
  store i32 %107, i32* %scevgep72.1.i
  store i32 %172, i32* %scevgep72.13.i
  store i32 %177, i32* %scevgep72.14.i
  store i32 %162, i32* %scevgep72.10.i
  store i32 %127, i32* %scevgep72.6.i
  store i32 %112, i32* %scevgep72.2.i
  store i32 %117, i32* %scevgep72.3.i
  store i32 %182, i32* %scevgep72.15.i
  store i32 %147, i32* %scevgep72.11.i
  store i32 %132, i32* %scevgep72.7.i
  br label %bb6.i

bb6.i:                                            ; preds = %bb6.i, %bb4.bb7.loopexit_crit_edge.i
  %i.21.i = phi i32 [ %186, %bb6.i ], [ 0, %bb4.bb7.loopexit_crit_edge.i ] ; <i32> [#uses=4]
  %scevgep.i = getelementptr [16 x i32]* %x.i, i32 0, i32 %i.21.i ; <i32*> [#uses=1]
  %scevgep53.i = getelementptr [16 x i32]* @STATE, i32 0, i32 %i.21.i ; <i32*> [#uses=1]
  %scevgep54.i = getelementptr [16 x i32]* @outbuf, i32 0, i32 %i.21.i ; <i32*> [#uses=1]
  %183 = load i32* %scevgep.i, align 4            ; <i32> [#uses=1]
  %184 = load i32* %scevgep53.i, align 4          ; <i32> [#uses=1]
  %185 = add i32 %184, %183                       ; <i32> [#uses=1]
  store i32 %185, i32* %scevgep54.i, align 4
  %186 = add i32 %i.21.i, 1                       ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %186, 16              ; <i1> [#uses=1]
  br i1 %exitcond.i, label %salsa20.exit, label %bb6.i

salsa20.exit:                                     ; preds = %bb6.i
  %187 = add i32 %7, 1                            ; <i32> [#uses=1]
  store i32 %187, i32* getelementptr inbounds ([16 x i32]* @STATE, i32 0, i32 0), align 32
  br label %salsa.exit

salsa.exit:                                       ; preds = %salsa20.exit, %bb4
  %188 = phi i32 [ %ptr.0, %salsa20.exit ], [ %3, %bb4 ] ; <i32> [#uses=1]
  %189 = add i32 %188, 1                          ; <i32> [#uses=1]
  %190 = and i32 %189, 15                         ; <i32> [#uses=3]
  %191 = getelementptr inbounds [16 x i32]* @outbuf, i32 0, i32 %190 ; <i32*> [#uses=1]
  %192 = load i32* %191, align 4                  ; <i32> [#uses=2]
  br i1 %5, label %bb5, label %bb3

bb5:                                              ; preds = %salsa.exit
  %193 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0), i32 %192) nounwind ; <i32> [#uses=0]
  %194 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 -162172867) nounwind ; <i32> [#uses=0]
  %195 = icmp ne i32 %192, -162172867             ; <i1> [#uses=1]
  %196 = zext i1 %195 to i32                      ; <i32> [#uses=1]
  ret i32 %196
}

declare i32 @printf(i8* nocapture, ...) nounwind
