; ModuleID = 'ReedSolomon.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@alpha_to = internal global [256 x i32] zeroinitializer, align 32 ; <[256 x i32]*> [#uses=32]
@index_of = internal global [256 x i32] zeroinitializer, align 32 ; <[256 x i32]*> [#uses=25]
@gg = internal global [17 x i32] zeroinitializer, align 32 ; <[17 x i32]*> [#uses=7]
@bb = internal global [16 x i32] zeroinitializer, align 32 ; <[16 x i32]*> [#uses=21]
@data = internal global [239 x i32] zeroinitializer, align 32 ; <[239 x i32]*> [#uses=3]
@recd = internal global [255 x i32] zeroinitializer, align 32 ; <[255 x i32]*> [#uses=11]

define internal fastcc void @generate_gf() nounwind {
entry:
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 0), align 32
  store i32 0, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 1), align 4
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 2), align 8
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 2), align 8
  store i32 2, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 4), align 16
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 3), align 4
  store i32 3, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 8), align 32
  store i32 16, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 4), align 16
  store i32 4, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 16), align 32
  store i32 29, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 8), align 32
  store i32 32, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 5), align 4
  store i32 5, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 32), align 32
  store i32 64, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 6), align 8
  store i32 6, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 64), align 32
  store i32 128, i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 7), align 4
  store i32 7, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 128), align 32
  store i32 8, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 29), align 4
  br label %bb5

bb5:                                              ; preds = %bb8, %entry
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %bb8 ] ; <i32> [#uses=3]
  %i.11 = add i32 %indvar, 9                      ; <i32> [#uses=2]
  %scevgep = getelementptr [256 x i32]* @alpha_to, i32 0, i32 %i.11 ; <i32*> [#uses=1]
  %tmp8 = add i32 %indvar, 8                      ; <i32> [#uses=1]
  %scevgep9 = getelementptr [256 x i32]* @alpha_to, i32 0, i32 %tmp8 ; <i32*> [#uses=1]
  %0 = load i32* %scevgep9, align 4               ; <i32> [#uses=3]
  %1 = icmp slt i32 %0, 128                       ; <i1> [#uses=1]
  br i1 %1, label %bb7, label %bb6

bb6:                                              ; preds = %bb5
  %2 = load i32* getelementptr inbounds ([256 x i32]* @alpha_to, i32 0, i32 8), align 32 ; <i32> [#uses=1]
  %3 = shl i32 %0, 1                              ; <i32> [#uses=1]
  %4 = xor i32 %3, 256                            ; <i32> [#uses=1]
  %5 = xor i32 %4, %2                             ; <i32> [#uses=1]
  br label %bb8

bb7:                                              ; preds = %bb5
  %6 = shl i32 %0, 1                              ; <i32> [#uses=1]
  br label %bb8

bb8:                                              ; preds = %bb7, %bb6
  %storemerge = phi i32 [ %6, %bb7 ], [ %5, %bb6 ] ; <i32> [#uses=2]
  store i32 %storemerge, i32* %scevgep
  %7 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %storemerge ; <i32*> [#uses=1]
  store i32 %i.11, i32* %7, align 4
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, 246       ; <i1> [#uses=1]
  br i1 %exitcond, label %bb10, label %bb5

bb10:                                             ; preds = %bb8
  store i32 -1, i32* getelementptr inbounds ([256 x i32]* @index_of, i32 0, i32 0), align 32
  ret void
}

define internal fastcc void @gen_poly() nounwind {
entry:
  store i32 2, i32* getelementptr inbounds ([17 x i32]* @gg, i32 0, i32 0), align 32
  store i32 1, i32* getelementptr inbounds ([17 x i32]* @gg, i32 0, i32 1), align 4
  br label %bb

bb:                                               ; preds = %bb6, %entry
  %0 = phi i32 [ 0, %entry ], [ %j.03, %bb6 ]     ; <i32> [#uses=3]
  %j.03 = add i32 %0, 1                           ; <i32> [#uses=5]
  %tmp19 = add i32 %0, 2                          ; <i32> [#uses=3]
  %scevgep22 = getelementptr [17 x i32]* @gg, i32 0, i32 %tmp19 ; <i32*> [#uses=1]
  store i32 1, i32* %scevgep22, align 4
  %1 = icmp sgt i32 %j.03, 0                      ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb6

bb1:                                              ; preds = %bb5.backedge, %bb
  %indvar = phi i32 [ %indvar.next, %bb5.backedge ], [ 0, %bb ] ; <i32> [#uses=3]
  %tmp13 = sub i32 %j.03, %indvar                 ; <i32> [#uses=1]
  %scevgep14 = getelementptr [17 x i32]* @gg, i32 0, i32 %tmp13 ; <i32*> [#uses=2]
  %tmp15 = sub i32 %0, %indvar                    ; <i32> [#uses=1]
  %scevgep16 = getelementptr [17 x i32]* @gg, i32 0, i32 %tmp15 ; <i32*> [#uses=1]
  %2 = load i32* %scevgep14, align 4              ; <i32> [#uses=2]
  %3 = icmp eq i32 %2, 0                          ; <i1> [#uses=1]
  %4 = load i32* %scevgep16, align 4              ; <i32> [#uses=2]
  br i1 %3, label %bb5.backedge, label %bb2

bb2:                                              ; preds = %bb1
  %5 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %2 ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %tmp20 = add i32 %6, %tmp19                     ; <i32> [#uses=1]
  %7 = srem i32 %tmp20, 255                       ; <i32> [#uses=1]
  %8 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %7 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 4                      ; <i32> [#uses=1]
  %10 = xor i32 %9, %4                            ; <i32> [#uses=1]
  br label %bb5.backedge

bb5.backedge:                                     ; preds = %bb2, %bb1
  %storemerge = phi i32 [ %10, %bb2 ], [ %4, %bb1 ] ; <i32> [#uses=1]
  store i32 %storemerge, i32* %scevgep14
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond11 = icmp eq i32 %indvar.next, %j.03   ; <i1> [#uses=1]
  br i1 %exitcond11, label %bb6, label %bb1

bb6:                                              ; preds = %bb5.backedge, %bb
  %11 = load i32* getelementptr inbounds ([17 x i32]* @gg, i32 0, i32 0), align 32 ; <i32> [#uses=1]
  %12 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %11 ; <i32*> [#uses=1]
  %13 = load i32* %12, align 4                    ; <i32> [#uses=1]
  %tmp21 = add i32 %13, %tmp19                    ; <i32> [#uses=1]
  %14 = srem i32 %tmp21, 255                      ; <i32> [#uses=1]
  %15 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %14 ; <i32*> [#uses=1]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  store i32 %16, i32* getelementptr inbounds ([17 x i32]* @gg, i32 0, i32 0), align 32
  %exitcond17 = icmp eq i32 %j.03, 15             ; <i1> [#uses=1]
  br i1 %exitcond17, label %bb9, label %bb

bb9:                                              ; preds = %bb9, %bb6
  %i.11 = phi i32 [ %20, %bb9 ], [ 0, %bb6 ]      ; <i32> [#uses=2]
  %scevgep = getelementptr [17 x i32]* @gg, i32 0, i32 %i.11 ; <i32*> [#uses=2]
  %17 = load i32* %scevgep, align 4               ; <i32> [#uses=1]
  %18 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %17 ; <i32*> [#uses=1]
  %19 = load i32* %18, align 4                    ; <i32> [#uses=1]
  store i32 %19, i32* %scevgep, align 4
  %20 = add nsw i32 %i.11, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %20, 17                 ; <i1> [#uses=1]
  br i1 %exitcond, label %return, label %bb9

return:                                           ; preds = %bb9
  ret void
}

define i32 @main() nounwind {
entry:
  %reg.i.i = alloca [9 x i32], align 4            ; <[9 x i32]*> [#uses=2]
  %err.i.i = alloca [255 x i32], align 4          ; <[255 x i32]*> [#uses=2]
  %z.i.i = alloca [9 x i32], align 4              ; <[9 x i32]*> [#uses=2]
  %loc.i.i = alloca [8 x i32], align 4            ; <[8 x i32]*> [#uses=3]
  %root.i.i = alloca [8 x i32], align 4           ; <[8 x i32]*> [#uses=2]
  %s.i.i = alloca [17 x i32], align 4             ; <[17 x i32]*> [#uses=6]
  %u_lu.i.i = alloca [18 x i32], align 4          ; <[18 x i32]*> [#uses=5]
  %l.i.i = alloca [18 x i32], align 4             ; <[18 x i32]*> [#uses=5]
  %d.i.i = alloca [18 x i32], align 4             ; <[18 x i32]*> [#uses=7]
  %elp.i.i = alloca [18 x [16 x i32]], align 4    ; <[18 x [16 x i32]]*> [#uses=45]
  %rs_out = alloca [204 x i8], align 1            ; <[204 x i8]*> [#uses=5]
  %rs_in = alloca [204 x i8], align 1             ; <[204 x i8]*> [#uses=4]
  %0 = getelementptr inbounds [18 x i32]* %d.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %1 = getelementptr inbounds [17 x i32]* %s.i.i, i32 0, i32 1 ; <i32*> [#uses=1]
  %2 = getelementptr inbounds [18 x i32]* %d.i.i, i32 0, i32 1 ; <i32*> [#uses=1]
  %3 = getelementptr inbounds [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 0 ; <i32*> [#uses=1]
  %4 = getelementptr inbounds [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 0 ; <i32*> [#uses=1]
  %scevgep175.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 1 ; <i32*> [#uses=1]
  %scevgep176.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 1 ; <i32*> [#uses=1]
  %scevgep175.1.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 2 ; <i32*> [#uses=1]
  %scevgep176.1.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 2 ; <i32*> [#uses=1]
  %scevgep175.2.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 3 ; <i32*> [#uses=1]
  %scevgep176.2.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 3 ; <i32*> [#uses=1]
  %scevgep175.3.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 4 ; <i32*> [#uses=1]
  %scevgep176.3.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 4 ; <i32*> [#uses=1]
  %scevgep175.4.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 5 ; <i32*> [#uses=1]
  %scevgep176.4.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 5 ; <i32*> [#uses=1]
  %scevgep175.5.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 6 ; <i32*> [#uses=1]
  %scevgep176.5.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 6 ; <i32*> [#uses=1]
  %scevgep175.6.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 7 ; <i32*> [#uses=1]
  %scevgep176.6.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 7 ; <i32*> [#uses=1]
  %scevgep175.7.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 8 ; <i32*> [#uses=1]
  %scevgep176.7.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 8 ; <i32*> [#uses=1]
  %scevgep175.8.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 9 ; <i32*> [#uses=1]
  %scevgep176.8.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 9 ; <i32*> [#uses=1]
  %scevgep175.9.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 10 ; <i32*> [#uses=1]
  %scevgep176.9.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 10 ; <i32*> [#uses=1]
  %scevgep175.10.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 11 ; <i32*> [#uses=1]
  %scevgep176.10.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 11 ; <i32*> [#uses=1]
  %scevgep175.11.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 12 ; <i32*> [#uses=1]
  %scevgep176.11.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 12 ; <i32*> [#uses=1]
  %scevgep175.12.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 13 ; <i32*> [#uses=1]
  %scevgep176.12.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 13 ; <i32*> [#uses=1]
  %scevgep175.13.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 14 ; <i32*> [#uses=1]
  %scevgep176.13.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 14 ; <i32*> [#uses=1]
  %scevgep175.14.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 1, i32 15 ; <i32*> [#uses=1]
  %scevgep176.14.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 0, i32 15 ; <i32*> [#uses=1]
  %5 = getelementptr inbounds [18 x i32]* %l.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %6 = getelementptr inbounds [18 x i32]* %l.i.i, i32 0, i32 1 ; <i32*> [#uses=1]
  %7 = getelementptr inbounds [18 x i32]* %u_lu.i.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %8 = getelementptr inbounds [18 x i32]* %u_lu.i.i, i32 0, i32 1 ; <i32*> [#uses=1]
  br label %bb2.preheader

bb1:                                              ; preds = %bb2.preheader, %bb1
  %j.01 = phi i32 [ 0, %bb2.preheader ], [ %11, %bb1 ] ; <i32> [#uses=2]
  %scevgep = getelementptr [204 x i8]* %rs_in, i32 0, i32 %j.01 ; <i8*> [#uses=1]
  %9 = call i32 (...)* @random() nounwind         ; <i32> [#uses=1]
  %10 = trunc i32 %9 to i8                        ; <i8> [#uses=1]
  store i8 %10, i8* %scevgep, align 1
  %11 = add nsw i32 %j.01, 1                      ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %11, 188                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb3, label %bb1

bb3:                                              ; preds = %bb1
  br i1 %inited.b.1, label %bb2.i.preheader, label %bb.i

bb.i:                                             ; preds = %bb3
  call fastcc void @generate_gf() nounwind
  call fastcc void @gen_poly() nounwind
  br label %bb2.i.preheader

bb2.i.preheader:                                  ; preds = %bb.i, %bb3
  %inited.b.2.ph = phi i1 [ true, %bb.i ], [ %inited.b.1, %bb3 ] ; <i1> [#uses=2]
  br label %bb2.i

bb2.i:                                            ; preds = %bb2.i, %bb2.i.preheader
  %i.06.i = phi i32 [ %12, %bb2.i ], [ 0, %bb2.i.preheader ] ; <i32> [#uses=2]
  %scevgep37.i = getelementptr [239 x i32]* @data, i32 0, i32 %i.06.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep37.i, align 4
  %12 = add nsw i32 %i.06.i, 1                    ; <i32> [#uses=2]
  %exitcond36.i = icmp eq i32 %12, 51             ; <i1> [#uses=1]
  br i1 %exitcond36.i, label %bb5.i, label %bb2.i

bb5.i:                                            ; preds = %bb5.i, %bb2.i
  %i.14.i = phi i32 [ %15, %bb5.i ], [ 0, %bb2.i ] ; <i32> [#uses=3]
  %scevgep33.i = getelementptr [204 x i8]* %rs_in, i32 0, i32 %i.14.i ; <i8*> [#uses=1]
  %tmp34.i = add i32 %i.14.i, 51                  ; <i32> [#uses=1]
  %scevgep35.i = getelementptr [239 x i32]* @data, i32 0, i32 %tmp34.i ; <i32*> [#uses=1]
  %13 = load i8* %scevgep33.i, align 1            ; <i8> [#uses=1]
  %14 = zext i8 %13 to i32                        ; <i32> [#uses=1]
  store i32 %14, i32* %scevgep35.i, align 4
  %15 = add nsw i32 %i.14.i, 1                    ; <i32> [#uses=2]
  %exitcond32.i = icmp eq i32 %15, 188            ; <i1> [#uses=1]
  br i1 %exitcond32.i, label %bb7.i, label %bb5.i

bb7.i:                                            ; preds = %bb5.i
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 0), align 32
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 1), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 2), align 8
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 3), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 4), align 16
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 5), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 7), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 8), align 32
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 9), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 10), align 8
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 11), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 12), align 16
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 13), align 4
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 14), align 8
  store i32 0, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 15), align 4
  br label %bb3.i.i

bb3.i.i:                                          ; preds = %bb15.i.i, %bb7.i
  %indvar23.i.i = phi i32 [ 0, %bb7.i ], [ %indvar.next24.i.i, %bb15.i.i ] ; <i32> [#uses=3]
  %tmp28.i.i = sub i32 237, %indvar23.i.i         ; <i32> [#uses=1]
  %tmp30.i = sub i32 238, %indvar23.i.i           ; <i32> [#uses=1]
  %scevgep27.i.i = getelementptr [239 x i32]* @data, i32 0, i32 %tmp30.i ; <i32*> [#uses=1]
  %16 = load i32* %scevgep27.i.i, align 4         ; <i32> [#uses=1]
  %17 = load i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 15), align 4 ; <i32> [#uses=1]
  %18 = xor i32 %17, %16                          ; <i32> [#uses=1]
  %19 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %18 ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=3]
  %21 = icmp eq i32 %20, -1                       ; <i1> [#uses=1]
  br i1 %21, label %bb12.i.i, label %bb5.i.i

bb5.i.i:                                          ; preds = %bb8.i.i, %bb3.i.i
  %indvar14.i.i = phi i32 [ %indvar.next15.i.i, %bb8.i.i ], [ 0, %bb3.i.i ] ; <i32> [#uses=3]
  %tmp23.i = sub i32 14, %indvar14.i.i            ; <i32> [#uses=1]
  %scevgep22.i.i = getelementptr [16 x i32]* @bb, i32 0, i32 %tmp23.i ; <i32*> [#uses=1]
  %tmp25.i = sub i32 15, %indvar14.i.i            ; <i32> [#uses=2]
  %scevgep20.i.i = getelementptr [16 x i32]* @bb, i32 0, i32 %tmp25.i ; <i32*> [#uses=1]
  %scevgep19.i.i = getelementptr [17 x i32]* @gg, i32 0, i32 %tmp25.i ; <i32*> [#uses=1]
  %22 = load i32* %scevgep19.i.i, align 4         ; <i32> [#uses=2]
  %23 = icmp eq i32 %22, -1                       ; <i1> [#uses=1]
  %24 = load i32* %scevgep22.i.i, align 4         ; <i32> [#uses=2]
  br i1 %23, label %bb8.i.i, label %bb6.i.i

bb6.i.i:                                          ; preds = %bb5.i.i
  %25 = add nsw i32 %22, %20                      ; <i32> [#uses=1]
  %26 = srem i32 %25, 255                         ; <i32> [#uses=1]
  %27 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %26 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4                    ; <i32> [#uses=1]
  %29 = xor i32 %28, %24                          ; <i32> [#uses=1]
  br label %bb8.i.i

bb8.i.i:                                          ; preds = %bb6.i.i, %bb5.i.i
  %storemerge31.i.i = phi i32 [ %29, %bb6.i.i ], [ %24, %bb5.i.i ] ; <i32> [#uses=1]
  store i32 %storemerge31.i.i, i32* %scevgep20.i.i
  %indvar.next15.i.i = add i32 %indvar14.i.i, 1   ; <i32> [#uses=2]
  %exitcond21.i = icmp eq i32 %indvar.next15.i.i, 15 ; <i1> [#uses=1]
  br i1 %exitcond21.i, label %bb10.i.i, label %bb5.i.i

bb10.i.i:                                         ; preds = %bb8.i.i
  %30 = load i32* getelementptr inbounds ([17 x i32]* @gg, i32 0, i32 0), align 32 ; <i32> [#uses=1]
  %31 = add nsw i32 %30, %20                      ; <i32> [#uses=1]
  %32 = srem i32 %31, 255                         ; <i32> [#uses=1]
  %33 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %32 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 4                    ; <i32> [#uses=1]
  br label %bb15.i.i

bb12.i.i:                                         ; preds = %bb12.i.i, %bb3.i.i
  %indvar.i.i = phi i32 [ %indvar.next.i.i, %bb12.i.i ], [ 0, %bb3.i.i ] ; <i32> [#uses=3]
  %tmp17.i = sub i32 14, %indvar.i.i              ; <i32> [#uses=1]
  %scevgep13.i.i = getelementptr [16 x i32]* @bb, i32 0, i32 %tmp17.i ; <i32*> [#uses=1]
  %tmp19.i = sub i32 15, %indvar.i.i              ; <i32> [#uses=1]
  %scevgep.i.i = getelementptr [16 x i32]* @bb, i32 0, i32 %tmp19.i ; <i32*> [#uses=1]
  %35 = load i32* %scevgep13.i.i, align 4         ; <i32> [#uses=1]
  store i32 %35, i32* %scevgep.i.i, align 4
  %indvar.next.i.i = add i32 %indvar.i.i, 1       ; <i32> [#uses=2]
  %exitcond15.i = icmp eq i32 %indvar.next.i.i, 15 ; <i1> [#uses=1]
  br i1 %exitcond15.i, label %bb15.i.i, label %bb12.i.i

bb15.i.i:                                         ; preds = %bb12.i.i, %bb10.i.i
  %storemerge.i.i = phi i32 [ %34, %bb10.i.i ], [ 0, %bb12.i.i ] ; <i32> [#uses=1]
  store i32 %storemerge.i.i, i32* getelementptr inbounds ([16 x i32]* @bb, i32 0, i32 0), align 32
  %phitmp8.i.i = icmp slt i32 %tmp28.i.i, 0       ; <i1> [#uses=1]
  %indvar.next24.i.i = add i32 %indvar23.i.i, 1   ; <i32> [#uses=1]
  br i1 %phitmp8.i.i, label %bb8.i, label %bb3.i.i

bb8.i:                                            ; preds = %bb8.i, %bb15.i.i
  %i.22.i = phi i32 [ %37, %bb8.i ], [ 0, %bb15.i.i ] ; <i32> [#uses=3]
  %scevgep13.i = getelementptr [204 x i8]* %rs_in, i32 0, i32 %i.22.i ; <i8*> [#uses=1]
  %scevgep14.i = getelementptr [204 x i8]* %rs_out, i32 0, i32 %i.22.i ; <i8*> [#uses=1]
  %36 = load i8* %scevgep13.i, align 1            ; <i8> [#uses=1]
  store i8 %36, i8* %scevgep14.i, align 1
  %37 = add nsw i32 %i.22.i, 1                    ; <i32> [#uses=2]
  %exitcond12.i = icmp eq i32 %37, 188            ; <i1> [#uses=1]
  br i1 %exitcond12.i, label %bb11.i, label %bb8.i

bb11.i:                                           ; preds = %bb11.i, %bb8.i
  %i.31.i = phi i32 [ %40, %bb11.i ], [ 0, %bb8.i ] ; <i32> [#uses=3]
  %scevgep.i = getelementptr [16 x i32]* @bb, i32 0, i32 %i.31.i ; <i32*> [#uses=1]
  %tmp.i = add i32 %i.31.i, 188                   ; <i32> [#uses=1]
  %scevgep11.i = getelementptr [204 x i8]* %rs_out, i32 0, i32 %tmp.i ; <i8*> [#uses=1]
  %38 = load i32* %scevgep.i, align 4             ; <i32> [#uses=1]
  %39 = trunc i32 %38 to i8                       ; <i8> [#uses=1]
  store i8 %39, i8* %scevgep11.i, align 1
  %40 = add nsw i32 %i.31.i, 1                    ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %40, 16               ; <i1> [#uses=1]
  br i1 %exitcond.i, label %rsenc_204.exit, label %bb11.i

rsenc_204.exit:                                   ; preds = %bb11.i
  %41 = call i32 (...)* @random() nounwind        ; <i32> [#uses=1]
  %42 = and i32 %41, 127                          ; <i32> [#uses=3]
  %43 = icmp eq i32 %42, 0                        ; <i1> [#uses=1]
  br i1 %43, label %bb8, label %bb.nph3

bb.nph3:                                          ; preds = %rsenc_204.exit
  %tmp8 = icmp ugt i32 %42, 1                     ; <i1> [#uses=1]
  %smax = select i1 %tmp8, i32 %42, i32 1         ; <i32> [#uses=1]
  br label %bb6

bb6:                                              ; preds = %bb6, %bb.nph3
  %j.12 = phi i32 [ 0, %bb.nph3 ], [ %49, %bb6 ]  ; <i32> [#uses=1]
  %44 = call i32 (...)* @random() nounwind        ; <i32> [#uses=1]
  %45 = srem i32 %44, 204                         ; <i32> [#uses=1]
  %46 = call i32 (...)* @random() nounwind        ; <i32> [#uses=1]
  %47 = trunc i32 %46 to i8                       ; <i8> [#uses=1]
  %48 = getelementptr inbounds [204 x i8]* %rs_out, i32 0, i32 %45 ; <i8*> [#uses=1]
  store i8 %47, i8* %48, align 1
  %49 = add nsw i32 %j.12, 1                      ; <i32> [#uses=2]
  %exitcond9 = icmp eq i32 %49, %smax             ; <i1> [#uses=1]
  br i1 %exitcond9, label %bb8, label %bb6

bb8:                                              ; preds = %bb6, %rsenc_204.exit
  br i1 %inited.b.2.ph, label %bb2.i3.preheader, label %bb.i2

bb.i2:                                            ; preds = %bb8
  call fastcc void @generate_gf() nounwind
  call fastcc void @gen_poly() nounwind
  br label %bb2.i3.preheader

bb2.i3.preheader:                                 ; preds = %bb.i2, %bb8
  %inited.b.0.ph = phi i1 [ true, %bb.i2 ], [ %inited.b.2.ph, %bb8 ] ; <i1> [#uses=1]
  br label %bb2.i3

bb2.i3:                                           ; preds = %bb2.i3, %bb2.i3.preheader
  %i.017.i = phi i32 [ %52, %bb2.i3 ], [ 0, %bb2.i3.preheader ] ; <i32> [#uses=3]
  %scevgep108.i = getelementptr [255 x i32]* @recd, i32 0, i32 %i.017.i ; <i32*> [#uses=1]
  %tmp109.i = add i32 %i.017.i, 188               ; <i32> [#uses=1]
  %scevgep110.i = getelementptr [204 x i8]* %rs_out, i32 0, i32 %tmp109.i ; <i8*> [#uses=1]
  %50 = load i8* %scevgep110.i, align 1           ; <i8> [#uses=1]
  %51 = zext i8 %50 to i32                        ; <i32> [#uses=1]
  store i32 %51, i32* %scevgep108.i, align 4
  %52 = add nsw i32 %i.017.i, 1                   ; <i32> [#uses=2]
  %exitcond107.i = icmp eq i32 %52, 16            ; <i1> [#uses=1]
  br i1 %exitcond107.i, label %bb5.i4, label %bb2.i3

bb5.i4:                                           ; preds = %bb5.i4, %bb2.i3
  %i.115.i = phi i32 [ %53, %bb5.i4 ], [ 0, %bb2.i3 ] ; <i32> [#uses=2]
  %tmp105.i = add i32 %i.115.i, 16                ; <i32> [#uses=1]
  %scevgep106.i = getelementptr [255 x i32]* @recd, i32 0, i32 %tmp105.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep106.i, align 4
  %53 = add nsw i32 %i.115.i, 1                   ; <i32> [#uses=2]
  %exitcond104.i = icmp eq i32 %53, 51            ; <i1> [#uses=1]
  br i1 %exitcond104.i, label %bb8.i5, label %bb5.i4

bb8.i5:                                           ; preds = %bb8.i5, %bb5.i4
  %i.213.i = phi i32 [ %56, %bb8.i5 ], [ 0, %bb5.i4 ] ; <i32> [#uses=3]
  %scevgep101.i = getelementptr [204 x i8]* %rs_out, i32 0, i32 %i.213.i ; <i8*> [#uses=1]
  %tmp102.i = add i32 %i.213.i, 67                ; <i32> [#uses=1]
  %scevgep103.i = getelementptr [255 x i32]* @recd, i32 0, i32 %tmp102.i ; <i32*> [#uses=1]
  %54 = load i8* %scevgep101.i, align 1           ; <i8> [#uses=1]
  %55 = zext i8 %54 to i32                        ; <i32> [#uses=1]
  store i32 %55, i32* %scevgep103.i, align 4
  %56 = add nsw i32 %i.213.i, 1                   ; <i32> [#uses=2]
  %exitcond100.i = icmp eq i32 %56, 188           ; <i1> [#uses=1]
  br i1 %exitcond100.i, label %bb11.i6, label %bb8.i5

bb11.i6:                                          ; preds = %bb11.i6, %bb8.i5
  %i.311.i = phi i32 [ %60, %bb11.i6 ], [ 0, %bb8.i5 ] ; <i32> [#uses=2]
  %scevgep99.i = getelementptr [255 x i32]* @recd, i32 0, i32 %i.311.i ; <i32*> [#uses=2]
  %57 = load i32* %scevgep99.i, align 4           ; <i32> [#uses=1]
  %58 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %57 ; <i32*> [#uses=1]
  %59 = load i32* %58, align 4                    ; <i32> [#uses=1]
  store i32 %59, i32* %scevgep99.i, align 4
  %60 = add nsw i32 %i.311.i, 1                   ; <i32> [#uses=2]
  %exitcond98.i = icmp eq i32 %60, 255            ; <i1> [#uses=1]
  br i1 %exitcond98.i, label %bb.i.i, label %bb11.i6

bb.i.i:                                           ; preds = %bb5.i.i8, %bb11.i6
  %indvar181.i.i = phi i32 [ %tmp91.i, %bb5.i.i8 ], [ 0, %bb11.i6 ] ; <i32> [#uses=1]
  %syn_error.155.i.i = phi i32 [ %syn_error.0.i.i, %bb5.i.i8 ], [ 0, %bb11.i6 ] ; <i32> [#uses=1]
  %tmp91.i = add i32 %indvar181.i.i, 1            ; <i32> [#uses=4]
  %scevgep188.i.i = getelementptr [17 x i32]* %s.i.i, i32 0, i32 %tmp91.i ; <i32*> [#uses=3]
  store i32 0, i32* %scevgep188.i.i, align 4
  br label %bb1.i.i

bb1.i.i:                                          ; preds = %bb3.i.i7, %bb.i.i
  %61 = phi i32 [ 0, %bb.i.i ], [ %.rle249.i.i, %bb3.i.i7 ] ; <i32> [#uses=2]
  %j.052.i.i = phi i32 [ 0, %bb.i.i ], [ %68, %bb3.i.i7 ] ; <i32> [#uses=3]
  %scevgep180.i.i = getelementptr [255 x i32]* @recd, i32 0, i32 %j.052.i.i ; <i32*> [#uses=1]
  %62 = load i32* %scevgep180.i.i, align 4        ; <i32> [#uses=2]
  %63 = icmp eq i32 %62, -1                       ; <i1> [#uses=1]
  br i1 %63, label %bb3.i.i7, label %bb2.i.i

bb2.i.i:                                          ; preds = %bb1.i.i
  %tmp92.i = mul i32 %j.052.i.i, %tmp91.i         ; <i32> [#uses=1]
  %tmp185.i.i = add i32 %62, %tmp92.i             ; <i32> [#uses=1]
  %64 = srem i32 %tmp185.i.i, 255                 ; <i32> [#uses=1]
  %65 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %64 ; <i32*> [#uses=1]
  %66 = load i32* %65, align 4                    ; <i32> [#uses=1]
  %67 = xor i32 %66, %61                          ; <i32> [#uses=2]
  store i32 %67, i32* %scevgep188.i.i, align 4
  br label %bb3.i.i7

bb3.i.i7:                                         ; preds = %bb2.i.i, %bb1.i.i
  %.rle249.i.i = phi i32 [ %67, %bb2.i.i ], [ %61, %bb1.i.i ] ; <i32> [#uses=3]
  %68 = add nsw i32 %j.052.i.i, 1                 ; <i32> [#uses=2]
  %exitcond90.i = icmp eq i32 %68, 255            ; <i1> [#uses=1]
  br i1 %exitcond90.i, label %bb5.i.i8, label %bb1.i.i

bb5.i.i8:                                         ; preds = %bb3.i.i7
  %69 = icmp eq i32 %.rle249.i.i, 0               ; <i1> [#uses=1]
  %syn_error.0.i.i = select i1 %69, i32 %syn_error.155.i.i, i32 1 ; <i32> [#uses=2]
  %70 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %.rle249.i.i ; <i32*> [#uses=1]
  %71 = load i32* %70, align 4                    ; <i32> [#uses=1]
  store i32 %71, i32* %scevgep188.i.i, align 4
  %exitcond95.i = icmp eq i32 %tmp91.i, 16        ; <i1> [#uses=1]
  br i1 %exitcond95.i, label %bb9.i.i, label %bb.i.i

bb9.i.i:                                          ; preds = %bb5.i.i8
  %72 = icmp eq i32 %syn_error.0.i.i, 0           ; <i1> [#uses=1]
  br i1 %72, label %bb127.i.i, label %bb10.i.i9

bb10.i.i9:                                        ; preds = %bb9.i.i
  store i32 0, i32* %0, align 4
  %73 = load i32* %1, align 4                     ; <i32> [#uses=1]
  store i32 %73, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 1, i32* %4, align 4
  store i32 -1, i32* %scevgep176.i.i, align 4
  store i32 0, i32* %scevgep175.i.i, align 4
  store i32 -1, i32* %scevgep176.1.i.i, align 4
  store i32 0, i32* %scevgep175.1.i.i, align 4
  store i32 -1, i32* %scevgep176.2.i.i, align 4
  store i32 0, i32* %scevgep175.2.i.i, align 4
  store i32 -1, i32* %scevgep176.3.i.i, align 4
  store i32 0, i32* %scevgep175.3.i.i, align 4
  store i32 -1, i32* %scevgep176.4.i.i, align 4
  store i32 0, i32* %scevgep175.4.i.i, align 4
  store i32 -1, i32* %scevgep176.5.i.i, align 4
  store i32 0, i32* %scevgep175.5.i.i, align 4
  store i32 -1, i32* %scevgep176.6.i.i, align 4
  store i32 0, i32* %scevgep175.6.i.i, align 4
  store i32 -1, i32* %scevgep176.7.i.i, align 4
  store i32 0, i32* %scevgep175.7.i.i, align 4
  store i32 -1, i32* %scevgep176.8.i.i, align 4
  store i32 0, i32* %scevgep175.8.i.i, align 4
  store i32 -1, i32* %scevgep176.9.i.i, align 4
  store i32 0, i32* %scevgep175.9.i.i, align 4
  store i32 -1, i32* %scevgep176.10.i.i, align 4
  store i32 0, i32* %scevgep175.10.i.i, align 4
  store i32 -1, i32* %scevgep176.11.i.i, align 4
  store i32 0, i32* %scevgep175.11.i.i, align 4
  store i32 -1, i32* %scevgep176.12.i.i, align 4
  store i32 0, i32* %scevgep175.12.i.i, align 4
  store i32 -1, i32* %scevgep176.13.i.i, align 4
  store i32 0, i32* %scevgep175.13.i.i, align 4
  store i32 -1, i32* %scevgep176.14.i.i, align 4
  store i32 0, i32* %scevgep175.14.i.i, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  store i32 -1, i32* %7, align 4
  store i32 0, i32* %8, align 4
  br label %bb14.i.i

bb14.i.i:                                         ; preds = %bb54.i.i, %bb10.i.i9
  %74 = phi i32 [ 0, %bb10.i.i9 ], [ %tmp132.i.i, %bb54.i.i ] ; <i32> [#uses=3]
  %tmp132.i.i = add i32 %74, 1                    ; <i32> [#uses=10]
  %tmp122.i.i = add i32 %74, 2                    ; <i32> [#uses=14]
  %scevgep170.i.i = getelementptr [18 x i32]* %d.i.i, i32 0, i32 %tmp132.i.i ; <i32*> [#uses=1]
  %scevgep169.i.i = getelementptr [18 x i32]* %l.i.i, i32 0, i32 %tmp132.i.i ; <i32*> [#uses=4]
  %scevgep168.i.i = getelementptr [18 x i32]* %u_lu.i.i, i32 0, i32 %tmp122.i.i ; <i32*> [#uses=1]
  %scevgep167.i.i = getelementptr [17 x i32]* %s.i.i, i32 0, i32 %tmp122.i.i ; <i32*> [#uses=1]
  %scevgep166.i.i = getelementptr [18 x i32]* %d.i.i, i32 0, i32 %tmp122.i.i ; <i32*> [#uses=3]
  %scevgep165.i.i = getelementptr [18 x i32]* %l.i.i, i32 0, i32 %tmp122.i.i ; <i32*> [#uses=2]
  %scevgep.i10 = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 0 ; <i32*> [#uses=1]
  %scevgep123251.i.i = bitcast i32* %scevgep.i10 to i8* ; <i8*> [#uses=1]
  %75 = load i32* %scevgep170.i.i, align 4        ; <i32> [#uses=2]
  %76 = icmp eq i32 %75, -1                       ; <i1> [#uses=1]
  br i1 %76, label %bb15.i.i11, label %bb20.i.i

bb15.i.i11:                                       ; preds = %bb14.i.i
  %77 = load i32* %scevgep169.i.i, align 4        ; <i32> [#uses=3]
  store i32 %77, i32* %scevgep165.i.i, align 4
  %78 = load i32* %scevgep169.i.i, align 4        ; <i32> [#uses=2]
  %79 = icmp slt i32 %78, 0                       ; <i1> [#uses=1]
  br i1 %79, label %bb43.i.i, label %bb16.i.i

bb16.i.i:                                         ; preds = %bb16.i.i, %bb15.i.i11
  %i.243.i.i = phi i32 [ %tmp69.i, %bb16.i.i ], [ 0, %bb15.i.i11 ] ; <i32> [#uses=3]
  %tmp69.i = add i32 %i.243.i.i, 1                ; <i32> [#uses=2]
  %scevgep140.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %i.243.i.i ; <i32*> [#uses=1]
  %scevgep138.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp132.i.i, i32 %i.243.i.i ; <i32*> [#uses=3]
  %80 = load i32* %scevgep138.i.i, align 4        ; <i32> [#uses=1]
  store i32 %80, i32* %scevgep140.i.i, align 4
  %81 = load i32* %scevgep138.i.i, align 4        ; <i32> [#uses=1]
  %82 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %81 ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=1]
  store i32 %83, i32* %scevgep138.i.i, align 4
  %84 = icmp slt i32 %78, %tmp69.i                ; <i1> [#uses=1]
  br i1 %84, label %bb43.i.i, label %bb16.i.i

bb20.i.i:                                         ; preds = %bb20.i.i, %bb14.i.i
  %85 = phi i32 [ %indvar.next114.i.i, %bb20.i.i ], [ 0, %bb14.i.i ] ; <i32> [#uses=2]
  %q.0.i.i = sub i32 %74, %85                     ; <i32> [#uses=6]
  %scevgep120.i.i = getelementptr [18 x i32]* %d.i.i, i32 0, i32 %q.0.i.i ; <i32*> [#uses=1]
  %86 = load i32* %scevgep120.i.i, align 4        ; <i32> [#uses=1]
  %87 = icmp eq i32 %86, -1                       ; <i1> [#uses=1]
  %88 = icmp sgt i32 %q.0.i.i, 0                  ; <i1> [#uses=2]
  %89 = and i1 %87, %88                           ; <i1> [#uses=1]
  %indvar.next114.i.i = add i32 %85, 1            ; <i32> [#uses=1]
  br i1 %89, label %bb20.i.i, label %bb23.i.i

bb23.i.i:                                         ; preds = %bb20.i.i
  br i1 %88, label %bb25.i.i, label %bb29.i.i

bb25.i.i:                                         ; preds = %bb28.i.i, %bb23.i.i
  %indvar111.i.i = phi i32 [ %indvar.next112.i.i, %bb28.i.i ], [ 0, %bb23.i.i ] ; <i32> [#uses=1]
  %j.1.i.i = phi i32 [ %90, %bb28.i.i ], [ %q.0.i.i, %bb23.i.i ] ; <i32> [#uses=1]
  %q.2.i.i = phi i32 [ %q.1.i.i, %bb28.i.i ], [ %q.0.i.i, %bb23.i.i ] ; <i32> [#uses=3]
  %90 = add i32 %j.1.i.i, -1                      ; <i32> [#uses=4]
  %91 = getelementptr inbounds [18 x i32]* %d.i.i, i32 0, i32 %90 ; <i32*> [#uses=1]
  %92 = load i32* %91, align 4                    ; <i32> [#uses=1]
  %93 = icmp eq i32 %92, -1                       ; <i1> [#uses=1]
  br i1 %93, label %bb28.i.i, label %bb26.i.i

bb26.i.i:                                         ; preds = %bb25.i.i
  %94 = getelementptr inbounds [18 x i32]* %u_lu.i.i, i32 0, i32 %q.2.i.i ; <i32*> [#uses=1]
  %95 = load i32* %94, align 4                    ; <i32> [#uses=1]
  %96 = getelementptr inbounds [18 x i32]* %u_lu.i.i, i32 0, i32 %90 ; <i32*> [#uses=1]
  %97 = load i32* %96, align 4                    ; <i32> [#uses=1]
  %98 = icmp slt i32 %95, %97                     ; <i1> [#uses=1]
  br i1 %98, label %bb27.i.i, label %bb28.i.i

bb27.i.i:                                         ; preds = %bb26.i.i
  br label %bb28.i.i

bb28.i.i:                                         ; preds = %bb27.i.i, %bb26.i.i, %bb25.i.i
  %q.1.i.i = phi i32 [ %90, %bb27.i.i ], [ %q.2.i.i, %bb25.i.i ], [ %q.2.i.i, %bb26.i.i ] ; <i32> [#uses=2]
  %indvar.next112.i.i = add i32 %indvar111.i.i, 1 ; <i32> [#uses=2]
  %exitcond65.i = icmp eq i32 %indvar.next112.i.i, %q.0.i.i ; <i1> [#uses=1]
  br i1 %exitcond65.i, label %bb29.i.i, label %bb25.i.i

bb29.i.i:                                         ; preds = %bb28.i.i, %bb23.i.i
  %q.3.i.i = phi i32 [ %q.0.i.i, %bb23.i.i ], [ %q.1.i.i, %bb28.i.i ] ; <i32> [#uses=5]
  %99 = load i32* %scevgep169.i.i, align 4        ; <i32> [#uses=2]
  %100 = getelementptr inbounds [18 x i32]* %l.i.i, i32 0, i32 %q.3.i.i ; <i32*> [#uses=2]
  %101 = load i32* %100, align 4                  ; <i32> [#uses=1]
  %tmp78.i = add i32 %101, %tmp132.i.i            ; <i32> [#uses=1]
  %tmp159.i.i = sub i32 %tmp78.i, %q.3.i.i        ; <i32> [#uses=2]
  %102 = icmp sgt i32 %99, %tmp159.i.i            ; <i1> [#uses=1]
  %storemerge189.i.i = select i1 %102, i32 %99, i32 %tmp159.i.i ; <i32> [#uses=3]
  store i32 %storemerge189.i.i, i32* %scevgep165.i.i
  call void @llvm.memset.i64(i8* %scevgep123251.i.i, i8 0, i64 64, i32 4) nounwind
  %103 = load i32* %100, align 4                  ; <i32> [#uses=2]
  %104 = icmp slt i32 %103, 0                     ; <i1> [#uses=1]
  br i1 %104, label %bb42.preheader.i.i, label %bb.nph40.i.i

bb.nph40.i.i:                                     ; preds = %bb29.i.i
  %105 = getelementptr inbounds [18 x i32]* %d.i.i, i32 0, i32 %q.3.i.i ; <i32*> [#uses=1]
  %106 = add nsw i32 %75, 255                     ; <i32> [#uses=1]
  %tmp60.i = sub i32 %tmp132.i.i, %q.3.i.i        ; <i32> [#uses=1]
  br label %bb36.i.i

bb36.i.i:                                         ; preds = %bb38.i.i, %bb.nph40.i.i
  %i.439.i.i = phi i32 [ 0, %bb.nph40.i.i ], [ %tmp131.i.i, %bb38.i.i ] ; <i32> [#uses=3]
  %scevgep124.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %q.3.i.i, i32 %i.439.i.i ; <i32*> [#uses=1]
  %tmp131.i.i = add i32 %i.439.i.i, 1             ; <i32> [#uses=2]
  %107 = load i32* %scevgep124.i.i, align 4       ; <i32> [#uses=2]
  %108 = icmp eq i32 %107, -1                     ; <i1> [#uses=1]
  br i1 %108, label %bb38.i.i, label %bb37.i.i

bb37.i.i:                                         ; preds = %bb36.i.i
  %tmp61.i = add i32 %i.439.i.i, %tmp60.i         ; <i32> [#uses=1]
  %scevgep130.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %tmp61.i ; <i32*> [#uses=1]
  %109 = load i32* %105, align 4                  ; <i32> [#uses=1]
  %110 = add i32 %106, %107                       ; <i32> [#uses=1]
  %111 = sub i32 %110, %109                       ; <i32> [#uses=1]
  %112 = srem i32 %111, 255                       ; <i32> [#uses=1]
  %113 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %112 ; <i32*> [#uses=1]
  %114 = load i32* %113, align 4                  ; <i32> [#uses=1]
  store i32 %114, i32* %scevgep130.i.i, align 4
  br label %bb38.i.i

bb38.i.i:                                         ; preds = %bb37.i.i, %bb36.i.i
  %115 = icmp slt i32 %103, %tmp131.i.i           ; <i1> [#uses=1]
  br i1 %115, label %bb42.preheader.i.i, label %bb36.i.i

bb42.preheader.i.i:                               ; preds = %bb38.i.i, %bb29.i.i
  %116 = load i32* %scevgep169.i.i, align 4       ; <i32> [#uses=2]
  %117 = icmp slt i32 %116, 0                     ; <i1> [#uses=1]
  br i1 %117, label %bb43.i.i, label %bb41.i.i

bb41.i.i:                                         ; preds = %bb41.i.i, %bb42.preheader.i.i
  %i.541.i.i = phi i32 [ %tmp54.i, %bb41.i.i ], [ 0, %bb42.preheader.i.i ] ; <i32> [#uses=3]
  %tmp54.i = add i32 %i.541.i.i, 1                ; <i32> [#uses=2]
  %scevgep135.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %i.541.i.i ; <i32*> [#uses=2]
  %scevgep133.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp132.i.i, i32 %i.541.i.i ; <i32*> [#uses=3]
  %118 = load i32* %scevgep135.i.i, align 4       ; <i32> [#uses=1]
  %119 = load i32* %scevgep133.i.i, align 4       ; <i32> [#uses=1]
  %120 = xor i32 %119, %118                       ; <i32> [#uses=1]
  store i32 %120, i32* %scevgep135.i.i, align 4
  %121 = load i32* %scevgep133.i.i, align 4       ; <i32> [#uses=1]
  %122 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %121 ; <i32*> [#uses=1]
  %123 = load i32* %122, align 4                  ; <i32> [#uses=1]
  store i32 %123, i32* %scevgep133.i.i, align 4
  %124 = icmp slt i32 %116, %tmp54.i              ; <i1> [#uses=1]
  br i1 %124, label %bb43.i.i, label %bb41.i.i

bb43.i.i:                                         ; preds = %bb41.i.i, %bb42.preheader.i.i, %bb16.i.i, %bb15.i.i11
  %125 = phi i32 [ %77, %bb15.i.i11 ], [ %storemerge189.i.i, %bb42.preheader.i.i ], [ %77, %bb16.i.i ], [ %storemerge189.i.i, %bb41.i.i ] ; <i32> [#uses=16]
  %tmp164.i.i = sub i32 %tmp132.i.i, %125         ; <i32> [#uses=1]
  store i32 %tmp164.i.i, i32* %scevgep168.i.i, align 4
  %126 = icmp sgt i32 %tmp132.i.i, 15             ; <i1> [#uses=1]
  br i1 %126, label %bb56.i.i, label %bb44.i.i

bb44.i.i:                                         ; preds = %bb43.i.i
  %127 = load i32* %scevgep167.i.i, align 4       ; <i32> [#uses=2]
  %128 = icmp eq i32 %127, -1                     ; <i1> [#uses=1]
  br i1 %128, label %bb52.preheader.i.i, label %bb45.i.i

bb45.i.i:                                         ; preds = %bb44.i.i
  %129 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %127 ; <i32*> [#uses=1]
  %130 = load i32* %129, align 4                  ; <i32> [#uses=1]
  br label %bb52.preheader.i.i

bb52.preheader.i.i:                               ; preds = %bb45.i.i, %bb44.i.i
  %storemerge190.i.i = phi i32 [ %130, %bb45.i.i ], [ 0, %bb44.i.i ] ; <i32> [#uses=3]
  store i32 %storemerge190.i.i, i32* %scevgep166.i.i
  %131 = icmp slt i32 %125, 1                     ; <i1> [#uses=1]
  br i1 %131, label %bb54.i.i, label %bb48.i.i

bb48.i.i:                                         ; preds = %bb51.i.i, %bb52.preheader.i.i
  %132 = phi i32 [ %.rle240.i.i, %bb51.i.i ], [ %storemerge190.i.i, %bb52.preheader.i.i ] ; <i32> [#uses=3]
  %indvar142.i.i = phi i32 [ %sum195.i.i, %bb51.i.i ], [ 0, %bb52.preheader.i.i ] ; <i32> [#uses=3]
  %tmp153.i.i = add i32 %indvar142.i.i, 2         ; <i32> [#uses=1]
  %tmp53.i = sub i32 %tmp132.i.i, %indvar142.i.i  ; <i32> [#uses=1]
  %scevgep147.i.i = getelementptr [17 x i32]* %s.i.i, i32 0, i32 %tmp53.i ; <i32*> [#uses=1]
  %sum195.i.i = add i32 %indvar142.i.i, 1         ; <i32> [#uses=2]
  %133 = load i32* %scevgep147.i.i, align 4       ; <i32> [#uses=2]
  %134 = icmp eq i32 %133, -1                     ; <i1> [#uses=1]
  br i1 %134, label %bb51.i.i, label %bb49.i.i

bb49.i.i:                                         ; preds = %bb48.i.i
  %scevgep152.i.i = getelementptr [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %sum195.i.i ; <i32*> [#uses=1]
  %135 = load i32* %scevgep152.i.i, align 4       ; <i32> [#uses=2]
  %136 = icmp eq i32 %135, 0                      ; <i1> [#uses=1]
  br i1 %136, label %bb51.i.i, label %bb50.i.i

bb50.i.i:                                         ; preds = %bb49.i.i
  %137 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %135 ; <i32*> [#uses=1]
  %138 = load i32* %137, align 4                  ; <i32> [#uses=1]
  %139 = add nsw i32 %138, %133                   ; <i32> [#uses=1]
  %140 = srem i32 %139, 255                       ; <i32> [#uses=1]
  %141 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %140 ; <i32*> [#uses=1]
  %142 = load i32* %141, align 4                  ; <i32> [#uses=1]
  %143 = xor i32 %142, %132                       ; <i32> [#uses=2]
  store i32 %143, i32* %scevgep166.i.i, align 4
  br label %bb51.i.i

bb51.i.i:                                         ; preds = %bb50.i.i, %bb49.i.i, %bb48.i.i
  %.rle240.i.i = phi i32 [ %143, %bb50.i.i ], [ %132, %bb48.i.i ], [ %132, %bb49.i.i ] ; <i32> [#uses=2]
  %144 = icmp slt i32 %125, %tmp153.i.i           ; <i1> [#uses=1]
  br i1 %144, label %bb54.i.i, label %bb48.i.i

bb54.i.i:                                         ; preds = %bb51.i.i, %bb52.preheader.i.i
  %145 = phi i32 [ %storemerge190.i.i, %bb52.preheader.i.i ], [ %.rle240.i.i, %bb51.i.i ] ; <i32> [#uses=1]
  %146 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %145 ; <i32*> [#uses=1]
  %147 = load i32* %146, align 4                  ; <i32> [#uses=1]
  store i32 %147, i32* %scevgep166.i.i, align 4
  %148 = icmp sgt i32 %125, 8                     ; <i1> [#uses=1]
  br i1 %148, label %bb121.i.i, label %bb14.i.i

bb56.i.i:                                         ; preds = %bb43.i.i
  %149 = icmp sgt i32 %125, 8                     ; <i1> [#uses=1]
  br i1 %149, label %bb121.i.i, label %bb59.preheader.i.i

bb59.preheader.i.i:                               ; preds = %bb56.i.i
  %150 = icmp slt i32 %125, 0                     ; <i1> [#uses=1]
  br i1 %150, label %bb62.loopexit.i.i, label %bb58.i.i

bb58.i.i:                                         ; preds = %bb58.i.i, %bb59.preheader.i.i
  %151 = phi i32 [ %tmp.i12, %bb58.i.i ], [ 0, %bb59.preheader.i.i ] ; <i32> [#uses=2]
  %tmp.i12 = add i32 %151, 1                      ; <i32> [#uses=2]
  %152 = getelementptr inbounds [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %151 ; <i32*> [#uses=2]
  %153 = load i32* %152, align 4                  ; <i32> [#uses=1]
  %154 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %153 ; <i32*> [#uses=1]
  %155 = load i32* %154, align 4                  ; <i32> [#uses=1]
  store i32 %155, i32* %152, align 4
  %156 = icmp slt i32 %125, %tmp.i12              ; <i1> [#uses=1]
  br i1 %156, label %bb62.loopexit.i.i, label %bb58.i.i

bb61.i.i:                                         ; preds = %bb62.loopexit.i.i, %bb61.i.i
  %indvar103.i.i = phi i32 [ %i.831.i.i, %bb61.i.i ], [ 0, %bb62.loopexit.i.i ] ; <i32> [#uses=2]
  %tmp107.i.i = add i32 %indvar103.i.i, 2         ; <i32> [#uses=1]
  %i.831.i.i = add i32 %indvar103.i.i, 1          ; <i32> [#uses=3]
  %scevgep106.i.i = getelementptr [9 x i32]* %reg.i.i, i32 0, i32 %i.831.i.i ; <i32*> [#uses=1]
  %157 = getelementptr inbounds [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %i.831.i.i ; <i32*> [#uses=1]
  %158 = load i32* %157, align 4                  ; <i32> [#uses=1]
  store i32 %158, i32* %scevgep106.i.i, align 4
  %159 = icmp slt i32 %125, %tmp107.i.i           ; <i1> [#uses=1]
  br i1 %159, label %bb68.preheader.i.preheader.i, label %bb61.i.i

bb62.loopexit.i.i:                                ; preds = %bb58.i.i, %bb59.preheader.i.i
  %160 = icmp slt i32 %125, 1                     ; <i1> [#uses=4]
  br i1 %160, label %bb68.preheader.i.us.i, label %bb61.i.i

bb68.preheader.i.preheader.i:                     ; preds = %bb61.i.i
  br i1 %160, label %bb68.preheader.i.us.i, label %bb68.preheader.i.i

bb68.preheader.i.us.i:                            ; preds = %bb68.preheader.i.us.i, %bb68.preheader.i.preheader.i, %bb62.loopexit.i.i
  %indvar97.i.us.i = phi i32 [ %i.927.i.us.i, %bb68.preheader.i.us.i ], [ 0, %bb62.loopexit.i.i ], [ 0, %bb68.preheader.i.preheader.i ] ; <i32> [#uses=1]
  %i.927.i.us.i = add i32 %indvar97.i.us.i, 1     ; <i32> [#uses=2]
  %exitcond.i13 = icmp eq i32 %i.927.i.us.i, 255  ; <i1> [#uses=1]
  br i1 %exitcond.i13, label %bb73.i.split.i, label %bb68.preheader.i.us.i

bb65.i.i:                                         ; preds = %bb68.preheader.i.i, %bb67.i.i
  %indvar91.i.i = phi i32 [ 0, %bb68.preheader.i.i ], [ %tmp41.i, %bb67.i.i ] ; <i32> [#uses=2]
  %q.524.i.i = phi i32 [ 1, %bb68.preheader.i.i ], [ %q.4.i.i, %bb67.i.i ] ; <i32> [#uses=2]
  %tmp96.i.i = add i32 %indvar91.i.i, 2           ; <i32> [#uses=1]
  %tmp41.i = add i32 %indvar91.i.i, 1             ; <i32> [#uses=3]
  %scevgep94.i.i = getelementptr [9 x i32]* %reg.i.i, i32 0, i32 %tmp41.i ; <i32*> [#uses=2]
  %161 = load i32* %scevgep94.i.i, align 4        ; <i32> [#uses=2]
  %162 = icmp eq i32 %161, -1                     ; <i1> [#uses=1]
  br i1 %162, label %bb67.i.i, label %bb66.i.i

bb66.i.i:                                         ; preds = %bb65.i.i
  %tmp95.i.i = add i32 %161, %tmp41.i             ; <i32> [#uses=1]
  %163 = srem i32 %tmp95.i.i, 255                 ; <i32> [#uses=2]
  store i32 %163, i32* %scevgep94.i.i, align 4
  %164 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %163 ; <i32*> [#uses=1]
  %165 = load i32* %164, align 4                  ; <i32> [#uses=1]
  %166 = xor i32 %165, %q.524.i.i                 ; <i32> [#uses=1]
  br label %bb67.i.i

bb67.i.i:                                         ; preds = %bb66.i.i, %bb65.i.i
  %q.4.i.i = phi i32 [ %166, %bb66.i.i ], [ %q.524.i.i, %bb65.i.i ] ; <i32> [#uses=2]
  %167 = icmp slt i32 %125, %tmp96.i.i            ; <i1> [#uses=1]
  br i1 %167, label %bb69.i.i, label %bb65.i.i

bb69.i.i:                                         ; preds = %bb67.i.i
  %168 = icmp eq i32 %q.4.i.i, 0                  ; <i1> [#uses=1]
  br i1 %168, label %bb70.i.i, label %bb71.i.i

bb70.i.i:                                         ; preds = %bb69.i.i
  %169 = getelementptr inbounds [8 x i32]* %root.i.i, i32 0, i32 %count.128.i.i ; <i32*> [#uses=1]
  store i32 %i.927.i.i, i32* %169, align 4
  %170 = getelementptr inbounds [8 x i32]* %loc.i.i, i32 0, i32 %count.128.i.i ; <i32*> [#uses=1]
  store i32 %tmp102.i.i, i32* %170, align 4
  %171 = add i32 %count.128.i.i, 1                ; <i32> [#uses=1]
  br label %bb71.i.i

bb71.i.i:                                         ; preds = %bb70.i.i, %bb69.i.i
  %count.0.i.i = phi i32 [ %171, %bb70.i.i ], [ %count.128.i.i, %bb69.i.i ] ; <i32> [#uses=2]
  %exitcond43.i = icmp eq i32 %i.927.i.i, 255     ; <i1> [#uses=1]
  br i1 %exitcond43.i, label %bb73.i.split.i, label %bb68.preheader.i.i

bb68.preheader.i.i:                               ; preds = %bb71.i.i, %bb68.preheader.i.preheader.i
  %indvar97.i.i = phi i32 [ %i.927.i.i, %bb71.i.i ], [ 0, %bb68.preheader.i.preheader.i ] ; <i32> [#uses=2]
  %count.128.i.i = phi i32 [ %count.0.i.i, %bb71.i.i ], [ 0, %bb68.preheader.i.preheader.i ] ; <i32> [#uses=4]
  %i.927.i.i = add i32 %indvar97.i.i, 1           ; <i32> [#uses=3]
  %tmp102.i.i = sub i32 254, %indvar97.i.i        ; <i32> [#uses=1]
  br label %bb65.i.i

bb73.i.split.i:                                   ; preds = %bb71.i.i, %bb68.preheader.i.us.i
  %count.0.i.lcssa.us-lcssa.i = phi i32 [ 0, %bb68.preheader.i.us.i ], [ %count.0.i.i, %bb71.i.i ] ; <i32> [#uses=1]
  %172 = icmp eq i32 %125, %count.0.i.lcssa.us-lcssa.i ; <i1> [#uses=1]
  br i1 %172, label %bb92.preheader.i.i, label %bb115.i.i

bb92.preheader.i.i:                               ; preds = %bb73.i.split.i
  br i1 %160, label %bb94.i.i, label %bb75.i.i

bb75.i.i:                                         ; preds = %bb91.i.i, %bb92.preheader.i.i
  %173 = phi i32 [ %i.1021.i.i, %bb91.i.i ], [ 0, %bb92.preheader.i.i ] ; <i32> [#uses=4]
  %tmp88.i.i = add i32 %173, 2                    ; <i32> [#uses=1]
  %i.1021.i.i = add i32 %173, 1                   ; <i32> [#uses=6]
  %scevgep90.i.i = getelementptr [9 x i32]* %z.i.i, i32 0, i32 %i.1021.i.i ; <i32*> [#uses=6]
  %scevgep89.i.i = getelementptr [17 x i32]* %s.i.i, i32 0, i32 %i.1021.i.i ; <i32*> [#uses=1]
  %174 = load i32* %scevgep89.i.i, align 4        ; <i32> [#uses=3]
  %175 = icmp eq i32 %174, -1                     ; <i1> [#uses=2]
  br i1 %175, label %bb82.i.i, label %bb76.i.i

bb76.i.i:                                         ; preds = %bb75.i.i
  %176 = getelementptr inbounds [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %i.1021.i.i ; <i32*> [#uses=1]
  %177 = load i32* %176, align 4                  ; <i32> [#uses=2]
  %178 = icmp eq i32 %177, -1                     ; <i1> [#uses=1]
  br i1 %178, label %bb78.i.i, label %bb77.i.i

bb77.i.i:                                         ; preds = %bb76.i.i
  %179 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %174 ; <i32*> [#uses=1]
  %180 = load i32* %179, align 4                  ; <i32> [#uses=1]
  %181 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %177 ; <i32*> [#uses=1]
  %182 = load i32* %181, align 4                  ; <i32> [#uses=1]
  %183 = xor i32 %182, %180                       ; <i32> [#uses=2]
  store i32 %183, i32* %scevgep90.i.i, align 4
  br label %bb90.preheader.i.i

bb78.i.i:                                         ; preds = %bb76.i.i
  br i1 %175, label %bb82.i.i, label %bb79.i.i

bb79.i.i:                                         ; preds = %bb78.i.i
  %184 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %174 ; <i32*> [#uses=1]
  %185 = load i32* %184, align 4                  ; <i32> [#uses=2]
  store i32 %185, i32* %scevgep90.i.i, align 4
  br label %bb90.preheader.i.i

bb82.i.i:                                         ; preds = %bb78.i.i, %bb75.i.i
  %186 = getelementptr inbounds [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %i.1021.i.i ; <i32*> [#uses=1]
  %187 = load i32* %186, align 4                  ; <i32> [#uses=2]
  %188 = icmp eq i32 %187, -1                     ; <i1> [#uses=1]
  br i1 %188, label %bb84.i.i, label %bb83.i.i

bb83.i.i:                                         ; preds = %bb82.i.i
  %189 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %187 ; <i32*> [#uses=1]
  %190 = load i32* %189, align 4                  ; <i32> [#uses=2]
  store i32 %190, i32* %scevgep90.i.i, align 4
  br label %bb90.preheader.i.i

bb84.i.i:                                         ; preds = %bb82.i.i
  store i32 0, i32* %scevgep90.i.i, align 4
  br label %bb90.preheader.i.i

bb90.preheader.i.i:                               ; preds = %bb84.i.i, %bb83.i.i, %bb79.i.i, %bb77.i.i
  %.rle239.i.i = phi i32 [ 0, %bb84.i.i ], [ %190, %bb83.i.i ], [ %185, %bb79.i.i ], [ %183, %bb77.i.i ] ; <i32> [#uses=2]
  %191 = icmp sgt i32 %i.1021.i.i, 1              ; <i1> [#uses=1]
  br i1 %191, label %bb86.i.i, label %bb91.i.i

bb86.i.i:                                         ; preds = %bb89.i.i, %bb90.preheader.i.i
  %192 = phi i32 [ %.rle238.i.i, %bb89.i.i ], [ %.rle239.i.i, %bb90.preheader.i.i ] ; <i32> [#uses=3]
  %indvar78.i.i = phi i32 [ %tmp27.i, %bb89.i.i ], [ 0, %bb90.preheader.i.i ] ; <i32> [#uses=2]
  %tmp27.i = add i32 %indvar78.i.i, 1             ; <i32> [#uses=3]
  %scevgep84.i.i = getelementptr [17 x i32]* %s.i.i, i32 0, i32 %tmp27.i ; <i32*> [#uses=1]
  %193 = load i32* %scevgep84.i.i, align 4        ; <i32> [#uses=2]
  %194 = icmp eq i32 %193, -1                     ; <i1> [#uses=1]
  br i1 %194, label %bb89.i.i, label %bb87.i.i

bb87.i.i:                                         ; preds = %bb86.i.i
  %tmp86.i.i = sub i32 %173, %indvar78.i.i        ; <i32> [#uses=1]
  %195 = getelementptr inbounds [18 x [16 x i32]]* %elp.i.i, i32 0, i32 %tmp122.i.i, i32 %tmp86.i.i ; <i32*> [#uses=1]
  %196 = load i32* %195, align 4                  ; <i32> [#uses=2]
  %197 = icmp eq i32 %196, -1                     ; <i1> [#uses=1]
  br i1 %197, label %bb89.i.i, label %bb88.i.i

bb88.i.i:                                         ; preds = %bb87.i.i
  %198 = add nsw i32 %196, %193                   ; <i32> [#uses=1]
  %199 = srem i32 %198, 255                       ; <i32> [#uses=1]
  %200 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %199 ; <i32*> [#uses=1]
  %201 = load i32* %200, align 4                  ; <i32> [#uses=1]
  %202 = xor i32 %201, %192                       ; <i32> [#uses=2]
  store i32 %202, i32* %scevgep90.i.i, align 4
  br label %bb89.i.i

bb89.i.i:                                         ; preds = %bb88.i.i, %bb87.i.i, %bb86.i.i
  %.rle238.i.i = phi i32 [ %202, %bb88.i.i ], [ %192, %bb86.i.i ], [ %192, %bb87.i.i ] ; <i32> [#uses=2]
  %exitcond26.i = icmp eq i32 %tmp27.i, %173      ; <i1> [#uses=1]
  br i1 %exitcond26.i, label %bb91.i.i, label %bb86.i.i

bb91.i.i:                                         ; preds = %bb89.i.i, %bb90.preheader.i.i
  %203 = phi i32 [ %.rle239.i.i, %bb90.preheader.i.i ], [ %.rle238.i.i, %bb89.i.i ] ; <i32> [#uses=1]
  %204 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %203 ; <i32*> [#uses=1]
  %205 = load i32* %204, align 4                  ; <i32> [#uses=1]
  store i32 %205, i32* %scevgep90.i.i, align 4
  %206 = icmp slt i32 %125, %tmp88.i.i            ; <i1> [#uses=1]
  br i1 %206, label %bb94.i.i, label %bb75.i.i

bb94.i.i:                                         ; preds = %bb97.i.i, %bb91.i.i, %bb92.preheader.i.i
  %i.1117.i.i = phi i32 [ %211, %bb97.i.i ], [ 0, %bb91.i.i ], [ 0, %bb92.preheader.i.i ] ; <i32> [#uses=3]
  %scevgep77.i.i = getelementptr [255 x i32]* @recd, i32 0, i32 %i.1117.i.i ; <i32*> [#uses=2]
  %scevgep76.i.i = getelementptr [255 x i32]* %err.i.i, i32 0, i32 %i.1117.i.i ; <i32*> [#uses=1]
  store i32 0, i32* %scevgep76.i.i, align 4
  %207 = load i32* %scevgep77.i.i, align 4        ; <i32> [#uses=2]
  %208 = icmp eq i32 %207, -1                     ; <i1> [#uses=1]
  br i1 %208, label %bb97.i.i, label %bb95.i.i

bb95.i.i:                                         ; preds = %bb94.i.i
  %209 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %207 ; <i32*> [#uses=1]
  %210 = load i32* %209, align 4                  ; <i32> [#uses=1]
  br label %bb97.i.i

bb97.i.i:                                         ; preds = %bb95.i.i, %bb94.i.i
  %storemerge192.i.i = phi i32 [ %210, %bb95.i.i ], [ 0, %bb94.i.i ] ; <i32> [#uses=1]
  store i32 %storemerge192.i.i, i32* %scevgep77.i.i
  %211 = add nsw i32 %i.1117.i.i, 1               ; <i32> [#uses=2]
  %exitcond39.i = icmp eq i32 %211, 255           ; <i1> [#uses=1]
  br i1 %exitcond39.i, label %bb113.loopexit.i.i, label %bb94.i.i

bb.nph16.i.i:                                     ; preds = %bb113.loopexit.i.i
  %tmp32.i = icmp sgt i32 %125, 1                 ; <i1> [#uses=1]
  %smax.i = select i1 %tmp32.i, i32 %125, i32 1   ; <i32> [#uses=2]
  br label %bb100.i.i

bb100.i.i:                                        ; preds = %bb112.i.i, %bb.nph16.i.i
  %212 = phi i32 [ 0, %bb.nph16.i.i ], [ %250, %bb112.i.i ] ; <i32> [#uses=4]
  %scevgep74.i.i = getelementptr [8 x i32]* %root.i.i, i32 0, i32 %212 ; <i32*> [#uses=2]
  %scevgep73.i.i = getelementptr [8 x i32]* %loc.i.i, i32 0, i32 %212 ; <i32*> [#uses=1]
  %213 = load i32* %scevgep73.i.i, align 4        ; <i32> [#uses=2]
  %214 = getelementptr inbounds [255 x i32]* %err.i.i, i32 0, i32 %213 ; <i32*> [#uses=4]
  store i32 1, i32* %214, align 4
  br i1 %160, label %bb106.i.i, label %bb101.i.i

bb101.i.i:                                        ; preds = %bb103.i.i, %bb100.i.i
  %215 = phi i32 [ %.rle112.i, %bb103.i.i ], [ 1, %bb100.i.i ] ; <i32> [#uses=2]
  %indvar.i.i14 = phi i32 [ %j.49.i.i, %bb103.i.i ], [ 0, %bb100.i.i ] ; <i32> [#uses=2]
  %tmp.i.i = add i32 %indvar.i.i14, 2             ; <i32> [#uses=1]
  %j.49.i.i = add i32 %indvar.i.i14, 1            ; <i32> [#uses=3]
  %scevgep66.i.i = getelementptr [9 x i32]* %z.i.i, i32 0, i32 %j.49.i.i ; <i32*> [#uses=1]
  %216 = load i32* %scevgep66.i.i, align 4        ; <i32> [#uses=2]
  %217 = icmp eq i32 %216, -1                     ; <i1> [#uses=1]
  br i1 %217, label %bb103.i.i, label %bb102.i.i

bb102.i.i:                                        ; preds = %bb101.i.i
  %218 = load i32* %scevgep74.i.i, align 4        ; <i32> [#uses=1]
  %219 = mul i32 %218, %j.49.i.i                  ; <i32> [#uses=1]
  %220 = add nsw i32 %219, %216                   ; <i32> [#uses=1]
  %221 = srem i32 %220, 255                       ; <i32> [#uses=1]
  %222 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %221 ; <i32*> [#uses=1]
  %223 = load i32* %222, align 4                  ; <i32> [#uses=1]
  %224 = xor i32 %223, %215                       ; <i32> [#uses=2]
  store i32 %224, i32* %214, align 4
  br label %bb103.i.i

bb103.i.i:                                        ; preds = %bb102.i.i, %bb101.i.i
  %.rle112.i = phi i32 [ %224, %bb102.i.i ], [ %215, %bb101.i.i ] ; <i32> [#uses=3]
  %225 = icmp slt i32 %125, %tmp.i.i              ; <i1> [#uses=1]
  br i1 %225, label %bb105.i.i, label %bb101.i.i

bb105.i.i:                                        ; preds = %bb103.i.i
  %226 = icmp eq i32 %.rle112.i, 0                ; <i1> [#uses=1]
  br i1 %226, label %bb112.i.i, label %bb106.i.i

bb106.i.i:                                        ; preds = %bb105.i.i, %bb100.i.i
  %.reg2mem.0 = phi i32 [ %.rle112.i, %bb105.i.i ], [ 1, %bb100.i.i ] ; <i32> [#uses=1]
  %227 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %.reg2mem.0 ; <i32*> [#uses=1]
  %228 = load i32* %227, align 4                  ; <i32> [#uses=2]
  store i32 %228, i32* %214, align 4
  br label %bb107.i.i

bb107.i.i:                                        ; preds = %bb109.i.i, %bb106.i.i
  %q.712.i.i = phi i32 [ 0, %bb106.i.i ], [ %q.6.i.i, %bb109.i.i ] ; <i32> [#uses=2]
  %229 = phi i32 [ 0, %bb106.i.i ], [ %241, %bb109.i.i ] ; <i32> [#uses=3]
  %230 = icmp eq i32 %229, %212                   ; <i1> [#uses=1]
  br i1 %230, label %bb109.i.i, label %bb108.i.i

bb108.i.i:                                        ; preds = %bb107.i.i
  %scevgep69.i.i = getelementptr [8 x i32]* %loc.i.i, i32 0, i32 %229 ; <i32*> [#uses=1]
  %231 = load i32* %scevgep69.i.i, align 4        ; <i32> [#uses=1]
  %232 = load i32* %scevgep74.i.i, align 4        ; <i32> [#uses=1]
  %233 = add nsw i32 %232, %231                   ; <i32> [#uses=1]
  %234 = srem i32 %233, 255                       ; <i32> [#uses=1]
  %235 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %234 ; <i32*> [#uses=1]
  %236 = load i32* %235, align 4                  ; <i32> [#uses=1]
  %237 = xor i32 %236, 1                          ; <i32> [#uses=1]
  %238 = getelementptr inbounds [256 x i32]* @index_of, i32 0, i32 %237 ; <i32*> [#uses=1]
  %239 = load i32* %238, align 4                  ; <i32> [#uses=1]
  %240 = add nsw i32 %239, %q.712.i.i             ; <i32> [#uses=1]
  br label %bb109.i.i

bb109.i.i:                                        ; preds = %bb108.i.i, %bb107.i.i
  %q.6.i.i = phi i32 [ %240, %bb108.i.i ], [ %q.712.i.i, %bb107.i.i ] ; <i32> [#uses=2]
  %241 = add nsw i32 %229, 1                      ; <i32> [#uses=2]
  %exitcond33.i = icmp eq i32 %241, %smax.i       ; <i1> [#uses=1]
  br i1 %exitcond33.i, label %bb111.i.i, label %bb107.i.i

bb111.i.i:                                        ; preds = %bb109.i.i
  %242 = srem i32 %q.6.i.i, 255                   ; <i32> [#uses=1]
  %sum.i = add i32 %242, -255                     ; <i32> [#uses=1]
  %243 = sub i32 %228, %sum.i                     ; <i32> [#uses=1]
  %244 = srem i32 %243, 255                       ; <i32> [#uses=1]
  %245 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %244 ; <i32*> [#uses=1]
  %246 = load i32* %245, align 4                  ; <i32> [#uses=2]
  store i32 %246, i32* %214, align 4
  %247 = getelementptr inbounds [255 x i32]* @recd, i32 0, i32 %213 ; <i32*> [#uses=2]
  %248 = load i32* %247, align 4                  ; <i32> [#uses=1]
  %249 = xor i32 %248, %246                       ; <i32> [#uses=1]
  store i32 %249, i32* %247, align 4
  br label %bb112.i.i

bb112.i.i:                                        ; preds = %bb111.i.i, %bb105.i.i
  %250 = add nsw i32 %212, 1                      ; <i32> [#uses=2]
  %exitcond38.i = icmp eq i32 %250, %smax.i       ; <i1> [#uses=1]
  br i1 %exitcond38.i, label %bb14.i, label %bb100.i.i

bb113.loopexit.i.i:                               ; preds = %bb97.i.i
  %251 = icmp sgt i32 %125, 0                     ; <i1> [#uses=1]
  br i1 %251, label %bb.nph16.i.i, label %bb14.i

bb115.i.i:                                        ; preds = %bb118.i.i, %bb73.i.split.i
  %i.138.i.i = phi i32 [ %256, %bb118.i.i ], [ 0, %bb73.i.split.i ] ; <i32> [#uses=2]
  %scevgep.i.i15 = getelementptr [255 x i32]* @recd, i32 0, i32 %i.138.i.i ; <i32*> [#uses=2]
  %252 = load i32* %scevgep.i.i15, align 4        ; <i32> [#uses=2]
  %253 = icmp eq i32 %252, -1                     ; <i1> [#uses=1]
  br i1 %253, label %bb118.i.i, label %bb116.i.i

bb116.i.i:                                        ; preds = %bb115.i.i
  %254 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %252 ; <i32*> [#uses=1]
  %255 = load i32* %254, align 4                  ; <i32> [#uses=1]
  br label %bb118.i.i

bb118.i.i:                                        ; preds = %bb116.i.i, %bb115.i.i
  %storemerge193.i.i = phi i32 [ %255, %bb116.i.i ], [ 0, %bb115.i.i ] ; <i32> [#uses=1]
  store i32 %storemerge193.i.i, i32* %scevgep.i.i15
  %256 = add nsw i32 %i.138.i.i, 1                ; <i32> [#uses=2]
  %exitcond25.i = icmp eq i32 %256, 255           ; <i1> [#uses=1]
  br i1 %exitcond25.i, label %bb14.i, label %bb115.i.i

bb121.i.i:                                        ; preds = %bb124.i.i, %bb56.i.i, %bb54.i.i
  %i.1435.i.i = phi i32 [ %261, %bb124.i.i ], [ 0, %bb54.i.i ], [ 0, %bb56.i.i ] ; <i32> [#uses=2]
  %scevgep110.i.i = getelementptr [255 x i32]* @recd, i32 0, i32 %i.1435.i.i ; <i32*> [#uses=2]
  %257 = load i32* %scevgep110.i.i, align 4       ; <i32> [#uses=2]
  %258 = icmp eq i32 %257, -1                     ; <i1> [#uses=1]
  br i1 %258, label %bb124.i.i, label %bb122.i.i

bb122.i.i:                                        ; preds = %bb121.i.i
  %259 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %257 ; <i32*> [#uses=1]
  %260 = load i32* %259, align 4                  ; <i32> [#uses=1]
  br label %bb124.i.i

bb124.i.i:                                        ; preds = %bb122.i.i, %bb121.i.i
  %storemerge191.i.i = phi i32 [ %260, %bb122.i.i ], [ 0, %bb121.i.i ] ; <i32> [#uses=1]
  store i32 %storemerge191.i.i, i32* %scevgep110.i.i
  %261 = add nsw i32 %i.1435.i.i, 1               ; <i32> [#uses=2]
  %exitcond47.i = icmp eq i32 %261, 255           ; <i1> [#uses=1]
  br i1 %exitcond47.i, label %bb14.i, label %bb121.i.i

bb127.i.i:                                        ; preds = %bb130.i.i, %bb9.i.i
  %i.1550.i.i = phi i32 [ %266, %bb130.i.i ], [ 0, %bb9.i.i ] ; <i32> [#uses=2]
  %scevgep178.i.i = getelementptr [255 x i32]* @recd, i32 0, i32 %i.1550.i.i ; <i32*> [#uses=2]
  %262 = load i32* %scevgep178.i.i, align 4       ; <i32> [#uses=2]
  %263 = icmp eq i32 %262, -1                     ; <i1> [#uses=1]
  br i1 %263, label %bb130.i.i, label %bb128.i.i

bb128.i.i:                                        ; preds = %bb127.i.i
  %264 = getelementptr inbounds [256 x i32]* @alpha_to, i32 0, i32 %262 ; <i32*> [#uses=1]
  %265 = load i32* %264, align 4                  ; <i32> [#uses=1]
  br label %bb130.i.i

bb130.i.i:                                        ; preds = %bb128.i.i, %bb127.i.i
  %storemerge.i.i16 = phi i32 [ %265, %bb128.i.i ], [ 0, %bb127.i.i ] ; <i32> [#uses=1]
  store i32 %storemerge.i.i16, i32* %scevgep178.i.i
  %266 = add nsw i32 %i.1550.i.i, 1               ; <i32> [#uses=2]
  %exitcond88.i = icmp eq i32 %266, 255           ; <i1> [#uses=1]
  br i1 %exitcond88.i, label %bb14.i, label %bb127.i.i

bb14.i:                                           ; preds = %bb14.i, %bb130.i.i, %bb124.i.i, %bb118.i.i, %bb113.loopexit.i.i, %bb112.i.i
  %i.410.i = phi i32 [ %269, %bb14.i ], [ 0, %bb130.i.i ], [ 0, %bb124.i.i ], [ 0, %bb118.i.i ], [ 0, %bb112.i.i ], [ 0, %bb113.loopexit.i.i ] ; <i32> [#uses=3]
  %scevgep85.i = getelementptr [204 x i8]* %rs_in, i32 0, i32 %i.410.i ; <i8*> [#uses=1]
  %tmp86.i = add i32 %i.410.i, 67                 ; <i32> [#uses=1]
  %scevgep87.i = getelementptr [255 x i32]* @recd, i32 0, i32 %tmp86.i ; <i32*> [#uses=1]
  %267 = load i32* %scevgep87.i, align 4          ; <i32> [#uses=1]
  %268 = trunc i32 %267 to i8                     ; <i8> [#uses=1]
  store i8 %268, i8* %scevgep85.i, align 1
  %269 = add nsw i32 %i.410.i, 1                  ; <i32> [#uses=2]
  %exitcond84.i = icmp eq i32 %269, 188           ; <i1> [#uses=1]
  br i1 %exitcond84.i, label %rsdec_204.exit, label %bb14.i

rsdec_204.exit:                                   ; preds = %bb14.i
  %270 = add i32 %i.04, 1                         ; <i32> [#uses=2]
  %exitcond10 = icmp eq i32 %270, 150000          ; <i1> [#uses=1]
  br i1 %exitcond10, label %bb12, label %bb2.preheader

bb2.preheader:                                    ; preds = %rsdec_204.exit, %entry
  %inited.b.1 = phi i1 [ false, %entry ], [ %inited.b.0.ph, %rsdec_204.exit ] ; <i1> [#uses=2]
  %i.04 = phi i32 [ 0, %entry ], [ %270, %rsdec_204.exit ] ; <i32> [#uses=1]
  br label %bb1

bb12:                                             ; preds = %rsdec_204.exit
  ret i32 0
}

declare i32 @random(...)

declare void @llvm.memset.i64(i8* nocapture, i8, i64, i32) nounwind
