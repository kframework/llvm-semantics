; ModuleID = 'himenobmtxpa.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.Matrix = type { float*, i32, i32, i32, i32 }
%struct.timeval = type { i32, i32 }

@.str11 = private constant [34 x i8] c"mimax = %d mjmax = %d mkmax = %d\0A\00", align 1 ; <[34 x i8]*> [#uses=1]
@.str12 = private constant [30 x i8] c"imax = %d jmax = %d kmax =%d\0A\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str13 = private constant [29 x i8] c" Loop executed for %d times\0A\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str14 = private constant [13 x i8] c" Gosa : %e \0A\00", align 1 ; <[13 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([34 x i8]* @.str11, i32 0, i32 0), i32 64, i32 64, i32 128) nounwind ; <i32> [#uses=0]
  %1 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([30 x i8]* @.str12, i32 0, i32 0), i32 63, i32 63, i32 127) nounwind ; <i32> [#uses=0]
  %2 = malloc [524288 x float]                    ; <[524288 x float]*> [#uses=23]
  %3 = malloc [524288 x float]                    ; <[524288 x float]*> [#uses=4]
  %4 = malloc [524288 x float]                    ; <[524288 x float]*> [#uses=4]
  %5 = malloc [524288 x float]                    ; <[524288 x float]*> [#uses=5]
  %6 = malloc [2097152 x float]                   ; <[2097152 x float]*> [#uses=10]
  %7 = malloc [1572864 x float]                   ; <[1572864 x float]*> [#uses=8]
  %8 = malloc [1572864 x float]                   ; <[1572864 x float]*> [#uses=8]
  br label %bb.nph3.i

bb2.i208:                                         ; preds = %bb2.i208.preheader, %bb2.i208
  %k.01.i205 = phi i32 [ %tmp325, %bb2.i208 ], [ 0, %bb2.i208.preheader ] ; <i32> [#uses=2]
  %tmp325 = add i32 %k.01.i205, 1                 ; <i32> [#uses=2]
  %tmp327 = shl i32 %16, 7                        ; <i32> [#uses=1]
  %tmp8.i = add i32 %k.01.i205, %tmp327           ; <i32> [#uses=1]
  %9 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp8.i ; <float*> [#uses=1]
  store float %15, float* %9, align 4
  %10 = icmp slt i32 %tmp325, 128                 ; <i1> [#uses=1]
  br i1 %10, label %bb2.i208, label %bb4.i209

bb4.i209:                                         ; preds = %bb2.i208
  %11 = icmp slt i32 %tmp10.i211, 64              ; <i1> [#uses=1]
  br i1 %11, label %bb2.i208.preheader, label %bb6.i213

bb.nph3.i:                                        ; preds = %bb6.i213, %entry
  %12 = phi i32 [ 0, %entry ], [ %tmp11.i, %bb6.i213 ] ; <i32> [#uses=4]
  %tmp11.i = add i32 %12, 1                       ; <i32> [#uses=2]
  %13 = mul i32 %12, %12                          ; <i32> [#uses=1]
  %14 = sitofp i32 %13 to float                   ; <float> [#uses=1]
  %15 = fdiv float %14, 3.969000e+03              ; <float> [#uses=1]
  %tmp.i206 = shl i32 %12, 6                      ; <i32> [#uses=1]
  br label %bb2.i208.preheader

bb2.i208.preheader:                               ; preds = %bb.nph3.i, %bb4.i209
  %j.02.i210 = phi i32 [ 0, %bb.nph3.i ], [ %tmp10.i211, %bb4.i209 ] ; <i32> [#uses=2]
  %tmp10.i211 = add i32 %j.02.i210, 1             ; <i32> [#uses=2]
  %16 = add i32 %j.02.i210, %tmp.i206             ; <i32> [#uses=1]
  br label %bb2.i208

bb6.i213:                                         ; preds = %bb4.i209
  %17 = icmp slt i32 %tmp11.i, 64                 ; <i1> [#uses=1]
  br i1 %17, label %bb.nph3.i, label %bb3.preheader.i198.preheader

bb2.i194:                                         ; preds = %bb2.i194.preheader, %bb2.i194
  %k.01.i189 = phi i32 [ %tmp319, %bb2.i194 ], [ 0, %bb2.i194.preheader ] ; <i32> [#uses=2]
  %tmp319 = add i32 %k.01.i189, 1                 ; <i32> [#uses=2]
  %tmp10.i193 = add i32 %k.01.i189, %tmp321       ; <i32> [#uses=1]
  %18 = getelementptr inbounds [524288 x float]* %3, i32 0, i32 %tmp10.i193 ; <float*> [#uses=1]
  store float 1.000000e+00, float* %18, align 4
  %19 = icmp slt i32 %tmp319, 128                 ; <i1> [#uses=1]
  br i1 %19, label %bb2.i194, label %bb4.i195

bb4.i195:                                         ; preds = %bb2.i194
  %20 = icmp slt i32 %tmp12.i197, 64              ; <i1> [#uses=1]
  br i1 %20, label %bb2.i194.preheader, label %bb6.i199

bb2.i194.preheader:                               ; preds = %bb3.preheader.i198.preheader, %bb4.i195
  %j.02.i196 = phi i32 [ %tmp12.i197, %bb4.i195 ], [ 0, %bb3.preheader.i198.preheader ] ; <i32> [#uses=2]
  %tmp12.i197 = add i32 %j.02.i196, 1             ; <i32> [#uses=2]
  %21 = add i32 %j.02.i196, %tmp7.i191            ; <i32> [#uses=1]
  %tmp321 = shl i32 %21, 7                        ; <i32> [#uses=1]
  br label %bb2.i194

bb6.i199:                                         ; preds = %bb4.i195
  %22 = icmp slt i32 %tmp13.i202, 64              ; <i1> [#uses=1]
  br i1 %22, label %bb3.preheader.i198.preheader, label %bb3.preheader.i182.preheader

bb3.preheader.i198.preheader:                     ; preds = %bb6.i199, %bb6.i213
  %23 = phi i32 [ %tmp13.i202, %bb6.i199 ], [ 0, %bb6.i213 ] ; <i32> [#uses=2]
  %tmp13.i202 = add i32 %23, 1                    ; <i32> [#uses=2]
  %tmp7.i191 = shl i32 %23, 6                     ; <i32> [#uses=1]
  br label %bb2.i194.preheader

bb2.i178:                                         ; preds = %bb2.i178.preheader, %bb2.i178
  %k.01.i173 = phi i32 [ %tmp313, %bb2.i178 ], [ 0, %bb2.i178.preheader ] ; <i32> [#uses=2]
  %tmp313 = add i32 %k.01.i173, 1                 ; <i32> [#uses=2]
  %tmp10.i177 = add i32 %k.01.i173, %tmp315       ; <i32> [#uses=1]
  %24 = getelementptr inbounds [524288 x float]* %4, i32 0, i32 %tmp10.i177 ; <float*> [#uses=1]
  store float 0.000000e+00, float* %24, align 4
  %25 = icmp slt i32 %tmp313, 128                 ; <i1> [#uses=1]
  br i1 %25, label %bb2.i178, label %bb4.i179

bb4.i179:                                         ; preds = %bb2.i178
  %26 = icmp slt i32 %tmp12.i181, 64              ; <i1> [#uses=1]
  br i1 %26, label %bb2.i178.preheader, label %bb6.i183

bb2.i178.preheader:                               ; preds = %bb3.preheader.i182.preheader, %bb4.i179
  %j.02.i180 = phi i32 [ %tmp12.i181, %bb4.i179 ], [ 0, %bb3.preheader.i182.preheader ] ; <i32> [#uses=2]
  %tmp12.i181 = add i32 %j.02.i180, 1             ; <i32> [#uses=2]
  %27 = add i32 %j.02.i180, %tmp7.i175            ; <i32> [#uses=1]
  %tmp315 = shl i32 %27, 7                        ; <i32> [#uses=1]
  br label %bb2.i178

bb6.i183:                                         ; preds = %bb4.i179
  %28 = icmp slt i32 %tmp13.i186, 64              ; <i1> [#uses=1]
  br i1 %28, label %bb3.preheader.i182.preheader, label %bb3.preheader.i166.preheader

bb3.preheader.i182.preheader:                     ; preds = %bb6.i183, %bb6.i199
  %29 = phi i32 [ %tmp13.i186, %bb6.i183 ], [ 0, %bb6.i199 ] ; <i32> [#uses=2]
  %tmp13.i186 = add i32 %29, 1                    ; <i32> [#uses=2]
  %tmp7.i175 = shl i32 %29, 6                     ; <i32> [#uses=1]
  br label %bb2.i178.preheader

bb2.i162:                                         ; preds = %bb2.i162.preheader, %bb2.i162
  %k.01.i157 = phi i32 [ %tmp307, %bb2.i162 ], [ 0, %bb2.i162.preheader ] ; <i32> [#uses=2]
  %tmp307 = add i32 %k.01.i157, 1                 ; <i32> [#uses=2]
  %tmp10.i161 = add i32 %k.01.i157, %tmp309       ; <i32> [#uses=1]
  %30 = getelementptr inbounds [524288 x float]* %5, i32 0, i32 %tmp10.i161 ; <float*> [#uses=1]
  store float 0.000000e+00, float* %30, align 4
  %31 = icmp slt i32 %tmp307, 128                 ; <i1> [#uses=1]
  br i1 %31, label %bb2.i162, label %bb4.i163

bb4.i163:                                         ; preds = %bb2.i162
  %32 = icmp slt i32 %tmp12.i165, 64              ; <i1> [#uses=1]
  br i1 %32, label %bb2.i162.preheader, label %bb6.i167

bb2.i162.preheader:                               ; preds = %bb3.preheader.i166.preheader, %bb4.i163
  %j.02.i164 = phi i32 [ %tmp12.i165, %bb4.i163 ], [ 0, %bb3.preheader.i166.preheader ] ; <i32> [#uses=2]
  %tmp12.i165 = add i32 %j.02.i164, 1             ; <i32> [#uses=2]
  %33 = add i32 %j.02.i164, %tmp7.i159            ; <i32> [#uses=1]
  %tmp309 = shl i32 %33, 7                        ; <i32> [#uses=1]
  br label %bb2.i162

bb6.i167:                                         ; preds = %bb4.i163
  %34 = icmp slt i32 %tmp13.i170, 64              ; <i1> [#uses=1]
  br i1 %34, label %bb3.preheader.i166.preheader, label %bb3.preheader.i150.preheader

bb3.preheader.i166.preheader:                     ; preds = %bb6.i167, %bb6.i183
  %35 = phi i32 [ %tmp13.i170, %bb6.i167 ], [ 0, %bb6.i183 ] ; <i32> [#uses=2]
  %tmp13.i170 = add i32 %35, 1                    ; <i32> [#uses=2]
  %tmp7.i159 = shl i32 %35, 6                     ; <i32> [#uses=1]
  br label %bb2.i162.preheader

bb2.i146:                                         ; preds = %bb2.i146.preheader, %bb2.i146
  %k.01.i141 = phi i32 [ %tmp300, %bb2.i146 ], [ 0, %bb2.i146.preheader ] ; <i32> [#uses=2]
  %tmp300 = add i32 %k.01.i141, 1                 ; <i32> [#uses=2]
  %tmp10.i145 = add i32 %k.01.i141, %tmp302       ; <i32> [#uses=1]
  %36 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp10.i145 ; <float*> [#uses=1]
  store float 1.000000e+00, float* %36, align 4
  %37 = icmp slt i32 %tmp300, 128                 ; <i1> [#uses=1]
  br i1 %37, label %bb2.i146, label %bb4.i147

bb4.i147:                                         ; preds = %bb2.i146
  %38 = icmp slt i32 %tmp12.i149, 64              ; <i1> [#uses=1]
  br i1 %38, label %bb2.i146.preheader, label %bb6.i151

bb2.i146.preheader:                               ; preds = %bb3.preheader.i150.preheader, %bb4.i147
  %j.02.i148 = phi i32 [ %tmp12.i149, %bb4.i147 ], [ 0, %bb3.preheader.i150.preheader ] ; <i32> [#uses=2]
  %tmp12.i149 = add i32 %j.02.i148, 1             ; <i32> [#uses=2]
  %39 = add i32 %j.02.i148, %tmp7.i143            ; <i32> [#uses=1]
  %tmp302 = shl i32 %39, 7                        ; <i32> [#uses=1]
  br label %bb2.i146

bb6.i151:                                         ; preds = %bb4.i147
  %40 = icmp slt i32 %tmp13.i154, 64              ; <i1> [#uses=1]
  br i1 %40, label %bb3.preheader.i150.preheader, label %bb3.preheader.i134.preheader

bb3.preheader.i150.preheader:                     ; preds = %bb6.i151, %bb6.i167
  %41 = phi i32 [ %tmp13.i154, %bb6.i151 ], [ 0, %bb6.i167 ] ; <i32> [#uses=2]
  %tmp13.i154 = add i32 %41, 1                    ; <i32> [#uses=2]
  %tmp7.i143 = shl i32 %41, 6                     ; <i32> [#uses=1]
  br label %bb2.i146.preheader

bb2.i130:                                         ; preds = %bb2.i130.preheader, %bb2.i130
  %k.01.i125 = phi i32 [ %tmp293, %bb2.i130 ], [ 0, %bb2.i130.preheader ] ; <i32> [#uses=2]
  %tmp293 = add i32 %k.01.i125, 1                 ; <i32> [#uses=2]
  %tmp10.i129 = add i32 %k.01.i125, %tmp295       ; <i32> [#uses=1]
  %42 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp10.i129 ; <float*> [#uses=1]
  store float 1.000000e+00, float* %42, align 4
  %43 = icmp slt i32 %tmp293, 128                 ; <i1> [#uses=1]
  br i1 %43, label %bb2.i130, label %bb4.i131

bb4.i131:                                         ; preds = %bb2.i130
  %44 = icmp slt i32 %tmp12.i133, 64              ; <i1> [#uses=1]
  br i1 %44, label %bb2.i130.preheader, label %bb6.i135

bb2.i130.preheader:                               ; preds = %bb3.preheader.i134.preheader, %bb4.i131
  %j.02.i132 = phi i32 [ %tmp12.i133, %bb4.i131 ], [ 0, %bb3.preheader.i134.preheader ] ; <i32> [#uses=2]
  %tmp12.i133 = add i32 %j.02.i132, 1             ; <i32> [#uses=2]
  %45 = add i32 %j.02.i132, %tmp7.i127            ; <i32> [#uses=1]
  %tmp295 = shl i32 %45, 7                        ; <i32> [#uses=1]
  br label %bb2.i130

bb6.i135:                                         ; preds = %bb4.i131
  %46 = icmp slt i32 %tmp13.i138, 64              ; <i1> [#uses=1]
  br i1 %46, label %bb3.preheader.i134.preheader, label %bb3.preheader.i118.preheader

bb3.preheader.i134.preheader:                     ; preds = %bb6.i135, %bb6.i151
  %i.04.i137 = phi i32 [ %tmp13.i138, %bb6.i135 ], [ 0, %bb6.i151 ] ; <i32> [#uses=2]
  %tmp13.i138 = add i32 %i.04.i137, 1             ; <i32> [#uses=2]
  %47 = shl i32 %i.04.i137, 6                     ; <i32> [#uses=1]
  %tmp7.i127 = add i32 %47, 4096                  ; <i32> [#uses=1]
  br label %bb2.i130.preheader

bb2.i114:                                         ; preds = %bb2.i114.preheader, %bb2.i114
  %k.01.i109 = phi i32 [ %tmp283, %bb2.i114 ], [ 0, %bb2.i114.preheader ] ; <i32> [#uses=2]
  %tmp283 = add i32 %k.01.i109, 1                 ; <i32> [#uses=2]
  %tmp10.i113 = add i32 %k.01.i109, %tmp288       ; <i32> [#uses=1]
  %48 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp10.i113 ; <float*> [#uses=1]
  store float 1.000000e+00, float* %48, align 4
  %49 = icmp slt i32 %tmp283, 128                 ; <i1> [#uses=1]
  br i1 %49, label %bb2.i114, label %bb4.i115

bb4.i115:                                         ; preds = %bb2.i114
  %50 = icmp slt i32 %tmp12.i117, 64              ; <i1> [#uses=1]
  br i1 %50, label %bb2.i114.preheader, label %bb6.i119

bb2.i114.preheader:                               ; preds = %bb3.preheader.i118.preheader, %bb4.i115
  %j.02.i116 = phi i32 [ %tmp12.i117, %bb4.i115 ], [ 0, %bb3.preheader.i118.preheader ] ; <i32> [#uses=2]
  %tmp12.i117 = add i32 %j.02.i116, 1             ; <i32> [#uses=2]
  %51 = add i32 %j.02.i116, %tmp286               ; <i32> [#uses=1]
  %tmp288 = shl i32 %51, 7                        ; <i32> [#uses=1]
  br label %bb2.i114

bb6.i119:                                         ; preds = %bb4.i115
  %52 = icmp slt i32 %tmp13.i122, 64              ; <i1> [#uses=1]
  br i1 %52, label %bb3.preheader.i118.preheader, label %bb3.preheader.i102.preheader

bb3.preheader.i118.preheader:                     ; preds = %bb6.i119, %bb6.i135
  %i.04.i121 = phi i32 [ %tmp13.i122, %bb6.i119 ], [ 0, %bb6.i135 ] ; <i32> [#uses=2]
  %tmp13.i122 = add i32 %i.04.i121, 1             ; <i32> [#uses=2]
  %53 = shl i32 %i.04.i121, 6                     ; <i32> [#uses=1]
  %tmp286 = add i32 %53, 8192                     ; <i32> [#uses=1]
  br label %bb2.i114.preheader

bb2.i98:                                          ; preds = %bb2.i98.preheader, %bb2.i98
  %k.01.i93 = phi i32 [ %tmp275, %bb2.i98 ], [ 0, %bb2.i98.preheader ] ; <i32> [#uses=2]
  %tmp275 = add i32 %k.01.i93, 1                  ; <i32> [#uses=2]
  %tmp10.i97 = add i32 %k.01.i93, %tmp279         ; <i32> [#uses=1]
  %54 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp10.i97 ; <float*> [#uses=1]
  store float 0x3FC5555560000000, float* %54, align 4
  %55 = icmp slt i32 %tmp275, 128                 ; <i1> [#uses=1]
  br i1 %55, label %bb2.i98, label %bb4.i99

bb4.i99:                                          ; preds = %bb2.i98
  %56 = icmp slt i32 %tmp12.i101, 64              ; <i1> [#uses=1]
  br i1 %56, label %bb2.i98.preheader, label %bb6.i103

bb2.i98.preheader:                                ; preds = %bb3.preheader.i102.preheader, %bb4.i99
  %j.02.i100 = phi i32 [ %tmp12.i101, %bb4.i99 ], [ 0, %bb3.preheader.i102.preheader ] ; <i32> [#uses=2]
  %tmp12.i101 = add i32 %j.02.i100, 1             ; <i32> [#uses=2]
  %57 = add i32 %j.02.i100, %tmp277               ; <i32> [#uses=1]
  %tmp279 = shl i32 %57, 7                        ; <i32> [#uses=1]
  br label %bb2.i98

bb6.i103:                                         ; preds = %bb4.i99
  %58 = icmp slt i32 %tmp13.i106, 64              ; <i1> [#uses=1]
  br i1 %58, label %bb3.preheader.i102.preheader, label %bb3.preheader.i86.preheader

bb3.preheader.i102.preheader:                     ; preds = %bb6.i103, %bb6.i119
  %i.04.i105 = phi i32 [ %tmp13.i106, %bb6.i103 ], [ 0, %bb6.i119 ] ; <i32> [#uses=2]
  %tmp13.i106 = add i32 %i.04.i105, 1             ; <i32> [#uses=2]
  %59 = shl i32 %i.04.i105, 6                     ; <i32> [#uses=1]
  %tmp277 = add i32 %59, 12288                    ; <i32> [#uses=1]
  br label %bb2.i98.preheader

bb2.i82:                                          ; preds = %bb2.i82.preheader, %bb2.i82
  %k.01.i77 = phi i32 [ %tmp268, %bb2.i82 ], [ 0, %bb2.i82.preheader ] ; <i32> [#uses=2]
  %tmp268 = add i32 %k.01.i77, 1                  ; <i32> [#uses=2]
  %tmp10.i81 = add i32 %k.01.i77, %tmp270         ; <i32> [#uses=1]
  %60 = getelementptr inbounds [1572864 x float]* %7, i32 0, i32 %tmp10.i81 ; <float*> [#uses=1]
  store float 0.000000e+00, float* %60, align 4
  %61 = icmp slt i32 %tmp268, 128                 ; <i1> [#uses=1]
  br i1 %61, label %bb2.i82, label %bb4.i83

bb4.i83:                                          ; preds = %bb2.i82
  %62 = icmp slt i32 %tmp12.i85, 64               ; <i1> [#uses=1]
  br i1 %62, label %bb2.i82.preheader, label %bb6.i87

bb2.i82.preheader:                                ; preds = %bb3.preheader.i86.preheader, %bb4.i83
  %j.02.i84 = phi i32 [ %tmp12.i85, %bb4.i83 ], [ 0, %bb3.preheader.i86.preheader ] ; <i32> [#uses=2]
  %tmp12.i85 = add i32 %j.02.i84, 1               ; <i32> [#uses=2]
  %63 = add i32 %j.02.i84, %tmp7.i79              ; <i32> [#uses=1]
  %tmp270 = shl i32 %63, 7                        ; <i32> [#uses=1]
  br label %bb2.i82

bb6.i87:                                          ; preds = %bb4.i83
  %64 = icmp slt i32 %tmp13.i90, 64               ; <i1> [#uses=1]
  br i1 %64, label %bb3.preheader.i86.preheader, label %bb3.preheader.i70.preheader

bb3.preheader.i86.preheader:                      ; preds = %bb6.i87, %bb6.i103
  %65 = phi i32 [ %tmp13.i90, %bb6.i87 ], [ 0, %bb6.i103 ] ; <i32> [#uses=2]
  %tmp13.i90 = add i32 %65, 1                     ; <i32> [#uses=2]
  %tmp7.i79 = shl i32 %65, 6                      ; <i32> [#uses=1]
  br label %bb2.i82.preheader

bb2.i66:                                          ; preds = %bb2.i66.preheader, %bb2.i66
  %k.01.i61 = phi i32 [ %tmp261, %bb2.i66 ], [ 0, %bb2.i66.preheader ] ; <i32> [#uses=2]
  %tmp261 = add i32 %k.01.i61, 1                  ; <i32> [#uses=2]
  %tmp10.i65 = add i32 %k.01.i61, %tmp263         ; <i32> [#uses=1]
  %66 = getelementptr inbounds [1572864 x float]* %7, i32 0, i32 %tmp10.i65 ; <float*> [#uses=1]
  store float 0.000000e+00, float* %66, align 4
  %67 = icmp slt i32 %tmp261, 128                 ; <i1> [#uses=1]
  br i1 %67, label %bb2.i66, label %bb4.i67

bb4.i67:                                          ; preds = %bb2.i66
  %68 = icmp slt i32 %tmp12.i69, 64               ; <i1> [#uses=1]
  br i1 %68, label %bb2.i66.preheader, label %bb6.i71

bb2.i66.preheader:                                ; preds = %bb3.preheader.i70.preheader, %bb4.i67
  %j.02.i68 = phi i32 [ %tmp12.i69, %bb4.i67 ], [ 0, %bb3.preheader.i70.preheader ] ; <i32> [#uses=2]
  %tmp12.i69 = add i32 %j.02.i68, 1               ; <i32> [#uses=2]
  %69 = add i32 %j.02.i68, %tmp7.i63              ; <i32> [#uses=1]
  %tmp263 = shl i32 %69, 7                        ; <i32> [#uses=1]
  br label %bb2.i66

bb6.i71:                                          ; preds = %bb4.i67
  %70 = icmp slt i32 %tmp13.i74, 64               ; <i1> [#uses=1]
  br i1 %70, label %bb3.preheader.i70.preheader, label %bb3.preheader.i54.preheader

bb3.preheader.i70.preheader:                      ; preds = %bb6.i71, %bb6.i87
  %i.04.i73 = phi i32 [ %tmp13.i74, %bb6.i71 ], [ 0, %bb6.i87 ] ; <i32> [#uses=2]
  %tmp13.i74 = add i32 %i.04.i73, 1               ; <i32> [#uses=2]
  %71 = shl i32 %i.04.i73, 6                      ; <i32> [#uses=1]
  %tmp7.i63 = add i32 %71, 4096                   ; <i32> [#uses=1]
  br label %bb2.i66.preheader

bb2.i50:                                          ; preds = %bb2.i50.preheader, %bb2.i50
  %k.01.i45 = phi i32 [ %tmp252, %bb2.i50 ], [ 0, %bb2.i50.preheader ] ; <i32> [#uses=2]
  %tmp252 = add i32 %k.01.i45, 1                  ; <i32> [#uses=2]
  %tmp10.i49 = add i32 %k.01.i45, %tmp257         ; <i32> [#uses=1]
  %72 = getelementptr inbounds [1572864 x float]* %7, i32 0, i32 %tmp10.i49 ; <float*> [#uses=1]
  store float 0.000000e+00, float* %72, align 4
  %73 = icmp slt i32 %tmp252, 128                 ; <i1> [#uses=1]
  br i1 %73, label %bb2.i50, label %bb4.i51

bb4.i51:                                          ; preds = %bb2.i50
  %74 = icmp slt i32 %tmp12.i53, 64               ; <i1> [#uses=1]
  br i1 %74, label %bb2.i50.preheader, label %bb6.i55

bb2.i50.preheader:                                ; preds = %bb3.preheader.i54.preheader, %bb4.i51
  %j.02.i52 = phi i32 [ %tmp12.i53, %bb4.i51 ], [ 0, %bb3.preheader.i54.preheader ] ; <i32> [#uses=2]
  %tmp12.i53 = add i32 %j.02.i52, 1               ; <i32> [#uses=2]
  %75 = add i32 %j.02.i52, %tmp255                ; <i32> [#uses=1]
  %tmp257 = shl i32 %75, 7                        ; <i32> [#uses=1]
  br label %bb2.i50

bb6.i55:                                          ; preds = %bb4.i51
  %76 = icmp slt i32 %tmp13.i58, 64               ; <i1> [#uses=1]
  br i1 %76, label %bb3.preheader.i54.preheader, label %bb3.preheader.i38.preheader

bb3.preheader.i54.preheader:                      ; preds = %bb6.i55, %bb6.i71
  %i.04.i57 = phi i32 [ %tmp13.i58, %bb6.i55 ], [ 0, %bb6.i71 ] ; <i32> [#uses=2]
  %tmp13.i58 = add i32 %i.04.i57, 1               ; <i32> [#uses=2]
  %77 = shl i32 %i.04.i57, 6                      ; <i32> [#uses=1]
  %tmp255 = add i32 %77, 8192                     ; <i32> [#uses=1]
  br label %bb2.i50.preheader

bb2.i34:                                          ; preds = %bb2.i34.preheader, %bb2.i34
  %k.01.i29 = phi i32 [ %tmp245, %bb2.i34 ], [ 0, %bb2.i34.preheader ] ; <i32> [#uses=2]
  %tmp245 = add i32 %k.01.i29, 1                  ; <i32> [#uses=2]
  %tmp10.i33 = add i32 %k.01.i29, %tmp247         ; <i32> [#uses=1]
  %78 = getelementptr inbounds [1572864 x float]* %8, i32 0, i32 %tmp10.i33 ; <float*> [#uses=1]
  store float 1.000000e+00, float* %78, align 4
  %79 = icmp slt i32 %tmp245, 128                 ; <i1> [#uses=1]
  br i1 %79, label %bb2.i34, label %bb4.i35

bb4.i35:                                          ; preds = %bb2.i34
  %80 = icmp slt i32 %tmp12.i37, 64               ; <i1> [#uses=1]
  br i1 %80, label %bb2.i34.preheader, label %bb6.i39

bb2.i34.preheader:                                ; preds = %bb3.preheader.i38.preheader, %bb4.i35
  %j.02.i36 = phi i32 [ %tmp12.i37, %bb4.i35 ], [ 0, %bb3.preheader.i38.preheader ] ; <i32> [#uses=2]
  %tmp12.i37 = add i32 %j.02.i36, 1               ; <i32> [#uses=2]
  %81 = add i32 %j.02.i36, %tmp7.i31              ; <i32> [#uses=1]
  %tmp247 = shl i32 %81, 7                        ; <i32> [#uses=1]
  br label %bb2.i34

bb6.i39:                                          ; preds = %bb4.i35
  %82 = icmp slt i32 %tmp13.i42, 64               ; <i1> [#uses=1]
  br i1 %82, label %bb3.preheader.i38.preheader, label %bb3.preheader.i22.preheader

bb3.preheader.i38.preheader:                      ; preds = %bb6.i39, %bb6.i55
  %83 = phi i32 [ %tmp13.i42, %bb6.i39 ], [ 0, %bb6.i55 ] ; <i32> [#uses=2]
  %tmp13.i42 = add i32 %83, 1                     ; <i32> [#uses=2]
  %tmp7.i31 = shl i32 %83, 6                      ; <i32> [#uses=1]
  br label %bb2.i34.preheader

bb2.i18:                                          ; preds = %bb2.i18.preheader, %bb2.i18
  %k.01.i13 = phi i32 [ %tmp239, %bb2.i18 ], [ 0, %bb2.i18.preheader ] ; <i32> [#uses=2]
  %tmp239 = add i32 %k.01.i13, 1                  ; <i32> [#uses=2]
  %tmp10.i17 = add i32 %k.01.i13, %tmp241         ; <i32> [#uses=1]
  %84 = getelementptr inbounds [1572864 x float]* %8, i32 0, i32 %tmp10.i17 ; <float*> [#uses=1]
  store float 1.000000e+00, float* %84, align 4
  %85 = icmp slt i32 %tmp239, 128                 ; <i1> [#uses=1]
  br i1 %85, label %bb2.i18, label %bb4.i19

bb4.i19:                                          ; preds = %bb2.i18
  %86 = icmp slt i32 %tmp12.i21, 64               ; <i1> [#uses=1]
  br i1 %86, label %bb2.i18.preheader, label %bb6.i23

bb2.i18.preheader:                                ; preds = %bb3.preheader.i22.preheader, %bb4.i19
  %j.02.i20 = phi i32 [ %tmp12.i21, %bb4.i19 ], [ 0, %bb3.preheader.i22.preheader ] ; <i32> [#uses=2]
  %tmp12.i21 = add i32 %j.02.i20, 1               ; <i32> [#uses=2]
  %87 = add i32 %j.02.i20, %tmp7.i15              ; <i32> [#uses=1]
  %tmp241 = shl i32 %87, 7                        ; <i32> [#uses=1]
  br label %bb2.i18

bb6.i23:                                          ; preds = %bb4.i19
  %88 = icmp slt i32 %tmp13.i26, 64               ; <i1> [#uses=1]
  br i1 %88, label %bb3.preheader.i22.preheader, label %bb3.preheader.i.preheader

bb3.preheader.i22.preheader:                      ; preds = %bb6.i23, %bb6.i39
  %i.04.i25 = phi i32 [ %tmp13.i26, %bb6.i23 ], [ 0, %bb6.i39 ] ; <i32> [#uses=2]
  %tmp13.i26 = add i32 %i.04.i25, 1               ; <i32> [#uses=2]
  %89 = shl i32 %i.04.i25, 6                      ; <i32> [#uses=1]
  %tmp7.i15 = add i32 %89, 4096                   ; <i32> [#uses=1]
  br label %bb2.i18.preheader

bb2.i:                                            ; preds = %bb2.i.preheader, %bb2.i
  %k.01.i = phi i32 [ %tmp, %bb2.i ], [ 0, %bb2.i.preheader ] ; <i32> [#uses=2]
  %tmp = add i32 %k.01.i, 1                       ; <i32> [#uses=2]
  %tmp10.i = add i32 %k.01.i, %tmp235             ; <i32> [#uses=1]
  %90 = getelementptr inbounds [1572864 x float]* %8, i32 0, i32 %tmp10.i ; <float*> [#uses=1]
  store float 1.000000e+00, float* %90, align 4
  %91 = icmp slt i32 %tmp, 128                    ; <i1> [#uses=1]
  br i1 %91, label %bb2.i, label %bb4.i

bb4.i:                                            ; preds = %bb2.i
  %92 = icmp slt i32 %tmp12.i, 64                 ; <i1> [#uses=1]
  br i1 %92, label %bb2.i.preheader, label %bb6.i

bb2.i.preheader:                                  ; preds = %bb3.preheader.i.preheader, %bb4.i
  %j.02.i = phi i32 [ %tmp12.i, %bb4.i ], [ 0, %bb3.preheader.i.preheader ] ; <i32> [#uses=2]
  %tmp12.i = add i32 %j.02.i, 1                   ; <i32> [#uses=2]
  %93 = add i32 %j.02.i, %tmp233                  ; <i32> [#uses=1]
  %tmp235 = shl i32 %93, 7                        ; <i32> [#uses=1]
  br label %bb2.i

bb6.i:                                            ; preds = %bb4.i
  %94 = icmp slt i32 %tmp13.i, 64                 ; <i1> [#uses=1]
  br i1 %94, label %bb3.preheader.i.preheader, label %bb6.preheader.i.preheader

bb3.preheader.i.preheader:                        ; preds = %bb6.i, %bb6.i23
  %i.04.i = phi i32 [ %tmp13.i, %bb6.i ], [ 0, %bb6.i23 ] ; <i32> [#uses=2]
  %tmp13.i = add i32 %i.04.i, 1                   ; <i32> [#uses=2]
  %95 = shl i32 %i.04.i, 6                        ; <i32> [#uses=1]
  %tmp233 = add i32 %95, 8192                     ; <i32> [#uses=1]
  br label %bb2.i.preheader

bb4.preheader.us.i.preheader:                     ; preds = %bb6.preheader.i.preheader, %bb7.i
  %96 = phi i32 [ %tmp180.i, %bb7.i ], [ 0, %bb6.preheader.i.preheader ] ; <i32> [#uses=4]
  %gosa.38.i = phi float [ %191, %bb7.i ], [ 0.000000e+00, %bb6.preheader.i.preheader ] ; <float> [#uses=1]
  %tmp180.i = add i32 %96, 1                      ; <i32> [#uses=5]
  %tmp198.i = shl i32 %tmp180.i, 6                ; <i32> [#uses=3]
  %tmp177.i = shl i32 %96, 6                      ; <i32> [#uses=1]
  %tmp200.i = add i32 %tmp177.i, 128              ; <i32> [#uses=3]
  %tmp202.i = shl i32 %96, 6                      ; <i32> [#uses=1]
  %tmp203.i = add i32 %tmp202.i, 4160             ; <i32> [#uses=1]
  %tmp205.i = shl i32 %tmp180.i, 6                ; <i32> [#uses=1]
  %tmp206.i = add i32 %tmp205.i, 8192             ; <i32> [#uses=1]
  %tmp132.i = shl i32 %96, 6                      ; <i32> [#uses=3]
  %tmp237.i = shl i32 %tmp180.i, 6                ; <i32> [#uses=1]
  %tmp238.i = add i32 %tmp237.i, 12288            ; <i32> [#uses=1]
  br label %bb4.preheader.us.i

bb4.preheader.us.i:                               ; preds = %bb4.bb5_crit_edge.us.i, %bb4.preheader.us.i.preheader
  %indvar23.i = phi i32 [ %tmp197.i, %bb4.bb5_crit_edge.us.i ], [ 0, %bb4.preheader.us.i.preheader ] ; <i32> [#uses=5]
  %gosa.24.us.i = phi float [ %191, %bb4.bb5_crit_edge.us.i ], [ %gosa.38.i, %bb4.preheader.us.i.preheader ] ; <float> [#uses=1]
  %tmp183.i = add i32 %indvar23.i, 2              ; <i32> [#uses=3]
  %tmp197.i = add i32 %indvar23.i, 1              ; <i32> [#uses=8]
  %tmp172.i = add i32 %tmp197.i, %tmp198.i        ; <i32> [#uses=1]
  %tmp173.i = shl i32 %tmp172.i, 7                ; <i32> [#uses=3]
  %tmp168.i = add i32 %tmp197.i, %tmp200.i        ; <i32> [#uses=1]
  %tmp169.i = shl i32 %tmp168.i, 7                ; <i32> [#uses=3]
  %tmp164.i = add i32 %tmp197.i, %tmp203.i        ; <i32> [#uses=1]
  %tmp165.i = shl i32 %tmp164.i, 7                ; <i32> [#uses=1]
  %tmp159.i = add i32 %tmp183.i, %tmp198.i        ; <i32> [#uses=1]
  %tmp160.i = shl i32 %tmp159.i, 7                ; <i32> [#uses=3]
  %tmp155.i = add i32 %tmp197.i, %tmp206.i        ; <i32> [#uses=1]
  %tmp156.i = shl i32 %tmp155.i, 7                ; <i32> [#uses=1]
  %tmp141.i = add i32 %tmp183.i, %tmp200.i        ; <i32> [#uses=1]
  %tmp142.i = shl i32 %tmp141.i, 7                ; <i32> [#uses=1]
  %tmp137.i = add i32 %indvar23.i, %tmp200.i      ; <i32> [#uses=1]
  %tmp138.i = shl i32 %tmp137.i, 7                ; <i32> [#uses=1]
  %tmp133.i = add i32 %tmp183.i, %tmp132.i        ; <i32> [#uses=1]
  %tmp134.i = shl i32 %tmp133.i, 7                ; <i32> [#uses=1]
  %97 = add i32 %indvar23.i, %tmp132.i            ; <i32> [#uses=1]
  %tmp130.i = shl i32 %97, 7                      ; <i32> [#uses=1]
  %tmp116.i = add i32 %indvar23.i, %tmp198.i      ; <i32> [#uses=1]
  %tmp117.i = shl i32 %tmp116.i, 7                ; <i32> [#uses=3]
  %tmp93.i = add i32 %tmp197.i, %tmp132.i         ; <i32> [#uses=1]
  %tmp94.i = shl i32 %tmp93.i, 7                  ; <i32> [#uses=3]
  %tmp48.i = add i32 %tmp197.i, %tmp238.i         ; <i32> [#uses=1]
  %tmp49.i = shl i32 %tmp48.i, 7                  ; <i32> [#uses=1]
  br label %bb3.us.i

bb3.us.i:                                         ; preds = %bb3.us.i, %bb4.preheader.us.i
  %indvar.i = phi i32 [ 0, %bb4.preheader.us.i ], [ %tmp22.i, %bb3.us.i ] ; <i32> [#uses=7]
  %gosa.11.us.i = phi float [ %gosa.24.us.i, %bb4.preheader.us.i ], [ %191, %bb3.us.i ] ; <float> [#uses=1]
  %tmp22.i = add i32 %indvar.i, 1                 ; <i32> [#uses=14]
  %tmp91.i = add i32 %indvar.i, 2                 ; <i32> [#uses=5]
  %tmp174.i = add i32 %tmp22.i, %tmp173.i         ; <i32> [#uses=7]
  %98 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp174.i ; <float*> [#uses=1]
  %99 = load float* %98, align 4                  ; <float> [#uses=1]
  %tmp170.i = add i32 %tmp22.i, %tmp169.i         ; <i32> [#uses=1]
  %100 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp170.i ; <float*> [#uses=1]
  %101 = load float* %100, align 4                ; <float> [#uses=1]
  %102 = fmul float %99, %101                     ; <float> [#uses=1]
  %tmp166.i = add i32 %tmp22.i, %tmp165.i         ; <i32> [#uses=3]
  %103 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp166.i ; <float*> [#uses=1]
  %104 = load float* %103, align 4                ; <float> [#uses=1]
  %tmp161.i = add i32 %tmp22.i, %tmp160.i         ; <i32> [#uses=1]
  %105 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp161.i ; <float*> [#uses=1]
  %106 = load float* %105, align 4                ; <float> [#uses=1]
  %107 = fmul float %104, %106                    ; <float> [#uses=1]
  %108 = fadd float %102, %107                    ; <float> [#uses=1]
  %tmp157.i = add i32 %tmp22.i, %tmp156.i         ; <i32> [#uses=3]
  %109 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp157.i ; <float*> [#uses=1]
  %110 = load float* %109, align 4                ; <float> [#uses=1]
  %tmp151.i = add i32 %tmp91.i, %tmp173.i         ; <i32> [#uses=1]
  %111 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp151.i ; <float*> [#uses=1]
  %112 = load float* %111, align 4                ; <float> [#uses=1]
  %113 = fmul float %110, %112                    ; <float> [#uses=1]
  %114 = fadd float %108, %113                    ; <float> [#uses=1]
  %115 = getelementptr inbounds [1572864 x float]* %7, i32 0, i32 %tmp174.i ; <float*> [#uses=1]
  %116 = load float* %115, align 4                ; <float> [#uses=1]
  %tmp143.i = add i32 %tmp22.i, %tmp142.i         ; <i32> [#uses=1]
  %117 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp143.i ; <float*> [#uses=1]
  %118 = load float* %117, align 4                ; <float> [#uses=1]
  %tmp139.i = add i32 %tmp22.i, %tmp138.i         ; <i32> [#uses=1]
  %119 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp139.i ; <float*> [#uses=1]
  %120 = load float* %119, align 4                ; <float> [#uses=1]
  %121 = fsub float %118, %120                    ; <float> [#uses=1]
  %tmp135.i = add i32 %tmp22.i, %tmp134.i         ; <i32> [#uses=1]
  %122 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp135.i ; <float*> [#uses=1]
  %123 = load float* %122, align 4                ; <float> [#uses=1]
  %124 = fsub float %121, %123                    ; <float> [#uses=1]
  %tmp131.i = add i32 %tmp22.i, %tmp130.i         ; <i32> [#uses=1]
  %125 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp131.i ; <float*> [#uses=1]
  %126 = load float* %125, align 4                ; <float> [#uses=1]
  %127 = fadd float %124, %126                    ; <float> [#uses=1]
  %128 = fmul float %116, %127                    ; <float> [#uses=1]
  %129 = fadd float %114, %128                    ; <float> [#uses=1]
  %130 = getelementptr inbounds [1572864 x float]* %7, i32 0, i32 %tmp166.i ; <float*> [#uses=1]
  %131 = load float* %130, align 4                ; <float> [#uses=1]
  %tmp122.i = add i32 %tmp91.i, %tmp160.i         ; <i32> [#uses=1]
  %132 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp122.i ; <float*> [#uses=1]
  %133 = load float* %132, align 4                ; <float> [#uses=1]
  %tmp118.i = add i32 %tmp91.i, %tmp117.i         ; <i32> [#uses=1]
  %134 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp118.i ; <float*> [#uses=1]
  %135 = load float* %134, align 4                ; <float> [#uses=1]
  %136 = fsub float %133, %135                    ; <float> [#uses=1]
  %tmp114.i = add i32 %indvar.i, %tmp160.i        ; <i32> [#uses=1]
  %137 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp114.i ; <float*> [#uses=1]
  %138 = load float* %137, align 4                ; <float> [#uses=1]
  %139 = fsub float %136, %138                    ; <float> [#uses=1]
  %tmp109.i = add i32 %indvar.i, %tmp117.i        ; <i32> [#uses=1]
  %140 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp109.i ; <float*> [#uses=1]
  %141 = load float* %140, align 4                ; <float> [#uses=1]
  %142 = fadd float %139, %141                    ; <float> [#uses=1]
  %143 = fmul float %131, %142                    ; <float> [#uses=1]
  %144 = fadd float %129, %143                    ; <float> [#uses=1]
  %145 = getelementptr inbounds [1572864 x float]* %7, i32 0, i32 %tmp157.i ; <float*> [#uses=1]
  %146 = load float* %145, align 4                ; <float> [#uses=1]
  %tmp99.i = add i32 %tmp91.i, %tmp169.i          ; <i32> [#uses=1]
  %147 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp99.i ; <float*> [#uses=1]
  %148 = load float* %147, align 4                ; <float> [#uses=1]
  %tmp95.i = add i32 %tmp91.i, %tmp94.i           ; <i32> [#uses=1]
  %149 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp95.i ; <float*> [#uses=1]
  %150 = load float* %149, align 4                ; <float> [#uses=1]
  %151 = fsub float %148, %150                    ; <float> [#uses=1]
  %tmp90.i = add i32 %indvar.i, %tmp169.i         ; <i32> [#uses=1]
  %152 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp90.i ; <float*> [#uses=1]
  %153 = load float* %152, align 4                ; <float> [#uses=1]
  %154 = fsub float %151, %153                    ; <float> [#uses=1]
  %tmp85.i = add i32 %indvar.i, %tmp94.i          ; <i32> [#uses=1]
  %155 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp85.i ; <float*> [#uses=1]
  %156 = load float* %155, align 4                ; <float> [#uses=1]
  %157 = fadd float %154, %156                    ; <float> [#uses=1]
  %158 = fmul float %146, %157                    ; <float> [#uses=1]
  %159 = fadd float %144, %158                    ; <float> [#uses=1]
  %160 = getelementptr inbounds [1572864 x float]* %8, i32 0, i32 %tmp174.i ; <float*> [#uses=1]
  %161 = load float* %160, align 4                ; <float> [#uses=1]
  %tmp77.i = add i32 %tmp22.i, %tmp94.i           ; <i32> [#uses=1]
  %162 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp77.i ; <float*> [#uses=1]
  %163 = load float* %162, align 4                ; <float> [#uses=1]
  %164 = fmul float %161, %163                    ; <float> [#uses=1]
  %165 = fadd float %159, %164                    ; <float> [#uses=1]
  %166 = getelementptr inbounds [1572864 x float]* %8, i32 0, i32 %tmp166.i ; <float*> [#uses=1]
  %167 = load float* %166, align 4                ; <float> [#uses=1]
  %tmp68.i = add i32 %tmp22.i, %tmp117.i          ; <i32> [#uses=1]
  %168 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp68.i ; <float*> [#uses=1]
  %169 = load float* %168, align 4                ; <float> [#uses=1]
  %170 = fmul float %167, %169                    ; <float> [#uses=1]
  %171 = fadd float %165, %170                    ; <float> [#uses=1]
  %172 = getelementptr inbounds [1572864 x float]* %8, i32 0, i32 %tmp157.i ; <float*> [#uses=1]
  %173 = load float* %172, align 4                ; <float> [#uses=1]
  %tmp58.i = add i32 %indvar.i, %tmp173.i         ; <i32> [#uses=1]
  %174 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp58.i ; <float*> [#uses=1]
  %175 = load float* %174, align 4                ; <float> [#uses=1]
  %176 = fmul float %173, %175                    ; <float> [#uses=1]
  %177 = fadd float %171, %176                    ; <float> [#uses=1]
  %178 = getelementptr inbounds [524288 x float]* %4, i32 0, i32 %tmp174.i ; <float*> [#uses=1]
  %179 = load float* %178, align 4                ; <float> [#uses=1]
  %180 = fadd float %177, %179                    ; <float> [#uses=1]
  %tmp50.i = add i32 %tmp22.i, %tmp49.i           ; <i32> [#uses=1]
  %181 = getelementptr inbounds [2097152 x float]* %6, i32 0, i32 %tmp50.i ; <float*> [#uses=1]
  %182 = load float* %181, align 4                ; <float> [#uses=1]
  %183 = fmul float %182, %180                    ; <float> [#uses=1]
  %184 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp174.i ; <float*> [#uses=1]
  %185 = load float* %184, align 4                ; <float> [#uses=2]
  %186 = fsub float %183, %185                    ; <float> [#uses=1]
  %187 = getelementptr inbounds [524288 x float]* %3, i32 0, i32 %tmp174.i ; <float*> [#uses=1]
  %188 = load float* %187, align 4                ; <float> [#uses=1]
  %189 = fmul float %186, %188                    ; <float> [#uses=3]
  %190 = fmul float %189, %189                    ; <float> [#uses=1]
  %191 = fadd float %190, %gosa.11.us.i           ; <float> [#uses=4]
  %192 = fmul float %189, 0x3FE99999A0000000      ; <float> [#uses=1]
  %193 = fadd float %185, %192                    ; <float> [#uses=1]
  %194 = getelementptr inbounds [524288 x float]* %5, i32 0, i32 %tmp174.i ; <float*> [#uses=1]
  store float %193, float* %194, align 4
  %exitcond.i = icmp eq i32 %tmp22.i, 126         ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb4.bb5_crit_edge.us.i, label %bb3.us.i

bb4.bb5_crit_edge.us.i:                           ; preds = %bb3.us.i
  %exitcond176.i = icmp eq i32 %tmp197.i, 62      ; <i1> [#uses=1]
  br i1 %exitcond176.i, label %bb7.i, label %bb4.preheader.us.i

bb7.i:                                            ; preds = %bb4.bb5_crit_edge.us.i
  %exitcond252.i = icmp eq i32 %tmp180.i, 62      ; <i1> [#uses=1]
  br i1 %exitcond252.i, label %bb13.preheader.i.preheader, label %bb4.preheader.us.i.preheader

bb12.i:                                           ; preds = %bb13.preheader.i, %bb12.i
  %indvar262.i = phi i32 [ 0, %bb13.preheader.i ], [ %tmp265.i, %bb12.i ] ; <i32> [#uses=1]
  %tmp265.i = add i32 %indvar262.i, 1             ; <i32> [#uses=3]
  %tmp279.i = add i32 %tmp265.i, %tmp278.i        ; <i32> [#uses=2]
  %195 = getelementptr inbounds [524288 x float]* %5, i32 0, i32 %tmp279.i ; <float*> [#uses=1]
  %196 = load float* %195, align 4                ; <float> [#uses=1]
  %197 = getelementptr inbounds [524288 x float]* %2, i32 0, i32 %tmp279.i ; <float*> [#uses=1]
  store float %196, float* %197, align 4
  %exitcond264.i = icmp eq i32 %tmp265.i, 126     ; <i1> [#uses=1]
  br i1 %exitcond264.i, label %bb14.i, label %bb12.i

bb14.i:                                           ; preds = %bb12.i
  %exitcond280.i = icmp eq i32 %tmp281.i, 62      ; <i1> [#uses=1]
  br i1 %exitcond280.i, label %bb16.i, label %bb13.preheader.i

bb13.preheader.i:                                 ; preds = %bb13.preheader.i.preheader, %bb14.i
  %indvar266.i = phi i32 [ %tmp281.i, %bb14.i ], [ 0, %bb13.preheader.i.preheader ] ; <i32> [#uses=1]
  %tmp281.i = add i32 %indvar266.i, 1             ; <i32> [#uses=3]
  %tmp277.i = add i32 %tmp281.i, %tmp283.i        ; <i32> [#uses=1]
  %tmp278.i = shl i32 %tmp277.i, 7                ; <i32> [#uses=1]
  br label %bb12.i

bb16.i:                                           ; preds = %bb14.i
  %exitcond287.i = icmp eq i32 %tmp282.i, 62      ; <i1> [#uses=1]
  br i1 %exitcond287.i, label %bb18.i, label %bb13.preheader.i.preheader

bb13.preheader.i.preheader:                       ; preds = %bb16.i, %bb7.i
  %indvar269.i = phi i32 [ %tmp282.i, %bb16.i ], [ 0, %bb7.i ] ; <i32> [#uses=1]
  %tmp282.i = add i32 %indvar269.i, 1             ; <i32> [#uses=3]
  %tmp283.i = shl i32 %tmp282.i, 6                ; <i32> [#uses=1]
  br label %bb13.preheader.i

bb18.i:                                           ; preds = %bb16.i
  %198 = add i32 %n.019.i, 1                      ; <i32> [#uses=2]
  %exitcond289.i = icmp eq i32 %198, 64           ; <i1> [#uses=1]
  br i1 %exitcond289.i, label %jacobi.exit, label %bb6.preheader.i.preheader

bb6.preheader.i.preheader:                        ; preds = %bb18.i, %bb6.i
  %n.019.i = phi i32 [ %198, %bb18.i ], [ 0, %bb6.i ] ; <i32> [#uses=1]
  br label %bb4.preheader.us.i.preheader

jacobi.exit:                                      ; preds = %bb18.i
  %199 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([29 x i8]* @.str13, i32 0, i32 0), i32 64) nounwind ; <i32> [#uses=0]
  %200 = fpext float %191 to double               ; <double> [#uses=1]
  %201 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str14, i32 0, i32 0), double %200) nounwind ; <i32> [#uses=0]
  %202 = icmp eq [524288 x float]* %2, null       ; <i1> [#uses=1]
  br i1 %202, label %clearMat.exit12, label %bb.i11

bb.i11:                                           ; preds = %jacobi.exit
  free [524288 x float]* %2
  br label %clearMat.exit12

clearMat.exit12:                                  ; preds = %bb.i11, %jacobi.exit
  %203 = icmp eq [524288 x float]* %3, null       ; <i1> [#uses=1]
  br i1 %203, label %clearMat.exit10, label %bb.i9

bb.i9:                                            ; preds = %clearMat.exit12
  free [524288 x float]* %3
  br label %clearMat.exit10

clearMat.exit10:                                  ; preds = %bb.i9, %clearMat.exit12
  %204 = icmp eq [524288 x float]* %4, null       ; <i1> [#uses=1]
  br i1 %204, label %clearMat.exit8, label %bb.i7

bb.i7:                                            ; preds = %clearMat.exit10
  free [524288 x float]* %4
  br label %clearMat.exit8

clearMat.exit8:                                   ; preds = %bb.i7, %clearMat.exit10
  %205 = icmp eq [524288 x float]* %5, null       ; <i1> [#uses=1]
  br i1 %205, label %clearMat.exit6, label %bb.i5

bb.i5:                                            ; preds = %clearMat.exit8
  free [524288 x float]* %5
  br label %clearMat.exit6

clearMat.exit6:                                   ; preds = %bb.i5, %clearMat.exit8
  %206 = icmp eq [2097152 x float]* %6, null      ; <i1> [#uses=1]
  br i1 %206, label %clearMat.exit4, label %bb.i3

bb.i3:                                            ; preds = %clearMat.exit6
  free [2097152 x float]* %6
  br label %clearMat.exit4

clearMat.exit4:                                   ; preds = %bb.i3, %clearMat.exit6
  %207 = icmp eq [1572864 x float]* %7, null      ; <i1> [#uses=1]
  br i1 %207, label %clearMat.exit2, label %bb.i1

bb.i1:                                            ; preds = %clearMat.exit4
  free [1572864 x float]* %7
  br label %clearMat.exit2

clearMat.exit2:                                   ; preds = %bb.i1, %clearMat.exit4
  %208 = icmp eq [1572864 x float]* %8, null      ; <i1> [#uses=1]
  br i1 %208, label %clearMat.exit, label %bb.i

bb.i:                                             ; preds = %clearMat.exit2
  free [1572864 x float]* %8
  ret i32 0

clearMat.exit:                                    ; preds = %clearMat.exit2
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
